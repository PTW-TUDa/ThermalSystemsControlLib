within ThermalSystemsControlLib.BaseClasses.Icons;
partial package TwoWayValve_Icon_Package
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
        Rectangle(
          extent={{-100,6},{100,-6}},
          lineColor={204,204,204},
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-40,20},{-40,-20},{0,0},{-40,20}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-20,20},{-20,-20},{20,0},{-20,20}},
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
          fillPattern=FillPattern.Solid),                                                                                                                                                                                         Text(extent={{
              -100,-110},{100,-150}},                                                                                                                                                                                                      lineColor=
              {153,204,0},                                                                                                                                                                                                        fillColor=
              {122,255,107},
            fillPattern=FillPattern.Solid,
          textString="%name")}),            Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end TwoWayValve_Icon_Package;
