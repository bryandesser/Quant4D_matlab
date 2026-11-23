classdef SaveExportTest < q4dtest.AppTestCase
    %SAVEEXPORTTEST  Save images (TIFF/PNG) and export data (raw/HDF5)
    %   (Python: tests/integration/test_save_export.py, tests/unit/test_export.py).

    methods (TestMethodSetup)
        function load(tc)
            tc.importSynthetic();
            tc.press(tc.App.ShowSaveWindow);
            tc.App.SaveDirectoryPath.Value = char(tc.TempDir);
        end
    end

    methods (Test)
        function rawExportRoundTrip(tc, byteOrder)
            tc.selectExport("raw", byteOrder);
            tc.press(tc.App.SaveExport);
            f = fullfile(tc.TempDir, tc.App.ExportFilename.Value + ".raw");
            fid = fopen(f, "r", byteOrder); c = onCleanup(@() fclose(fid));
            back = fread(fid, Inf, "single=>single");
            tc.verifyEqual(back, reshape(gather(tc.App.data), [], 1));
        end

        function hdf5ExportRoundTrip(tc)
            tc.selectExport("h5", "l");
            tc.press(tc.App.SaveExport);
            f = fullfile(tc.TempDir, tc.App.ExportFilename.Value + ".h5");
            back = h5read(f, "/STEM4D");                  % MATLAB order (kx, ky, rx, ry)
            tc.verifyEqual(back, reshape(gather(tc.App.data), [tc.DET tc.SCAN]));
            tc.verifyEqual(size(tc.App.data), [prod(tc.DET) prod(tc.SCAN)], "data reshaped back to 2-D");
        end

        function exportDoesNotOverwrite(tc)
            tc.selectExport("raw", "l");
            tc.press(tc.App.SaveExport);
            tc.press(tc.App.SaveExport);
            shown = q4dtest.dialogs("shown");
            tc.verifyTrue(any(contains([shown.message], "already exists")));
        end

        function tiffIsUnscaledFloat(tc)
            tc.saveImages("Real", tiff=true, png=false);
            im = imread(tc.imageFile("Real") + ".tif");
            tc.verifyClass(im, "single");
            tc.verifyEqual(im, single(tc.App.images.Real.'));
        end

        function dpcMaskStackDoesNotGrowOnResave(tc)
            % imwrite(...,"WriteMode","append") appended to the file left by the previous save
            tc.chooseMode("Segmented (DPC)");
            tc.press(tc.App.ShowSaveWindow);
            tc.saveImages("DiffractionMask", tiff=true, png=false);
            tc.saveImages("DiffractionMask", tiff=true, png=false);
            n = numel(imfinfo(tc.imageFile("DiffractionMask") + ".tif"));
            tc.verifyEqual(n, tc.App.NSeg.Value*tc.App.NRung.Value);
        end

        function pngWithoutAnnotationsForConstantImage(tc)
            tc.App.images.Real = 5*ones(tc.SCAN, "single");
            tc.App.plot_image(tc.event(tc.App.UpdateImages), "Real");
            tc.saveImages("Real", tiff=false, png=true);
            tc.verifyTrue(isfile(tc.imageFile("Real") + ".png"));
        end
    end

    properties (TestParameter)
        byteOrder = {"l", "b"}
    end

    methods
        function selectExport(tc, type, byteOrder)
            tc.App.SaveTabGroup.SelectedTab = tc.App.ExportDatasetTab;
            tc.App.ExportDataType.Value = char(type);
            tc.App.ExportByteOrder.Value = char(byteOrder);
            tc.App.ExportFilename.Value = 'export';
            tc.App.ExportDimensionSuffix.Value = false;
        end

        function saveImages(tc, id, opts)
            arguments
                tc; id (1,1) string; opts.tiff (1,1) logical; opts.png (1,1) logical
            end
            tc.App.SaveTabGroup.SelectedTab = tc.App.SaveImagesTab;
            tc.App.SaveImageTIFF.Value = opts.tiff;
            tc.App.SaveImagePNG.Value = opts.png;
            tc.App.SaveImageAnnotations.Value = false;
            tc.App.SaveImageList.Value = {char(id)};
            tc.press(tc.App.SaveExport);
        end

        function f = imageFile(tc, id)
            items = string(tc.App.SaveImageList.Items);
            f = fullfile(tc.TempDir, items(string(tc.App.SaveImageList.ItemsData) == id));
        end
    end
end
