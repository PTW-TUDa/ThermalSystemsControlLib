within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model localSetParametersControlMode_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Real nControlModeAlgorithm=0 annotation(Evaluate=false);

  output localSetParametersControlMode localSetParameters1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.RealToInteger R2I_nControlModeAlgorithm annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
equation
  //convert real to integer because eta utility can only handle reals
  R2I_nControlModeAlgorithm.u = nControlModeAlgorithm;

  localSetParameters1.nControlModeAlgorithm = R2I_nControlModeAlgorithm.y;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"localSetParameters - nControlMode\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end localSetParametersControlMode_FMUConnector;
