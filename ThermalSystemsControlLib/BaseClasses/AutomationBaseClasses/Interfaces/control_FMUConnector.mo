within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model control_FMUConnector
  extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Boolean bSetStatusOnAlgorithm=false annotation(Evaluate=false);
  parameter Boolean bAlgorithmModeActivated=false annotation(Evaluate=false);

  output control control1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  control1.bSetStatusOnAlgorithm=bSetStatusOnAlgorithm;
  control1.bAlgorithmModeActivated = bAlgorithmModeActivated;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"control\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end control_FMUConnector;
