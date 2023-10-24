within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Interfaces;
connector control_CN_Input
  input Real fFeedTemperature_CN;
  //input Boolean bSetStatusOn_AKM;
  input Boolean bSetStatusOn_hybridCoolerSystem;
  input Boolean bAlgorithmPermission;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end control_CN_Input;
