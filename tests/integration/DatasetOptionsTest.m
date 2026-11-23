classdef DatasetOptionsTest < q4dtest.AppTestCase
    %DATASETOPTIONSTEST  Settings > Data Info: swap byte order / swap X-Y, NaN handling
    %   (Python: tests/integration/test_dataset_options.py).

    methods (Test)
        function swapDiffractionXYTransposesPatterns(tc)
            % dataset_options_callbacks referenced dataset_parameters.n_pixels_file (no such field)
            tc.importSynthetic();
            before = tc.App.images.Diffraction;
            tc.showInfoTab();
            tc.press(tc.App.SwapDiffractionXY);
            tc.verifyEqual(tc.App.dataset_parameters.n_pixels, fliplr(tc.DET));
            tc.verifyEqual(tc.App.images.Diffraction, before.', "RelTol", 1e-5);
        end

        function swapRealXYTransposesImages(tc)
            tc.importSynthetic();
            before = tc.App.images.Real;
            tc.showInfoTab();
            tc.press(tc.App.SwapRealXY);
            tc.verifyEqual(tc.App.dataset_parameters.n_frames, fliplr(tc.SCAN));
            tc.verifyEqual(tc.App.images.Real, before.', "RelTol", 1e-5);
        end

        function swapByteOrderTwiceIsIdentity(tc)
            tc.importSynthetic();
            tc.showInfoTab();
            q4dtest.dialogs("queue", "quest", "Yes");
            tc.press(tc.App.SwapByteOrder);
            q4dtest.dialogs("queue", "quest", "Yes");
            tc.press(tc.App.SwapByteOrder);
            tc.verifyDataEquals(tc.Data);
        end

        function nanDataWithContinueStillAligns(tc)
            % check_NaN(.., false) read dataset_parameters.pixel_binning (field is pixels_binning)
            data = q4dtest.makeDataset();
            data(1, 1, 1, 1) = NaN;
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "nan.bin"), data);
            q4dtest.dialogs("queue", "quest", "Continue");
            tc.importFile(p);
            tc.verifyEqual(string(tc.App.Mode.Value), "Alignment");
            q4dtest.dialogs("queue", "quest", "No");      % don't swap bytes
            tc.verifyWarningFree(@() tc.App.check_NaN(tc.App.images.Diffraction, false));
        end

        function previewSetNaNsToZeroFixesThePreview(tc)
            % the PreviewButton branch zeroed NaNs in app.data (the loaded dataset), not the preview
            data = q4dtest.makeDataset();
            data(1:4, :, :, :) = NaN;
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "nan_preview.bin"), data);
            tc.fillImportForm(p);
            q4dtest.dialogs("queue", "quest", "Set NaNs to 0");
            tc.press(tc.App.PreviewButton);
            tc.verifyFalse(any(isnan(tc.App.images.Preview), "all"));
        end
    end

    methods
        function showInfoTab(tc)
            figure(tc.App.figures.Settings);
            tc.App.SettingsTabGroup.SelectedTab = tc.App.InfoTab;
            drawnow
        end
    end
end
