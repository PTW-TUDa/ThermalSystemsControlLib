within ThermalSystemsControlLib.Components.LayeredHeatingStorage.ValveControls;
model LowerControl
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput threshold annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealOutput opening annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.Less less annotation (Placement(transformation(extent={{-14,38},{6,58}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=1, realFalse=0) annotation (Placement(transformation(extent={{40,-10},{60,10}})));

equation

  connect(feed_temp, less.u1) annotation (Line(points={{-120,80},{-26,80},{-26,48},{-16,48}}, color={0,0,127}));
  connect(threshold, less.u2) annotation (Line(points={{-120,40},{-16,40}}, color={0,0,127}));
  connect(booleanToReal.y, opening) annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  connect(less.y, booleanToReal.u) annotation (Line(points={{7,48},{28,48},{28,0},{38,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LowerControl;
