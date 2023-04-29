within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Methods;
model ControlHnhtHnltLinkage
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Logical.OnOffController Controller_HeatExchanger1(bandwidth=5) annotation (Placement(transformation(extent={{-10,60},{10,80}})));

  input ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnhtHnltLinkageControl hnhtHnltLinkageControl annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
equation
  Controller_HeatExchanger1.u = hnltState.fMidTemperature;
  Controller_HeatExchanger1.reference = strategyState.fTargetTemperature_HNLT_Heating;
  hnhtHnltLinkageControl.bSetStatusOn_HeatExchanger1 = Controller_HeatExchanger1.y;

  if hnhtState.fMidTemperature > strategyState.aTemperatureLimits_HNHT[1] and hnhtState.fMidTemperature < strategyState.aTemperatureLimits_HNHT[2] then
    hnhtHnltLinkageControl.bAlgorithmPermission_HNHT = true;
  else
    hnhtHnltLinkageControl.bAlgorithmPermission_HNHT = false;
  end if;

  if hnltState.fMidTemperature > strategyState.aTemperatureLimits_HNLT[1] and hnltState.fMidTemperature < strategyState.aTemperatureLimits_HNLT[2] then
    hnhtHnltLinkageControl.bAlgorithmPermission_HNLT = true;
  else
    hnhtHnltLinkageControl.bAlgorithmPermission_HNLT = false;
  end if;

  hnhtHnltLinkageControl.fFeedTemperature_HNLT_Heating = strategyState.fFeedTemperature_HNLT_Heating;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnhtHnltLinkage;
