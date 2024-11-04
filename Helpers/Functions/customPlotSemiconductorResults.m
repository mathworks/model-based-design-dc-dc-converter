function customPlotSemiconductorResults(Vg_vec,out,Vds_min,Vds_max,Id_min,Id_max,legend_info)

% Reuse figure if it exists, else create new figure
if ~exist('h1_MOSFETCharacteristics', 'var') || ...
        ~isgraphics(h1_MOSFETCharacteristics, 'figure')
    h1_MOSFETCharacteristics = figure('Name', 'MOSFETCharacteristics');
end
figure(h1_MOSFETCharacteristics);
clf(h1_MOSFETCharacteristics);
hold on
for i=1:length(Vg_vec)
    plot(out(i).Vds.signals.values,out(i).Id.signals.values,'LineWidth',1);
end
axis([Vds_min Vds_max Id_min Id_max]);
xlabel('Drain-Source Voltage (V)');
ylabel('Drain Current (A)');

legend(legend_info)
legend("Position", [0.2395 0.5883 0.1575, 0.2830]);
title('MOSFET Curves: Id vs. Vds for Varying Gate Voltage');
grid on
yscale log
xscale log
end