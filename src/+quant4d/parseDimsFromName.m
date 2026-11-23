function [dims, isEMPAD] = parseDimsFromName(filename)
%PARSEDIMSFROMNAME Dataset size [kx ky rx ry] encoded in a file name.
%
% Recognises EMPAD names (scan_x256_y128.raw gives [128 128 256 128]) and names
% containing AxBxCxD. Replaces the app's get_dims_from_name, whose patterns also
% matched empty numbers.
%
% Usage::
%
%     [dims, isEMPAD] = quant4d.parseDimsFromName("sample_64x64x256x128.bin")
%
% Parameters:
%     filename (str) : file name or full path
%
% Returns:
%     dims ([int int int int]) : [kx ky rx ry], or [] if the name holds no size
%     isEMPAD (bool) : true for the EMPAD scan_xC_yD.raw pattern
arguments
    filename {mustBeTextScalar}
end
[~, name, ext] = fileparts(char(filename));
name = [name ext];
dims = [];
isEMPAD = false;

t = regexp(name, 'scan_x(\d+)_y(\d+)\.raw$', 'tokens', 'once');
if ~isempty(t)
    dims = [128 128 str2double(t{1}) str2double(t{2})];
    isEMPAD = true;
    return
end

t = regexp(name, '(\d+)x(\d+)x(\d+)x(\d+)', 'tokens', 'once');
if ~isempty(t)
    dims = reshape(str2double(t), 1, []);
end
end
