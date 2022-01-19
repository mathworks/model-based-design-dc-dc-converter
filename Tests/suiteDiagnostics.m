%Common Properties:
import matlab.unittest.parameters.Parameter
Variant = {'VoltCL_LEDCL_SimscapeSwi','VoltCL_LEDCL_SimscapeAvg_SIL','VoltCL_LEDCL_SimscapeAvg'};
Variant={'VoltCL_LEDCL_TIHardware_PIL'};
TopModel = {'DCDC_SEPIC_TopLevelModel'};
param = Parameter.fromData('variantScriptName',Variant,'topMdlName',TopModel);

import matlab.unittest.TestSuite
suite = TestSuite.fromClass(?testSimDiagnostics,'ExternalParameters',param);
{suite.Name}'
suite.run

% tempTest.variantScriptName='VoltCL_LEDCL_SimscapeSwi';
% tempTest.topMdlName = 'DCDC_SEPIC_TopLevelModel';

