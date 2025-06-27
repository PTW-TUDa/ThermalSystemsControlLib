within ThermalSystemsControlLib.Components.LayeredHeatingStorage.ValveControls;
model MidControl
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput threshold_upper annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput lower_opening annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealOutput opening annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput threshold_lower annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation (Placement(transformation(extent={{-18,-2},{2,18}})));
  Modelica.Blocks.Logical.Less less annotation (Placement(transformation(extent={{-18,38},{2,58}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.5) annotation (Placement(transformation(extent={{-18,-90},{2,-70}})));
  Modelica.Blocks.MathBoolean.And and1(nu=3) annotation (Placement(transformation(extent={{30,-6},{42,6}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=1, realFalse=0) annotation (Placement(transformation(extent={{64,-10},{84,10}})));
  Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={18,-32})));
equation
  connect(feed_temp, greaterEqual.u1) annotation (Line(points={{-120,80},{-30,80},{-30,8},{-20,8}}, color={0,0,127}));
  connect(threshold_lower, greaterEqual.u2) annotation (Line(points={{-120,0},{-20,0}}, color={0,0,127}));
  connect(feed_temp, less.u1) annotation (Line(points={{-120,80},{-30,80},{-30,48},{-20,48}}, color={0,0,127}));
  connect(threshold_upper, less.u2) annotation (Line(points={{-120,40},{-20,40}}, color={0,0,127}));
  connect(lower_opening, realToBoolean.u) annotation (Line(points={{-120,-80},{-20,-80}}, color={0,0,127}));
  connect(less.y, and1.u[1]) annotation (Line(points={{3,48},{24,48},{24,-1.4},{30,-1.4}}, color={255,0,255}));
  connect(greaterEqual.y, and1.u[2]) annotation (Line(points={{3,8},{24,8},{24,0},{30,0}}, color={255,0,255}));
  connect(booleanToReal.y, opening) annotation (Line(points={{85,0},{110,0}}, color={0,0,127}));
  connect(and1.y, booleanToReal.u) annotation (Line(points={{42.9,0},{62,0}}, color={255,0,255}));
  connect(realToBoolean.y, not1.u) annotation (Line(points={{3,-80},{18,-80},{18,-44}}, color={255,0,255}));
  connect(not1.y, and1.u[3]) annotation (Line(points={{18,-21},{18,1.4},{30,1.4}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MidControl;
