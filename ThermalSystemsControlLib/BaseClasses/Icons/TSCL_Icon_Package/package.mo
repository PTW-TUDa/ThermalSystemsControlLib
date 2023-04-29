within ThermalSystemsControlLib.BaseClasses.Icons;
partial package TSCL_Icon_Package "Icon for packages containing data"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
                           Line(
        points={{-80,80},{-80,-80},{80,-80}},
        color={28,108,200},
        thickness=0.5),
                      Line(
        points={{-60,-42},{-42,10},{-24,-48},{-6,22},{12,-38},{28,-14},{48,-66},{60,40}},
        color={28,108,200},
        thickness=0.5,
        smooth=Smooth.Bezier)}),                                            Documentation(info="<html>
<p>This icon indicates a package that contains executable examples.</p>
</html>"));
end TSCL_Icon_Package;
