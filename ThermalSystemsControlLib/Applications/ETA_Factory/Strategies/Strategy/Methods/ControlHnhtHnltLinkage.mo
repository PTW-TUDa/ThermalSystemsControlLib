within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model ControlHnhtHnltLinkage
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
      parameter Real fOffset_TargetTemperature_HeatExchanger1 = 2;
      parameter Real fOffset_TargetTemperature_HeatPump = 1;
      parameter Real fOffset_TargetTemperature_HeatPump_Permission = 1;
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Logical.OnOffController Controller_HeatExchanger1(bandwidth=8) annotation (Placement(transformation(extent={{-10,60},{10,80}})));

  input ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnhtHnltLinkageControl hnhtHnltLinkageControl annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_HeatPump_HNHT(bandwidth=10) annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Blocks.Logical.OnOffController Controller_HeatPump_HNHT_Permission(bandwidth=4) annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  BaseClasses.Utilities.RangeCheck RangeCheck_HNHT(fRestoreDifference=5) annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  BaseClasses.Utilities.RangeCheck RangeCheck_HNLT(fRestoreDifference=5) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
equation
  //algortihm permission and general control
  RangeCheck_HNHT.u = hnhtState.fMidTemperature;
  RangeCheck_HNHT.aTemperatureLimits = strategyState.aTemperatureLimits_HNHT;
  RangeCheck_HNLT.u = hnltState.fMidTemperature;
  RangeCheck_HNLT.aTemperatureLimits = strategyState.aTemperatureLimits_HNLT;
  hnhtHnltLinkageControl.bAlgorithmPermission_HNHT = RangeCheck_HNHT.y;
  hnhtHnltLinkageControl.bAlgorithmPermission_HNLT = RangeCheck_HNLT.y;
  hnhtHnltLinkageControl.fFeedTemperature_HNLT_Heating = strategyState.fFeedTemperature_HNLT_Heating;
  hnhtHnltLinkageControl.fFeedTemperature_HNHT = strategyState.fFeedTemperature_HNHT;

  //heat exchanger 1 control
  Controller_HeatExchanger1.u = hnltState.fMidTemperature;
  Controller_HeatExchanger1.reference = strategyState.fTargetTemperature_HNLT_Heating;
  hnhtHnltLinkageControl.bSetStatusOn_HeatExchanger1 = Controller_HeatExchanger1.y;

  //heat pump control
  Controller_HeatPump_HNHT.u = hnhtState.fUpperTemperature;
  Controller_HeatPump_HNHT.reference = strategyState.fTargetTemperature_HNHT_Heating+fOffset_TargetTemperature_HeatPump;
  Controller_HeatPump_HNHT_Permission.u = strategyState.fFeedTemperature_HNLT_Cooling+fOffset_TargetTemperature_HeatPump_Permission;
  Controller_HeatPump_HNHT_Permission.reference = hnltState.fMidTemperature;
  hnhtHnltLinkageControl.bSetStatusOn_HeatPump = Controller_HeatPump_HNHT.y and Controller_HeatPump_HNHT_Permission.y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnhtHnltLinkage;
