within ThermalSystemsControlLib.Applications.HD_UseCase;
model HD_Benchmark
  Thermalnetworks.Benchmark.HighTemperatureHeatingNetworkBenchmark HNHT(T_start=353.15)
                                                                        annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Thermalnetworks.Benchmark.LowTemperatureHeatingNetworkBenchmark HNLT(T_start=343.15)
                                                                       annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Strategies.HD_StrategyController_Benchmark HD_BenchmarkStrategy(fTargetTemperature_CN=293.15) annotation (Placement(transformation(extent={{-4,54},{16,74}})));
  Thermalnetworks.Benchmark.CoolingNetworkBenchmark CN(T_start=293.15)
                                                       annotation (Placement(transformation(extent={{40,-8},{60,12}})));
  inner Weather weather annotation (Placement(transformation(extent={{50,-100},{70,-80}})));
equation
  connect(HNHT.outlet_HEX, HNLT.inlet_HEX) annotation (Line(points={{-46,4},{-10,4}}, color={0,127,255}));
  connect(HNHT.inlet_HEX, HNLT.outlet_HEX) annotation (Line(points={{-46,-4},{-10,-4}}, color={0,127,255}));
  connect(HD_BenchmarkStrategy.localState_HNHT, HNHT.localState) annotation (Line(points={{-3,55},{-3,36},{-51,36},{-51,11}}, color={0,0,0}));
  connect(HNLT.localState, HD_BenchmarkStrategy.localState_HNLT) annotation (Line(points={{5,11},{5,55},{3,55}},            color={0,0,0}));
  connect(HD_BenchmarkStrategy.control_HNLT, HNLT.control) annotation (Line(points={{15,67},{40,67},{40,20},{-5,20},{-5,11}}, color={0,0,0}));
  connect(HD_BenchmarkStrategy.control_HNHT, HNHT.control) annotation (Line(points={{15,73},{36,73},{36,26},{-59,26},{-59,11}}, color={0,0,0}));
  connect(HD_BenchmarkStrategy.control_CN, CN.control) annotation (Line(points={{15,61},{45,61},{45,13}}, color={0,0,0}));
  connect(HD_BenchmarkStrategy.localState_CN, CN.localState) annotation (Line(points={{9,55},{9,38},{55,38},{55,13}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=604800,
      Interval=900.00288,
      __Dymola_Algorithm="Dassl"));
end HD_Benchmark;
