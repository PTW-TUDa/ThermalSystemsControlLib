within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector cnControl
    Real fFeedTemperature;
    Boolean bAlgorithmPermission;
    Boolean bSetStatusOn_eChiller;
    Boolean bSetStatusOn_HVFASystem;
    Boolean bLoading_HVFASystem;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end cnControl;
