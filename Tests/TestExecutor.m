cp = currentProject;
rootFolder = cp.RootFolder;

runner = matlab.unittest.TestRunner.withTextOutput;

% Report output
% pdfreport = matlab.unittest.plugins.TestReportPlugin.producingPDF(rootFolder+filesep+"Reports"+filesep+"MyReport.pdf");
pdfreport = matlab.unittest.plugins.TestReportPlugin.producingPDF(rootFolder+filesep+"MyReport.pdf");
runner.addPlugin(pdfreport);

% Coverage
% coverage = matlab.unittest.plugins.CodeCoveragePlugin.forFolder(rootFolder);
% runner.addPlugin(coverage);

% Test Suite
suite = matlab.unittest.TestSuite.fromProject(cp);

results = run(runner, suite)

% open('Reports/MyReport.pdf');