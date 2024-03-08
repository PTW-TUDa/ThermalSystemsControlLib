within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model SetTemperatures
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  input Interfaces.localSetParametersStrategy localSetParameters annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  output Interfaces.BaseStrategyState localState annotation (Placement(transformation(extent={{100,-8},{120,12}})));
equation
  if not localSetParameters.bProductionModeActivated then
    localState.fTargetTemperature_HNHT_Heating = 273.15+50;
    localState.fTargetTemperature_HNHT_Cooling = 273.15+70;
    localState.fTargetTemperature_HNLT_Cooling = 273.15+46;
    localState.fTargetTemperature_HNLT_Heating = 273.15+40;

    //summer
    if time>604800 then
      localState.fTargetTemperature_CN = 273.15+15;
    //winter
    else
      localState.fTargetTemperature_CN = 273.15+20;
    end if;

    localState.aTemperatureLimits_HNHT = {273.15+40,273.15+70};
    localState.aTemperatureLimits_HNLT = {273.15+30,273.15+50};
    localState.aTemperatureLimits_CN = {273.15+5,273.15+25};
  else
    localState.fTargetTemperature_HNHT_Heating = 273.15+60;
    localState.fTargetTemperature_HNHT_Cooling = 273.15+80;
    localState.fTargetTemperature_HNLT_Cooling = 273.15+40;
    localState.fTargetTemperature_HNLT_Heating = 273.15+34;
    if time>604800 then
      localState.fTargetTemperature_CN = 273.15+15;
    else
      localState.fTargetTemperature_CN = 273.15+20;
    end if;

    localState.aTemperatureLimits_HNHT = {273.15+45,273.15+85};
    localState.aTemperatureLimits_HNLT = {273.15+10,273.15+45};
    localState.aTemperatureLimits_CN = {273.15+5,273.15+25};
  end if;
  localState.fFeedTemperature_HNHT = localState.fTargetTemperature_HNHT_Heating+4;
  localState.fFeedTemperature_HNLT_Heating = localState.fTargetTemperature_HNLT_Heating+4;
  localState.fFeedTemperature_HNLT_Cooling = localState.fTargetTemperature_HNLT_Cooling-6;

  if time>604800 then
    localState.fFeedTemperature_CN = localState.fTargetTemperature_CN;
  else
    localState.fFeedTemperature_CN = localState.fTargetTemperature_CN-5;
  end if;

  localState.fTargetTemperature_ProductionHall = 273.15+19;
  localState.bProductionModeActivated = localSetParameters.bProductionModeActivated;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SetTemperatures;
