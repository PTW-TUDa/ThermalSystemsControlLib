within ThermalSystemsControlLib.Components;
model PhysicalComponentTypes
    extends ThermalSystemsControlLib.BaseClasses.Icons.Information_Icon;
 annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4>Physical component definition</h4>
<p>The TSCL allows using different physical models with the standardized control interfaces. At the moment the following physical mdoel types are included.</p>
<ul>
<li>Type 1: Physical behavior with characteristic curve, dynamics with PT1 elements, temperature depending operation limits, pressure differences, heat flow rate depends on setpoint and inlet temperature </li>
<li>Type 2: Physical behavior with characteristic curve, dynamics with PT1 elements, no pressure differences and ideal mass flows, ideal heat flow rates as inputs </li>
</ul>
</html>"));
end PhysicalComponentTypes;
