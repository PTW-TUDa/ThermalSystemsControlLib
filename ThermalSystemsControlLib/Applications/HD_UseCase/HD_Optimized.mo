within ThermalSystemsControlLib.Applications.HD_UseCase;
model HD_Optimized
  Thermalnetworks.Optimization.HighTemperatureHeatingNetwork highTemperatureHeatingNetwork annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Thermalnetworks.Optimization.LowTemperatureHeatingNetwork lowTemperatureHeatingNetwork annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Thermalnetworks.Optimization.CoolingNetwork coolingNetwork annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Strategies.HD_StrategyController_Optimization hD_StrategyController_Optimization annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  inner Weather weather annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
equation
  connect(highTemperatureHeatingNetwork.outlet_HEX, lowTemperatureHeatingNetwork.inlet_HEX) annotation (Line(points={{-20,-6},{-10,-6}}, color={0,127,255}));
  connect(highTemperatureHeatingNetwork.inlet_HEX, lowTemperatureHeatingNetwork.outlet_HEX) annotation (Line(points={{-20,-14},{-10,-14}}, color={0,127,255}));
  connect(coolingNetwork.outlet_AKM_HNLT, lowTemperatureHeatingNetwork.inlet_AKM) annotation (Line(points={{28,-20},{28,-26},{-6,-26},{-6,-20}}, color={0,127,255}));
  connect(coolingNetwork.inlet_AKM_HNHT, highTemperatureHeatingNetwork.outlet_AKM) annotation (Line(points={{32,-20},{32,-30},{-24,-30},{-24,-20}}, color={0,127,255}));
  connect(coolingNetwork.outlet_AKM_HNHT, highTemperatureHeatingNetwork.inlet_AKM) annotation (Line(points={{36,-20},{36,-32},{-28,-32},{-28,-20}}, color={0,127,255}));
  connect(coolingNetwork.inlet_AKM_HNLT, lowTemperatureHeatingNetwork.outlet_AKM) annotation (Line(points={{24,-20},{24,-24},{-2,-24},{-2,-20}}, color={0,127,255}));
  connect(hD_StrategyController_Optimization.localState_HNHT, highTemperatureHeatingNetwork.localState) annotation (Line(points={{-19,41},{-20,41},{-20,20},{-25,20},{-25,1}}, color={0,0,0}));
  connect(hD_StrategyController_Optimization.localState_HNLT, lowTemperatureHeatingNetwork.localState) annotation (Line(points={{-13,41},{-13,20},{6,20},{6,1},{5,1}}, color={0,0,0}));
  connect(hD_StrategyController_Optimization.localState_CN, coolingNetwork.localState) annotation (Line(points={{-7,41},{-7,20},{36,20},{36,1},{35,1}}, color={0,0,0}));
  connect(hD_StrategyController_Optimization.control_CN, coolingNetwork.control) annotation (Line(points={{-1,47},{0,47},{0,48},{20,48},{20,20},{26,20},{26,1},{25,1}}, color={0,0,0}));
  connect(hD_StrategyController_Optimization.control_HNLT, lowTemperatureHeatingNetwork.control) annotation (Line(points={{-1,53},{-2,53},{-2,52},{20,52},{20,20},{-5,20},{-5,1}}, color={0,0,0}));
  connect(hD_StrategyController_Optimization.control_HNHT, highTemperatureHeatingNetwork.control) annotation (Line(points={{-1,59},{0,59},{0,60},{20,60},{20,20},{-35,20},{-35,1}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=31536000, __Dymola_Algorithm="Dassl"));
end HD_Optimized;
