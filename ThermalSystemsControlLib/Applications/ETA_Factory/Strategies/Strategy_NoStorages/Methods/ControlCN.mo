within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy_NoStorages.Methods;
model ControlCN
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
      parameter Real fOffset_TargetTemperature_eChiller = 0.5;

  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState cnState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  ThermalNetworks.Interfaces.cnControl cnControl annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_eChiller(bandwidth=7) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
equation
  //algortihm permission and general control
  if cnState.fMidTemperature > strategyState.aTemperatureLimits_CN[1] and cnState.fMidTemperature < strategyState.aTemperatureLimits_CN[2] then
    cnControl.bAlgorithmPermission = true;
  else
    cnControl.bAlgorithmPermission = false;
  end if;
  cnControl.fFeedTemperature = strategyState.fFeedTemperature_CN;

  //eChiller control
  Controller_eChiller.reference = cnState.fMidTemperature;
  Controller_eChiller.u = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_eChiller;
  cnControl.bSetStatusOn_eChiller = Controller_eChiller.y;

  //hvfa storage control
  cnControl.bSetStatusOn_HVFASystem = false;
  cnControl.bLoading_HVFASystem = false;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlCN;
