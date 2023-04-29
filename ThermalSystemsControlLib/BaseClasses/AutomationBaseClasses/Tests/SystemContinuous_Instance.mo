within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Tests;
model SystemContinuous_Instance
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=3));
    extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Sources.RealExpression realExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,30})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=10, initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean                 annotation (Placement(transformation(extent={{80,-50},{100,-30}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=20, initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1 annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean1                 annotation (Placement(transformation(extent={{80,0},{100,20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T=30, initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal2 annotation (Placement(transformation(extent={{0,50},{20,70}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean2                 annotation (Placement(transformation(extent={{80,50},{100,70}})));
equation
  connect(realExpression.y, selectSetPoint.fOperatingPoint) annotation (Line(points={{-41,30},{-70,30},{-70,18}}, color={0,0,127}));
  connect(firstOrder.u,booleanToReal. y) annotation (Line(points={{38,-40},{21,-40}},color={0,0,127}));
  connect(firstOrder.y,realToBoolean. u) annotation (Line(points={{61,-40},{78,-40}}, color={0,0,127}));
  connect(booleanToReal1.y,firstOrder1. u) annotation (Line(points={{21,10},{38,10}},
                                                                                   color={0,0,127}));
  connect(firstOrder1.y,realToBoolean1. u) annotation (Line(points={{61,10},{78,10}},
                                                                                    color={0,0,127}));
  connect(booleanToReal2.y,firstOrder2. u) annotation (Line(points={{21,60},{38,60}},color={0,0,127}));
  connect(firstOrder2.y,realToBoolean2. u) annotation (Line(points={{61,60},{78,60}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[1], booleanToReal2.u) annotation (Line(points={{-19,70},{-12,70},{-12,60},{-2,60}}, color={255,0,255}));
  connect(booleanToReal1.u, systemFlowControl.bSetStatusOn_Components[2]) annotation (Line(points={{-2,10},{-12,10},{-12,70},{-19,70}}, color={255,0,255}));
  connect(booleanToReal.u, systemFlowControl.bSetStatusOn_Components[3]) annotation (Line(points={{-2,-40},{-12,-40},{-12,70},{-19,70}}, color={255,0,255}));
  connect(realToBoolean2.y, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{101,60},{100,60},{100,40},{-30,40},{-30,81}}, color={255,0,255}));
  connect(realToBoolean1.y, systemFlowControl.bStatusOn_Components[2]) annotation (Line(points={{101,10},{100,10},{100,-20},{-30,-20},{-30,81}}, color={255,0,255}));
  connect(realToBoolean.y, systemFlowControl.bStatusOn_Components[3]) annotation (Line(points={{101,-40},{100,-40},{100,-60},{-30,-60},{-30,81}}, color={255,0,255}));
  connect(realToBoolean.y, selectControlMode.bStatusOn) annotation (Line(points={{101,-40},{100,-40},{100,-60},{-70,-60},{-70,82}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SystemContinuous_Instance;
