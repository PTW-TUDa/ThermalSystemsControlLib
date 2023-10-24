within ThermalSystemsControlLib.Applications.HD_UseCase.Systems;
model IdealHeatExchangerSystem
    extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=1));
    extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;

    //## IMPORTS ##
    import SI = Modelica.SIunits;
    parameter SI.Temperature T_min=303.15 "Minimum return temperature for cold side (interpolation)";
    parameter SI.Temperature T_max=343.15 "Maximum feed temperature for hot side (interpolation)";
    parameter SI.Power P_th_nom = 5e6 "Nominal power of heat exchanger";
  Components.Consumer.PhysicalModels.IdealConsumer_Physical sink(
    redeclare package Medium = Medium1,
    is_heat_sink=true,
    dT_min=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={20,0})));
  Components.Consumer.PhysicalModels.IdealConsumer_Physical source(
    redeclare package Medium = Medium2,
    is_heat_sink=false,
    dT_min=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={80,0})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-10})));
  Modelica.Blocks.Tables.CombiTable1D Q_flow_table(table=[T_min,P_th_nom; T_max,0], extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
                                                   annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_VL_warm(redeclare package Medium = Medium1)
                                                                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,50})));
  Modelica.Blocks.Math.Gain gain(k=1)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,28})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_VL_cold(redeclare package Medium = Medium2)
                                                                                         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={80,50})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium2,
    use_portsData=false,
    use_HeatTransfer=true,
    V=1,
    nPorts=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={80,-70})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=volume.medium.T) annotation (Placement(transformation(extent={{70,-80},{50,-60}})));
equation
  connect(booleanToReal.y, product1.u1) annotation (Line(points={{-20,-21},{-20,-40},{-2,-40},{-2,-44}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[1], booleanToReal.u) annotation (Line(points={{-19,70},{10,70},{10,20},{-20,20},{-20,2}},
                                                                                                                                            color={255,0,255}));
  connect(selectControlMode.bStatusOn, systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{-70,82},{-70,28},{10,28},{10,70},{-19,70}},
                                                                                                                                                         color={255,0,255}));
  connect(systemFlowControl.bStatusOn_Components[1], systemFlowControl.bSetStatusOn_Components[1]) annotation (Line(points={{-30,81},{-30,68},{10,68},{10,70},{-19,70}},
                                                                                                                                                                       color={255,0,255}));
  connect(selectSetPoint.fSetPoint, source.T_r) annotation (Line(points={{-59,30},{-20,30},{-20,-30},{60,-30},{60,5},{68,5}},   color={0,0,127}));
  connect(sink.port_a, T_VL_warm.port_b) annotation (Line(points={{20,10},{20,40}}, color={0,127,255}));
  connect(T_VL_warm.port_a, port_a1) annotation (Line(points={{20,60},{20,80},{20,100},{60,100}},color={0,127,255}));
  connect(sink.port_b, port_b1) annotation (Line(points={{20,-10},{20,-56},{20,-100},{60,-100}},color={0,127,255}));
  connect(Q_flow_table.y[1], product1.u2) annotation (Line(points={{19,-70},{-2,-70},{-2,-56}}, color={0,0,127}));
  connect(product1.y, source.Q_flow) annotation (Line(points={{21,-50},{50,-50},{50,-5},{68,-5}}, color={0,0,127}));
  connect(gain.y, sink.Q_flow) annotation (Line(points={{39,28},{32,28},{32,5}}, color={0,0,127}));
  connect(source.port_b, T_VL_cold.port_a) annotation (Line(points={{80,10},{80,40}}, color={0,127,255}));
  connect(T_VL_cold.port_b, port_b2) annotation (Line(points={{80,60},{80,60},{80,100},{100,100}},color={0,127,255}));
  connect(T_VL_cold.T, selectSetPoint.fOperatingPoint) annotation (Line(points={{91,50},{100,50},{100,-80},{-70,-80},{-70,18}},  color={0,0,127}));
  connect(sink.T_r, source.T_r) annotation (Line(points={{32,-5},{42,-5},{42,6},{60,6},{60,5},{68,5}}, color={0,0,127}));
  connect(gain.u, source.Q_flow) annotation (Line(points={{62,28},{66,28},{66,16},{50,16},{50,-5},{68,-5}}, color={0,0,127}));
  connect(volume.ports[1], port_a2) annotation (Line(points={{82,-80},{82,-100},{100,-100}}, color={0,127,255}));
  connect(volume.ports[2], source.port_a) annotation (Line(points={{78,-80},{78,-44},{80,-44},{80,-10}}, color={0,127,255}));
  connect(realExpression.y, Q_flow_table.u[1]) annotation (Line(points={{49,-70},{42,-70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end IdealHeatExchangerSystem;
