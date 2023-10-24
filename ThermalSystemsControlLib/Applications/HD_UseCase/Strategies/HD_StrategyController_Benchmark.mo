within ThermalSystemsControlLib.Applications.HD_UseCase.Strategies;
model HD_StrategyController_Benchmark
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
  Methods.Benchmark.HDBenchmarkSetTemperatures setTemperatures annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Methods.Benchmark.HDBenchmarkControlHNLT hDBenchmarkControlHnhtHnltLinkage annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Methods.Benchmark.HDBenchmarkControlHNHT hDBenchmarkControlHNHT annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Methods.Benchmark.HDBenchmarkControlCN hDBenchmarkControlCN annotation (Placement(transformation(extent={{20,20},{40,40}})));
equation

  connect(setTemperatures.localState, hDBenchmarkControlHnhtHnltLinkage.strategyState) annotation (Line(points={{-59,70.2},{-10,70.2},{-10,41}}, color={0,0,0}));
  connect(hDBenchmarkControlHNHT.strategyState, setTemperatures.localState) annotation (Line(points={{-50,41},{-50,70.2},{-59,70.2}}, color={0,0,0}));
  connect(setTemperatures.localState, hDBenchmarkControlCN.strategyState) annotation (Line(points={{-59,70.2},{30,70.2},{30,41}}, color={0,0,0}));
  connect(localState_HNHT, hDBenchmarkControlHNHT.localState_HNHT) annotation (Line(points={{-90,-90},{-90,-20},{-57,-20},{-57,19}}, color={0,0,0}));
  connect(hDBenchmarkControlHnhtHnltLinkage.localState_HNLT, localState_HNLT) annotation (Line(points={{-1,19},{-1,-40},{-30,-40},{-30,-90}}, color={0,0,0}));
  connect(hDBenchmarkControlHnhtHnltLinkage.localState_HNHT, hDBenchmarkControlHNHT.localState_HNHT) annotation (Line(points={{-19,19},{-19,-20},{-57,-20},{-57,19}}));
  connect(localState_CN, hDBenchmarkControlCN.localState_CN) annotation (Line(points={{30,-90},{30,-40},{23,-40},{23,19}}, color={0,0,0}));
  connect(control_CN, hDBenchmarkControlCN.control_CN) annotation (Line(points={{90,-30},{37,-30},{37,19}}, color={0,0,0}));
  connect(hDBenchmarkControlHnhtHnltLinkage.control_HNLT, control_HNLT) annotation (Line(points={{-10,19},{-10,-20},{60,-20},{60,30},{90,30}},          color={0,0,0}));
  connect(hDBenchmarkControlHNHT.control_HNHT, control_HNHT) annotation (Line(points={{-43,19},{-43,-20},{60,-20},{60,90},{90,90}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HD_StrategyController_Benchmark;
