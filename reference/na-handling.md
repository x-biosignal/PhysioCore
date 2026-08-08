# NA Value Handling Utilities for PhysioExperiment

This file provides standardized NA handling functions and documents the
NA handling policy for the PhysioExperiment package.

## NA Handling Policy

The PhysioExperiment package follows these principles for NA handling:

1.  **Preservation**: NA values in input data are preserved by default.
    Functions do not remove or replace NA values unless explicitly
    requested.

2.  **Propagation**: Operations that encounter NA values will propagate
    them in the output (standard R behavior) unless na.rm = TRUE is
    specified.

3.  **Explicit Control**: Functions that can handle NA values provide
    na.rm or na.action parameters for user control.

4.  **Documentation**: Each function documents its NA handling behavior.

5.  **Validation**: Input validation functions check for NA and provide
    informative warnings or errors as appropriate.
