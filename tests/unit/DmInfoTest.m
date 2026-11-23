classdef DmInfoTest < matlab.unittest.TestCase
    %DMINFOTEST  src/dmInfo.m (Python equivalent: tests/unit/test_readers.py, DM part).
    %
    %   Real DM3/DM4 fixtures: generate them once with the Python repo's tests/dm_writer.py
    %   and commit them to tests/data/ (a few kB each). Tests that need them are skipped
    %   until they exist.

    properties
        DataDir (1,1) string
    end

    methods (TestClassSetup)
        function setup(tc)
            root = fileparts(fileparts(fileparts(mfilename("fullpath"))));
            tc.applyFixture(matlab.unittest.fixtures.PathFixture(fullfile(root, "src")));
            tc.DataDir = fullfile(root, "tests", "data");
        end
    end

    methods (Test)
        function notADmFileReturnsMessage(tc)
            f = tc.junkFile(uint8(1:64));
            info = dmInfo(f);
            tc.verifyTrue(ischar(info) || isstring(info));
            tc.verifySubstring(string(info), "Not a DM3/4");
        end

        function notADmFileClosesItsHandle(tc)
            % dmInfo returned early on a non-DM file without fclose (file stays locked on Windows)
            before = numel(fopen("all"));
            dmInfo(tc.junkFile(uint8(1:64)));
            tc.verifyEqual(numel(fopen("all")), before);
        end

        function missingFileReturnsMessage(tc)
            info = dmInfo(fullfile(tempdir, "definitely_missing_q4d.dm4"));
            tc.verifyTrue(ischar(info));
        end

        function dm4FixtureParses(tc)
            f = fullfile(tc.DataDir, "small_4d.dm4");
            tc.assumeTrue(isfile(f), "fixture tests/data/small_4d.dm4 not generated yet");
            info = dmInfo(f);
            tc.assertClass(info, "cell");
            img = info{1};
            tc.verifyEqual(cell2mat(img.Dimensions(:)).', [24 16 6 4]);
            tc.verifyEqual(info{end}.fileSize, dir(f).bytes);
        end

        function dm3FileSizeMatchesDisk(tc)
            % DM3 root-tag size is file size - 16 (dmInfo used + 20)
            f = fullfile(tc.DataDir, "small_3d.dm3");
            tc.assumeTrue(isfile(f), "fixture tests/data/small_3d.dm3 not generated yet");
            info = dmInfo(f);
            tc.verifyEqual(info{end}.fileSize, dir(f).bytes);
        end
    end

    methods
        function f = junkFile(tc, bytes)
            d = tc.applyFixture(matlab.unittest.fixtures.TemporaryFolderFixture).Folder;
            f = fullfile(d, "junk.dm4");
            fid = fopen(f, "w"); fwrite(fid, bytes, "uint8"); fclose(fid);
        end
    end
end
