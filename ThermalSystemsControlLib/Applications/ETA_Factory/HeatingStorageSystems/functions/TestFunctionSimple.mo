within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.functions;
function TestFunctionSimple

algorithm
 // Plot commands
removePlots(false);
Advanced.FilesToKeep :=3;
createPlot(id=1, position={0, 0, 1004, 431}, y={"const.y", "layeredStorage_Physical_simple.valveLinear_lower.opening",
"layeredStorage_Physical_simple.valveLinear_mid.opening", "layeredStorage_Physical_simple.valveLinear_upper.opening"}, range={0.0, 200.0, -0.1, 1.1}, grid=true, legends={"Feed temperature", "Lower valve opening", "Middle valve opening",
"Upper valve opening"}, colors={{0,140,72}, {28,108,200}, {244,125,35}, {238,46,47}}, range2={325.0, 385.0}, axes={2, 1, 1, 1}, timeUnit="s", displayUnits={"K", "1", "1", "1"});
createPlot(id=2, position={329, 0, 590, 365}, y={"layeredStorage_Physical_simple.vol_temperature_upper.T", "layeredStorage_Physical_simple.vol_temperature_mid.T",
 "layeredStorage_Physical_simple.vol_temperature_lower.T", "const.y"}, heading="Temperature ", range={0.0, 200.0, 10.0, 110.0}, grid=true, legends={"Upper temperature", "Middle temperature", "Lowest temperature",
"Feed temperature"}, colors={{238,46,47}, {244,125,35}, {28,108,200}, {0,140,72}}, timeUnit="s", displayUnits={"degC", "degC", "degC", "degC"});



  simulateModel(
  "ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.TestLayeredStorage",
  stopTime=10000,
  resultFile="TestLayeredStorage");

end TestFunctionSimple;
