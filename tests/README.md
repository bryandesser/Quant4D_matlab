# Quant4D (MATLAB) test suite

Same layout as the Python repo's `tests/`, built on `matlab.unittest` / `matlab.uitest`.

```
buildfile.m                     buildtool tasks: check, testUnit, test, testGPU
.github/workflows/matlab-tests.yml
src/+quant4d/                   pure maths extracted from the .mlapp: readRaw, readHDF5,
                                radialBins/binRange, centerOfMass, segmentMasks/Centroids,
                                dpcCoM, integrateCoM, minimizeCurl, guessScanShape, ...
src/+quant4d/+internal/         helpers for those (not API)
tests/
├── +q4dtest/                   shared helpers  (≈ conftest.py)
│   ├── AppTestCase.m           base class: paths, fresh app per test, importFile()
│   ├── dialogs.m               scripted answers + log for the dialog stubs
│   ├── makeDataset.m           6×4 scan of 24×16 patterns, drifting disc (same as Python)
│   ├── writeRaw.m / writeHDF5.m
├── stubs/                      shadow questdlg/msgbox/uiwait/uigetfile/... so nothing blocks
├── unit/                       no GUI: ReaderTest, DetectorMathTest, PhysicsTest, DmInfoTest
├── integration/                matlab.uitest: Startup, ImportPipeline, DetectorModes,
│                               RealSpaceROI, Display, DatasetOptions, CustomDetector, SaveExport
├── gpu/                        GpuParityTest (TestTags GPU; skipped without a usable GPU)
└── data/                       small DM3/DM4 fixtures (generate with Python tests/dm_writer.py)
```

Run from the repo root:

```matlab
buildtool            % static checks + unit + integration
buildtool testUnit   % seconds, no windows
buildtool testGPU
runtests("tests/integration/ImportPipelineTest.m", "ProcedureName", "bigEndian")
```

Conventions
- Tests drive the GUI with gestures (`press`, `type`, `choose`) for wiring, and call the app's
  public methods (`check_NaN`, `plot_image`, …) for precise checks — callback errors raised during
  a gesture are printed by MATLAB, not always rethrown, so assert on state, not on "no error".
- The stubs only act while a test runs (`AppTestCase` activates them). Outside a test they call
  MATLAB's real dialogs, but don't keep `tests/stubs` on your saved path anyway; the tests add it
  themselves.
- Answer a dialog before triggering it: `q4dtest.dialogs("queue", "quest", "Continue")`.
  Unqueued dialogs return their default button. `q4dtest.dialogs("shown")` lists what was shown.
- Synthetic data only, deliberately non-square in both spaces so any x/y swap fails a test.
