within ThermalSystemsControlLib.Components.Valves.Methods;
model ControlThreeWayValve
  extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  //## parameters ##
  parameter Real k=1 "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1 "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0 "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));

  Modelica.Blocks.Interfaces.IntegerInput nControlMode annotation (Placement(transformation(extent={{-140,-110},{-100,-70}})));
  Modelica.Blocks.Interfaces.RealOutput fSetPointInternal annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
  Modelica.Blocks.Interfaces.BooleanInput bSetStatusOn annotation (Placement(transformation(extent={{-140,70},{-100,110}})));
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-120})));
  Modelica.Blocks.Continuous.LimPID PID_Heating(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Continuous.LimPID PID_Cooling(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) annotation (Placement(transformation(extent={{0,10},{20,-10}})));
  Modelica.Blocks.Continuous.LimPID PID_ThermalPower(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Logical.Switch switch annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
  Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  Modelica.Blocks.Math.Abs abs2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-70})));
equation
  if nControlMode == 1 then
    switch.u1 = PID_Heating.y;
  elseif nControlMode == 2 then
    switch.u1 = PID_Cooling.y;
  elseif nControlMode == 3 then
    switch.u1 = PID_ThermalPower.y;
  else
    switch.u1 = fSetPoint;
  end if;

//connections
  connect(fSetPoint, PID_Heating.u_s) annotation (Line(points={{-120,0},{-60,0},{-60,70},{-2,70}},   color={0,0,127}));
  connect(PID_Cooling.u_m, PID_Heating.u_s) annotation (Line(points={{10,12},{10,26},{-60,26},{-60,70},{-2,70}}, color={0,0,127}));
  connect(PID_Cooling.u_s, fTemperatureExternal) annotation (Line(points={{-2,0},{-50,0},{-50,-120}}, color={0,0,127}));
  connect(PID_Heating.u_m, fTemperatureExternal) annotation (Line(points={{10,58},{10,40},{-50,40},{-50,-120}}, color={0,0,127}));
  connect(realExpression.y, switch.u3) annotation (Line(points={{50,19},{50,8},{58,8}}, color={0,0,127}));
  connect(switch.y, fSetPointInternal) annotation (Line(points={{81,0},{90.5,0},{90.5,0},{110,0}}, color={0,0,127}));
  connect(PID_ThermalPower.u_s, abs1.y) annotation (Line(points={{-2,-50},{-9,-50}}, color={0,0,127}));
  connect(abs1.u, PID_Heating.u_s) annotation (Line(points={{-32,-50},{-60,-50},{-60,70},{-2,70}}, color={0,0,127}));
  connect(abs2.y, PID_ThermalPower.u_m) annotation (Line(points={{19,-70},{10,-70},{10,-62}}, color={0,0,127}));
  connect(abs2.u, fThermalPowerExternal) annotation (Line(points={{42,-70},{50,-70},{50,-120}}, color={0,0,127}));
  connect(bSetStatusOn, switch.u2) annotation (Line(points={{-120,90},{40,90},{40,0},{58,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Control method for three way valves.</p>
<p>nControl = 1: Heating application (opens valve if measured temperature falls below setpoint)</p>
<p>nControl = 2: Cooling application (closes valve if measured temperature falls below setpoint)</p>
<p>nControl = 3: Thermal power (opens valve to increase thermal power)</p>
<p>else: fSetPoint controls valve opening.</p>
</html>"));
end ControlThreeWayValve;
