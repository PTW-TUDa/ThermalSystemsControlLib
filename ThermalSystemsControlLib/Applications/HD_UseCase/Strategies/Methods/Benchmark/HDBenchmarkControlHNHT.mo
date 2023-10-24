within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies.Methods.Benchmark;
model HDBenchmarkControlHNHT
  Real fOffset_TargetTemperature_CHP1=0;
  Real fOffset_TargetTemperature_CondensingBoiler=5;

  input HD_UseCase.Strategies.Interfaces.HDBenchmarkBaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  input Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_HNHT annotation (Placement(transformation(extent={{-80,-120},{-60,-100}})));
  output Thermalnetworks.Interfaces.control_HNHT_Output control_HNHT annotation (Placement(transformation(extent={{60,-120},{80,-100}})));

  Modelica.Blocks.Logical.OnOffController Boiler_Controller(bandwidth=10)
                                                                         annotation (Placement(transformation(extent={{0,0},{20,20}})));

  Modelica.Blocks.Logical.OnOffController CHP_Controller(bandwidth=10)
                                                                      annotation (Placement(transformation(extent={{0,40},{20,60}})));
equation
  Boiler_Controller.u = localState_HNHT.fMidTemperature;
  CHP_Controller.u = localState_HNHT.fMidTemperature;
  Boiler_Controller.reference = strategyState.fTargetTemperature_HNHT-fOffset_TargetTemperature_CondensingBoiler;
  CHP_Controller.reference = strategyState.fTargetTemperature_HNHT-fOffset_TargetTemperature_CHP1;

  control_HNHT.bSetStatusOn_Boiler = Boiler_Controller.y;
  control_HNHT.bSetStatusOn_cHPSystem = CHP_Controller.y;

  if localState_HNHT.fMidTemperature > strategyState.aTemperatureLimits_HNHT[1] and localState_HNHT.fMidTemperature < strategyState.aTemperatureLimits_HNHT[2] then
    control_HNHT.bAlgorithmPermission = true;
  else
    control_HNHT.bAlgorithmPermission = false;
  end if;
  control_HNHT.fFeedTemperature_HNHT = strategyState.fFeedTemperature_HNHT;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=604800,
      Interval=60,
      __Dymola_Algorithm="Dassl"));
end HDBenchmarkControlHNHT;
