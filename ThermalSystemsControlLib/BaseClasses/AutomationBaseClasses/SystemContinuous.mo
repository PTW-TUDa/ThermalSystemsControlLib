within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses;
partial model SystemContinuous
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous;
  Interfaces.systemState_FMUConnector systemState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,90})));
  Methods.SystemFlowControl systemFlowControl annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
equation
  connect(systemFlowControl.systemState, systemState.systemState1) annotation (Line(points={{-21,81},{-21,90},{-21,90}}, color={0,0,0}));
  connect(selectControlMode.bSetStatusOn, systemFlowControl.bSetStatusOn) annotation (Line(points={{-59,70},{-42,70}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
Automation base model for a continuous system model <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.
</html>"));
end SystemContinuous;
