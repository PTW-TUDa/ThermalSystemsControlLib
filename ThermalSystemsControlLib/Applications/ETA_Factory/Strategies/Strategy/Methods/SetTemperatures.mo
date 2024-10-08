within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model SetTemperatures
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  input Interfaces.localSetParametersStrategy localSetParameters annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  output Interfaces.BaseStrategyState localState annotation (Placement(transformation(extent={{100,-8},{120,12}})));
equation
  if not localSetParameters.bProductionModeActivated then
    localState.fTargetTemperature_HNHT_Heating = 273.15+50;
    localState.fTargetTemperature_HNHT_Cooling = 273.15+65;
    localState.fTargetTemperature_HNLT_Cooling = 273.15+46;
    localState.fTargetTemperature_HNLT_Heating = 273.15+40;
    localState.fTargetTemperature_CN = 273.15+15;

    localState.aTemperatureLimits_HNHT = {273.15+40,273.15+70};
    localState.aTemperatureLimits_HNLT = {273.15+30,273.15+55};
    localState.aTemperatureLimits_CN = {273.15+5,273.15+25};
  else
    localState.fTargetTemperature_HNHT_Heating = 273.15+70;
    localState.fTargetTemperature_HNHT_Cooling = 273.15+80;
    localState.fTargetTemperature_HNLT_Cooling = 273.15+40;
    localState.fTargetTemperature_HNLT_Heating = 273.15+34;
    localState.fTargetTemperature_CN = 273.15+15;

    localState.aTemperatureLimits_HNHT = {273.15+45,273.15+85};
    localState.aTemperatureLimits_HNLT = {273.15+10,273.15+50};
    localState.aTemperatureLimits_CN = {273.15+5,273.15+25};
  end if;
  localState.fFeedTemperature_HNHT = localState.fTargetTemperature_HNHT_Heating+4;
  localState.fFeedTemperature_HNLT_Heating = localState.fTargetTemperature_HNLT_Heating+4;
  localState.fFeedTemperature_HNLT_Cooling = localState.fTargetTemperature_HNLT_Cooling-6;
  localState.fFeedTemperature_CN = localState.fTargetTemperature_CN-5;

  localState.fTargetTemperature_ProductionHall = 273.15+19;
  localState.bProductionModeActivated = localSetParameters.bProductionModeActivated;
  localState.bHeatingModeActivated = localSetParameters.bHeatingModeActivated;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SetTemperatures;
