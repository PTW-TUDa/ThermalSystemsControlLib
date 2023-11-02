within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks.Interfaces;
model ambientState_FMUConnector
  extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Boolean bRain;
  output Real fOutsideTemperature;
  output Real fOutsideTemperature_Mean;

  ambientState ambientState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  bRain = ambientState1.bRain;
  fOutsideTemperature = ambientState1.fOutsideTemperature-273.15;
  fOutsideTemperature_Mean = ambientState1.fOutsideTemperature_Mean-273.15;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ambientState_FMUConnector;
