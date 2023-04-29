within ThermalSystemsControlLib.BaseClasses.Utilities;
block ZeroLimiter "Limit the range of a signal"
  parameter Real u_max=1 "Upper limits of input signals";
  parameter Real u_min=0 "Lower limits of input signals - u<u_min is zero";
  parameter Real u_0=1e-4 "output value for u<u_min";
  parameter Boolean strict=false
"= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
  extends Modelica.Blocks.Interfaces.SISO;

equation
  assert(u_max >= u_min, "Limiter: Limits must be consistent. However, u_max (=" + String(u_max) +
                       ") < u_min (=" + String(u_min) + ")");
  if strict then
     y = homotopy(actual = smooth(0, noEvent(if u > u_max then u_max else if u < u_min then u_0 else u)), simplified=u);
  else
     y = homotopy(actual = smooth(0,if u > u_max then u_max else if u < u_min then u_0 else u), simplified=u);
  end if;
  annotation (
    Documentation(info="<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
</html>"), Icon(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
    Line(points={{-74,-90},{-74,68}},
                                  color={192,192,192}),
    Polygon(
      points={{-74,90},{-82,68},{-66,68},{-74,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,-74},{68,-74}},
                                  color={192,192,192}),
    Polygon(
      points={{90,-74},{68,-82},{68,-66},{90,-74}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,-74},{-50,-74},{-50,-18},{34,58},{82,58}}),
    Text(
      extent={{-150,-150},{150,-110}},
      lineColor={0,0,0},
      textString="u_max=%u_max"),
    Text(
      extent={{-150,150},{150,110}},
      textString="%name",
      lineColor={0,0,255}),
    Line(
      visible=strict,
      points={{50,70},{80,70}},
      color={255,0,0}),
    Line(
      visible=strict,
      points={{-80,-70},{-50,-70}},
      color={255,0,0})}),
    Diagram(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
    Line(points={{0,-60},{0,50}}, color={192,192,192}),
    Polygon(
      points={{0,60},{-5,50},{5,50},{0,60}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-60,0},{50,0}}, color={192,192,192}),
    Polygon(
      points={{60,0},{50,-5},{50,5},{60,0}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}),
    Text(
      extent={{46,-6},{68,-18}},
      lineColor={128,128,128},
      textString="u"),
    Text(
      extent={{-30,70},{-5,50}},
      lineColor={128,128,128},
      textString="y"),
    Text(
      extent={{-58,-54},{-28,-42}},
      lineColor={128,128,128},
      textString="u_min"),
    Text(
      extent={{26,40},{66,56}},
      lineColor={128,128,128},
      textString="u_max")}));
end ZeroLimiter;
