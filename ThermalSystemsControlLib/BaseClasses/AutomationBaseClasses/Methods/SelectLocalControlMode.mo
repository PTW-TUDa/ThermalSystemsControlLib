within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Methods;
model SelectLocalControlMode
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  Modelica.Blocks.Interfaces.BooleanInput bAlgorithmPermission annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
  input BaseClasses.AutomationBaseClasses.Interfaces.control control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Blocks.Interfaces.IntegerInput nControlModeAutomatic annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Interfaces.IntegerOutput nControlMode annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  input Interfaces.localSetParametersControlMode localSetParameters1 annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
equation
  if control.bAlgorithmModeActivated and bAlgorithmPermission then
    nControlMode = localSetParameters1.nControlModeAlgorithm;
  else
    nControlMode = nControlModeAutomatic;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Method to select \"nControlMode\" based on the access mode <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end SelectLocalControlMode;
