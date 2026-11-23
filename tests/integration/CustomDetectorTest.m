classdef CustomDetectorTest < q4dtest.AppTestCase
    %CUSTOMDETECTORTEST  Custom detectors, combination modes, Math masks
    %   (Python: tests/unit/test_custom_detector.py, tests/integration/test_custom_detector_ui.py).

    methods (TestMethodSetup)
        function load(tc)
            tc.importSynthetic();
            tc.chooseMode("Custom Detectors");
        end
    end

    methods (Test)
        function newCircleAddsRowAndMask(tc)
            tc.press(tc.App.CustomDetectorNewCircle);
            tc.verifyEqual(height(tc.App.CustomDetectorTable.Data), 1);
            tc.verifyEqual(string(tc.App.CustomDetectorTable.Data.ID), "A");
            tc.verifySize(tc.App.masks.Custom.A, tc.DET);
        end

        function idsRollOverPastZ(tc)
            for k = 1:27
                tc.press(tc.App.CustomDetectorNewCircle);
            end
            ids = string(tc.App.CustomDetectorTable.Data.ID);
            tc.verifyEqual(ids([1 26 27]).', ["A" "Z" "AA"]);
            tc.verifyEqual(numel(unique(ids)), 27);
        end

        function fileMaskInvertChangesTheDetector(tc)
            % the File branch inverted `mask`, stored it, then the common code inverted it again
            m = false(tc.DET);  m(5:12, 3:9) = true;
            f = fullfile(tc.TempDir, "mask.png");
            imwrite(m.', f);                           % images are stored row-major (y, x)
            q4dtest.dialogs("queue", "file", f);
            tc.press(tc.App.CustomDetectorNewFromFile);
            tc.verifyEqual(logical(tc.App.masks.Custom.A), m);

            tc.press(tc.App.CustomDetectorInvert);
            tc.verifyEqual(logical(tc.App.masks.Custom.A), ~m);
            tc.verifyRealMatchesMask(~m);
        end

        function colorMixImageHasDisplayOrientation(tc)
            % RealColorMix was [nx ny 3] while plot_image expects the transposed [ny nx 3]
            tc.choose(tc.App.CustomDetectorInterMask, 'Color Mix');
            tc.press(tc.App.CustomDetectorNewCircle);
            tc.verifySize(tc.App.image_displays.Real.CData, [fliplr(tc.SCAN) 3]);
        end

        function unionOfTwoMasks(tc)
            tc.choose(tc.App.CustomDetectorInterMask, 'Union');
            tc.press(tc.App.CustomDetectorNewCircle);
            tc.press(tc.App.CustomDetectorNewBandpass);
            expected = tc.App.masks.Custom.A | tc.App.masks.Custom.B;
            tc.verifyEqual(logical(tc.App.images.DiffractionMask), expected);
            tc.verifyRealMatchesMask(expected);
        end

        function mathMaskCombinesOthers(tc)
            tc.press(tc.App.CustomDetectorNewCircle);       % A
            tc.press(tc.App.CustomDetectorNewBandpass);     % B
            tc.press(tc.App.CustomDetectorNewMath);         % C
            tc.App.MathFormula.Value = {'A & ~B'};
            tc.press(tc.App.Evaluate);
            tc.verifyEqual(logical(tc.App.masks.Custom.C), ...
                           logical(tc.App.masks.Custom.A) & ~logical(tc.App.masks.Custom.B));
        end

        function deleteSelectedMask(tc)
            tc.press(tc.App.CustomDetectorNewCircle);
            tc.press(tc.App.CustomDetectorNewCircle);
            tc.press(tc.App.CustomDetectorDeleteMask);
            tc.verifyEqual(string(tc.App.CustomDetectorTable.Data.ID), "A");
            tc.verifyFalse(isfield(tc.App.masks.Custom, "B"));
        end
    end

    methods
        function verifyRealMatchesMask(tc, mask)
            expected = reshape(double(mask(:)).'*double(gather(tc.App.data)), tc.SCAN);
            tc.verifyEqual(double(tc.App.images.Real), expected, "RelTol", 1e-4);
        end
    end
end
