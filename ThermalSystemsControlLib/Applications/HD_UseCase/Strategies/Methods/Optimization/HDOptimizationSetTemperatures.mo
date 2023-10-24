within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies.Methods.Optimization;
model HDOptimizationSetTemperatures
  output HD_UseCase.Strategies.Interfaces.HDBenchmarkBaseStrategyState localState annotation (Placement(transformation(extent={{100,-8},{120,12}})));
equation
  localState.fTargetTemperature_HNHT = 273.15+90;
  localState.fTargetTemperature_HNLT = 273.15+80;
  localState.fTargetTemperature_CN = 273.15+15;

  localState.aTemperatureLimits_HNHT = {273.15+50,273.15+95};
  localState.aTemperatureLimits_HNLT = {273.15+30,273.15+90};
  localState.aTemperatureLimits_CN = {273.15+10,273.15+20};

  localState.fFeedTemperature_HNHT = localState.fTargetTemperature_HNHT+2;
  localState.fFeedTemperature_HNLT = localState.fTargetTemperature_HNLT+2;
  localState.fFeedTemperature_CN = localState.fTargetTemperature_CN;

  localState.fTargetTemperature_ProductionHall = 19;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HDOptimizationSetTemperatures;
