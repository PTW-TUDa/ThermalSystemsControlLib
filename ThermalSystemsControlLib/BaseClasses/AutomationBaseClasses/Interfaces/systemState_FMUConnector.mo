within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model systemState_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Integer nOperatingState "operating state";

  input systemState systemState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  nOperatingState = systemState1.nOperatingState;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"systemState\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end systemState_FMUConnector;
