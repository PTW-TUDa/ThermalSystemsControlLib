within ThermalSystemsControlLib.BaseClasses.Icons;
class TwoWayValve_Icon
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
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
        Polygon(
          points={{-20,-40},{20,-40},{0,0},{-20,-40}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{4.01041e-15,-40},{40,-40},{20,0},{4.01041e-15,-40}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={20,0},
          rotation=180),
        Ellipse(
          extent={{-20,20},{20,-20}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
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
          pattern=LinePattern.None)}),      Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end TwoWayValve_Icon;
