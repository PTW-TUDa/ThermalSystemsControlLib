within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model ControlHnltCnLinkage
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
      parameter Real fOffset_TargetTemperature_HeatPump_Permission = 3;
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState cnState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnltCnLinkageControl hnltCnLinkageControl annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_HeatPump_CN(bandwidth=4) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_HeatPump_CN_Permission(bandwidth=4) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  BaseClasses.Utilities.RangeCheck RangeCheck_CN(fRestoreDifference=2) annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  BaseClasses.Utilities.RangeCheck RangeCheck_HNLT(fRestoreDifference=5) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
equation
  //algortihm permission and general control
  RangeCheck_CN.u = cnState.fMidTemperature;
  RangeCheck_CN.aTemperatureLimits = strategyState.aTemperatureLimits_CN;
  RangeCheck_HNLT.u = hnltState.fMidTemperature;
  RangeCheck_HNLT.aTemperatureLimits = strategyState.aTemperatureLimits_HNLT;
  hnltCnLinkageControl.bAlgorithmPermission_CN = RangeCheck_CN.y;
  hnltCnLinkageControl.bAlgorithmPermission_HNLT = RangeCheck_HNLT.y;
  hnltCnLinkageControl.fFeedTemperature_HNLT_Heating = strategyState.fFeedTemperature_HNLT_Heating;

  //heat pump control
  Controller_HeatPump_CN.reference = strategyState.fFeedTemperature_HNLT_Heating;
  Controller_HeatPump_CN.u = hnltState.fMidTemperature;
  Controller_HeatPump_CN_Permission.reference = cnState.fMidTemperature;
  Controller_HeatPump_CN_Permission.u = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_HeatPump_Permission;
  hnltCnLinkageControl.bSetStatusOn_HeatPump = Controller_HeatPump_CN.y and Controller_HeatPump_CN_Permission.y;

  //heating systems
  hnltCnLinkageControl.fTargetTemperature_ProductionHall = strategyState.fTargetTemperature_ProductionHall;
  hnltCnLinkageControl.bHeatingMode = strategyState.bHeatingModeActivated;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnltCnLinkage;
