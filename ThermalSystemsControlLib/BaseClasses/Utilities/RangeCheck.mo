within ThermalSystemsControlLib.BaseClasses.Utilities;
model RangeCheck
  "Restore algorithm permission depending on restore difference to prevent chattering"
  extends Icons.Methods_Icon;
  parameter Real fRestoreDifference;
  Modelica.Blocks.Logical.OnOffController Check_UpperLimit(bandwidth=fRestoreDifference) annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Modelica.Blocks.Logical.OnOffController Check_LowerLimit(bandwidth=fRestoreDifference) annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal used as measurement signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput aTemperatureLimits[2]
                                         "Connector of Real input signal used as measurement signal" annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
equation
  Check_UpperLimit.reference = aTemperatureLimits[2];
  Check_LowerLimit.u = aTemperatureLimits[1];
  connect(Check_UpperLimit.u, u) annotation (Line(points={{-12,64},{-60,64},{-60,0},{-120,0}}, color={0,0,127}));
  connect(Check_LowerLimit.reference, u) annotation (Line(points={{-12,-64},{-60,-64},{-60,0},{-120,0}}, color={0,0,127}));
  connect(and1.u2, Check_LowerLimit.y) annotation (Line(points={{38,-8},{20,-8},{20,-70},{11,-70}}, color={255,0,255}));
  connect(and1.u1, Check_UpperLimit.y) annotation (Line(points={{38,0},{20,0},{20,70},{11,70}}, color={255,0,255}));
  connect(and1.y, y) annotation (Line(points={{61,0},{110,0}}, color={255,0,255}));
end RangeCheck;
