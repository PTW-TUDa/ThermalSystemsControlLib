within ThermalSystemsControlLib.BaseClasses.Utilities;
model IntegerSwitch
  extends Modelica.Blocks.Icons.PartialBooleanBlock;
  Modelica.Blocks.Interfaces.IntegerInput u1 annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.BooleanInput u2 annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.IntegerInput u3 annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.IntegerOutput y annotation (Placement(transformation(extent={{80,-20},{120,20}})));
equation
  y = if u2 then u1 else u3;
  annotation (Icon(graphics={
        Line(points={{-28,80},{16,2}},
          color={255,128,0},
          thickness=1),
        Line(points={{-90,80},{-28,80}},
          color={255,128,0}),
        Line(points={{-90,0},{-30,0}},
          color={255,0,255}),
        Line(points={{-30,12},{-30,-12}},
          color={255,0,255}),
        Line(points={{-90,-80},{-30,-80},{-30,-80}},
          color={255,128,0}),
        Ellipse(lineColor={0,0,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{12,-8},{28,8}},
          fillColor={244,125,35}),
        Line(points={{22,0},{110,0}},
          color={255,128,0})}), Documentation(info="<html>
<p><span style=\"font-family: Arial;\">The Switch switches, depending on the logical connector u2 (the middle connector) between the two possible input signals u1 (upper connector) and u3 (lower connector).</span></p>
<p><span style=\"font-family: Arial;\">The input signals u1, u3 and output signal y is integer.</span></p>
<p><span style=\"font-family: Arial;\">If u2 is&nbsp;<b>true</b>, the output signal y is set equal to u1, else it is set equal to u3.</span></p>
</html>"));
end IntegerSwitch;
