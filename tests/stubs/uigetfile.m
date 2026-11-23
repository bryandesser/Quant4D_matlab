function varargout = uigetfile(varargin)
%UIGETFILE  Test stub. Outside a test run it calls the real uigetfile. In a test it returns
%   the queued "file" path, or 0 (= user cancelled).
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("uigetfile", varargin{:});
    return
end
p = string(q4dtest.dialogs("next", "file", ""));
q4dtest.dialogs("log", "file", p, "uigetfile");
if p == ""
    varargout = {0, 0, 0};
    return
end
[d, name, ext] = fileparts(p);
varargout = {char(name + ext), char(d + filesep), 1};
end
