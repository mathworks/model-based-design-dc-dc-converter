classdef testSimDiagnostics < matlab.unittest.TestCase
    properties (TestParameter)
        variantScriptName = {'VoltCL_LEDCL_SimscapeSwi','VoltCL_LEDCL_SimscapeAvg','VoltCL_LEDCL_SimscapeAvg_SIL'};
        topMdlName = {'DCDC_SEPIC_TopLevelModel'};
    end
    methods (Test)
        function testModelUpdate(testCase,variantScriptName,topMdlName)
            
            load_system(topMdlName);
            
            %Setting up config and variants:
            evalin('base',variantScriptName);
            
            %Verify warnings
            testCase.verifyWarningFree(@() set_param(topMdlName,'SimulationCommand','Update'));

        end
    end

end