within ThermalSystemsControlLib.Applications.HD_UseCase.Thermalnetworks.Interfaces;
connector control_HNLT_Output
  //output Real fFeedTemperature_HNHT;
  output Real fFeedTemperature_HNLT;
  output Boolean bSetStatusOn_HEX;
  //output Boolean bSetStatusOn_hybridCoolerSystem;
  output Boolean bAlgorithmPermission_HNHT;
  output Boolean bAlgorithmPermission_HNLT;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end control_HNLT_Output;
