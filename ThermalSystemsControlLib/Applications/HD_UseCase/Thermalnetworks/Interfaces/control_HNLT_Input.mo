within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Interfaces;
connector control_HNLT_Input
  //input Real fFeedTemperature_HNHT;
  input Real fFeedTemperature_HNLT;
  input Boolean bSetStatusOn_HEX;
  //input Boolean bSetStatusOn_hybridCoolerSystem;
  input Boolean bAlgorithmPermission_HNHT;
  input Boolean bAlgorithmPermission_HNLT;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end control_HNLT_Input;
