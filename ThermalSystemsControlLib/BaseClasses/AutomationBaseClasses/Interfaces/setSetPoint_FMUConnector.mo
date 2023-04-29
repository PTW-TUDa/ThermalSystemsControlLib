within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model setSetPoint_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Real fSetPointAlgorithm = 0 annotation(Evaluate=false);


  output setSetPoint setSetPoint1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  setSetPoint1.fSetPointAlgorithm = fSetPointAlgorithm;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"setSetPoint\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end setSetPoint_FMUConnector;
