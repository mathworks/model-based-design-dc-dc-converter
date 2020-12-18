%Copyright 2020 - 2020 The MathWorks, Inc.

try
    load Efficiency_powerLossesMap_737930681.mat
    
    % Efficiency Map
    
    close all
    h = figure;
    [M,c] = contourf(Curr_Test_Load,Voltage_Test_Vector,efficiency_grid'/100,50);
    h.CurrentAxes.FontSize=14;
    h.Position = [300 0 751.3333 646];
    c.LineWidth =1.1;
    colorbar('FontSize',14);
    xlabel('Current [mA]','FontSize',14);
    ylabel('Voltage [V]','FontSize',14);
    title(['\fontsize{16}Converter Efficiency Map over Voltage and Current']);
    
    rectangle('Position',[40 16.8 350 3.7],'EdgeColor','r','LineWidth',3);
%     annotation('textbox',[50 20.8 350 1],'String','Converter operating region','FitBoxToText','on');
    rectangle('Position',[30 20.8 900 1],'FaceColor',[1 1 1]);
    text(30,21.3,'Converter operating region','Color','red','FontSize',14);
    hold on
    plot(100,18,'xr','MarkerSize',10);
    text(130,18,num2str(efficiency_grid(5,6)),'Color','red','FontSize',14);
    
    % Power Loss Map:
    
    %Limits heatmap:
    bottom = min(min(min(mosfetLosses_grid)),min(min(diodeLosses_grid)));
    top  = max(max(max(mosfetLosses_grid)),max(max(diodeLosses_grid)));
    
    

    openfig( 'powerLossesFigure.fig' )
%     ax1 = subplot(1,2,1)
%     contourf(Curr_Test_Load,Voltage_Test_Vector,mosfetLosses_grid',50)
%     colormap hot
%     % This sets the limits of the colorbar to manual for the first plot
%     caxis manual
%     caxis([bottom top]);
% 
%     
%     
%     ax2 = subplot(1,2,2)
%     contourf(Curr_Test_Load,Voltage_Test_Vector,diodeLosses_grid',50)
%     colormap hot
%     % This sets the limits of the colorbar to manual for the first plot
%     caxis manual
%     caxis([bottom top]);
%     colorbar;%('location','Manual', 'position', [0.93 0.1 0.02 0.81]);

catch
        disp('simulate test harness! data are too large to upload');
end
%% various simulations with various resistance:

Load_Block_Name = 'DCDC_SEPIC_EfficiencyTest/Test Resistor';
Harness_Name ='DCDC_SEPIC_EfficiencyTest';
load_system(Harness_Name);
%% Single simulation:
Voltage_Test_Single = 18;
Curr_Test_Single = 50;

desiredLoad_Param = Voltage_Test_Single/(Curr_Test_Single*0.001);
desiredVoltage_Param = Voltage_Test_Single;

%% Alternative simulation controlled voltage
Voltage_Test_Vector = [8:2:26];
Curr_Test_Load = [10,25,50,75,100,150,300,500,750,1000,1500,2000];
desiredLoad_Param = 0;
desiredVoltage_Param = 0;
Harness_Name ='DCDC_SEPIC_EfficiencyTest';


%%
clc
current_results_grid = zeros(length(Curr_Test_Load),length(Voltage_Test_Vector));
voltage_results_grid = zeros(length(Curr_Test_Load),length(Voltage_Test_Vector));
mosfetLosses_grid = zeros(length(Curr_Test_Load),length(Voltage_Test_Vector));
diodeLosses_grid = zeros(length(Curr_Test_Load),length(Voltage_Test_Vector));
efficiency_grid = zeros(length(Curr_Test_Load),length(Voltage_Test_Vector));

set_param(Harness_Name,'FastRestart','on');
for j=1:1:length(Curr_Test_Load)

    for k=1:1:length(Voltage_Test_Vector)
    
        disp([num2str(j),',',num2str(k)])
        
        desiredVoltage_Param = Voltage_Test_Vector(k);
        desiredLoad_Param = Voltage_Test_Vector(k)./(Curr_Test_Load(j)*0.001);
        
        out=sim(Harness_Name);
        voltage_results=out.simlog_getEfficiency.Test_Resistor.TestResistor_Load.p.v.series.values;
        voltage_results_grid(j,k) = voltage_results(end);
        current_results=out.simlog_getEfficiency.Test_Resistor.TestResistor_Load.Resistor.i.series.values;
        current_results_grid(j,k) = current_results(end);
        endTime=out.logsout{1}.Values.Time(end);
        disp('powerloss calculation')
        %Getting MOSFET losses
        tab =ee_getPowerLossSummary(out.simlog_getEfficiency.SEPIC_Circuit.MOSFET.MOSFET.N_Channel_MOSFET,endTime-0.0001,endTime);
        mosfetLosses_grid(j,k) = table2array(tab(1,2));
        %Getting diode losses
        tab =ee_getPowerLossSummary(out.simlog_getEfficiency.SEPIC_Circuit.x8ETH06,endTime-0.0001,endTime);
        diodeLosses_grid(j,k) = table2array(tab(1,2));
        efficiency_grid(j,k) = ee_getEfficiency('Load',out.simlog_getEfficiency,endTime-0.0001,endTime)
        
    end
end
set_param(Harness_Name,'FastRestart','off');
%%
contourf(Curr_Test_Load,Voltage_Test_Vector,efficiency_grid'/100,40);
colorbar;
xlabel('Current [mA]');
ylabel('Voltage [V]');

%% Saving the variable
filename = [SlPrj.RootFolder,'\Data\Results\Efficiency_powerLossesMap_', num2str(floor(datenum(datetime)*1000)),'.mat'];

save(filename, 'efficiency_grid', 'current_results_grid','voltage_results_grid','Curr_Test_Load','Voltage_Test_Vector','diodeLosses_grid','mosfetLosses_grid');

% %%
% close all
% figure
% plot(voltage_design,efficiency_design)
% xlabel('Voltage [V]');
% ylabel('Efficiency [%]');
% legend('10 ohm','50 ohm','100 ohm','500 ohm','1000 ohm','Location','Best');
% % yyaxis right
% % plot(test_vector,voltage_design);
% % ylabel('Voltage [V]');
% xl1=xline(16.8,'-k','16.8 V');
% xl2=xline(20.5,'-k','20.5 V');
% xl1.LabelVerticalAlignment = 'bottom';
% xl1.LabelHorizontalAlignment = 'center';
% xl2.LabelVerticalAlignment = 'bottom';
% xl2.LabelHorizontalAlignment = 'center';
% % % clear nr_steps k sampling_time time_vector voltage_vector
% 
% 
% figure
% plot(current_design,efficiency_design)
% xlabel('Current [A]');
% ylabel('Efficiency [%]');
% legend('10 ohm','50 ohm','100 ohm','500 ohm','1000 ohm','Location','Best');
% % yyaxis right
% % plot(test_vector,voltage_design);
% % ylabel('Voltage [V]');
% % xl1=xline(16.8,'-k','16.8 V');
% % xl2=xline(20.5,'-k','20.5 V');
% % xl1.LabelVerticalAlignment = 'bottom';
% % xl1.LabelHorizontalAlignment = 'center';
% % xl2.LabelVerticalAlignment = 'bottom';
% % xl2.LabelHorizontalAlignment = 'center';
% 
% %% Interpolating lookup table:
% 
% DesiredVoltageColumn = [5:50]';
% DesiredResistanceRow = R_Test_Load;
% EfficiencyMap = zeros(length(DesiredVoltageColumn),length(DesiredResistanceRow));
% 
% for j=1:1:length(DesiredResistanceRow)
%    
%         EfficiencyMap(:,j) = interp1(voltage_design(1:end-1,j),efficiency_design(1:end-1,j),DesiredVoltageColumn);
%     
% end
% contourf(DesiredResistanceRow,DesiredVoltageColumn,EfficiencyMap,10);
