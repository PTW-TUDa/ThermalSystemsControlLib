within ThermalSystemsControlLib.Components.Valves.Methods;
model ControlTwoWayValve
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  //## parameters ##
  parameter Real k=1 "Gain of controller" annotation(Dialog(group="Controller limitations"));
  parameter Real yMax=1 "Upper limit of controller output" annotation(Dialog(group="Controller limitations"));
  parameter Real yMin=0 "Lower limit of controller output" annotation(Dialog(group="Controller limitations"));

  Modelica.Blocks.Interfaces.IntegerInput nControlMode annotation (Placement(transformation(extent={{-140,-110},{-100,-70}})));
  Modelica.Blocks.Interfaces.RealOutput fSetPointInternal annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanInput bSetStatusOn annotation (Placement(transformation(extent={{-140,70},{-100,110}})));
  Modelica.Blocks.Interfaces.RealInput fThermalPowerExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Continuous.LimPID PID_ThermalPower(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Switch switch annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
  Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.Abs abs2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-50})));
equation
  if nControlMode == 3 then
    switch.u1 = PID_ThermalPower.y;
  else
    switch.u1 = fSetPoint;
  end if;

//connections
  connect(realExpression.y, switch.u3) annotation (Line(points={{50,19},{50,8},{58,8}}, color={0,0,127}));
  connect(switch.y, fSetPointInternal) annotation (Line(points={{81,0},{90.5,0},{90.5,0},{110,0}}, color={0,0,127}));
  connect(PID_ThermalPower.u_s, abs1.y) annotation (Line(points={{-12,0},{-39,0}},   color={0,0,127}));
  connect(abs2.y, PID_ThermalPower.u_m) annotation (Line(points={{8.88178e-16,-39},{0,-39},{0,-12}},
                                                                                              color={0,0,127}));
  connect(abs2.u, fThermalPowerExternal) annotation (Line(points={{-6.66134e-16,-62},{0,-62},{0,-120}},
                                                                                                color={0,0,127}));
  connect(bSetStatusOn, switch.u2) annotation (Line(points={{-120,90},{40,90},{40,0},{58,0}}, color={255,0,255}));
  connect(fSetPoint, abs1.u) annotation (Line(points={{-120,0},{-62,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Control method for two way valves.</p>
<p>nControl = 1: Thermal power (opens valve to increase thermal power)</p>
<p>else: fSetPoint controls valve opening.</p>
</html>"));
end ControlTwoWayValve;
