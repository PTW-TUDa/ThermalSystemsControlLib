within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Strategies.Interfaces;
connector BaseStrategyState
    Real fTargetTemperature_HNHT;
    Real fTargetTemperature_HNLT_Cooling;
    Real fTargetTemperature_HNLT_Heating;
    Real fTargetTemperature_CN;
    Real fTargetTemperature_ProductionHall;

    Real aTemperatureLimits_HNHT[2];
    Real aTemperatureLimits_HNLT[2];
    Real aTemperatureLimits_CN[2];
    Real fFeedTemperature_HNHT;
    Real fFeedTemperature_HNLT_Heating;
    Real fFeedTemperature_HNLT_Cooling;
    Real fFeedTemperature_CN;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseStrategyState;
