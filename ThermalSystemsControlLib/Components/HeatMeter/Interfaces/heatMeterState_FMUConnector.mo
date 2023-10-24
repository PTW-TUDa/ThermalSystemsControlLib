within ThermalSystemsControlLib.Components.HeatMeter.Interfaces;
model heatMeterState_FMUConnector
  output Real fFeedTemperature;
  output Real fReturnTemperature;
  output Real fTemperatureDifference;
  output Real fVolumeFlowRate;
  output Real fHeatFlowRate;
  output Real fHeatEnergy;

  input heatMeterState sensorState annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  fFeedTemperature = sensorState.fFeedTemperature-273.15;
  fReturnTemperature = sensorState.fReturnTemperature-273.15;
  fTemperatureDifference = sensorState.fTemperatureDifference;
  fVolumeFlowRate = sensorState.fVolumeFlowRate*3600;
  fHeatFlowRate = sensorState.fHeatFlowRate/1000;
  fHeatEnergy = sensorState.fHeatEnergy/(1e6*3600);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end heatMeterState_FMUConnector;
