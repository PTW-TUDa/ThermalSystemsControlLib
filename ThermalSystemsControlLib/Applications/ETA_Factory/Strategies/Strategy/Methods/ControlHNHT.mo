within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model ControlHNHT
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  Real fOffset_TargetTemperature_CHP1;
  Real fOffset_TargetTemperature_CHP2;
  Boolean bTrigger_CHP1;
  Boolean bTrigger_CHP2;

  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtControl hnhtControl annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Logical.OnOffController Controller_CondensingBoiler(bandwidth=12)
                                                                                   annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  BaseClasses.Utilities.OnOffController_VariableBandwith Controller_CHP1_UpperTemperature annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  BaseClasses.Utilities.OnOffController_VariableBandwith Controller_CHP2_UpperTemperature annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));

  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.OnOffController Controller_CHP_Prioritization(bandwidth=4) annotation (Placement(transformation(extent={{-20,18},{0,38}})));
  Modelica.Blocks.Logical.OnOffController Controller_Buffer_VSI_Unloading(bandwidth=4) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_VSI_Unloading_Permission(bandwidth=4) annotation (Placement(transformation(extent={{60,20},{80,40}})));
  Modelica.Blocks.Logical.OnOffController Controller_VSI_Loading_Permission(bandwidth=4) annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  BaseClasses.Utilities.OnOffController_VariableBandwith Controller_CHP1_LowerTemperature annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  BaseClasses.Utilities.OnOffController_VariableBandwith Controller_CHP2_LowerTemperature annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge_CHP1_UpperTemperature annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge_CHP2_UpperTemperature annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge_CHP1_LowerTemperature annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge_CHP2_LowerTemperature annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Logical.OnOffController Controller_StaticHeating(bandwidth=4) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
equation
  //algortihm permission and general control
  if hnhtState.fMidTemperature > strategyState.aTemperatureLimits_HNHT[1] and hnhtState.fMidTemperature < strategyState.aTemperatureLimits_HNHT[2] then
    hnhtControl.bAlgorithmPermission = true;
  else
    hnhtControl.bAlgorithmPermission = false;
  end if;
  hnhtControl.fFeedTemperature = strategyState.fFeedTemperature_HNHT;

  //chp prioritization
  Controller_CHP_Prioritization.u = 273.15+15;
  Controller_CHP_Prioritization.reference = ambientState.fOutsideTemperature_Mean;
  if Controller_CHP_Prioritization.y then
    fOffset_TargetTemperature_CHP1 = 1;
    fOffset_TargetTemperature_CHP2 = 0;
    Controller_CHP1_UpperTemperature.bandwidth = 14;
    Controller_CHP2_UpperTemperature.bandwidth = 12;
    Controller_CHP1_LowerTemperature.bandwidth = 14;
    Controller_CHP2_LowerTemperature.bandwidth = 12;
  else
    fOffset_TargetTemperature_CHP1 = 0;
    fOffset_TargetTemperature_CHP2 = 1;
    Controller_CHP1_UpperTemperature.bandwidth = 12;
    Controller_CHP2_UpperTemperature.bandwidth = 14;
    Controller_CHP1_LowerTemperature.bandwidth = 12;
    Controller_CHP2_LowerTemperature.bandwidth = 14;
  end if;

  //chp1 control
  Controller_CHP1_UpperTemperature.u = hnhtState.fUpperTemperature;
  Controller_CHP1_LowerTemperature.u = hnhtState.fLowerTemperature;
  Controller_CHP1_UpperTemperature.reference = strategyState.fTargetTemperature_HNHT_Heating - fOffset_TargetTemperature_CHP1;
  Controller_CHP1_LowerTemperature.reference = strategyState.fTargetTemperature_HNHT_Heating - fOffset_TargetTemperature_CHP1;
  when fallingEdge_CHP1_UpperTemperature.y then
    bTrigger_CHP1 = true;
  elsewhen fallingEdge_CHP1_LowerTemperature.y then
    bTrigger_CHP1 = false;
  end when;
  hnhtControl.bSetStatusOn_CHP1 = Controller_CHP1_UpperTemperature.y or (Controller_CHP1_LowerTemperature.y and bTrigger_CHP1);

  //chp2 control
  Controller_CHP2_UpperTemperature.u = hnhtState.fUpperTemperature;
  Controller_CHP2_LowerTemperature.u = hnhtState.fLowerTemperature;
  Controller_CHP2_UpperTemperature.reference = strategyState.fTargetTemperature_HNHT_Heating - fOffset_TargetTemperature_CHP2;
  Controller_CHP2_LowerTemperature.reference = strategyState.fTargetTemperature_HNHT_Heating - fOffset_TargetTemperature_CHP2;
  when fallingEdge_CHP2_UpperTemperature.y then
    bTrigger_CHP2 = true;
  elsewhen fallingEdge_CHP2_LowerTemperature.y then
    bTrigger_CHP2 = false;
  end when;
  hnhtControl.bSetStatusOn_CHP2 = Controller_CHP2_UpperTemperature.y or (Controller_CHP2_LowerTemperature.y and bTrigger_CHP2);

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
  Controller_Buffer_VSI_Unloading.u = hnhtState.fUpperTemperature;
  Controller_Buffer_VSI_Unloading.reference = strategyState.fTargetTemperature_HNHT_Heating;
  Controller_VSI_Unloading_Permission.u = strategyState.fTargetTemperature_HNHT_Heating;
  Controller_VSI_Unloading_Permission.reference = hnhtState.fUpperTemperature_ActiveStorage;
  Controller_VSI_Loading_Permission.u = hnhtState.fLowerTemperature_ActiveStorage;
  Controller_VSI_Loading_Permission.reference = strategyState.fTargetTemperature_HNHT_Heating;
  hnhtControl.bSetStatusOn_VSIStorage = (Controller_Buffer_VSI_Unloading.y and Controller_VSI_Unloading_Permission.y) or ((hnhtControl.bSetStatusOn_CHP1 or hnhtControl.bSetStatusOn_CHP2) and not Controller_Buffer_VSI_Unloading.y and Controller_VSI_Loading_Permission.y);
  hnhtControl.bLoading_VSIStorage = not (Controller_Buffer_VSI_Unloading.y and Controller_VSI_Unloading_Permission.y);

  connect(Controller_CHP1_UpperTemperature.y, fallingEdge_CHP1_UpperTemperature.u) annotation (Line(points={{-79,-10},{-62,-10}}, color={255,0,255}));
  connect(Controller_CHP2_UpperTemperature.y, fallingEdge_CHP2_UpperTemperature.u) annotation (Line(points={{-79,-50},{-62,-50}}, color={255,0,255}));
  connect(Controller_CHP1_LowerTemperature.y,fallingEdge_CHP1_LowerTemperature. u) annotation (Line(points={{1,-10},{18,-10}}, color={255,0,255}));
  connect(Controller_CHP2_LowerTemperature.y, fallingEdge_CHP2_LowerTemperature.u) annotation (Line(points={{1,-50},{18,-50}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=7000, __Dymola_Algorithm="Dassl"));
end ControlHNHT;
