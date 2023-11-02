within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Systems.HNHT;
model CHP1System_Type2
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=1));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CHP_Icon;
  Components.CombinedHeatPower.PhysicalModels.CHP_Type2 cHP_Type2_1(redeclare package Medium = Medium, redeclare Records.ViessmannVitobloc200_EM_6_15 deviceData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  Modelica.Blocks.Interfaces.RealInput fTargetTemperature annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{30,12},{50,32}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-30,4},{-10,24}})));
equation
  connect(cHP_Type2_1.port_a, port_a) annotation (Line(points={{70,-10},{70,-100},{100,-100}}, color={0,127,255}));
  connect(cHP_Type2_1.port_b, port_b) annotation (Line(points={{70,10},{70,100},{100,100}}, color={0,127,255}));
  connect(cHP_Type2_1.fTargetTemperature, fTargetTemperature) annotation (Line(points={{58,5},{10,5},{10,-30},{-120,-30}}, color={0,0,127}));
  connect(cHP_Type2_1.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{65,11},{65,40},{0,40},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(cHP_Type2_1.bStatusOn, bStatusOn) annotation (Line(points={{61,11},{61,100},{-50,100},{-50,110}}, color={255,0,255}));
  connect(systemFlowControl.bStatusOn_Components[1], cHP_Type2_1.bStatusOn) annotation (Line(points={{-30,81},{-30,90},{61,90},{61,11}}, color={255,0,255}));
  connect(systemFlowControl.bSetStatusOn_Components[1], switch1.u2) annotation (Line(points={{-19,70},{0,70},{0,22},{28,22}}, color={255,0,255}));
  connect(selectSetPoint.fSetPoint, switch1.u1) annotation (Line(points={{-59,30},{28,30}}, color={0,0,127}));
  connect(switch1.u3, const.y) annotation (Line(points={{28,14},{-9,14}}, color={0,0,127}));
  connect(cHP_Type2_1.fSetPoint, switch1.y) annotation (Line(points={{58,0},{54,0},{54,22},{51,22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CHP1System_Type2;
