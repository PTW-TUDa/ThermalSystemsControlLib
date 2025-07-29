within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.functions;
function TestFunction_Physical "Plotting temperatures from each layer and each valve opening"

algorithm
// Plot commands
removePlots(false);
Advanced.FilesToKeep :=3;
createPlot(id=1, position={0, 0, 691, 361}, y={"ramp.y", "layeredStorage_Physical.valve_feed[1].fSetPoint", "layeredStorage_Physical.valve_feed[3].fSetPoint",
 "layeredStorage_Physical.valve_feed[5].fSetPoint", "layeredStorage_Physical.valve_feed[2].fSetPoint",
 "layeredStorage_Physical.valve_feed[4].fSetPoint", "layeredStorage_Physical.valve_feed[6].fSetPoint",
 "layeredStorage_Physical.valve_feed[7].fSetPoint"}, heading="Feed valves opening", range={0.0, 10000.0, -0.1, 1.1}, grid=true, legends={"Feed temperature", "Valve opening 1 (lower)", "Valve opening 3",
"Valve opening 5", "Valve opening 2", "Valve opening 4", "Valve opening 6",
"Valve opening 7 (upper)"}, colors={{0,140,72}, {28,108,200}, {162,29,33}, {244,125,35}, {162,29,33}, {244,125,35},
 {238,46,47}, {238,46,47}}, patterns={LinePattern.Solid, LinePattern.Solid, LinePattern.Solid, LinePattern.Solid,
LinePattern.Dash, LinePattern.Dash, LinePattern.Dash, LinePattern.Solid}, range2={270.0, 335.0}, axes={2, 1, 1, 1, 1, 1, 1, 1}, timeUnit="s", displayUnits={"K", "1", "1", "1", "1", "1", "1", "1"});
createPlot(id=2, position={469, -8, 572, 372}, y={"feed_temp.T", "layeredStorage_Physical.vol_temperature[1].T", "layeredStorage_Physical.vol_temperature[2].T",
 "layeredStorage_Physical.vol_temperature[3].T", "layeredStorage_Physical.vol_temperature[4].T",
 "layeredStorage_Physical.vol_temperature[5].T", "layeredStorage_Physical.vol_temperature[6].T",
 "layeredStorage_Physical.vol_temperature[7].T"}, heading="Temperature ", range={0.0, 10000.0, 25.0, 85.0}, grid=true, legends={"Feed temperature", "Temperature 1 (lower)", "Temperature 2", "Temperature 3",
"Temperature 4", "Temperature 5", "Temperature 6", "Temperature 7 (upper)"}, colors={{0,140,72}, {28,108,200}, {0,0,0}, {162,29,33}, {244,125,35}, {244,125,35},
{238,46,47}, {238,46,47}}, patterns={LinePattern.Dot, LinePattern.Solid, LinePattern.Dash, LinePattern.Solid,
LinePattern.Dash, LinePattern.Solid, LinePattern.Dash, LinePattern.Solid}, thicknesses={0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5}, timeUnit="s", displayUnits={"degC", "degC", "degC", "degC", "degC", "degC", "degC", "degC"});
createPlot(id=3, position={0, 0, 1055, 372}, y={"layeredStorage_Physical.localState.fUpperTemperature", "layeredStorage_Physical.localState.fMidTemperature",
 "layeredStorage_Physical.localState.fLowerTemperature", "layeredStorage_Physical.feedTemperature",
 "Q_feed.V_flow"}, heading="Local storage", range={0.0, 58000.0, 312.0, 338.0}, grid=true, legends={"UpperTemperature", "Mid Temperature", "LowerTemperature", "Feed Temperature",
 "Volume flow"}, colors={{238,46,47}, {244,125,35}, {28,108,200}, {0,140,72}, {0,140,72}}, patterns={LinePattern.Solid, LinePattern.Solid, LinePattern.Solid, LinePattern.Dash,
LinePattern.Solid}, thicknesses={0.5, 0.5, 0.25, 0.5, 0.25}, range2={-0.0002, 0.0016}, axes={1, 1, 1, 1, 2}, timeUnit="s", displayUnits={"degC", "degC", "degC", "degC", "m3/s"});

  simulateModel(
  "ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.TestLayeredStorage_Physical",
  stopTime=25200,
  resultFile="TestLayeredStorage_Physical");

  annotation (__Dymola_Commands(file="plotsetup_7layers_simple.mos" "plotsetup_7layers_simple"));
end TestFunction_Physical;
