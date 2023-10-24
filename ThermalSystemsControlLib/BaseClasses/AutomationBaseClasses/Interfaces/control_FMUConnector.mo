within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model control_FMUConnector
  extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Real bSetStatusOnAlgorithm=0 annotation(Evaluate=false);
  parameter Real bAlgorithmModeActivated=0 annotation(Evaluate=false);

  output control control1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.RealToBoolean R2B_bSetStatusOnAlgorithm(threshold=0.1) annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Math.RealToBoolean R2B_bAlgorithmModeActivated(threshold=0.1) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
equation
  //convert real to boolean because eta utility can only handle reals
  R2B_bSetStatusOnAlgorithm.u = bSetStatusOnAlgorithm;
  R2B_bAlgorithmModeActivated.u = bAlgorithmModeActivated;

  control1.bSetStatusOnAlgorithm = R2B_bSetStatusOnAlgorithm.y;
  control1.bAlgorithmModeActivated = R2B_bAlgorithmModeActivated.y;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"control\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end control_FMUConnector;
