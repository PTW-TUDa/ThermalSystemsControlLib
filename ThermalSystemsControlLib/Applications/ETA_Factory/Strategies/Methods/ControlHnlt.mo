within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Methods;
model ControlHnlt
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnltControl            hnltControl            annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
equation
  if hnltState.fMidTemperature > strategyState.aTemperatureLimits_HNLT[1] and hnltState.fMidTemperature < strategyState.aTemperatureLimits_HNLT[2] then
    hnltControl.bAlgorithmPermission = true;
  else
    hnltControl.bAlgorithmPermission = false;
  end if;

  hnltControl.fFeedTemperature_Heating = strategyState.fFeedTemperature_HNLT_Heating;
  hnltControl.fFeedTemperature_Cooling = strategyState.fFeedTemperature_HNLT_Cooling;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnlt;
