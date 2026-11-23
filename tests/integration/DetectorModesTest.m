classdef DetectorModesTest < q4dtest.AppTestCase
    %DETECTORMODESTEST  Alignment / Annular / CoM / DPC / Virtual / Custom
    %   (Python: test_detector_modes.py, test_dpc_com_overlays.py, test_axis_direction.py).

    properties (TestParameter)
        mode = {"Alignment", "Annular/Round", "Center of Mass", "Segmented (DPC)", ...
                "Virtual Aperture", "Custom Detectors"}
        detectorRotation = {0, 30, -75}
    end

    methods (TestMethodSetup)
        function load(tc)
            tc.importSynthetic();
        end
    end

    methods (Test)
        function everyModeProducesARealSpaceImage(tc, mode)
            tc.chooseMode(mode);
            tc.verifySize(tc.App.images.Real, tc.SCAN);
            tc.verifySize(tc.App.images.DiffractionMask, tc.DET);
        end

        function annularImageMatchesDrawnMask(tc)
            % BF/ADF came from summed annular bins incl. the bin starting AT the outer radius
            tc.chooseMode("Annular/Round");
            tc.type(tc.App.OuterAnnularRadiusSpinner, 0.5*tc.App.OuterAnnularRadiusSpinner.Limits(2));
            tc.verifyRealMatchesMask(tc.App.masks.annular);
        end

        function annularImageFollowsCalibrationChange(tc)
            % annular_images were cached on the beam centre only; changing the convergence
            % angle (mrad/px) or AnnularStep left stale bins
            tc.chooseMode("Annular/Round");
            tc.chooseMode("Alignment");
            tc.type(tc.App.Alpha, 7.3);
            tc.chooseMode("Annular/Round");
            tc.verifyRealMatchesMask(tc.App.masks.annular);
        end

        function radiusEditKeepsAlphaConsistent(tc)
            % move_transmitted_beam computed mrad/px from the OLD radius
            tc.type(tc.App.Alpha, 20);
            tc.type(tc.App.TransBeamRSpinner, 4);
            tc.verifyEqual(tc.App.mradPx.Value, tc.App.Alpha.Value/tc.App.TransBeamR.Value, ...
                           "RelTol", 1e-9);
        end

        function dpcConvergesToCoMWithFineSegments(tc, detectorRotation)
            % With many segments and rungs the DPC estimate must approach true CoM. Catches the
            % degree/radian centroid factor (x57.3) and the doubled detector rotation.
            tc.chooseMode("Center of Mass");
            com = complex(tc.App.images.CoMX, tc.App.images.CoMY);

            tc.chooseMode("Segmented (DPC)");
            tc.type(tc.App.NSeg, 32);
            tc.type(tc.App.NRung, 16);
            tc.type(tc.App.DetectorRotationSpinner, detectorRotation);
            dpc = complex(tc.App.images.CoMX, tc.App.images.CoMY);

            tc.verifyEqual(abs(mean(dpc(:)))/abs(mean(com(:))), 1, "RelTol", 0.05, "magnitude");
            tc.verifyEqual(angle(mean(dpc(:))./mean(com(:))), 0, "AbsTol", deg2rad(2), "direction");
        end

        function bandPassIsFeatureSizeAndSurvivesBeamMoves(tc)
            % D2: the iCoM band-pass is a feature-size range in scan pixels, defaulting to
            % "no filter" [1, larger scan size]; C10: moving the beam must not reset it
            tc.verifyEqual(tc.App.BandpassFilter.Value, [1 max(tc.SCAN)]);
            tc.chooseMode("Center of Mass");
            tc.type(tc.App.BandpassFilterLow, 2);
            tc.chooseMode("Alignment");
            tc.type(tc.App.TransBeamXSpinner, tc.App.TransBeamXSpinner.Value + 1);
            tc.verifyEqual(tc.App.BandpassFilterLow.Value, 2);
        end

        function autoCurlToleratesNaNPixels(tc)
            % one probe position with zero counts in the annulus -> 0/0 -> NaN CoM;
            % mean() without "omitnan" turned the whole curl curve NaN
            tc.App.data(:, 1) = 0;
            tc.chooseMode("Center of Mass");
            tc.press(tc.App.ScanDirectionLock);
            tc.press(tc.App.AutoCurl);
            v = tc.App.ScanDirectionSlider.Value;
            tc.verifyTrue(isscalar(v) && isfinite(v));
        end

        function scanRotationAppliesInDpcToo(tc)
            tc.chooseMode("Segmented (DPC)");
            before = complex(tc.App.images.CoMX, tc.App.images.CoMY);
            tc.press(tc.App.ScanDirectionLock);
            tc.type(tc.App.ScanDirectionSpinner, 90);
            after = complex(tc.App.images.CoMX, tc.App.images.CoMY);
            tc.verifyEqual(abs(angle(mean(after(:))./mean(before(:)))), pi/2, "AbsTol", deg2rad(2));
        end

        function virtualApertureMaskDrivesImage(tc)
            tc.chooseMode("Virtual Aperture");
            tc.verifyRealMatchesMask(tc.App.images.DiffractionMask);
        end
    end

    methods
        function verifyRealMatchesMask(tc, mask)
            expected = reshape(double(mask(:)).'*double(gather(tc.App.data)), tc.SCAN);
            tc.verifyEqual(double(tc.App.images.Real), expected, "RelTol", 1e-4);
        end
    end
end
