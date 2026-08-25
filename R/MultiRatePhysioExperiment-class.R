#' Multi-rate multimodal container for PhysioExperiment streams
#'
#' \code{MultiRatePhysioExperiment} holds several \code{PhysioExperiment}
#' streams that share a common master clock but each keep their own sampling
#' rate and time-length - the classic motion-capture situation of, say, 100 Hz
#' kinematics alongside 1000 Hz force-plate analog and 2000 Hz EMG, or the
#' NWB \code{TimeSeries} / LSL-XDF / C3D POINT+ANALOG pattern.
#'
#' The master \code{clock} is a list with \code{t0} (origin timestamp, seconds),
#' \code{reference_rate} (the default rate used by \code{\link{alignStreams}}),
#' and \code{offsets} (a named numeric of per-stream start offsets in seconds
#' relative to \code{t0}).
#'
#' @slot streams A \code{SimpleList} of named \code{PhysioExperiment} objects.
#' @slot clock A list describing the master clock (\code{t0},
#'   \code{reference_rate}, \code{offsets}).
#' @seealso \code{\link{MultiRatePhysioExperiment}} for the constructor,
#'   \code{\link{resampleToCommon}}, \code{\link{alignStreams}}
#' @name MultiRatePhysioExperiment-class
#' @exportClass MultiRatePhysioExperiment
setClass(
  "MultiRatePhysioExperiment",
  representation(streams = "SimpleList", clock = "list"),
  prototype = list(
    streams = S4Vectors::SimpleList(),
    clock = list(t0 = 0, reference_rate = NA_real_, offsets = numeric(0))
  ),
  validity = function(object) {
    msgs <- character(0)
    s <- object@streams
    if (length(s) > 0) {
      if (is.null(names(s)) || any(!nzchar(names(s)))) {
        msgs <- c(msgs, "all streams must be named")
      }
      if (!all(vapply(s, methods::is, logical(1), "PhysioExperiment"))) {
        msgs <- c(msgs, "all streams must be PhysioExperiment objects")
      }
    }
    cl <- object@clock
    if (length(cl) > 0 &&
        !all(c("t0", "reference_rate", "offsets") %in% names(cl))) {
      msgs <- c(msgs, "clock must contain t0, reference_rate and offsets")
    }
    if (length(msgs)) msgs else TRUE
  }
)

#' Construct a MultiRatePhysioExperiment
#'
#' @param streams A named list of \code{PhysioExperiment} streams (or pass them
#'   as named \code{...} arguments).
#' @param ... Additional named \code{PhysioExperiment} streams.
#' @param clock Optional pre-built master-clock list. If \code{NULL} (default) a
#'   clock is built from \code{t0}, \code{reference_rate} and \code{offsets}.
#' @param t0 Origin timestamp in seconds (default 0).
#' @param reference_rate Reference sampling rate in Hz for
#'   \code{\link{alignStreams}}. Defaults to the highest stream rate.
#' @param offsets Named numeric of per-stream start offsets in seconds relative
#'   to \code{t0} (default 0 for every stream).
#' @return A \code{MultiRatePhysioExperiment}.
#' @seealso \code{\link{streamRates}}, \code{\link{resampleToCommon}}
#' @export
#' @examples
#' kin <- PhysioExperiment(
#'   S4Vectors::SimpleList(raw = matrix(rnorm(100 * 3), 100, 3)), samplingRate = 100)
#' emg <- PhysioExperiment(
#'   S4Vectors::SimpleList(raw = matrix(rnorm(2000 * 2), 2000, 2)), samplingRate = 2000)
#' mr <- MultiRatePhysioExperiment(kinematics = kin, emg = emg)
#' streamRates(mr)
MultiRatePhysioExperiment <- function(streams = list(), ..., clock = NULL,
                                      t0 = 0, reference_rate = NULL,
                                      offsets = NULL) {
  all_streams <- c(as.list(streams), list(...))
  nm <- names(all_streams)
  if (length(all_streams) > 0) {
    if (is.null(nm) || any(!nzchar(nm))) {
      stop("all streams must be named", call. = FALSE)
    }
    if (!all(vapply(all_streams, methods::is, logical(1), "PhysioExperiment"))) {
      stop("all streams must be PhysioExperiment objects", call. = FALSE)
    }
  }
  sl <- do.call(S4Vectors::SimpleList, all_streams)
  rates <- if (length(all_streams)) {
    vapply(all_streams, samplingRate, numeric(1))
  } else numeric(0)

  if (is.null(clock)) {
    if (is.null(reference_rate)) {
      reference_rate <- if (length(rates)) max(rates, na.rm = TRUE) else NA_real_
    }
    off <- stats::setNames(rep(0, length(nm)), nm)
    if (!is.null(offsets)) off[names(offsets)] <- offsets
    clock <- list(t0 = t0, reference_rate = reference_rate, offsets = off)
  }
  methods::new("MultiRatePhysioExperiment", streams = sl, clock = clock)
}

