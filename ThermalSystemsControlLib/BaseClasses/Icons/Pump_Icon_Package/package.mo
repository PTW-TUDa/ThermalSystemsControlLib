within ThermalSystemsControlLib.BaseClasses.Icons;
partial package Pump_Icon_Package "Icon for pumps"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
        Rectangle(
          extent={{-100,20},{100,-20}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-28,3},{28,-3}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          origin={97,-2},
          rotation=90),
        Rectangle(
          extent={{-28,3},{28,-3}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          origin={-97,0},
          rotation=90),
        Ellipse(fillColor={238,238,238},
                fillPattern=FillPattern.Solid,
                extent={{-80,-80},{80,80}},
          lineColor={28,108,200}),
        Polygon(
          points={{-40,70},{-40,-70},{80,0},{-40,70}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}),                            Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
end Pump_Icon_Package;
