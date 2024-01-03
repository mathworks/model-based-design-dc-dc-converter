%Copyright 2020 - 2020 The MathWorks, Inc.
% Selecting block:
% DiodeBlockPath='DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit';

% retrieving data from diode characteristic plot:
fh=gcf;
Vf_Vec=fh.Children.Children.XData;
If_Vec=fh.Children.Children.YData;

%Loading datasheet data:
DiodeMOSFETFromDatasheet;


plot(fh.Children,Diode_Datasheet_Vf,Diode_Datasheet_If,'+r')
xlim([0 max(Diode_Datasheet_Vf)]);
leg = {'Simulation','Datasheet'};
legend(leg);