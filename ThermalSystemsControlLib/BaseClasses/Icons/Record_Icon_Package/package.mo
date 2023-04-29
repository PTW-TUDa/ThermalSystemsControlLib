within ThermalSystemsControlLib.BaseClasses.Icons;
partial package Record_Icon_Package "Icon for records"

  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          radius=25,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
        Rectangle(
          origin={0,-1},
          lineColor={64,64,64},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          extent={{-100.0,-75.0},{100.0,75.0}},
          radius=25),
        Line(
          points={{-100,24},{100,24}},
          color={153,153,153},
          thickness=0.5),
        Line(
          origin={0,-26},
          points={{-100.0,0.0},{100.0,0.0}},
          color={153,153,153},
          thickness=0.5),
        Line(
          origin={0,-1},
          points={{0.0,75.0},{0.0,-75.0}},
          color={153,153,153},
          thickness=0.5)}),                           Documentation(info="<html>
<p>
This icon is indicates a record.
</p>
</html>"));
end Record_Icon_Package;
