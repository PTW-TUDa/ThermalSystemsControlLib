within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
model ambientState_FMUConnector
  extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Boolean bRain;
  output Real fOutsideTemperature;
  output Real fOutsideTemperature_Mean;

  input ambientState ambientState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  bRain = ambientState1.bRain;
  fOutsideTemperature = ambientState1.fOutsideTemperature;
  fOutsideTemperature_Mean = ambientState1.fOutsideTemperature_Mean;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ambientState_FMUConnector;
