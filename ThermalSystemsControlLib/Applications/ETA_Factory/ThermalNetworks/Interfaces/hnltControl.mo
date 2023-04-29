within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector hnltControl
    Real fFeedTemperature_Heating;
    Real fFeedTemperature_Cooling;
    Boolean bAlgorithmPermission;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnltControl;
