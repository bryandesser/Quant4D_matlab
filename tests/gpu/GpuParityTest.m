classdef (TestTags = {'GPU'}) GpuParityTest < q4dtest.AppTestCase
    %GPUPARITYTEST  GPU and CPU paths give the same images (Python: tests/integration/test_gpu.py).
    %   Skipped unless Parallel Computing Toolbox can use a GPU. Run on the self-hosted runner:
    %   buildtool testGPU

    methods (TestClassSetup)
        function requireGpu(tc)
            tc.assumeTrue(exist("canUseGPU", "file") > 0 && canUseGPU(), "No usable GPU");
        end
    end

    properties (TestParameter)
        mode = {"Annular/Round", "Center of Mass", "Segmented (DPC)", "Virtual Aperture"}
    end

    methods (Test)
        function imagesMatchCpu(tc, mode)
            cpu = tc.runMode(mode, 0);
            q4dtest.AppTestCase.closeApp(tc.App);
            tc.App = q4dtest.AppTestCase.newApp();
            tc.addTeardown(@q4dtest.AppTestCase.closeApp, tc.App);
            gpu = tc.runMode(mode, 1);
            for f = string(fieldnames(cpu)).'
                tc.verifyEqual(gpu.(f), cpu.(f), "RelTol", 1e-4, f);
            end
        end

        function dataLivesOnGpu(tc)
            tc.runMode("Alignment", 1);
            tc.verifyClass(tc.App.data, "gpuArray");
        end
    end

    methods
        function out = runMode(tc, mode, gpuIndex)
            tc.importSynthetic(GPU=gpuIndex);
            tc.chooseMode(mode);
            out.Real = gather(tc.App.images.Real);
            if isfield(tc.App.images, "CoMX") && ismember(mode, ["Center of Mass" "Segmented (DPC)"])
                out.CoMX = gather(tc.App.images.CoMX);
                out.CoMY = gather(tc.App.images.CoMY);
            end
        end
    end
end
