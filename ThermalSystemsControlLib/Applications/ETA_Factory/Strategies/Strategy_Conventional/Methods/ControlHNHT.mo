within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy_Conventional.Methods;
model ControlHNHT
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;

  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtControl hnhtControl annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Logical.OnOffController Controller_CondensingBoiler(bandwidth=12)
                                                                                   annotation (Placement(transformation(extent={{-20,60},{0,80}})));

  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.OnOffController Controller_StaticHeating(bandwidth=4) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
equation
  //algortihm permission and general control
  if hnhtState.fMidTemperature > strategyState.aTemperatureLimits_HNHT[1] and hnhtState.fMidTemperature < strategyState.aTemperatureLimits_HNHT[2] then
    hnhtControl.bAlgorithmPermission = true;
  else
    hnhtControl.bAlgorithmPermission = false;
  end if;
  hnhtControl.fFeedTemperature = strategyState.fFeedTemperature_HNHT;

  //chp control
  hnhtControl.bSetStatusOn_CHP1 = true;
  hnhtControl.bSetStatusOn_CHP2 = true;

  //condensing boiler control
  Controller_CondensingBoiler.u = hnhtState.fUpperTemperature;
  Controller_CondensingBoiler.reference = strategyState.fTargetTemperature_HNHT_Heating;
  hnhtControl.bSetStatusOn_CondensingBoiler = Controller_CondensingBoiler.y;

  //static heating control
  Controller_StaticHeating.u = ambientState.fOutsideTemperature;
  Controller_StaticHeating.reference = 293.15+15;
  hnhtControl.bSetStatusOn_StaticHeating = Controller_StaticHeating.y;
  hnhtControl.fTargetTemperature_ProductionHall = strategyState.fTargetTemperature_ProductionHall;

  //vsi storage control
  hnhtControl.bSetStatusOn_VSIStorage = false;
  hnhtControl.bLoading_VSIStorage = false;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=7000, __Dymola_Algorithm="Dassl"));
end ControlHNHT;
