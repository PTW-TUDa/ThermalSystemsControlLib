within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Tests;
model Actuator2Point_Instance
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Actuator2Point;
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Modelica.Blocks.Sources.BooleanExpression booleanExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,30})));
equation
  connect(selectControlMode.bStatusOn, booleanExpression.y) annotation (Line(points={{-70,82},{-70,41}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Actuator2Point_Instance;
