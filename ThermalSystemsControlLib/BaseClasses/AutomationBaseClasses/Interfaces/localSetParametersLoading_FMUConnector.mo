within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model localSetParametersLoading_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Real bLoadingAlgorithm=0 annotation(Evaluate=false);

  output ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces.localSetParametersLoading localSetParameters1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.RealToBoolean R2B_bLoadingAlgorithm(threshold=0.1) annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
equation
  //convert real to boolean because eta utility can only handle reals
  R2B_bLoadingAlgorithm.u = bLoadingAlgorithm;

  localSetParameters1.bLoadingAlgorithm = R2B_bLoadingAlgorithm.y;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"localSetParameters - bLoading\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end localSetParametersLoading_FMUConnector;
