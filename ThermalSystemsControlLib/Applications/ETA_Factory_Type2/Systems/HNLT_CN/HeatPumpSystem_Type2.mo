within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Systems.HNLT_CN;
model HeatPumpSystem_Type2
  extends ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.SystemContinuous(systemFlowControl(nComponents=1));
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidFourPort_CounterFlow;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  Components.CompressionChiller.PhysicalModels.CompressionChiller_Type2 compressionChiller_Type2_1(
    redeclare package Medium = Medium1,
    redeclare package Medium1 = Medium2,
    redeclare Records.ViessmannVitocal200G deviceData(u_min=0.25))
                                                       annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={82,0})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{10,-18},{30,2}})));
  Modelica.Blocks.Interfaces.RealInput fTargetTemperatureHeating annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealInput fTargetTemperatureCooling annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
equation
  connect(compressionChiller_Type2_1.port_a1, port_a2) annotation (Line(points={{92,-10},{92,-100},{100,-100}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.port_b1, port_b2) annotation (Line(points={{92,10},{92,100},{100,100}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.port_a, port_a1) annotation (Line(points={{82,10},{82,100},{60,100}}, color={0,127,255}));
  connect(compressionChiller_Type2_1.port_b, port_b1) annotation (Line(points={{82,-10},{82,-100},{60,-100}}, color={0,127,255}));
  connect(const.y, switch1.u3) annotation (Line(points={{31,-8},{36,-8}}, color={0,0,127}));
  connect(systemFlowControl.bSetStatusOn_Components[1], switch1.u2) annotation (Line(points={{-19,70},{28,70},{28,0},{36,0}}, color={255,0,255}));
  connect(switch1.y, compressionChiller_Type2_1.fSetPoint) annotation (Line(points={{59,0},{70,0}}, color={0,0,127}));
  connect(selectSetPoint.fSetPoint, switch1.u1) annotation (Line(points={{-59,30},{36,30},{36,8}}, color={0,0,127}));
  connect(compressionChiller_Type2_1.bStatusOn, systemFlowControl.bStatusOn_Components[1]) annotation (Line(points={{74,-11},{74,81},{-30,81}}, color={255,0,255}));
  connect(fTargetTemperatureHeating, compressionChiller_Type2_1.fTargetTemperatureCooling) annotation (Line(points={{-120,-30},{64,-30},{64,5},{70,5}}, color={0,0,127}));
  connect(fTargetTemperatureCooling, compressionChiller_Type2_1.fTargetTemperatureHeating) annotation (Line(points={{-120,-70},{70,-70},{70,-5}}, color={0,0,127}));
  connect(compressionChiller_Type2_1.fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{78,-11},{78,40},{0,40},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(compressionChiller_Type2_1.bStatusOn, bStatusOn) annotation (Line(points={{74,-11},{74,88},{-70,88},{-70,100},{-50,100},{-50,110}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatPumpSystem_Type2;
