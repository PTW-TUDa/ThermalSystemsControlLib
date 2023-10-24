within ThermalSystemsControlLib.BaseClasses.Icons;
partial package HeatExchanger_Icon_Package "icon for heat exchanger"
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={226,226,226},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,-100},{-100,-40},{100,40},{100,-100},{-100,-100}},
          lineColor={255,255,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={153,153,153},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,100},{-100,-40},{100,40},{100,100},{-100,100}},
          lineColor={255,255,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-34,108},{-34,108}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,72},{-38,32}},
          lineColor={102,44,145},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          radius=20),
        Line(
          points={{-68,72},{-36,48}},
          color={102,44,145},
          pattern=LinePattern.None,
          thickness=1,
          smooth=Smooth.Bezier),
        Polygon(
          points={{-54,62},{-24,42},{-22,38},{-26,40},{-56,60},{-56,62},{-54,62}},
          lineColor={102,44,145},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier,
          pattern=LinePattern.None),
        Polygon(
          points={{-8,16},{10,-14},{12,-18},{8,-16},{-10,14},{-12,18},{-8,16}},
          lineColor={102,44,145},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier,
          pattern=LinePattern.None,
          origin={-38,50},
          rotation=90),
        Polygon(
          points={{-30,54},{-26,60},{-24,66},{-28,62},{-32,54},{-30,54}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-46,54},{-50,62},{-50,66},{-48,64},{-44,52},{-46,54}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-48,44},{-50,38},{-50,36},{-48,36},{-44,48},{-48,44}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-28,42},{-26,38},{-28,36},{-30,40},{-34,48},{-28,42}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-22,46},{-32,44}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Rectangle(
          extent={{-46,56},{-56,54}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Rectangle(
          extent={{-46,46},{-56,44}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Rectangle(
          extent={{-20,56},{-30,54}},
          lineColor={102,44,145},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Polygon(
          points={{-44,32},{-38,40},{-38,44},{-46,34},{-44,32}},
          lineColor={102,44,145},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-34,32},{-40,40},{-40,44},{-32,34},{-34,32}},
          lineColor={102,44,145},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-34,70},{-40,62},{-40,58},{-32,68},{-34,70}},
          lineColor={102,44,145},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-44,70},{-38,62},{-38,58},{-46,68},{-44,70}},
          lineColor={102,44,145},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{60,-30},{48,-50},{54,-56},{50,-74},{58,-56},{52,-46},{60,-30}},
          lineColor={153,204,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Polygon(
          points={{48,-30},{36,-50},{42,-56},{38,-74},{46,-56},{40,-46},{48,-30}},
          lineColor={153,204,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Polygon(
          points={{36,-30},{24,-50},{30,-56},{26,-74},{34,-56},{28,-46},{36,-30}},
          lineColor={153,204,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier)}),          Diagram(coordinateSystem(
          preserveAspectRatio=false)));

end HeatExchanger_Icon_Package;