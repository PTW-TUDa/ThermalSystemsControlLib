within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces;
connector hnltControl
    Real fFeedTemperature_Heating;
    Real fFeedTemperature_Cooling;
    Boolean bAlgorithmPermission;
    Boolean bSetStatusOn_OuterCapillaryTubeMats;
    Boolean bSetStatusOn_HVFASystem;
    Boolean bLoading_HVFASystem;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end hnltControl;
