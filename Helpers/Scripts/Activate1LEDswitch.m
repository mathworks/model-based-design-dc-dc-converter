%Copyright 2020 - 2020 The MathWorks, Inc.

blockPath = 'DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load';
set_param(blockPath ,'LabelModeActivechoice','SingleLEDStrip');
set_param(bdroot,'SimscapeUseOperatingPoints','on','SimscapeOperatingPoint','op_tm_switch_mosfet');
save_system(bdroot,'','SaveDirtyReferencedModels','on');
% Updating Mask
ConverterType = '';
if Var_Plant == 0
    if Var_Converter ~=2
        ConverterType = 'Average';
    end
end

TransistorType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit/MOSFET','LabelModeActivechoice');

LoadType = 'SingleLEDStrip';

set_param([bdroot,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC(ConverterType,TransistorType,LoadType));
clear LoadType TransistorType ConverterType
      