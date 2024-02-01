within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks.Interfaces;
connector hnhtHnltLinkageControl
    Real fFeedTemperature_HNLT_Heating;
    Real fFeedTemperature_HNHT;
    Boolean bAlgorithmPermission_HNHT;
    Boolean bAlgorithmPermission_HNLT;
    Boolean bSetStatusOn_HeatExchanger1;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnhtHnltLinkageControl;
