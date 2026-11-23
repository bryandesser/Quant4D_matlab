function varargout = msgbox(varargin)
%MSGBOX  Test stub. Outside a test run it calls the real msgbox. In a test it logs the message
%   and returns an invisible figure, which the uiwait stub deletes straight away (so
%   notification_dialog's DeleteFcn still runs).
if ~q4dtest.dialogs("active")
    [varargout{1:nargout}] = q4dtest.callReal("msgbox", varargin{:});
    return
end
args = [varargin, {"", ""}];
q4dtest.dialogs("log", "msgbox", args{1}, args{2});
varargout{1} = figure("Visible", "off", "HandleVisibility", "off", "Tag", "q4dtest-dialog");
end
