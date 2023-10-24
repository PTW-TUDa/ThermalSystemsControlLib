within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies.Methods.Benchmark;
model HDBenchmarkControlCN
  input HD_UseCase.Strategies.Interfaces.HDBenchmarkBaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  input Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_CN annotation (Placement(transformation(extent={{-80,-120},{-60,-100}})));

  Modelica.Blocks.Logical.OnOffController HybridCooler_Controller(bandwidth=5) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Thermalnetworks.Interfaces.control_CN_Output control_CN annotation (Placement(transformation(extent={{60,-120},{80,-100}})));

equation
  HybridCooler_Controller.u = localState_CN.fMidTemperature;
  HybridCooler_Controller.reference = strategyState.fTargetTemperature_HNLT;
  control_CN.bSetStatusOn_hybridCoolerSystem =HybridCooler_Controller.y;

  if localState_CN.fMidTemperature > strategyState.aTemperatureLimits_CN[1] and localState_CN.fMidTemperature < strategyState.aTemperatureLimits_CN[2] then
    control_CN.bAlgorithmPermission = true;
  else
    control_CN.bAlgorithmPermission= false;
  end if;

  control_CN.fFeedTemperature_CN = strategyState.fFeedTemperature_CN;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HDBenchmarkControlCN;
