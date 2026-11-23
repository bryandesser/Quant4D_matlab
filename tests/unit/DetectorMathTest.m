classdef DetectorMathTest < matlab.unittest.TestCase
    %DETECTORMATHTEST  Annular rings, CoM, DPC, scan-rotation search, file-name parsing
    %   (Python: tests/unit/test_compute.py).

    properties (TestParameter)
        detectorRotation = {0, 30, -75}
        trueScan = {0, 37, -120, 170}
        trueFlip = {false, true}
        startScan = {0, 25}
        startFlip = {false, true}
    end

    methods (TestClassSetup)
        function setup(tc)
            root = fileparts(fileparts(fileparts(mfilename("fullpath"))));
            tc.applyFixture(matlab.unittest.fixtures.PathFixture(fullfile(root, "src")));
        end
    end

    methods (Test)
        % ---------------- annular ----------------
        function everyPixelInOneRing(tc)
            bins = quant4d.radialBins([24 16], [13.2 8.7], 1.5, 15);
            tc.verifyTrue(all(sum(bins, 1) == 1));
        end

        function ringsMatchTheMask(tc)
            % BF/ADF summed from rings must equal mask*data (the app added one extra ring)
            [bins, edges] = quant4d.radialBins([24 16], [13.2 8.7], 1.5, 15);
            k = quant4d.binRange(edges, 3, 9);
            mask = reshape(any(bins(k, :), 1), 24, 16);
            [x, y] = ndgrid(1:24, 1:16);
            r = hypot(x - 13.2, y - 8.7);
            tc.verifyEqual(mask, r >= 3 & r < 9);

            data = rand(24*16, 10);
            tc.verifyEqual(sum(double(bins(k, :))*data, 1), double(mask(:)).'*data, "AbsTol", 1e-10);
        end

        % ---------------- CoM / DPC ----------------
        function centerOfMassOfDeltas(tc)
            P = zeros(24, 16, 2);
            P(16, 5, 1) = 1;  P(10, 12, 2) = 1;
            [cx, cy] = quant4d.centerOfMass(reshape(P, 24*16, []), true(24, 16), [12 8], [2 1]);
            tc.verifyEqual([cx(:) cy(:)], [4 -3; -2 4], "AbsTol", 1e-12);
        end

        function centerOfMassFlipThenRotate(tc)
            P = zeros(24, 16, 2);
            P(16, 5, 1) = 1;  P(10, 12, 2) = 1;
            [cx, cy] = quant4d.centerOfMass(reshape(P, 24*16, []), true(24, 16), [12 8], [2 1], ...
                                            FlipY=true, ScanRotation=90);
            R = [cosd(90) sind(90); -sind(90) cosd(90)];
            tc.verifyEqual([cx(:) cy(:)], [4 3; -2 -4]*R, "AbsTol", 1e-12);
        end

        function centerOfMassOnSingleData(tc)
            P = rand(24*16, 3, "single");
            [cx, ~] = quant4d.centerOfMass(P, true(24, 16), [12 8], [3 1]);
            tc.verifyClass(cx, "single");
        end

        function dpcConvergesToCoM(tc, detectorRotation)
            % fine segments/rungs => DPC ~ CoM; catches the degree/radian factor (x57.3)
            % and the doubled detector rotation of the app's integrate_CoM
            n = [96 96];  c = [48.3 47.6];
            bins = quant4d.radialBins(n, c, 1, 70);
            ann = reshape(any(bins(5:40, :), 1), n);
            [x, y] = ndgrid(1:n(1), 1:n(2));
            I = exp(-((x - 60).^2 + (y - 40).^2)/300) + 0.2*exp(-((x - 30).^2 + (y - 55).^2)/200);
            I = I(:).*[1 0.7 1.3];
            [ccx, ccy] = quant4d.centerOfMass(I, ann, c, [3 1], ScanRotation=20);
            masks = quant4d.segmentMasks(n, c, 32, 16, 4, 40, detectorRotation, false);
            cen = quant4d.segmentCentroids(32, 16, 4, 40, detectorRotation);
            [dx, dy] = quant4d.dpcCoM(I, masks, ann, cen, [3 1], 20);
            ratio = complex(dx, dy)./complex(ccx, ccy);
            tc.verifyEqual(abs(ratio), ones(3, 1), "RelTol", 0.05);
            tc.verifyEqual(angle(ratio), zeros(3, 1), "AbsTol", deg2rad(2));
        end

        function segmentMasksPartitionTheAnnulus(tc)
            masks = quant4d.segmentMasks([64 64], [32.5 32.5], 6, 3, 5, 25, 17, true);
            bins = quant4d.radialBins([64 64], [32.5 32.5], 5, 40);
            tc.verifyTrue(all(sum(masks, 1) <= 1), "segments overlap");
            tc.verifyEqual(any(masks, 1), any(bins(2:5, :), 1), "segments must tile 5 <= r < 25");
        end

        % ---------------- scan rotation search ----------------
        function minimizeCurlRecoversScanSettings(tc, trueScan, trueFlip, startScan, startFlip)
            n = [40 32];
            [x, y] = ndgrid(1:n(1), 1:n(2));
            phi = exp(-((x - 15).^2 + (y - 12).^2)/40) - 0.6*exp(-((x - 28).^2 + (y - 22).^2)/25) ...
                  + 0.002*x.*y;
            [gy, gx] = gradient(phi);                     % gx = d/dx along dim 1
            G = [gx(:) gy(:)];                            % curl-free: what the right settings give
            R = @(d) [cosd(d) sind(d); -sind(d) cosd(d)];
            F = @(f) diag([1, 1 - 2*f]);
            raw = G*R(trueScan).'*F(trueFlip);            % detector-frame CoM
            cur = raw*F(startFlip)*R(startScan);          % what the app currently shows
            [s, f] = quant4d.minimizeCurl(reshape(cur(:, 1), n), reshape(cur(:, 2), n), startScan, startFlip);
            tc.verifyEqual(f, trueFlip);
            tc.verifyLessThan(mod(s - trueScan + 0.5, 180), 1.0001, ...
                              "rotation wrong (modulo the 180 deg ambiguity)");
        end

        function minimizeCurlToleratesNaN(tc)
            [x, y] = ndgrid(1:40, 1:32);
            [gy, gx] = gradient(exp(-((x - 15).^2 + (y - 12).^2)/40) + 0.002*x.*y);
            gx(3, 3) = NaN;  gy(3, 3) = NaN;
            [s, f] = quant4d.minimizeCurl(gx, gy, 0, false);
            tc.verifyTrue(isscalar(s) && isfinite(s));
            tc.verifyFalse(f);
            tc.verifyLessThan(mod(s + 0.5, 180), 1.0001);
        end

        function minimizeCurlAllNaNErrors(tc)
            tc.verifyError(@() quant4d.minimizeCurl(NaN(8), NaN(8)), "quant4d:minimizeCurl:nan");
        end

        % ---------------- file names / scan shape ----------------
        function scanShapeMultipliesBack(tc)
            tc.verifyEqual(quant4d.guessScanShape(24), [6 4]);
            tc.verifyEqual(quant4d.guessScanShape(4096), [64 64]);
            tc.verifyEqual(quant4d.guessScanShape(7), [7 1]);
        end

        function dimsFromFileNames(tc)
            [d, empad] = quant4d.parseDimsFromName("C:\data\scan_x256_y128.raw");
            tc.verifyEqual(d, [128 128 256 128]);
            tc.verifyTrue(empad);
            tc.verifyEqual(quant4d.parseDimsFromName("s_64x32x256x128_c.bin"), [64 32 256 128]);
            tc.verifyEmpty(quant4d.parseDimsFromName("a_x_x_x.bin"));
        end
    end
end
