within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Interfaces;
connector control_HNHT_Input
  input Real fFeedTemperature_HNHT;
  input Boolean bSetStatusOn_Boiler;
  input Boolean bSetStatusOn_cHPSystem;
  input Boolean bAlgorithmPermission;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end control_HNHT_Input;
