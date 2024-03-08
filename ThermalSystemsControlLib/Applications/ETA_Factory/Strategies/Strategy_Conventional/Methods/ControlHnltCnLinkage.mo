within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy_Conventional.Methods;
model ControlHnltCnLinkage
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState cnState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnltCnLinkageControl hnltCnLinkageControl annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
equation
  //algortihm permission and general control
  if hnltState.fMidTemperature > strategyState.aTemperatureLimits_HNLT[1] and hnltState.fMidTemperature < strategyState.aTemperatureLimits_HNLT[2] then
    hnltCnLinkageControl.bAlgorithmPermission_HNLT = true;
  else
    hnltCnLinkageControl.bAlgorithmPermission_HNLT = false;
  end if;
  if cnState.fMidTemperature > strategyState.aTemperatureLimits_CN[1] and cnState.fMidTemperature < strategyState.aTemperatureLimits_CN[2] then
    hnltCnLinkageControl.bAlgorithmPermission_CN = true;
  else
    hnltCnLinkageControl.bAlgorithmPermission_CN = false;
  end if;
  hnltCnLinkageControl.fFeedTemperature_HNLT_Heating = strategyState.fFeedTemperature_HNLT_Heating;

  //heat pump control
  hnltCnLinkageControl.bSetStatusOn_HeatPump = false;

  //heating systems
  hnltCnLinkageControl.fTargetTemperature_ProductionHall = strategyState.fTargetTemperature_ProductionHall;

  if time>604800 then
    hnltCnLinkageControl.bHeatingMode = false;
  else
    hnltCnLinkageControl.bHeatingMode = true;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnltCnLinkage;
