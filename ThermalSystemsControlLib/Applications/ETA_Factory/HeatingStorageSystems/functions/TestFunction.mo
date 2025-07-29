within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.functions;
function TestFunction "Plotting local storage temperatures"
algorithm

simulateModel(
  "ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.TestLayeredStorage",
  stopTime=25000,
  resultFile="TestLayeredStorage");

// Plot commands
removePlots(false);
Advanced.FilesToKeep :=3;
createPlot(id=1, position={0, 0, 1055, 372}, y={"layeredHeatingStorage.localStorageState.fUpperTemperature",
"layeredHeatingStorage.localStorageState.fMidTemperature",
"layeredHeatingStorage.localStorageState.fLowerTemperature",
"boundary1.m_flow_in", "temp_feed.T"}, heading="Temperature ", range={0.0, 25000.0, 45.0, 80.0}, grid=true, legends={"Upper Temperature", "Middle Temperature", "Lower temperature", "Mass flow",
"Feed temperature"}, colors={{238,46,47}, {244,125,35}, {28,108,200}, {162,29,33}, {0,140,72}}, range2={-0.2, 1.6}, axes={1, 1, 1, 2, 1}, timeUnit="s", displayUnits={"degC", "degC", "degC", "kg/s", "degC"});
  annotation (__Dymola_Commands(file="plotsetup_complex.mos" "plotsetup_complex"));
end TestFunction;
