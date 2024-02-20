within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector hnltCnLinkageControl
    Real fFeedTemperature_HNLT_Heating;
    Real fTargetTemperature_ProductionHall;
    Boolean bAlgorithmPermission_HNLT;
    Boolean bAlgorithmPermission_CN;
    Boolean bSetStatusOn_HeatPump;
    Boolean bHeatingMode;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnltCnLinkageControl;
