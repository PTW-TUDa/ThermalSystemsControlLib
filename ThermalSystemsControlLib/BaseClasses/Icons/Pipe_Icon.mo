within ThermalSystemsControlLib.BaseClasses.Icons;
partial class Pipe_Icon "Icon for Pipes"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{100,20},{-100,-100}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid,
          rotation=90),
        Rectangle(
          extent={{99,31},{-99,-31}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          rotation=90,
          origin={69,1}),
        Rectangle(
          extent={{96,3},{-96,-3}},
          lineColor={191,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Backward,
          pattern=LinePattern.None,
          origin={39,2},
          rotation=90),
        Rectangle(
          extent={{-37,-3},{37,3}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          origin={63,-97},
          rotation=180),
        Rectangle(
          extent={{-36,-3},{36,3}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          origin={64,97},
          rotation=180),
        Line(
          points={{-70,20}},
          color={28,108,200},
          arrow={Arrow.Filled,Arrow.None}),
        Line(points={{-80,20}}, color={28,108,200})}),                      Documentation(info="<html>
<p>This icon indicates a package that contains executable examples.</p>
</html>"));
end Pipe_Icon;
