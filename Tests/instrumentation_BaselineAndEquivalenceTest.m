%Clean existing Folder
try
    delete(cp.RootFolder+filesep+"baselineReport.pdf")
end
exampleFile = 'BaselineAndEquivalence_TestFile.mldatx';
sltest.testmanager.load(exampleFile);
baselineObj = sltest.testmanager.run;

sltest.testmanager.report(baselineObj,'../baselineReport.pdf',...
    'IncludeTestResults',0,'IncludeComparisonSignalPlots',true,...
    'IncludeSimulationSignalPlots',true,'NumPlotRowsPerPage',3);

assert(strcmp(baselineObj.Outcome,'Passed'),'Baseline Equivalence Tests did not pass successfully')