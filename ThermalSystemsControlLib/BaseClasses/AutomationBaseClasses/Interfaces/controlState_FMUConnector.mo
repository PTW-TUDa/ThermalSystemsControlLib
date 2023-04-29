within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model controlState_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Boolean bStatusOn;
  output Integer nAccessMode;
  output ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces.Enum_AccessMode sAccessMode;

  input controlState controlState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  bStatusOn = controlState1.bStatusOn;
  nAccessMode = controlState1.nAccessMode;
  sAccessMode = controlState1.sAccessMode;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"controlState\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end controlState_FMUConnector;
