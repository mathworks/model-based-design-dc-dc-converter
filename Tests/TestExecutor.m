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
suites = matlab.unittest.TestSuite.fromProject(cp);

%make integrity test first:
for k=1:length(suites)
    if strcmp(suites(k).ProcedureName,'shouldPassAllIntegrityChecks') && k~=1
        memSuite = suites(1);
        suites(1)=suites(k);
        suites(k)=memSuite;
        clear memSuite
        break;
    end
end

results = run(runner, suites)

if any([results.Failed])
    msg = 'At least one test suite failed';
    error(msg);
end

clear rootFolder pdfreport suites results msg
% open('Reports/MyReport.pdf');