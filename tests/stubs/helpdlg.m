function varargout = helpdlg(varargin)
%HELPDLG  Test stub (used by cross_align). Outside a test run it calls the real helpdlg.
%   See the msgbox stub.
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("helpdlg", varargin{:});
    return
end
args = [varargin, {"", ""}];
q4dtest.dialogs("log", "help", args{1}, args{2});
varargout{1} = figure("Visible", "off", "HandleVisibility", "off", "Tag", "q4dtest-dialog");
end
