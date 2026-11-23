classdef DisplayTest < q4dtest.AppTestCase
    %DISPLAYTEST  Brightness/contrast/gamma, colormaps, histogram, zoom
    %   (Python: tests/integration/test_display.py, tests/unit/test_histbox.py).

    methods (TestMethodSetup)
        function load(tc)
            tc.importSynthetic();
        end
    end

    methods (Test)
        function displayedDataIsNormalised(tc)
            cdata = tc.App.image_displays.Real.CData;
            tc.verifyGreaterThanOrEqual(min(cdata, [], "all"), 0);
            tc.verifyLessThanOrEqual(max(cdata, [], "all"), 1);
        end

        function constantImageIsNormalised(tc)
            % plot_image's "(high <= 1 || high >= 0)" is always true, so a constant image of 5
            % was displayed unscaled
            tc.App.images.Real = 5*ones(tc.SCAN, "single");
            tc.App.plot_image(tc.event(tc.App.UpdateImages), "Real");
            cdata = tc.App.image_displays.Real.CData;
            tc.verifyLessThanOrEqual(max(cdata, [], "all"), 1);
        end

        function brightnessSliderUpdatesUserData(tc)
            tc.App.DisplayImage.Value = 'Real';
            tc.type(tc.App.DisplayBrightnessSpinner, 70);
            tc.verifyEqual(tc.App.image_axes.Real.UserData.brightness, 70);
            tc.verifyEqual(tc.App.DisplayBrightness.Value, 70);
        end

        function histogramBoxDragChangesContrast(tc)
            % drag the histogram range box's right edge inwards: contrast must go up
            tc.choose(tc.App.DisplayImage, 'Real-space');
            before = tc.App.DisplayContrast.Value;
            box = tc.App.annotations.hist.Hi;
            tc.drag(tc.App.HistogramAxes, box.Position, box.Position - [0.3*box.Position(1) 0]);
            tc.verifyGreaterThan(tc.App.DisplayContrast.Value, before);
        end

        function scrollWheelZoomInEveryWindow(tc)
            % scroll_figure had no limits for the Preview/ColorWheel windows ('lim' undefined)
            for id = ["Diffraction" "Real" "Preview"]
                f = tc.App.figures.(id);
                tc.verifyWarningFree(@() f.WindowScrollWheelFcn(f, struct("VerticalScrollCount", -1)), id);
            end
        end

        function axisFlipButtons(tc)
            tc.press(tc.App.ReverseRealX);
            tc.verifyEqual(string(tc.App.image_axes.Real.XDir), "reverse");
            tc.verifyEqual(string(tc.App.image_axes.ColorWheel.XDir), "reverse", "colour wheel follows real space");
        end
    end
end