# ---- accessors --------------------------------------------------------------

#' Access the streams of a MultiRatePhysioExperiment
#' @param x A \code{MultiRatePhysioExperiment}.
#' @param value A named list / SimpleList of \code{PhysioExperiment} streams.
#' @return \code{streams()} a \code{SimpleList}; setter returns the updated object.
#' @export
setGeneric("streams", function(x) standardGeneric("streams"))
#' @rdname streams
#' @export
setMethod("streams", "MultiRatePhysioExperiment", function(x) x@streams)

#' @rdname streams
#' @export
setGeneric("streams<-", function(x, value) standardGeneric("streams<-"))
#' @rdname streams
#' @export
setReplaceMethod("streams", "MultiRatePhysioExperiment", function(x, value) {
  x@streams <- if (methods::is(value, "SimpleList")) value
               else do.call(S4Vectors::SimpleList, as.list(value))
  methods::validObject(x)
  x
})

#' Names of the streams
#' @param x A \code{MultiRatePhysioExperiment}.
#' @return Character vector of stream names.
#' @export
streamNames <- function(x) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  names(x@streams)
}

#' Per-stream sampling rates
#' @param x A \code{MultiRatePhysioExperiment}.
#' @return Named numeric of sampling rates (Hz), one per stream.
#' @export
streamRates <- function(x) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  s <- as.list(x@streams)
  if (length(s) == 0) return(stats::setNames(numeric(0), character(0)))
  vapply(s, samplingRate, numeric(1))
}

#' The master clock
#' @param x A \code{MultiRatePhysioExperiment}.
#' @return The master-clock list (\code{t0}, \code{reference_rate}, \code{offsets}).
#' @export
commonClock <- function(x) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  x@clock
}

#' Number of streams
#' @param x A \code{MultiRatePhysioExperiment}.
#' @return Integer count of streams.
#' @export
nStreams <- function(x) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  length(x@streams)
}

#' Display, size and stream-extraction methods for MultiRatePhysioExperiment
#'
#' @param object,x A \code{MultiRatePhysioExperiment}.
#' @param i Stream name or index (for \code{[[}).
#' @param j,... Ignored.
#' @return \code{length()} the number of streams; \code{dim()} a matrix of
#'   per-stream \code{c(nsamples, nchannels)}; \code{[[} the selected
#'   \code{PhysioExperiment} stream; \code{show()} is called for its side effect.
#' @name MultiRatePhysioExperiment-methods
#' @rdname MultiRatePhysioExperiment-methods
NULL

#' @rdname MultiRatePhysioExperiment-methods
#' @export
setMethod("length", "MultiRatePhysioExperiment", function(x) length(x@streams))

#' @rdname MultiRatePhysioExperiment-methods
#' @export
setMethod("[[", "MultiRatePhysioExperiment", function(x, i, j, ...) x@streams[[i]])

