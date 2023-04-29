within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
model thermalNetworkState_FMUConnector
  extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Real fUpperTemperature;
  output Real fMidTemperature;
  output Real fLowerTemperature;
  output Real fUpperTemperature_ActiveStorage;
  output Real fLowerTemperature_ActiveStorage;

  thermalNetworkState thermalNetworkState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  fUpperTemperature = thermalNetworkState1.fUpperTemperature;
  fMidTemperature = thermalNetworkState1.fMidTemperature;
  fLowerTemperature = thermalNetworkState1.fLowerTemperature;
  fUpperTemperature_ActiveStorage = thermalNetworkState1.fUpperTemperature_ActiveStorage;
  fLowerTemperature_ActiveStorage = thermalNetworkState1.fLowerTemperature_ActiveStorage;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end thermalNetworkState_FMUConnector;
