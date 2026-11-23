function bytes = freeSpace(folder)
%FREESPACE Free space available to the user on the drive holding a folder, in bytes.
%
% Replaces java.io.File(folder).getUsableSpace in the app's export notes, which
% fails in MATLAB releases without a Java runtime. Uses Java when available, .NET
% on Windows, and df on macOS/Linux. Returns NaN if the space cannot be found.
%
% Usage::
%
%     gib = quant4d.freeSpace(pwd) / 1024^3
%
% Parameters:
%     folder (str) : any folder on the drive; need not exist yet if its parent does
%
% Returns:
%     bytes (double) : usable free space, or NaN

bytes = NaN;
folder = char(folder);
while ~isempty(folder) && ~isfolder(folder)
    parent = fileparts(folder);
    if strcmp(parent, folder), break, end
    folder = parent;
end
if isempty(folder), folder = pwd; end

if usejava('jvm')
    try
        bytes = double(java.io.File(folder).getUsableSpace());
        return
    catch
    end
end
if ispc
    try
        d = System.IO.DriveInfo(System.IO.Path.GetPathRoot(System.IO.Path.GetFullPath(folder)));
        bytes = double(d.AvailableFreeSpace);
        return
    catch
    end
else
    [status, out] = system(sprintf('df -Pk "%s" | tail -1', folder));
    if status == 0
        parts = strsplit(strtrim(out));
        if numel(parts) >= 4
            bytes = str2double(parts{4}) * 1024;
        end
    end
end
end
