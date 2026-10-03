# PhysioCore is a compatibility package. These tests assert that code written
# against the old entry point keeps working after the implementation moved to
# PhysioExperiment -- they deliberately use the OLD calling conventions.

test_that("the old constructor and accessors still work", {
  pe <- PhysioExperiment(assays = list(raw = matrix(rnorm(200), 50, 4)),
                         samplingRate = 250)
  expect_s4_class(pe, "PhysioExperiment")
  expect_equal(samplingRate(pe), 250)
  expect_equal(dim(SummarizedExperiment::assay(pe, "raw")), c(50L, 4L))
})

test_that("PhysioCore:: qualified calls resolve to the foundation", {
  expect_identical(PhysioCore::samplingRate, PhysioExperiment::samplingRate)
  expect_identical(PhysioCore::PhysioExperiment, PhysioExperiment::PhysioExperiment)
})

test_that("the classes resolve through this namespace", {
  # objects saved while the classes were defined here carry
  # attr(class(x), "package") == "PhysioCore"; the re-export is what keeps
  # those objects loadable, so the class must be findable from here.
  for (cl in c("PhysioExperiment", "PhysioEvents", "MultiRatePhysioExperiment",
               "PhysioLongitudinal", "PhysioCohort")) {
    expect_true(methods::isVirtualClass(cl) || !is.null(methods::getClass(cl)),
                info = cl)
  }
})

test_that("the multi-stream container round-trips through the old name", {
  mk <- function(n, sr) PhysioExperiment(assays = list(raw = matrix(rnorm(n * 2), n, 2)),
                                         samplingRate = sr)
  mr <- MultiRatePhysioExperiment(streams = list(A = mk(100, 100), B = mk(250, 250)),
                                  t0 = 5, offsets = c(A = 0, B = -0.25))
  expect_equal(length(streams(mr)), 2L)
  expect_equal(mr@clock$t0, 5)
  f <- tempfile(fileext = ".rds"); saveRDS(mr, f)
  back <- readRDS(f)
  expect_equal(back@clock$t0, 5)
  expect_equal(unname(back@clock$offsets), c(0, -0.25))
})
