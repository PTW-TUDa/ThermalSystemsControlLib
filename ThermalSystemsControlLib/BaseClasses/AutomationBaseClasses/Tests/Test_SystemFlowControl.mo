within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Tests;
model Test_SystemFlowControl
    extends ThermalSystemsControlLib.BaseClasses.Icons.Test_Icon;
  Modelica.Blocks.Sources.BooleanPulse bSetStatusOn(
    width=50,
    period=40,
    startTime=100) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  SystemContinuous_Instance systemContinuous_Instance annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
equation
  connect(bSetStatusOn.y, systemContinuous_Instance.bSetStatusOnAutomatic) annotation (Line(points={{-79,50},{-72,50},{-72,9},{-62,9}}, color={255,0,255}));
  connect(booleanConstant.y, systemContinuous_Instance.bAlgorithmPermission) annotation (Line(points={{-79,90},{-62,90},{-62,5}}, color={255,0,255}));
  connect(const.y, systemContinuous_Instance.fSetPointAutomatic) annotation (Line(points={{-79,0},{-70,0},{-70,1},{-62,1}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=400, __Dymola_Algorithm="Dassl"));
end Test_SystemFlowControl;