#' @rdname MultiRatePhysioExperiment-methods
#' @export
setMethod("dim", "MultiRatePhysioExperiment", function(x) {
  s <- as.list(x@streams)
  if (length(s) == 0) return(matrix(integer(0), 0, 2,
                                    dimnames = list(NULL, c("nsamples", "nchannels"))))
  d <- t(vapply(s, function(e) {
    a <- SummarizedExperiment::assay(e, defaultAssay(e))
    dm <- dim(a)
    c(dm[1], if (length(dm) >= 2) dm[2] else NA_integer_)
  }, integer(2)))
  colnames(d) <- c("nsamples", "nchannels")
  rownames(d) <- names(s)
  d
})

#' @rdname MultiRatePhysioExperiment-methods
#' @export
setMethod("show", "MultiRatePhysioExperiment", function(object) {
  cat("class: MultiRatePhysioExperiment\n")
  s <- object@streams
  cat("streams(", length(s), "): ", paste(names(s), collapse = ", "), "\n", sep = "")
  cl <- object@clock
  if (length(cl) > 0) {
    cat("clock: t0=", cl$t0 %||% 0,
        " reference_rate=", cl$reference_rate %||% NA, " Hz\n", sep = "")
  }
  for (nm in names(s)) {
    e <- s[[nm]]
    a <- SummarizedExperiment::assay(e, defaultAssay(e))
    off <- if (!is.null(cl$offsets) && nm %in% names(cl$offsets)) cl$offsets[[nm]] else 0
    cat("  ", nm, ": ", paste(dim(a), collapse = " x "),
        " @ ", samplingRate(e), " Hz (offset ", off, " s)\n", sep = "")
  }
})

# ---- clock / alignment ------------------------------------------------------

#' Sample times of a stream on the shared clock
#'
#' @param x A \code{MultiRatePhysioExperiment}.
#' @param stream Stream name (or \code{NULL} for a named list of all streams).
#' @return Numeric time vector (seconds from \code{t0}) for the stream, or a
#'   named list of such vectors when \code{stream} is \code{NULL}.
#' @seealso \code{\link{resampleToCommon}}
#' @export
streamTimeIndex <- function(x, stream = NULL) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  cl <- x@clock
  one <- function(nm) {
    e <- x@streams[[nm]]
    a <- SummarizedExperiment::assay(e, defaultAssay(e))
    n <- dim(a)[1]
    off <- if (!is.null(cl$offsets) && nm %in% names(cl$offsets)) cl$offsets[[nm]] else 0
    r <- samplingRate(e)
    off + (seq_len(n) - 1) / r
  }
  if (is.null(stream)) {
    return(stats::setNames(lapply(names(x@streams), one), names(x@streams)))
  }
  if (!stream %in% names(x@streams)) {
    stop(sprintf("unknown stream '%s'", stream), call. = FALSE)
  }
  one(stream)
}

