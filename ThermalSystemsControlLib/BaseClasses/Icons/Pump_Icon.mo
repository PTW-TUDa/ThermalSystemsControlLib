within ThermalSystemsControlLib.BaseClasses.Icons;
partial class Pump_Icon "Icon for pumps"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,100},{10,-100}},
          lineColor={204,204,204},
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(fillColor={238,238,238},
                fillPattern=FillPattern.Solid,
                extent={{-80,-80},{80,80}},
          lineColor={28,108,200}),
        Polygon(
          points={{0,60},{-60,-40},{60,-40},{0,60}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{0,100},{100,80}},
          lineColor={204,204,204},
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{0,-80},{100,-100}},
          lineColor={204,204,204},
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}),                            Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
end Pump_Icon;
