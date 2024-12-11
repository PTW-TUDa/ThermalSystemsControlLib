within ThermalSystemsControlLib.BaseClasses.Icons;
partial model Systems_Icon
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),      Rectangle(
          extent={{-66,28},{-14,-24}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=5), Rectangle(
          extent={{14,28},{66,-24}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          radius=5),
        Text(
          extent={{-78,88},{68,34}},
          textColor={28,108,200},
          textString="%name")}),                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end Systems_Icon;