#' Resample all streams onto a single common-rate view
#'
#' Interpolates every stream onto a shared time grid at \code{rate}, honouring
#' each stream's start offset on the master clock, and returns a single
#' \code{PhysioExperiment} whose channels are the union of all streams'
#' channels (prefixed with the stream name). Grid positions before/after a
#' stream's coverage are \code{NA}.
#'
#' @param x A \code{MultiRatePhysioExperiment}.
#' @param rate Target sampling rate in Hz (default: the clock reference rate).
#' @return A single-rate \code{PhysioExperiment} with an \code{"aligned"} assay.
#' @seealso \code{\link{alignStreams}}, \code{\link{streamTimeIndex}}
#' @export
#' @examples
#' kin <- PhysioExperiment(
#'   S4Vectors::SimpleList(raw = matrix(rnorm(100 * 2), 100, 2)), samplingRate = 100)
#' emg <- PhysioExperiment(
#'   S4Vectors::SimpleList(raw = matrix(rnorm(1000 * 2), 1000, 2)), samplingRate = 1000)
#' mr <- MultiRatePhysioExperiment(kin = kin, emg = emg)
#' aligned <- resampleToCommon(mr, 1000)
#' dim(SummarizedExperiment::assay(aligned, "aligned"))
resampleToCommon <- function(x, rate = NULL) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  s <- x@streams
  if (length(s) == 0) stop("no streams to align", call. = FALSE)
  cl <- x@clock
  if (is.null(rate)) rate <- cl$reference_rate
  if (is.null(rate) || is.na(rate) || rate <= 0) {
    stop("a positive target 'rate' is required", call. = FALSE)
  }

  info <- lapply(names(s), function(nm) {
    e <- s[[nm]]
    a <- SummarizedExperiment::assay(e, defaultAssay(e))
    if (length(dim(a)) != 2L) {
      stop(sprintf("stream '%s' must have a 2D (time x channel) assay", nm),
           call. = FALSE)
    }
    off <- if (!is.null(cl$offsets) && nm %in% names(cl$offsets)) cl$offsets[[nm]] else 0
    r <- samplingRate(e)
    list(data = a, times = off + (seq_len(nrow(a)) - 1) / r, r = r)
  })
  names(info) <- names(s)

  t_start <- min(vapply(info, function(i) i$times[1], numeric(1)))
  t_end <- max(vapply(info, function(i) i$times[length(i$times)], numeric(1)))
  grid <- seq(t_start, t_end, by = 1 / rate)
  N <- length(grid)

  cols <- list(); coldata <- list()
  for (nm in names(info)) {
    i <- info[[nm]]
    d <- i$data
    ch <- ncol(d)
    lo <- i$times[1]; hi <- i$times[length(i$times)]
    within <- grid >= lo - 1e-9 & grid <= hi + 1e-9
    m <- matrix(NA_real_, N, ch)
    for (cc in seq_len(ch)) {
      m[within, cc] <- stats::approx(i$times, d[, cc], xout = grid[within],
                                     rule = 2)$y
    }
    labs <- colnames(d)
    if (is.null(labs)) labs <- paste0("ch", seq_len(ch))
    colnames(m) <- paste0(nm, ".", labs)
    cols[[nm]] <- m
    coldata[[nm]] <- S4Vectors::DataFrame(stream = nm, label = labs, rate = i$r)
  }
  merged <- do.call(cbind, cols)
  cd <- do.call(rbind, coldata)

  out <- PhysioExperiment(
    assays = S4Vectors::SimpleList(aligned = merged),
    colData = cd,
    metadata = list(common_clock = cl, grid_start = t_start,
                    source_streams = names(s)),
    samplingRate = rate
  )
  appendProvenance(out, activity = "resampleToCommon",
                   params = list(rate = rate, n_streams = length(s)),
                   output_assay = "aligned",
                   software_version = as.character(utils::packageVersion("PhysioCore")))
}

#' Align all streams to the reference rate
#'
#' Convenience wrapper for \code{resampleToCommon(x, reference_rate)} using the
#' master clock's reference rate.
#'
#' @param x A \code{MultiRatePhysioExperiment}.
#' @return A single-rate \code{PhysioExperiment}.
#' @seealso \code{\link{resampleToCommon}}
#' @export
alignStreams <- function(x) {
  stopifnot(methods::is(x, "MultiRatePhysioExperiment"))
  resampleToCommon(x, x@clock$reference_rate)
}

# ---- aggregated provenance --------------------------------------------------

#' @rdname provenance
#' @export
setMethod("provenance", "MultiRatePhysioExperiment", function(x) {
  s <- x@streams
  if (length(s) == 0) {
    return(cbind(stream = character(0),
                 provenance(PhysioExperiment(S4Vectors::SimpleList()))))
  }
  parts <- lapply(names(s), function(nm) {
    p <- provenance(s[[nm]])
    if (nrow(p) == 0) return(NULL)
    cbind(stream = rep(nm, nrow(p)), p, stringsAsFactors = FALSE)
  })
  parts <- Filter(Negate(is.null), parts)
  if (length(parts) == 0) {
    return(cbind(stream = character(0),
                 provenance(PhysioExperiment(S4Vectors::SimpleList()))))
  }
  do.call(rbind, parts)
})
