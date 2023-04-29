within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model localSetParametersControlMode_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Integer nControlModeAlgorithm=0 annotation(Evaluate=false);

  output localSetParametersControlMode localSetParameters1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  localSetParameters1.nControlModeAlgorithm = nControlModeAlgorithm;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"localSetParameters - nControlMode\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end localSetParametersControlMode_FMUConnector;
