within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Tests;
model Test_ActorContinuous "Test for ActorContinuous_Instance model"
    extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  Modelica.Blocks.Sources.BooleanStep bSetStatusOnAutomatic(startTime=50) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Sources.BooleanStep bAlgorithmPermission(startTime=250, startValue=true) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ActuatorContinuous_Instance actuatorContinuous_Instance annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica.Blocks.Sources.Constant fSetPointAutomatic(k=80) annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
equation
  connect(bAlgorithmPermission.y, actuatorContinuous_Instance.bAlgorithmPermission) annotation (Line(points={{-79,90},{-40,90},{-40,55},{-22,55}}, color={255,0,255}));
  connect(fSetPointAutomatic.y, actuatorContinuous_Instance.fSetPointAutomatic) annotation (Line(points={{-79,10},{-28,10},{-28,51},{-22,51}}, color={0,0,127}));
  connect(bSetStatusOnAutomatic.y, actuatorContinuous_Instance.bSetStatusOnAutomatic) annotation (Line(points={{-79,50},{-40,50},{-40,59},{-22,59}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Test_ActorContinuous;
