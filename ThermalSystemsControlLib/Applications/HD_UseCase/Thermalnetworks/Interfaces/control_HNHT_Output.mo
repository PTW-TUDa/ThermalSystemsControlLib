within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Interfaces;
connector control_HNHT_Output
  output Real fFeedTemperature_HNHT;
  output Boolean bSetStatusOn_Boiler;
  output Boolean bSetStatusOn_cHPSystem;
  output Boolean bAlgorithmPermission;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end control_HNHT_Output;
