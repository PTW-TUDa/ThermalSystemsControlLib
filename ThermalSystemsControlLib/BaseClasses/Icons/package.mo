within ThermalSystemsControlLib.BaseClasses;
package Icons
  extends ThermalSystemsControlLib.BaseClasses.Icons.Icons_Icon_Package;

  partial model Interface_Icon

  annotation (Icon(graphics={
          Rectangle(
          extent={{-100,-100},{100,100}},
          radius=0,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          lineColor={215,215,215}),
          Polygon(origin={20,0},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            points={{-10.0,70.0},{10.0,70.0},{40.0,20.0},{80.0,20.0},{80.0,-20.0},{40.0,-20.0},{10.0,-70.0},{-10.0,-70.0}}),
          Polygon(fillColor={28,108,200},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-100,20},{-60,20},{-30,70},{-10,70},{-10,-70},{-30,-70},{-60,-20},{-100,-20}},
          lineColor={28,108,200})}));
  end Interface_Icon;

annotation (Documentation(info="<html>
<p>This package contains partial icon models which can be extended in further models.</p>
</html>"));
end Icons;
