within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model setPointState_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Real fOperatingPoint "operating point in percent";

  input setPointState setPointState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  fOperatingPoint = setPointState1.fOperatingPoint;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"setPointState\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end setPointState_FMUConnector;
