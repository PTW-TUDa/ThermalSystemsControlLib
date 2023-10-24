within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies.Methods.Optimization;
model HDOptimizationControlHNLT
  input HD_UseCase.Strategies.Interfaces.HDBenchmarkBaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  Modelica.Blocks.Logical.OnOffController HEX_Controller(bandwidth=5)                                                       annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Thermalnetworks.Interfaces.control_HNLT_Output control_HNLT annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_HNLT annotation (Placement(transformation(extent={{80,-120},{100,-100}})));

  Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_HNHT annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
  Modelica.Blocks.Logical.OnOffController HybridCooler_Controller(bandwidth=5) annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
equation
  HEX_Controller.u = localState_HNLT.fMidTemperature;
  HEX_Controller.reference = strategyState.fTargetTemperature_HNLT;
  control_HNLT.bSetStatusOn_HEX = HEX_Controller.y;

   HybridCooler_Controller.u = localState_HNLT.fMidTemperature;
   HybridCooler_Controller.reference = strategyState.fTargetTemperature_HNLT;
   control_HNLT.bSetStatusOn_hybridCoolerSystem = HybridCooler_Controller.y;


  if localState_HNHT.fMidTemperature > strategyState.aTemperatureLimits_HNHT[1] and localState_HNHT.fMidTemperature < strategyState.aTemperatureLimits_HNHT[2] then
    control_HNLT.bAlgorithmPermission_HNHT = true;
  else
    control_HNLT.bAlgorithmPermission_HNHT = false;
  end if;

  if localState_HNLT.fMidTemperature > strategyState.aTemperatureLimits_HNLT[1] and localState_HNLT.fMidTemperature < strategyState.aTemperatureLimits_HNLT[2] then
    control_HNLT.bAlgorithmPermission_HNLT = true;
  else
    control_HNLT.bAlgorithmPermission_HNLT = false;
  end if;

  control_HNLT.fFeedTemperature_HNLT = strategyState.fFeedTemperature_HNLT;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HDOptimizationControlHNLT;
