within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses;
partial model Actuator2Point
  Modelica.Blocks.Interfaces.BooleanInput bSetStatusOnAutomatic annotation (Placement(transformation(extent={{-140,70},{-100,110}})));
  Methods.SelectControlMode selectControlMode annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Interfaces.BooleanInput bAlgorithmPermission annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Interfaces.control_FMUConnector control annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Interfaces.controlState_FMUConnector controlState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,90})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,110})));
equation
  connect(bSetStatusOnAutomatic, selectControlMode.bSetStatusOnAutomatic) annotation (Line(points={{-120,90},{-100,90},{-100,75},{-82,75}}, color={255,0,255}));
  connect(selectControlMode.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{-82,65},{-100,65},{-100,50},{-120,50}},
                                                                                                                                      color={255,0,255}));
  connect(control.control1, selectControlMode.control) annotation (Line(points={{-79,90},{-75,90},{-75,81}}, color={0,0,0}));
  connect(controlState.controlState1, selectControlMode.controlState) annotation (Line(points={{-61,90},{-65,90},{-65,81}}, color={0,0,0}));
  connect(selectControlMode.bStatusOn, bStatusOn) annotation (Line(points={{-70,82},{-70,100},{-50,100},{-50,110}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
Automation base model for a discrete actuator <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.
</html>"));
end Actuator2Point;
