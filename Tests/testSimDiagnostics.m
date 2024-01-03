classdef testSimDiagnostics < matlab.unittest.TestCase
    properties (TestParameter)
        variantScriptName = {'templateName'};
        topMdlName = {'templateName'};
    end
    methods (Test)
        function testModel(testCase,variantScriptName,topMdlName)
            
            load_system(topMdlName);
            str=[];
            HasWarningOrError = false;
            %Setting up config and variants:
            evalin('base',variantScriptName);
            try
                set_param(topMdlName,'SimulationCommand','Update');
            catch ME
                str=ME.message;
                HasWarningOrError = true;
            end
            if isempty(str)
                            
                out=sim(topMdlName,1e-3);            
                
                if ~isempty(out.SimulationMetadata.ExecutionInfo.WarningDiagnostics)
                    HasWarningOrError=true;
                    str=out.SimulationMetadata.ExecutionInfo.WarningDiagnostics.Diagnostic.message;
                end
            end
            testCase.verifyEqual(HasWarningOrError,false,str)
        end
    end

end