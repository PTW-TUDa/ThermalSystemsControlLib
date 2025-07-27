within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.functions;
function TestFunctionComplex "Plotting temperatures of each layer"
algorithm

simulateModel(
  "ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.TestLayeredStorage_complex",
  stopTime=25000,
  resultFile="TestLayeredStorage_complex");

// Plot commands
// Plot commands
removePlots(false);
Advanced.FilesToKeep :=3;
createPlot(id=1, position={0, 0, 1065, 407}, y={"input_Temp.y", "layeredHeatingStorage_3portvalves.localStorageState.fUpperTemperature",
"layeredHeatingStorage_3portvalves.localStorageState.fMidTemperature", "layeredHeatingStorage_3portvalves.localStorageState.fLowerTemperature"}, heading="Temperature ", range={0.0, 10000.0, 310.0, 355.0}, grid=true, legends={"Feed Temperature", "Upper Temperature", "Middle Temperature", "Lower Temperature"}, colors={{0,140,72}, {238,46,47}, {244,125,35}, {28,108,200}}, timeUnit="s", displayUnits={"K", "K", "K", "K"});

  annotation (__Dymola_Commands(file="plotsetup_complex.mos" "plotsetup_complex"));
end TestFunctionComplex;
