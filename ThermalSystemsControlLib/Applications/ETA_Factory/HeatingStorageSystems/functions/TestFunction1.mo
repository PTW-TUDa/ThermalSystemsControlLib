within ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.functions;
function TestFunction1 "Plotting temperatures of each layer"
algorithm

simulateModel(
  "ThermalSystemsControlLib.Applications.ETA_Factory.HeatingStorageSystems.TestLayeredStorage",
  stopTime=600,
  resultFile="TestLayeredStorage");
 //= true;

// Plot commands
removePlots(false);
Advanced.FilesToKeep :=3;
createPlot(id=2, position={-12, 5, 834, 365}, y={"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[1].T",
"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[2].T",
"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[3].T",
"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[7].T",
"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[4].T",
"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[5].T",
"layeredHeatingStorage.layeredStorage_Physical.vol_temperature[6].T"}, heading="Temperatures of each layer (°C)", range={0.0, 10.0, 35.0, 85.0}, grid=true, legends={"T_layer1", "T_layer2", "T_layer3", "T_layer7", "T_layer4", "T_layer5",
"T_layer6"}, colors={{28,108,200}, {238,46,47}, {0,140,72}, {217,67,180}, {0,0,0}, {162,29,33},
{244,125,35}}, timeUnit="min", displayUnits={"degC", "degC", "degC", "degC", "degC", "degC", "degC"});

end TestFunction1;
