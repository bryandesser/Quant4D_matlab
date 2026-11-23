function varargout = uigetdir(varargin)
%UIGETDIR  Test stub. Outside a test run it calls the real uigetdir. In a test it returns the
%   queued "dir" path, or 0 (= user cancelled).
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("uigetdir", varargin{:});
    return
end
folder = q4dtest.dialogs("next", "dir", 0);
q4dtest.dialogs("log", "dir", string(folder), "uigetdir");
if isstring(folder), folder = char(folder); end
varargout{1} = folder;
end
