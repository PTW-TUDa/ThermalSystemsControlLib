within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses;
partial model SystemContinuous_Storage
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous;
  Interfaces.systemState_FMUConnector systemState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,90})));
  Methods.SystemFlowControl systemFlowControl annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Interfaces.localSetParametersLoading_FMUConnector localSetParameters annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Methods.SelectLocalControlModeBoolean selectLocalControlModeBoolean annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Modelica.Blocks.Interfaces.BooleanInput bLoadingAutomatic annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
equation
  connect(systemFlowControl.systemState, systemState.systemState1) annotation (Line(points={{-21,81},{-21,90},{-21,90}}, color={0,0,0}));
  connect(selectControlMode.bSetStatusOn, systemFlowControl.bSetStatusOn) annotation (Line(points={{-59,70},{-42,70}}, color={255,0,255}));
  connect(selectLocalControlModeBoolean.localSetParameters1, localSetParameters.localSetParameters1) annotation (Line(points={{-75,-81},{-75,-90},{-79,-90}}, color={0,0,0}));
  connect(selectLocalControlModeBoolean.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{-82,-75},{-100,-75},{-100,50},{-120,50}}, color={255,0,255}));
  connect(selectLocalControlModeBoolean.bLoadingAutomatic, bLoadingAutomatic) annotation (Line(points={{-82,-65},{-95,-65},{-95,-50},{-120,-50}}, color={255,0,255}));
  connect(selectLocalControlModeBoolean.control, selectSetPoint.control) annotation (Line(points={{-75,-59},{-75,19}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
Automation base model for a continuous system model <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.
</html>"));
end SystemContinuous_Storage;
