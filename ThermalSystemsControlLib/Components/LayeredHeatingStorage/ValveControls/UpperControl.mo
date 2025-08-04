within ThermalSystemsControlLib.Components.LayeredHeatingStorage.ValveControls;
model UpperControl
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput threshold annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput lower_opening annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput opening annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=1, realFalse=0) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation (Placement(transformation(extent={{-38,70},{-18,90}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(extent={{-34,-18},{-14,2}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.5) annotation (Placement(transformation(extent={{-82,-70},{-62,-50}})));


equation

  connect(booleanToReal.y, opening) annotation (Line(points={{71,0},{110,0}}, color={0,0,127}));
  connect(feed_temp, greaterEqual.u1) annotation (Line(points={{-120,80},{-40,80}}, color={0,0,127}));
  connect(threshold, greaterEqual.u2) annotation (Line(points={{-120,40},{-48,40},{-48,72},{-40,72}}, color={0,0,127}));
  connect(and1.y, booleanToReal.u) annotation (Line(points={{25,0},{48,0}}, color={255,0,255}));
  connect(greaterEqual.y, and1.u1) annotation (Line(points={{-17,80},{-8,80},{-8,0},{2,0}}, color={255,0,255}));
  connect(not1.y, and1.u2) annotation (Line(points={{-13,-8},{2,-8}}, color={255,0,255}));
  connect(lower_opening, realToBoolean.u) annotation (Line(points={{-120,-60},{-84,-60}}, color={0,0,127}));
  connect(realToBoolean.y, not1.u) annotation (Line(points={{-61,-60},{-46,-60},{-46,-8},{-36,-8}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end UpperControl;
