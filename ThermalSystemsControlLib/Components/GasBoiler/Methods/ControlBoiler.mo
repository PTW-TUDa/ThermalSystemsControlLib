within ThermalSystemsControlLib.Components.GasBoiler.Methods;
model ControlBoiler
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  //## parameters ##
  parameter Real k=1 "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1 "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0 "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));

  Modelica.Blocks.Interfaces.IntegerInput nControlMode annotation (Placement(transformation(extent={{-140,-110},{-100,-70}})));
  Modelica.Blocks.Interfaces.RealOutput fSetPointInternal annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanInput bSetStatusOn annotation (Placement(transformation(extent={{-140,70},{-100,110}})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Continuous.LimPID PID_FeedTemperature(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Switch switch annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
equation
  if nControlMode == 1 then
    switch.u1 = PID_FeedTemperature.y;
  else
    switch.u1 = fSetPoint*0.01;
  end if;

//connections
  connect(realExpression.y, switch.u3) annotation (Line(points={{50,19},{50,8},{58,8}}, color={0,0,127}));
  connect(switch.y, fSetPointInternal) annotation (Line(points={{81,0},{90.5,0},{90.5,0},{110,0}}, color={0,0,127}));
  connect(bSetStatusOn, switch.u2) annotation (Line(points={{-120,90},{40,90},{40,0},{58,0}}, color={255,0,255}));
  connect(PID_FeedTemperature.u_m, fTemperatureExternal) annotation (Line(points={{0,-12},{0,-120}}, color={0,0,127}));
  connect(fSetPoint, PID_FeedTemperature.u_s) annotation (Line(points={{-120,0},{-12,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Control method for gas boilers.</p>
<p>nControl = 1: Feed temperature.</p>
<p>else: fSetPoint controls relative power.</p>
</html>"));
end ControlBoiler;
