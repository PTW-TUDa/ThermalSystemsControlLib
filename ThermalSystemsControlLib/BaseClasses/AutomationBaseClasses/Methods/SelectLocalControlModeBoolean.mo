within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Methods;
model SelectLocalControlModeBoolean
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  Modelica.Blocks.Interfaces.BooleanInput bAlgorithmPermission annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
  input BaseClasses.AutomationBaseClasses.Interfaces.control control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  input Interfaces.localSetParametersLoading     localSetParameters1 annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  Modelica.Blocks.Interfaces.BooleanInput bLoadingAutomatic annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Interfaces.BooleanOutput bLoading annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  if control.bAlgorithmModeActivated and bAlgorithmPermission then
    bLoading = localSetParameters1.bLoadingAlgorithm;
  else
    bLoading = bLoadingAutomatic;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Method to select \"nControlMode\" based on the access mode <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end SelectLocalControlModeBoolean;
