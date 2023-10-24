within ThermalSystemsControlLib.Components.HeatMeter.Interfaces;
connector heatMeterState
  Real fFeedTemperature;
  Real fReturnTemperature;
  Real fTemperatureDifference;
  Real fVolumeFlowRate;
  Real fHeatFlowRate;
  Real fHeatEnergy;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end heatMeterState;
