# Event management for PhysioExperiment

Functions for managing experimental events (triggers, markers,
annotations) within PhysioExperiment objects. PhysioEvents class

## Details

A simple S4 class to store event information as a DataFrame.

## Slots

- `events`:

  A DataFrame containing event information with columns: onset
  (numeric), duration (numeric), type (character), value (character).
