within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies.Interfaces;
connector HDBenchmarkBaseStrategyState
    Real fTargetTemperature_HNHT;
    Real fTargetTemperature_HNLT;
    Real fTargetTemperature_CN;
    Real fTargetTemperature_ProductionHall;

    Real aTemperatureLimits_HNHT[2];
    Real aTemperatureLimits_HNLT[2];
    Real aTemperatureLimits_CN[2];

    Real fFeedTemperature_HNHT;
    Real fFeedTemperature_HNLT;
    Real fFeedTemperature_CN;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HDBenchmarkBaseStrategyState;
