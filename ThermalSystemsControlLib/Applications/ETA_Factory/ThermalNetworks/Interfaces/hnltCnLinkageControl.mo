within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector hnltCnLinkageControl
    Real fFeedTemperature_HNLT_Heating;
    Boolean bAlgorithmPermission_HNLT;
    Boolean bAlgorithmPermission_CN;
    Boolean bSetStatusOn_HeatPump;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnltCnLinkageControl;
