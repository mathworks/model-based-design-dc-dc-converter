%Copyright 2020 - 2020 The MathWorks, Inc.
close all
open open_loop_stairs_current_sensor_calibration.fig
handle_ax_current=gca;

CurrentPinOut.time = handle_ax_current.Children(1).XData;
CurrentPinOut.data = handle_ax_current.Children(1).YData;
figure
plot(CurrentPinOut.time,CurrentPinOut.data ,'-k')
xlabel('Time s')
ylabel('Current A')

%%
close all
open open_loop_test_voltage_sensor_calibration.fig
% fig_handle=gcf;
handle_ax_voltage=gca;
VoltPinOut.time = handle_ax_voltage.Children(1).XData;
VoltPinOut.data = handle_ax_voltage.Children(1).YData;
figure
plot(VoltPinOut.time,VoltPinOut.data ,'-k')
xlabel('Time s')
ylabel('Voltage V')

%%
close all
open open_loop_test_dc_sensor_calibration.fig
handle_ax_dc=gca;
DC.time = handle_ax_dc.Children(1).XData;
DC.data = handle_ax_dc.Children(1).YData;
figure
plot(DC.time,DC.data ,'-k')
xlabel('Time s')
ylabel('DC')

%%
