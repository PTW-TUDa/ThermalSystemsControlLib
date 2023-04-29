within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector hnhtHnltLinkageControl
    Real fFeedTemperature_HNLT_Heating;
    Boolean bAlgorithmPermission_HNHT;
    Boolean bAlgorithmPermission_HNLT;
    Boolean bSetStatusOn_HeatExchanger1;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnhtHnltLinkageControl;
