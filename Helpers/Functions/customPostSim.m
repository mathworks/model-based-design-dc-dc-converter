function newout = customPostSim(out)
    %Calculating power:
    power_Load=ee_getPowerLossSummary(out.simlog.Test_Resistor.TestResistor_Load.Resistor);
    power_PR1=ee_getPowerLossSummary(out.simlog.SEPIC_Circuit.PR1_Load.Resistor);
    newout.power_Load_tot = (power_Load{1,2}+power_PR1{1,2});
    
    %For oscillating current, need to use rms instead of mean:
    newout.power_PSU = rms(out.simlog.Controlled_Voltage_Source.i.series.values.*out.simlog.Controlled_Voltage_Source.v.series.values);
    
    %Power Losses MOSFET & Diode
    power_MOSFET=ee_getPowerLossSummary(out.simlog.SEPIC_Circuit.MOSFET.IdealMOSFET.MOSFET);
    newout.power_MOSFET = power_MOSFET{1,2};
    power_Diode=ee_getPowerLossSummary(out.simlog.SEPIC_Circuit.Diode);
    newout.power_Diode = power_Diode{1,2};

    %Efficiency
    newout.Efficiency = newout.power_Load_tot/newout.power_PSU;
    
    %Final operating point:
    newout.V_rms = rms(out.simlog.Test_Resistor.TestResistor_Load.Resistor.v.series.values);
    newout.I_rms = rms(out.simlog.Test_Resistor.TestResistor_Load.Resistor.i.series.values);
    
    %Cleanup
    clear power_Diode power_MOSFET power_LOAD power_PR1
end