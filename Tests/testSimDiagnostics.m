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
            try
                set_param(topMdlName,'SimulationCommand','Update');
            catch ME
                str=ME.message;
                HasWarningOrError = true;
            end
            if isempty(str)
                %Setting up as Switched Model:
                evalin('base',variantScriptName);
            
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