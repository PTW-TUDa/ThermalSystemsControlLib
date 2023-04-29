within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Tests;
model ActuatorContinuous_Instance
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.ActuatorContinuous;
    extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Sources.BooleanExpression booleanExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,60})));
  Modelica.Blocks.Sources.RealExpression realExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,40})));
equation
  connect(booleanExpression.y, selectControlMode.bStatusOn) annotation (Line(points={{-41,60},{-56,60},{-56,82},{-70,82}}, color={255,0,255}));
  connect(realExpression.y, selectSetPoint.fOperatingPoint) annotation (Line(points={{-41,40},{-56,40},{-56,18},{-70,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ActuatorContinuous_Instance;
