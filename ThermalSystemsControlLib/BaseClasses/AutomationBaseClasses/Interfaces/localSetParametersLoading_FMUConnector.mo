within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
model localSetParametersLoading_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Boolean bLoadingAlgorithm=false annotation(Evaluate=false);

  output ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces.localSetParametersLoading localSetParameters1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  localSetParameters1.bLoadingAlgorithm = bLoadingAlgorithm;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>FMU Connector for \"localSetParameters - bLoading\" method <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end localSetParametersLoading_FMUConnector;
