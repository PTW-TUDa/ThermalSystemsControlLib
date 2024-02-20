within ThermalSystemsControlLib.Applications.ETA_Factory;
model Information
    extends ThermalSystemsControlLib.BaseClasses.Icons.Information_Icon;
 annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4>Use case description</h4>
<p>The TSCL allows rapid modeling of supervisory control strategy. Therefore, the ETA Factory example implements three different control use cases.</p>
<ul>
<li>Full system description: <a href=\"https://github.com/lbl-srg/modelica-buildings\">https://github.com/lbl-srg/modelica-buildings</a>.</li>
<li>Strategy_Conventional: No heat pumps and additional storages. </li>
<li>Strategy_NoStorages: No additional storages. </li>
<li>Strategy: Baseline strategy for full system including additional storages and heat pumps. </li>
</ul>
</html>"));
end Information;
