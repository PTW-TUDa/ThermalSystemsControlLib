within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses;
partial model ActuatorContinuous_LocalControlMode
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous;
  Interfaces.localSetParametersControlMode_FMUConnector localSetParameters annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  BaseClasses.AutomationBaseClasses.Methods.SelectLocalControlMode selectLocalControlMode annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Modelica.Blocks.Interfaces.IntegerInput nControlModeAutomatic annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
equation
  connect(localSetParameters.localSetParameters1, selectLocalControlMode.localSetParameters1) annotation (Line(points={{-79,-90},{-75,-90},{-75,-81}}, color={0,0,0}));
  connect(selectLocalControlMode.control, selectSetPoint.control) annotation (Line(points={{-75,-59},{-75,-59},{-75,19},{-75,19}},    color={0,0,0}));
  connect(nControlModeAutomatic, selectLocalControlMode.nControlModeAutomatic) annotation (Line(points={{-120,-50},{-90,-50},{-90,-65},{-82,-65}},   color={255,127,0}));
  connect(selectLocalControlMode.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{-82,-75},{-100,-75},{-100,50},{-120,50}},                   color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
Automation base model for a continuous actuator including a local control mode selection <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.
</html>"));
end ActuatorContinuous_LocalControlMode;
