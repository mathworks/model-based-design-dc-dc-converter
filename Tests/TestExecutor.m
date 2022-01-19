cp = currentProject;
rootFolder = cp.RootFolder;

runner = matlab.unittest.TestRunner.withTextOutput;

% Report output
% wordreport = matlab.unittest.plugins.TestReportPlugin.producingPDF(['.',filesep,'Reports',filesep,'MyReport.pdf']);
% runner.addPlugin(wordreport);

% Coverage
% coverage = matlab.unittest.plugins.CodeCoveragePlugin.forFolder(rootFolder);
% runner.addPlugin(coverage);

% Test Suite
suite = matlab.unittest.TestSuite.fromProject(cp);

results = run(runner, suite)

% open('Reports/MyReport.pdf');