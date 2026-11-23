classdef ReaderTest < matlab.unittest.TestCase
    %READERTEST  quant4d.readRaw / quant4d.readHDF5 (Python: tests/unit/test_readers.py).
    %   Every case writes a known array and checks it comes back bit-for-bit.

    properties
        Dir (1,1) string
        Data                 % (kx, ky, rx, ry) = 24 x 16 x 6 x 4, single
    end

    properties (TestParameter)
        order = {"kr", "kr_inv", "rk", "rk_inv"}
        dtype = {"uint8", "int16", "uint16", "int32", "uint32", "single", "double", "int64"}
        byteOrder = {"l", "b"}
    end

    methods (TestClassSetup)
        function setup(tc)
            root = fileparts(fileparts(fileparts(mfilename("fullpath"))));
            tc.applyFixture(matlab.unittest.fixtures.PathFixture(fullfile(root, "src")));
            tc.applyFixture(matlab.unittest.fixtures.PathFixture(fullfile(root, "tests")));
            tc.Dir = tc.applyFixture(matlab.unittest.fixtures.TemporaryFolderFixture).Folder;
            tc.Data = q4dtest.makeDataset();
        end
    end

    methods (Test)
        function everyAxisOrder(tc, order)
            p = q4dtest.writeRaw(tc.file(), tc.Data, Order=order);
            out = quant4d.readRaw(p, [24 16 6 4], Order=order);
            tc.verifyEqual(out, tc.Data);
        end

        function everyTypeAndByteOrder(tc, dtype, byteOrder)
            % app regression: 4-byte stride, ignored byte order, integer output class
            expected = round(100*tc.Data);
            p = q4dtest.writeRaw(tc.file(), expected, Precision=dtype, ByteOrder=byteOrder, ...
                                 Header=16, Footer=1024, Offset=512);
            out = quant4d.readRaw(p, [24 16 6 4], DataType=dtype, ByteOrder=byteOrder, ...
                                  Header=16, Footer=1024, Offset=512);
            if ismember(dtype, ["double" "int64"])
                tc.verifyClass(out, "double");
            else
                tc.verifyClass(out, "single");
            end
            tc.verifyEqual(double(out), double(expected));
        end

        function headerFooterInRealSpaceMajor(tc)
            p = q4dtest.writeRaw(tc.file(), tc.Data, Order="rk_inv", ByteOrder="b", Header=8, Footer=8);
            out = quant4d.readRaw(p, [24 16 6 4], Order="rk_inv", ...
                                  ByteOrder="b", Header=8, Footer=8);
            tc.verifyEqual(out, tc.Data);
        end

        function binningAndCrop(tc, order)
            p = q4dtest.writeRaw(tc.file(), tc.Data, Order=order);
            out = quant4d.readRaw(p, [24 16 6 4], Order=order, ...
                                  Binning=2, PixelStart=[3 1], NumPixels=[10 8]);
            sub = tc.Data(3:22, 1:16, :, :);
            expected = squeeze(sum(sum(reshape(sub, 2, 10, 2, 8, 6, 4), 1), 3));
            tc.verifyEqual(out, single(expected), "AbsTol", 1e-5);
        end

        function samplingTakesEveryNthPosition(tc, order)
            p = q4dtest.writeRaw(tc.file(), tc.Data, Order=order);
            out = quant4d.readRaw(p, [24 16 6 4], Order=order, ...
                                  Sampling=2, FrameStart=[2 1]);
            tc.verifyEqual(out, tc.Data(:, :, 2:2:6, 1:2:4));
        end

        function samplingThatDoesNotDivideTheScan(tc)
            % the app's reader cropped start:start+n*s-1 and indexed past a 6-wide scan
            p = q4dtest.writeRaw(tc.file(), tc.Data);
            out = quant4d.readRaw(p, [24 16 6 4], Sampling=4);
            tc.verifyEqual(out, tc.Data(:, :, [1 5], 1));
        end

        function progressCanCancel(tc)
            p = q4dtest.writeRaw(tc.file(), tc.Data);
            [out, cancelled] = quant4d.readRaw(p, [24 16 6 4], Progress=@(done, total) done < 3);
            tc.verifyTrue(cancelled);
            tc.verifyEmpty(out);
        end

        function shortFileErrors(tc)
            p = q4dtest.writeRaw(tc.file(), tc.Data);
            tc.verifyError(@() quant4d.readRaw(p, [24 16 6 5]), "quant4d:readRaw:eof");
        end

        function cropOutsideDetectorErrors(tc)
            p = q4dtest.writeRaw(tc.file(), tc.Data);
            tc.verifyError(@() quant4d.readRaw(p, [24 16 6 4], PixelStart=[20 1], NumPixels=[10 NaN]), ...
                           "quant4d:range");
        end

        function noFileHandleLeak(tc)
            p = q4dtest.writeRaw(tc.file(), tc.Data);
            before = numel(fopen("all"));
            try
                quant4d.readRaw(p, [24 16 6 5]);   % errors half-way
            catch
            end
            tc.verifyEqual(numel(fopen("all")), before);
        end

        % ---------------- HDF5 ----------------
        function hdf5FourD(tc)
            p = q4dtest.writeHDF5(tc.file(".h5"), tc.Data);
            tc.verifyEqual(quant4d.readHDF5(p, "/data"), tc.Data);
        end

        function hdf5ThreeDWithScanSize(tc)
            p = q4dtest.writeHDF5(tc.file(".h5"), reshape(tc.Data, 24, 16, []));
            tc.verifyEqual(quant4d.readHDF5(p, "/data", ScanSize=[6 4]), tc.Data);
        end

        function hdf5ThreeDGuessesScan(tc)
            p = q4dtest.writeHDF5(tc.file(".h5"), reshape(tc.Data, 24, 16, []));
            tc.verifySize(quant4d.readHDF5(p, "/data"), [24 16 6 4]);   % 24 = 6 x 4
        end

        function hdf5IntegerIsConverted(tc)
            p = q4dtest.writeHDF5(tc.file(".h5"), uint16(round(1000*tc.Data)));
            out = quant4d.readHDF5(p, "/data");
            tc.verifyClass(out, "single");
            tc.verifyEqual(out, single(round(1000*tc.Data)));
        end

        function hdf5BinCropSample(tc)
            p = q4dtest.writeHDF5(tc.file(".h5"), tc.Data);
            out = quant4d.readHDF5(p, "/data", Binning=2, PixelStart=[3 1], NumPixels=[10 8], ...
                                   Sampling=2, FrameStart=[2 1]);
            sub = tc.Data(3:22, 1:16, 2:2:6, 1:2:4);
            expected = squeeze(sum(sum(reshape(sub, 2, 10, 2, 8, 3, 2), 1), 3));
            tc.verifyEqual(out, single(expected), "AbsTol", 1e-5);
        end
    end

    methods
        function p = file(tc, ext)
            if nargin < 2, ext = ".bin"; end
            [~, name] = fileparts(tempname);
            p = fullfile(tc.Dir, name + ext);
        end
    end

end
