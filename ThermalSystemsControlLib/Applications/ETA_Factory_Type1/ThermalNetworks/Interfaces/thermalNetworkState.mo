within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks.Interfaces;
connector thermalNetworkState
  Real fUpperTemperature;
  Real fMidTemperature;
  Real fLowerTemperature;
  Real fUpperTemperature_ActiveStorage;
  Real fLowerTemperature_ActiveStorage;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end thermalNetworkState;
