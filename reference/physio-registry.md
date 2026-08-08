# PhysioCore plugin / registration API

A lightweight, package-private registry so that domain packages can
advertise the file readers/writers and named operations they provide
without PhysioCore depending on them. Downstream packages call the
`register*()` verbs from their own
[`.onLoad()`](https://x-biosignal.github.io/PhysioCore/reference/dot-onLoad.md)
(with `overwrite = TRUE`, so re-loading a session is idempotent); any
package discovers or dispatches through `available*()` and `get*()`.

## Extension contract

A reader or writer is a function whose first argument is a file path
(plus `...`). An operation is any function, keyed by `name` and tagged
with an optional `modality` (e.g. `"eeg"`). Keys are matched
case-insensitively and with surrounding whitespace trimmed; the
`available*()` discovery tables therefore report keys in their
normalized (lower-cased) form. Registering a key that already exists
errors unless `overwrite = TRUE`. A typical consumer registers in its
`.onLoad` with `overwrite = TRUE`, which keeps registration idempotent
across dev reloads (`devtools::load_all`):

    .onLoad <- function(libname, pkgname) {
      PhysioCore::registerReader("brainvision", readBrainVision,
                                 ext = c("vhdr", "eeg"), overwrite = TRUE)
    }

The store is anchored in a session option, so it survives a PhysioCore
reload and is shared across packages. Resolution is last-writer-wins: if
two packages register the same key with `overwrite = TRUE`, the one
loaded later prevails; `available*()` shows which function is currently
active.

## See also

Other plugin-api:
[`registerOperation()`](https://x-biosignal.github.io/PhysioCore/reference/registerOperation.md),
[`registerReader()`](https://x-biosignal.github.io/PhysioCore/reference/registerReader.md),
[`registerWriter()`](https://x-biosignal.github.io/PhysioCore/reference/registerWriter.md)
