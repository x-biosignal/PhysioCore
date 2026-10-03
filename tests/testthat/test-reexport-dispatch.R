# PhysioCore is a compatibility shim: its whole purpose is that
# `PhysioCore::fn()` keeps working for code written against the old package.
# S4 dispatch is namespace-scoped, so re-exporting a generic with importFrom()
# WITHOUT its methods leaves `PhysioCore::<generic>(x)` unable to find an
# inherited method -- notably on the PARENT container MultiPhysioExperiment,
# whose method was defined directly on it. These tests pin that down on both the
# parent and the subclass so the regression cannot return silently.

make_parent <- function() {
  set.seed(1)
  pe1 <- PhysioExperiment(assays = list(raw = matrix(rnorm(60 * 2), 60, 2)), samplingRate = 100)
  pe2 <- PhysioExperiment(assays = list(raw = matrix(rnorm(60 * 2), 60, 2)), samplingRate = 100)
  MultiPhysioExperiment(streams = list(a = pe1, b = pe2))
}
make_child <- function() {
  set.seed(2)
  pe1 <- PhysioExperiment(assays = list(raw = matrix(rnorm(60 * 2), 60, 2)), samplingRate = 100)
  pe3 <- PhysioExperiment(assays = list(raw = matrix(rnorm(30 * 2), 30, 2)), samplingRate = 50)
  MultiRatePhysioExperiment(streams = list(a = pe1, c = pe3))
}

test_that("streams() dispatches through PhysioCore:: on parent and subclass", {
  parent <- make_parent()
  child  <- make_child()
  expect_s4_class(parent, "MultiPhysioExperiment")
  expect_s4_class(child, "MultiRatePhysioExperiment")

  # Parent was the broken case: used to error with
  # "unable to find an inherited method for function 'streams'".
  expect_no_error(PhysioCore::streams(parent))
  expect_no_error(PhysioCore::streams(child))
  expect_length(PhysioCore::streams(parent), 2L)
  expect_identical(names(PhysioCore::streams(parent)), c("a", "b"))
})

test_that("other export()-ed S4 generics also dispatch on the parent container", {
  parent <- make_parent()
  expect_no_error(PhysioCore::provenance(parent))
  # replacement generic must resolve too
  expect_true(methods::existsMethod("streams<-", "MultiPhysioExperiment",
                                    where = asNamespace("PhysioCore")) ||
              methods::hasMethod("streams<-", "MultiPhysioExperiment",
                                 where = asNamespace("PhysioCore")))
})

test_that("every re-exported S4 generic resolves through PhysioCore wherever the foundation does", {
  skip_if_not_installed("PhysioExperiment")
  fnd  <- asNamespace("PhysioExperiment")
  core <- asNamespace("PhysioCore")
  gens <- Filter(function(nm) methods::isGeneric(nm, where = fnd),
                 getNamespaceExports("PhysioCore"))
  classes <- c("PhysioExperiment", "PhysioEvents", "MultiPhysioExperiment",
               "MultiRatePhysioExperiment", "PhysioLongitudinal", "PhysioCohort",
               "AnalysisResult", "PhysioBiomarker", "NormativeReference")
  broken <- character()
  suppressWarnings(
    for (g in gens) for (cl in classes) {
      fh <- tryCatch(hasMethod(g, cl, where = fnd),  error = function(e) NA)
      ch <- tryCatch(hasMethod(g, cl, where = core), error = function(e) NA)
      if (isTRUE(fh) && isFALSE(ch)) broken <- c(broken, paste0(g, "[", cl, "]"))
    }
  )
  expect_identical(broken, character())
})
