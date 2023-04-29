within ThermalSystemsControlLib.BaseClasses.Icons;
partial package Pipe_Icon_Package "Icon for Pipes"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
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
          extent={{-94,-20},{94,-24}},
          lineColor={191,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Backward,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-94,24},{94,20}},
          lineColor={191,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Backward,
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
          rotation=90)}),                                                   Documentation(info="<html>
<p>This icon indicates a package that contains executable examples.</p>
</html>"));
end Pipe_Icon_Package;
