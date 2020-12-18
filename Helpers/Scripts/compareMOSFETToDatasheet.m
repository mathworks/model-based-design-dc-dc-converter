%Copyright 2020 - 2020 The MathWorks, Inc.
% Selecting block:
% DiodeBlockPath='DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit';

% retrieving data from diode characteristic plot:
fh=gcf;
AxesId_Vds=fh.Children(4);
AxesId_Vgs=fh.Children(2);
%Loading datasheet data:
DiodeMOSFETFromDatasheet;

plot(AxesId_Vds,MOSFET_Datasheet_Vds,MOSFET_Datasheet_Id,'+r')
xlim(AxesId_Vds,[0 max(MOSFET_Datasheet_Vds)]);

plot(AxesId_Vgs,MOSFET_Datasheet_Vgs,MOSFET_Datasheet_Ids,'+r')
xlim(AxesId_Vgs,[0 max(MOSFET_Datasheet_Vgs)]);
% leg = {'Simulation','Datasheet'};
% legend(leg);