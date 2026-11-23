function out = dialogs(action, varargin)
%DIALOGS  Scripted answers and a log for the stubbed dialog functions in tests/stubs.
%
%   q4dtest.dialogs("activate")                 stubs answer from the queue (AppTestCase does this)
%   q4dtest.dialogs("deactivate")               stubs pass every call to MATLAB's real dialog
%   tf = q4dtest.dialogs("active")
%   q4dtest.dialogs("reset")                    clear the answer queue and the log
%   q4dtest.dialogs("queue", kind, answer)      the next dialog of `kind` returns `answer`
%   a = q4dtest.dialogs("next", kind, default)  (used by the stubs) pop an answer, else `default`
%   q4dtest.dialogs("log", kind, msg, title)    (used by the stubs) record a dialog that was shown
%   s = q4dtest.dialogs("shown")                struct array of every dialog shown since "reset"
%
%   kind is one of "quest", "list", "msgbox", "help", "file", "dir", "color".
%   Stubs are inactive by default (and after `clear all`), so having tests/stubs on the path
%   outside a test run never changes the app's behaviour.
%
%   Python equivalent: the `_no_modal_dialogs` fixture in tests/conftest.py.

persistent kinds answers shown active
if isempty(kinds),   kinds = strings(0, 1); answers = {}; end
if isempty(shown),   shown = struct("kind", {}, "message", {}, "title", {}); end
if isempty(active),  active = false; end

out = [];
switch action
    case "activate"
        active = true;

    case "deactivate"
        active = false;

    case "active"
        out = active;

    case "reset"
        kinds = strings(0, 1);
        answers = {};
        shown = struct("kind", {}, "message", {}, "title", {});

    case "queue"
        kinds(end + 1, 1) = string(varargin{1});
        answers{end + 1, 1} = varargin{2};

    case "next"
        out = varargin{2};
        i = find(kinds == string(varargin{1}), 1);
        if ~isempty(i)
            out = answers{i};
            kinds(i) = [];
            answers(i) = [];
        end

    case "log"
        shown(end + 1) = struct("kind", string(varargin{1}), ...
                                "message", strjoin(string(varargin{2}), newline), ...
                                "title", string(varargin{3}));

    case "shown"
        out = shown;

    otherwise
        error("q4dtest:dialogs:badAction", "Unknown action '%s'.", action);
end
end
