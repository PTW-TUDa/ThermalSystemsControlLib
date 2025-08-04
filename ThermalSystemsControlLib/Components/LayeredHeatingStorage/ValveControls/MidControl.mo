within ThermalSystemsControlLib.Components.LayeredHeatingStorage.ValveControls;
model MidControl
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Interfaces.RealInput feed_temp annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput threshold_upper annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput lower_opening annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealOutput opening annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput threshold_lower annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation (Placement(transformation(extent={{-38,-4},{-18,16}})));
  Modelica.Blocks.Logical.Less less annotation (Placement(transformation(extent={{-40,42},{-20,62}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.5) annotation (Placement(transformation(extent={{-42,-90},{-22,-70}})));
  Modelica.Blocks.MathBoolean.And and1(nu=3) annotation (Placement(transformation(extent={{16,0},{28,12}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=1, realFalse=0) annotation (Placement(transformation(extent={{46,-4},{66,16}})));
  Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,-30})));


equation
  connect(feed_temp, greaterEqual.u1) annotation (Line(points={{-120,80},{-52,80},{-52,46},{-50,46},{-50,6},{-40,6}},
                                                                                                    color={0,0,127}));
  connect(threshold_lower, greaterEqual.u2) annotation (Line(points={{-120,0},{-48,0},{-48,-2},{-40,-2}},
                                                                                        color={0,0,127}));
  connect(feed_temp, less.u1) annotation (Line(points={{-120,80},{-52,80},{-52,52},{-42,52}}, color={0,0,127}));
  connect(threshold_upper, less.u2) annotation (Line(points={{-120,40},{-52,40},{-52,44},{-42,44}},
                                                                                  color={0,0,127}));
  connect(lower_opening, realToBoolean.u) annotation (Line(points={{-120,-80},{-44,-80}}, color={0,0,127}));
  connect(less.y, and1.u[1]) annotation (Line(points={{-19,52},{6,52},{6,4.6},{16,4.6}},   color={255,0,255}));
  connect(greaterEqual.y, and1.u[2]) annotation (Line(points={{-17,6},{16,6}},             color={255,0,255}));
  connect(and1.y, booleanToReal.u) annotation (Line(points={{28.9,6},{44,6}}, color={255,0,255}));
  connect(realToBoolean.y, not1.u) annotation (Line(points={{-21,-80},{2,-80},{2,-42}}, color={255,0,255}));
  connect(not1.y, and1.u[3]) annotation (Line(points={{2,-19},{2,7.4},{16,7.4}},   color={255,0,255}));
  connect(booleanToReal.y, opening) annotation (Line(points={{67,6},{94,6},{94,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MidControl;
