within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Tests;
model Test_Actuator2Point
    extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  Actuator2Point_Instance actuator2Point_Instance annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.BooleanStep bSetStatusOnAutomatic(startTime=50) annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Sources.BooleanStep bAlgorithmPermission(startTime=250, startValue=true) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
equation
  connect(actuator2Point_Instance.bAlgorithmPermission, bAlgorithmPermission.y) annotation (Line(points={{-12,5},{-36,5},{-36,10},{-59,10}}, color={255,0,255}));
  connect(actuator2Point_Instance.bSetStatusOnAutomatic, bSetStatusOnAutomatic.y) annotation (Line(points={{-12,9},{-20,9},{-20,90},{-59,90}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=300, __Dymola_Algorithm="Dassl"));
end Test_Actuator2Point;
