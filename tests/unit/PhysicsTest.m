classdef PhysicsTest < matlab.unittest.TestCase
    %PHYSICSTEST  Pure maths, no GUI (Python equivalent: tests/unit/test_compute.py).
    %   Covers the functions extracted from the .mlapp into src/+quant4d.

    methods (TestClassSetup)
        function addSrc(tc)
            root = fileparts(fileparts(fileparts(mfilename("fullpath"))));
            tc.applyFixture(matlab.unittest.fixtures.PathFixture(fullfile(root, "src")));
        end
    end

    properties (TestParameter)
        gridSize = struct("evenNonSquare", [64 48], "oddNonSquare", [63 47], "square", [32 32])
        nseg = struct("four", 4, "six", 6, "sixteen", 16)
    end

    methods (Test)
        function iCoMRecoversPotential(tc, gridSize)
            % CoM of a thin object is proportional to grad(phi); iCoM must give phi back,
            % with the same scale along x and y (the app's version did not for non-square scans).
            [phi, gx, gy] = PhysicsTest.periodicPotential(gridSize);
            icom = quant4d.integrateCoM(gx, gy);
            tc.verifyEqual(icom, phi - mean(phi, "all"), "AbsTol", 1e-10);
        end

        function dCoMIsLaplacian(tc, gridSize)
            [phi, gx, gy] = PhysicsTest.periodicPotential(gridSize);
            [~, dcom] = quant4d.integrateCoM(gx, gy);
            n = gridSize;
            [KX, KY] = ndgrid(ifftshift((0:n(1)-1) - floor(n(1)/2)).'/n(1), ...
                              ifftshift((0:n(2)-1) - floor(n(2)/2))/n(2));
            lap = real(ifft2(-4*pi^2*(KX.^2 + KY.^2).*fft2(phi)));
            tc.verifyEqual(dcom, lap, "AbsTol", 1e-10);
        end

        function bandPassRemovesOutOfBand(tc)
            [~, gx, gy] = PhysicsTest.periodicPotential([64 48]);   % modes at |k| ~ 0.06
            icom = quant4d.integrateCoM(gx, gy, [0.2 Inf]);
            tc.verifyLessThan(max(abs(icom), [], "all"), 1e-10);
        end

        function periodsToBandConverts(tc)
            tc.verifyEqual(quant4d.periodsToBand([2 200]), [0.005 0.5], "AbsTol", 1e-15);
            tc.verifyEqual(quant4d.periodsToBand([200 2]), [0.005 0.5], "AbsTol", 1e-15, "order");
            tc.verifyEqual(quant4d.periodsToBand([4 Inf]), [0 0.25]);
        end

        function featureSizeBandKeepsOnlyThoseFeatures(tc)
            % 16-px features along x and 6-px features along y on a non-square scan:
            % keeping 8..32 px must return the 16-px part and drop the 6-px part
            n = [64 48];
            [x, y] = ndgrid(0:n(1) - 1, 0:n(2) - 1);
            a = 2*pi/16;  b = 2*pi/6;
            keep = sin(a*x);       drop = cos(b*y);
            gx = a*cos(a*x);       gy = -b*sin(b*y);
            icom = quant4d.integrateCoM(gx, gy, quant4d.periodsToBand([8 32]));
            tc.verifyEqual(icom, keep, "AbsTol", 1e-10);
            tc.verifyLessThan(abs(sum(icom(:).*drop(:))), 1e-8);
        end

        function defaultFeatureRangeIsNoFilter(tc, gridSize)
            % the app's default: smallest feature 1 px, largest = the larger scan size
            [~, gx, gy] = PhysicsTest.periodicPotential(gridSize);
            filtered = quant4d.integrateCoM(gx, gy, quant4d.periodsToBand([1 max(gridSize)]));
            tc.verifyEqual(filtered, quant4d.integrateCoM(gx, gy), "AbsTol", 1e-12);
        end

        function sectorCentroidMatchesNumericIntegral(tc, nseg)
            r1 = 10; r2 = 30;
            v = quant4d.segmentCentroids(nseg, 1, r1, r2, 0);
            % brute-force centroid of segment 1 (centred on angle 0) on a fine polar grid
            r = linspace(r1, r2, 2001);
            t = linspace(-pi/nseg, pi/nseg, 2001);
            [R, T] = ndgrid(r, t);
            expected = trapz(t, trapz(r, R.^2.*cos(T), 1)) / trapz(t, trapz(r, R, 1));
            tc.verifyEqual(norm(v(1, :)), expected, "RelTol", 1e-4);
        end

        function segmentCentroidsFollowRotationOnce(tc)
            v0 = quant4d.segmentCentroids(4, 2, 5, 20, 0);
            v30 = quant4d.segmentCentroids(4, 2, 5, 20, 30);
            R = [cosd(30) sind(30); -sind(30) cosd(30)];   % Quant4D's rotation_matrix (row vectors)
            tc.verifyEqual(v30, v0*R, "AbsTol", 1e-12);
        end

        function segmentRowOrderMatchesMasks(tc)
            v = quant4d.segmentCentroids(4, 3, 0, 30, 0);
            tc.verifySize(v, [12 2]);
            rungRadius = vecnorm(v(1:4:end, :), 2, 2);      % segment 1 of each rung
            tc.verifyTrue(issorted(rungRadius), "rows must be rung-major, inner rung first");
        end
    end

    methods (Static)
        function [phi, gx, gy] = periodicPotential(n)
            [x, y] = ndgrid(0:n(1) - 1, 0:n(2) - 1);
            a = 2*pi*3/n(1);  b = 2*pi*2/n(2);
            phi = sin(a*x).*cos(b*y) + 0.5*cos(a*x);
            gx = a*cos(a*x).*cos(b*y) - 0.5*a*sin(a*x);
            gy = -b*sin(a*x).*sin(b*y);
        end
    end
end
