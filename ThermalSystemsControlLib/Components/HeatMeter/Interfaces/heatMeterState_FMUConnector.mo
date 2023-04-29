within ThermalSystemsControlLib.Components.HeatMeter.Interfaces;
model heatMeterState_FMUConnector
  output Real fFeedTemperature;
  output Real fReturnTemperature;
  output Real fTemperatureDifference;
  output Real fVolumeFlowRate;
  output Real fHeatFlowRate;

  input heatMeterState sensorState annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  fFeedTemperature = sensorState.fFeedTemperature;
  fReturnTemperature = sensorState.fReturnTemperature;
  fTemperatureDifference = sensorState.fTemperatureDifference;
  fVolumeFlowRate = sensorState.fVolumeFlowRate;
  fHeatFlowRate = sensorState.fHeatFlowRate;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end heatMeterState_FMUConnector;
