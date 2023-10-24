within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Interfaces;
connector control_CN_Output
  output Real fFeedTemperature_CN;
  //output Boolean bSetStatusOn_AKM;
  output Boolean bSetStatusOn_hybridCoolerSystem;
  output Boolean bAlgorithmPermission;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end control_CN_Output;
