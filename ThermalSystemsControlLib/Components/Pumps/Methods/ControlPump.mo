within ThermalSystemsControlLib.Components.Pumps.Methods;
model ControlPump
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
    yMax=1,
    yMin=0,
    initType=Modelica.Blocks.Types.InitPID.InitialState) annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Modelica.Blocks.Logical.Switch switch annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,30})));
  Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Math.Abs abs2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-84})));
  Modelica.Blocks.Continuous.LimPID PID_ConstantTemperature_Heating(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) "Flow is heated" annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureExternal annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
  Modelica.Blocks.Continuous.LimPID PID_ConstantTemperature_Cooling(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) "Flow is cooled" annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.LimPID PID_TemperatureDifference(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    yMax=yMax,
    yMin=yMin,
    initType=Modelica.Blocks.Types.InitPID.InitialState) "Flow is heated" annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  Modelica.Blocks.Interfaces.RealInput fTemperatureDifference
                                                             annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-120})));
  Modelica.Blocks.Math.Abs abs3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-70})));
  Modelica.Blocks.Math.Gain gain1(k=1/1000)
                                           annotation (Placement(transformation(extent={{-32,-46},{-20,-34}})));
  Modelica.Blocks.Math.Gain gain2(k=1/1000)
                                           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-62})));
equation
  if nControlMode == 1 then
    //flow is heated
    switch.u1 = PID_ConstantTemperature_Heating.y;
  elseif nControlMode == 2 then
     //flow is cooled
    switch.u1 = PID_ConstantTemperature_Cooling.y;
  elseif nControlMode == 3 then
     //temperature difference
    switch.u1 = PID_TemperatureDifference.y;
  elseif nControlMode == 6 then
    switch.u1 = PID_ThermalPower.y;
  else
    switch.u1 = fSetPoint*0.01;
  end if;

//connections
  connect(realExpression.y, switch.u3) annotation (Line(points={{50,19},{50,8},{58,8}}, color={0,0,127}));
  connect(switch.y, fSetPointInternal) annotation (Line(points={{81,0},{90.5,0},{90.5,0},{110,0}}, color={0,0,127}));
  connect(abs2.u, fThermalPowerExternal) annotation (Line(points={{-8.88178e-16,-96},{0,-96},{0,-120}}, color={0,0,127}));
  connect(bSetStatusOn, switch.u2) annotation (Line(points={{-120,90},{40,90},{40,0},{58,0}}, color={255,0,255}));
  connect(abs1.u, fSetPoint) annotation (Line(points={{-62,-40},{-80,-40},{-80,0},{-120,0}},
                                                                         color={0,0,127}));
  connect(fTemperatureExternal, PID_ConstantTemperature_Heating.u_s) annotation (Line(points={{-50,-120},{-50,40},{-12,40}}, color={0,0,127}));
  connect(fTemperatureExternal, PID_ConstantTemperature_Cooling.u_m) annotation (Line(points={{-50,-120},{-50,-12},{0,-12}},
                                                                                                                           color={0,0,127}));
  connect(PID_ConstantTemperature_Heating.u_m, fSetPoint) annotation (Line(points={{0,28},{-40,28},{-40,0},{-120,0}}, color={0,0,127}));
  connect(PID_ConstantTemperature_Cooling.u_s, fSetPoint) annotation (Line(points={{-12,0},{-120,0}}, color={0,0,127}));
  connect(fTemperatureDifference, abs3.u) annotation (Line(points={{50,-120},{50,-82}}, color={0,0,127}));
  connect(PID_ThermalPower.u_s, gain1.y) annotation (Line(points={{-12,-40},{-19.4,-40}}, color={0,0,127}));
  connect(gain1.u, abs1.y) annotation (Line(points={{-33.2,-40},{-39,-40}}, color={0,0,127}));
  connect(abs2.y, gain2.u) annotation (Line(points={{6.66134e-16,-73},{0,-73},{-4.44089e-16,-69.2}}, color={0,0,127}));
  connect(gain2.y, PID_ThermalPower.u_m) annotation (Line(points={{3.88578e-16,-55.4},{3.88578e-16,-53.7},{0,-53.7},{0,-52}}, color={0,0,127}));
  connect(abs3.y, PID_TemperatureDifference.u_s) annotation (Line(points={{50,-59},{50,-20},{30,-20},{30,60},{-20,60},{-20,80},{-12,80}}, color={0,0,127}));
  connect(PID_TemperatureDifference.u_m, fSetPoint) annotation (Line(points={{0,68},{-80,68},{-80,0},{-120,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Control method for pumps.</p>
<p>nControl = 3: Thermal power (increases mass flow to increase thermal power).</p>
<p>else: fSetPoint controls relative pump speed.</p>
</html>"));
end ControlPump;
