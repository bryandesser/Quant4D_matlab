classdef ImportPipelineTest < q4dtest.AppTestCase
    %IMPORTPIPELINETEST  File -> app.data, through the Import window
    %   (Python: tests/integration/test_import_pipeline.py, test_emd_import.py).
    %
    %   Every case compares app.data with the array that was written, so a wrong stride,
    %   byte order, axis order, type or binning shows up as a value mismatch.

    properties (TestParameter)
        intType = struct( ...
            "uint8",  {{"uint8",  "8-bit Unsigned"}}, ...
            "int16",  {{"int16",  "16-bit Signed"}}, ...
            "uint16", {{"uint16", "16-bit Unsigned"}}, ...
            "uint32", {{"uint32", "32-bit Unsigned"}}, ...
            "double", {{"double", "64-bit Real"}})
    end

    methods (Test)
        function float32FramesContiguous(tc)
            tc.importSynthetic();
            tc.verifyEqual(string(tc.App.Mode.Value), "Alignment");
            tc.verifyDataEquals(tc.Data);
        end

        function otherDataTypes(tc, intType)
            % read_file used a hard-coded 4-byte frame stride and kept integer data as integers
            [precision, label] = intType{:};
            expected = round(100*q4dtest.makeDataset());
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "typed.bin"), expected, Precision=precision);
            tc.importFile(p, DataType=label);
            tc.verifyDataEquals(single(expected));
            tc.verifyNotEmpty(tc.App.images.Real, "first image update failed (mtimes on integer data?)");
        end

        function bigEndian(tc)
            % read_file / preview_frame ignored the byte order (fread(..., "l"))
            expected = q4dtest.makeDataset();
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "be.bin"), expected, ByteOrder="b");
            tc.importFile(p, ByteOrder="Big Endian");
            tc.verifyDataEquals(expected);
        end

        function bigEndianUint16LikeMedipix(tc)
            expected = round(1000*q4dtest.makeDataset());
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "mib_like.bin"), expected, ...
                                 Precision="uint16", ByteOrder="b", Header=384);
            tc.importFile(p, DataType="16-bit Unsigned", ByteOrder="Big Endian", Header=384);
            tc.verifyDataEquals(single(expected));
        end

        function headerFooterAndOffset(tc)
            expected = q4dtest.makeDataset();
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "hf.bin"), expected, ...
                                 Header=32, Footer=1024, Offset=512);
            tc.importFile(p, Header=32, Footer=1024, Offset=512);
            tc.verifyDataEquals(expected);
        end

        function realSpaceMajorOrder(tc)
            expected = q4dtest.makeDataset();
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "rk.bin"), expected, Order="rk");
            % D1: the size fields stay detector/scan whatever the axis order
            tc.importFile(p, AxisOrder="(rₓ rᵧ kₓ kᵧ)");
            tc.verifyDataEquals(expected);
        end

        function binning2(tc)
            data = q4dtest.makeDataset();
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "bin.bin"), data);
            tc.importFile(p, Binning=2);
            sz = size(data);
            expected = squeeze(sum(reshape(data, [2 sz(1)/2 2 sz(2)/2 sz(3:4)]), [1 3]));
            tc.verifyDataEquals(reshape(expected, [sz(1:2)/2 sz(3:4)]), 1e-5);
        end

        function hdf5NonSquareDetector(tc)
            % read_file built the HDF5 file space as [.. n_pixels_total(2) n_pixels_total(2)]
            expected = q4dtest.makeDataset();
            p = q4dtest.writeHDF5(fullfile(tc.TempDir, "data.h5"), expected);
            tc.importFile(p);
            tc.verifyDataEquals(expected);
        end

        function hdf5ThreeDimensional(tc)
            % (N, ky, kx) datasets are common; the hand-built 4-D file space cannot read them
            data = q4dtest.makeDataset();
            sz = size(data);
            p = q4dtest.writeHDF5(fullfile(tc.TempDir, "data3d.h5"), reshape(data, sz(1), sz(2), []));
            tc.fillImportForm(p);
            tc.type(tc.App.ImportFramesX, sz(3));   % 24 frames: the sqrt guess gives 5 x 5
            tc.type(tc.App.ImportFramesY, sz(4));
            tc.press(tc.App.ImportData);
            tc.verifyEqual(size(gather(tc.App.data)), [prod(sz(1:2)) prod(sz(3:4))]);
        end

        function hdf5SubDatasetListRefreshesWhenPathTyped(tc)
            two = q4dtest.writeHDF5(fullfile(tc.TempDir, "two.h5"), q4dtest.makeDataset());
            h5create(two, "/extra", [4 4]);
            one = q4dtest.writeHDF5(fullfile(tc.TempDir, "one.h5"), q4dtest.makeDataset());
            tc.press(tc.App.ShowImportWindow);
            tc.type(tc.App.ImportFilePath, char(two));
            tc.type(tc.App.ImportFilePath, char(one));
            tc.verifyNumElements(tc.App.SubDataset.Items, 1, "stale items from the previous file");
        end

        function empadSizeCheckUsesBothScanAxes(tc)
            % import_file_type compared the file size with FramesX*FramesX
            data = q4dtest.makeDataset(8, 4, 128, 128);
            p = q4dtest.writeRaw(fullfile(tc.TempDir, "scan_x8_y4.raw"), data);   % no footer
            tc.press(tc.App.ShowImportWindow);
            tc.type(tc.App.ImportFilePath, char(p));
            tc.verifyTrue(tc.App.Custom.Value, "plain .raw of the right size should switch to Custom");
            tc.verifyEqual(tc.App.DataFooter.Value, 0);
        end

        function cancellingImportLeavesNothingLoaded(tc)
            tc.press(tc.App.ShowImportWindow);
            close(tc.App.figures.Import);              % = CancelImport
            tc.verifyEmpty(tc.App.data);
            tc.verifyEqual(string(tc.App.Mode.Value), "Preview");
        end
    end
end
