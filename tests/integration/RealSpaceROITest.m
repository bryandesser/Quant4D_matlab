classdef RealSpaceROITest < q4dtest.AppTestCase
    %REALSPACEROITEST  Real-space ROI -> diffraction pattern
    %   (Python: tests/integration/test_realspace_roi.py).

    properties (TestParameter)
        shape = {"Full Image", "Point", "Ellipse", "Rectangle"}
        reducer = {"sum", "mean", "max", "std"}
    end

    methods (TestMethodSetup)
        function load(tc)
            tc.importSynthetic();
        end
    end

    methods (Test)
        function diffractionMatchesRoi(tc, shape)
            tc.choose(tc.App.RealROIShape, char(shape));
            tc.verifyDiffraction("sum");
        end

        function invertedRoi(tc, shape)
            % "Point" + Invert hit the single-frame fast path and failed to reshape N-1 frames
            tc.assumeNotEqual(shape, "Full Image", "Invert is disabled for the full image");
            tc.choose(tc.App.RealROIShape, char(shape));
            tc.press(tc.App.RealROIInvert);
            tc.verifyDiffraction("sum");
        end

        function reducersUseOnlyRoiFrames(tc, reducer)
            % max/std multiplied the data by the mask, so excluded frames counted as zeros
            tc.choose(tc.App.RealROIShape, 'Rectangle');
            tc.choose(tc.App.diffraction_dropdown, char(reducer));
            tc.verifyDiffraction(reducer);
        end

        function pointSpinnersMoveTheRoi(tc)
            tc.choose(tc.App.RealROIShape, 'Point');
            tc.type(tc.App.RealROIFrameX, 2);
            tc.type(tc.App.RealROIFrameY, 3);
            tc.verifyEqual(tc.App.annotations.RealROI.Real.Position, [2 3]);
            tc.verifyDiffraction("sum");
        end
    end

    methods
        function verifyDiffraction(tc, reducer)
            m = logical(tc.App.masks.real(:));
            d = double(gather(tc.App.data(:, m)));
            switch reducer
                case "sum",  e = sum(d, 2);
                case "mean", e = mean(d, 2);
                case "max",  e = max(d, [], 2);
                case "std",  e = std(d, 0, 2);
            end
            tc.verifyEqual(double(tc.App.images.Diffraction), reshape(e, tc.DET), "RelTol", 1e-4);
        end
    end
end
