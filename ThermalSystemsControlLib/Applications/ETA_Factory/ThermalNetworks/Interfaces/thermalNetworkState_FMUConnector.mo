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
  fUpperTemperature = thermalNetworkState1.fUpperTemperature-273.15;
  fMidTemperature = thermalNetworkState1.fMidTemperature-273.15;
  fLowerTemperature = thermalNetworkState1.fLowerTemperature-273.15;
  fUpperTemperature_ActiveStorage = thermalNetworkState1.fUpperTemperature_ActiveStorage-273.15;
  fLowerTemperature_ActiveStorage = thermalNetworkState1.fLowerTemperature_ActiveStorage-273.15;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end thermalNetworkState_FMUConnector;
