within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector hnhtControl
    Real fFeedTemperature;
    Real fTargetTemperature_ProductionHall;
    Boolean bAlgorithmPermission;
    Boolean bSetStatusOn_CHP1;
    Boolean bSetStatusOn_CHP2;
    Boolean bSetStatusOn_CondensingBoiler;
    Boolean bSetStatusOn_StaticHeating;
    Boolean bSetStatusOn_VSIStorage;
    Boolean bLoading_VSIStorage;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnhtControl;
