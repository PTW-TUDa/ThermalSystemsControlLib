within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies;
model HD_StrategyController_Optimization
  //## IMPORTS ##
  import SI = Modelica.SIunits;

  //## PARAMETERS ##
  parameter SI.Temperature fTargetTemperature_HNHT = 273.15+90 "Feed temperature of HNHT";
  parameter SI.Temperature fTargetTemperature_HNLT = 273.15+80 "Feed temperature of HNLT";
  parameter SI.Temperature fTargetTemperature_CN = 273.15+15 "Feed temperature of CN";

  parameter SI.Temperature fFeedTemperature_HNHT = 273.15+95 "Feed temperature of HNHT";
  parameter SI.Temperature fFeedTemperature_HNLT = 273.15+85 "Feed temperature of HNLT";
  parameter SI.Temperature fFeedTemperature_CN = 273.15+10 "Feed temperature of CN";

  parameter SI.TemperatureDifference fOffset_Boiler = 5;

  Thermalnetworks.Interfaces.control_HNHT_Output control_HNHT annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Thermalnetworks.Interfaces.control_HNLT_Output control_HNLT annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Thermalnetworks.Interfaces.control_CN_Output control_CN annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_HNHT annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_HNLT annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  Thermalnetworks.Interfaces.localState_FluidNetwork_Input localState_CN annotation (Placement(transformation(extent={{20,-100},{40,-80}})));

  Methods.Optimization.HDOptimizationSetTemperatures hDOptimizationSetTemperatures annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Methods.Optimization.HDOptimizationControlHNHT hDOptimizationControlHNHT annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Methods.Optimization.HDOptimizationControlHNLT hDOptimizationControlHNLT annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Methods.Optimization.HDOptimizationControlCN hDOptimizationControlCN annotation (Placement(transformation(extent={{20,20},{40,40}})));
equation

  connect(hDOptimizationSetTemperatures.localState, hDOptimizationControlHNHT.strategyState) annotation (Line(points={{-59,70.2},{-50,70.2},{-50,41}}, color={0,0,0}));
  connect(hDOptimizationSetTemperatures.localState, hDOptimizationControlHNLT.strategyState) annotation (Line(points={{-59,70.2},{-10,70.2},{-10,41}}, color={0,0,0}));
  connect(hDOptimizationSetTemperatures.localState, hDOptimizationControlCN.strategyState) annotation (Line(points={{-59,70.2},{30,70.2},{30,41}}, color={0,0,0}));
  connect(hDOptimizationControlHNHT.localState_HNHT, localState_HNHT) annotation (Line(points={{-57,19},{-57,-20},{-90,-20},{-90,-90}}, color={0,0,0}));
  connect(hDOptimizationControlHNHT.control_HNHT, control_HNHT) annotation (Line(points={{-43,19},{-43,-20},{58,-20},{58,90},{90,90}}, color={0,0,0}));
  connect(hDOptimizationControlHNLT.localState_HNHT, localState_HNHT) annotation (Line(points={{-19,19},{-19,-20},{-90,-20},{-90,-90}}, color={0,0,0}));
  connect(hDOptimizationControlHNLT.control_HNLT, control_HNLT) annotation (Line(points={{-10,19},{-10,-20},{58,-20},{58,30},{90,30}}, color={0,0,0}));
  connect(hDOptimizationControlHNLT.localState_HNLT, localState_HNLT) annotation (Line(points={{-1,19},{-1,-20},{-30,-20},{-30,-90}}, color={0,0,0}));
  connect(hDOptimizationControlCN.localState_CN, localState_CN) annotation (Line(points={{23,19},{23,-20},{30,-20},{30,-90}}, color={0,0,0}));
  connect(hDOptimizationControlCN.control_CN, control_CN) annotation (Line(points={{37,19},{37,-20},{58,-20},{58,-30},{90,-30}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HD_StrategyController_Optimization;
