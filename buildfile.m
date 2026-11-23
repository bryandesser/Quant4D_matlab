function plan = buildfile
%BUILDFILE  MATLAB build tool tasks (R2023b+). Python equivalent: pytest.ini + the CI jobs.
%
%   buildtool              % check + test (what CI runs)
%   buildtool testUnit     % pure maths only, no GUI, seconds
%   buildtool testGPU      % GPU parity tests (self-hosted GPU runner)
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask

plan = buildplan(localfunctions);

% Static analysis of the app, dmInfo and the extracted +quant4d functions
plan("check") = CodeIssuesTask("src", ...
    Results = "results/code-issues.sarif");

plan("testUnit") = TestTask("tests/unit", ...
    TestResults = "results/unit-results.xml");

plan("test") = TestTask(["tests/unit" "tests/integration"], ...
    TestResults = "results/test-results.xml");
plan("test").Dependencies = "check";

plan("testGPU") = TestTask("tests/gpu", ...
    TestResults = "results/gpu-results.xml");

plan.DefaultTasks = "test";
end
