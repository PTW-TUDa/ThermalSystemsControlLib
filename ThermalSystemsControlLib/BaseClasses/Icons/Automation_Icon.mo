within ThermalSystemsControlLib.BaseClasses.Icons;
partial model Automation_Icon
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
                           Line(
          points={{-60,80},{-60,-60},{60,-60}},
          color={28,108,200},
          thickness=0.5),
                      Line(
          points={{-52,-20},{-34,32},{-16,-26},{2,44},{20,-16},{36,8},{56,-44},{60,40}},
          color={28,108,200},
          thickness=0.5,
          smooth=Smooth.Bezier)}),
                              Diagram(coordinateSystem(preserveAspectRatio=false)));
end Automation_Icon;
