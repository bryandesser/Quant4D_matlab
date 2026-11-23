classdef AppTestCase < matlab.uitest.TestCase
    %APPTESTCASE  Base class for GUI integration tests (Python equivalent: tests/conftest.py).
    %
    %   * puts src/ and the dialog stubs (tests/stubs) on the path, so no test ever blocks on
    %     a modal dialog; script answers with q4dtest.dialogs("queue", kind, answer)
    %   * launches a fresh Quant4D per test method and closes it (and every window) afterwards
    %   * importFile() drives the Import window exactly like a user would
    %
    %   Function-scoped app (fresh per test) is the default. If the suite gets slow, move the
    %   import into a TestClassSetup for read-only tests, as `loaded_app` does in Python.

    properties (Constant)
        SCAN = [6 4]      % [rx ry] probe positions — non-square on purpose
        DET  = [24 16]    % [kx ky] detector pixels — non-square on purpose
    end

    properties
        App               % Quant4D app under test
        TempDir (1,1) string
        Data              % the synthetic (kx, ky, rx, ry) dataset of the current test
    end

    methods (TestClassSetup)
        function addPaths(tc)
            import matlab.unittest.fixtures.*
            root = q4dtest.AppTestCase.repoRoot();
            tc.applyFixture(PathFixture(fullfile(root, "src")));
            tc.applyFixture(PathFixture(fullfile(root, "tests", "stubs")));
            % the stubs shadow MATLAB's own questdlg/msgbox/... on purpose
            tc.applyFixture(SuppressedWarningsFixture("MATLAB:dispatcher:nameConflict"));
            % stubs answer from the queue only while these tests run
            q4dtest.dialogs("activate");
            tc.addTeardown(@() q4dtest.dialogs("deactivate"));
        end
    end

    methods (TestMethodSetup)
        function launch(tc)
            q4dtest.dialogs("reset");
            tc.TempDir = tc.applyFixture(matlab.unittest.fixtures.TemporaryFolderFixture).Folder;
            tc.App = q4dtest.AppTestCase.newApp();
            tc.addTeardown(@q4dtest.AppTestCase.closeApp, tc.App);
        end
    end

    methods
        function importFile(tc, path, varargin)
            %IMPORTFILE  Import through the Import window, as a user would.
            %   Takes the same name-value options as fillImportForm.
            tc.fillImportForm(path, varargin{:});
            tc.press(tc.App.ImportData);
            drawnow
        end

        function fillImportForm(tc, path, opts)
            %FILLIMPORTFORM  Open the Import window and fill it in, without pressing Import.
            arguments
                tc
                path (1,1) string
                opts.Dims (1,4) double = [q4dtest.AppTestCase.DET q4dtest.AppTestCase.SCAN]
                opts.DataType (1,1) string = "32-bit Real"     % item text of ImportDataType
                opts.ByteOrder (1,1) string = "Little Endian"
                opts.AxisOrder (1,1) string = ""               % e.g. "(rₓ rᵧ kₓ kᵧ)"; "" = default
                opts.Offset (1,1) double = 0
                opts.Header (1,1) double = 0
                opts.Footer (1,1) double = 0
                opts.Binning (1,1) double = 1
                opts.GPU double = []                           % [] = leave the app's choice
            end
            app = tc.App;
            tc.press(app.ShowImportWindow);
            tc.type(app.ImportFilePath, char(path));   % import_select_file -> import_file_type

            if ~endsWith(lower(path), [".h5" ".hdf5" ".hspy"])   % HDF5 fills these in itself
                if opts.AxisOrder ~= ""
                    tc.choose(app.ImportAxisOrder, char(opts.AxisOrder));
                end
                tc.choose(app.ImportDataType, char(opts.DataType));
                tc.choose(app.ImportByteOrder, char(opts.ByteOrder));
                tc.type(app.DatasetOffset, opts.Offset);
                tc.type(app.DataHeader, opts.Header);
                tc.type(app.DataFooter, opts.Footer);
                tc.type(app.ImportPixelsX, opts.Dims(1));
                tc.type(app.ImportPixelsY, opts.Dims(2));
                tc.type(app.ImportFramesX, opts.Dims(3));
                tc.type(app.ImportFramesY, opts.Dims(4));
            end
            if opts.Binning > 1
                tc.choose(app.ImportPartialPixels, true);
                tc.type(app.DiffractionPartialImportPixelsDist, opts.Binning);
            end
            if ~isempty(opts.GPU)
                % set last: every form edit re-runs check_memory, which re-picks the GPU
                app.GPU.Value = opts.GPU;
            end
        end

        function importSynthetic(tc, varargin)
            %IMPORTSYNTHETIC  Write the default synthetic dataset as float32 .bin and import it.
            tc.Data = q4dtest.makeDataset();
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "synthetic.bin"), tc.Data);
            tc.importFile(p, varargin{:});
        end

        function chooseMode(tc, label)
            %CHOOSEMODE  e.g. "Annular/Round", "Center of Mass", "Segmented (DPC)".
            tc.choose(tc.App.Mode, char(label));
            drawnow
        end

        function e = event(tc, source, name)
            %EVENT  A minimal event struct, for calling Quant4D's public methods directly.
            arguments
                tc %#ok<INUSA>
                source
                name (1,1) string = "ButtonPushed"
            end
            e = struct("Source", source, "EventName", name);
        end

        function verifyDataEquals(tc, expected4d, tol)
            %VERIFYDATAEQUALS  app.data (pixels x frames, maybe on GPU) vs a (kx,ky,rx,ry) array.
            if nargin < 3, tol = 1e-6; end
            sz = size(expected4d, 1:4);
            actual = gather(tc.App.data);
            tc.verifyClass(actual, "single", "Quant4D computes in single precision.");
            tc.verifySize(actual, [prod(sz(1:2)) prod(sz(3:4))]);
            tc.verifyEqual(double(actual), double(reshape(expected4d, prod(sz(1:2)), [])), ...
                "AbsTol", tol);
        end
    end

    methods (Static)
        function root = repoRoot()
            % tests/+q4dtest/AppTestCase.m -> repo root
            root = fileparts(fileparts(fileparts(mfilename("fullpath"))));
        end

        function app = newApp()
            % Launch the app under test: Quant4D (the .mlapp) by default, or another class
            % named in the QUANT4D_APP environment variable, e.g. to test an exported copy:
            %     setenv("QUANT4D_APP", "Quant4D_exported"); runtests("tests")
            name = string(getenv("QUANT4D_APP"));
            if name == ""
                name = "Quant4D";
            end
            app = feval(name);
        end

        function closeApp(app)
            % Close like the user does (CloseRequestFcn = close_function closes every window).
            if ~isempty(app) && isvalid(app) && isvalid(app.Quant4D_Fig)
                close(app.Quant4D_Fig);   % not "force": that would skip close_function
            end
            if ~isempty(app) && isvalid(app)
                delete(app);
            end
            delete(findall(groot, "Tag", "q4dtest-dialog"));
            delete(timerfindall("Name", "Import"));
            delete(timerfindall("Name", "Export"));
        end
    end
end
