classdef StartupTest < q4dtest.AppTestCase
    %STARTUPTEST  App launch and window wiring (Python: tests/integration/test_startup.py).

    methods (Test)
        function launchesInImportPreviewMode(tc)
            tc.verifyEqual(string(tc.App.Mode.Value), "Preview");
            tc.verifyEqual(string(tc.App.DisplayImage.ItemsData), "Preview");
            tc.verifyEmpty(tc.App.data);
        end

        function createsEveryImageWindow(tc)
            ids = ["Diffraction" "DiffractionMask" "Preview" "ColorWheel" "Real" "CoMPhMag" ...
                   "CoMPh" "CoMMag" "CoMX" "CoMY" "dCoM" "iCoM" "RealMask"];
            for id = ids
                tc.verifyTrue(isfield(tc.App.figures, id) && isvalid(tc.App.figures.(id)), id);
                tc.verifyTrue(isfield(tc.App.image_axes, id) && isvalid(tc.App.image_axes.(id)), id);
            end
            tc.verifyTrue(all(isfield(tc.App.figures, ["Settings" "Import" "Save"])));
        end

        function iconsShipWithTheSource(tc)
            % the app references src/icons/*.png by relative path; guard against them going
            % missing, since CI runs the app straight from a clone
            icons = fullfile(q4dtest.AppTestCase.repoRoot(), "src", "icons");
            for f = ["settings.png" "save.png" "import.png" "lock.png" "unlock.png"]
                tc.verifyTrue(isfile(fullfile(icons, f)), "missing src/icons/" + f);
            end
        end

        function closingMainWindowClosesEverything(tc)
            figs = [tc.App.ui_groups.image_figures; tc.App.figures.Settings; ...
                    tc.App.figures.Import; tc.App.figures.Save];
            close(tc.App.Quant4D_Fig);
            tc.verifyFalse(any(isvalid(figs)));
        end

        function f5KeyDoesNotErrorBeforeImport(tc)
            fig = tc.App.Quant4D_Fig;
            tc.verifyWarningFree(@() fig.KeyPressFcn(fig, struct("Key", "f5", "Modifier", {{}})));
        end
    end
end
