within ThermalSystemsControlLib.Components.DryCooler.PhysicalModels;
model DryCooler_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.CoolingTower_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.DryCooler.PhysicalModels.Records.DryCoolerProperties deviceData constrainedby ThermalSystemsControlLib.Components.DryCooler.PhysicalModels.Records.DryCoolerProperties annotation (choicesAllMatching=true);

  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  HeatExchanger.PhysicalModels.HeatExchanger_Physical heatExchanger_Physical(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Modelica.Media.Air.SimpleAir,
    deviceData=deviceData.deviceData_HeatExchanger) annotation (Placement(transformation(extent={{-8,20},{12,0}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(
    redeclare package Medium = Modelica.Media.Air.SimpleAir,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,20})));
  Modelica.Blocks.Interfaces.RealInput T_air
    "Prescribed boundary temperature" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,50})));
  Pumps.PhysicalModels.IdealPump_Physical idealPump_Physical(redeclare package Medium = Modelica.Media.Air.SimpleAir, deviceData=deviceData.deviceData_Ventilation)
                                                             annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={30,30})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(
    redeclare package Medium = Modelica.Media.Air.SimpleAir,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-92,20})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=deviceData.deviceData_Ventilation.u_min) annotation (Placement(transformation(extent={{60,70},{80,90}})));
equation

  connect(port_a,port_a)  annotation (Line(points={{-100,0},{-100,0}},                   color={0,127,255}));
  connect(heatExchanger_Physical.port_b1, port_b) annotation (Line(points={{12,6},{20,6},{20,0},{100,0}},                 color={0,127,255}));
  connect(idealPump_Physical.port_b, heatExchanger_Physical.port_a2) annotation (Line(points={{20,20},{20,14},{-7.8,14}},           color={0,127,255}));
  connect(boundary1.ports[1], heatExchanger_Physical.port_b2) annotation (Line(points={{-82,20},{-20,20},{-20,14},{12,14}},      color={0,127,255}));
  connect(heatExchanger_Physical.port_a1, port_a) annotation (Line(points={{-8,6},{-20,6},{-20,0},{-100,0},{-100,0}}, color={0,127,255}));
  connect(idealPump_Physical.port_a, boundary.ports[1]) annotation (Line(points={{40,20},{60,20}}, color={0,127,255}));
  connect(T_air, boundary.T_in) annotation (Line(points={{-120,50},{82,50},{82,16}}, color={0,0,127}));
  connect(fSetPoint, idealPump_Physical.fSetPoint) annotation (Line(points={{0,120},{0,80},{18,80},{18,30}}, color={0,0,127}));
  connect(idealPump_Physical.fOperatingPoint, fOperatingPoint) annotation (Line(points={{26,19},{20,19},{20,40},{110,40}}, color={0,0,127}));
  connect(realToBoolean.y, bStatusOn) annotation (Line(points={{81,80},{110,80}}, color={255,0,255}));
  connect(realToBoolean.u, fOperatingPoint) annotation (Line(points={{58,80},{40,80},{40,40},{110,40}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1)),
    Documentation(info="<html>
<p>Dry cooler model using an ideal pump for ventilation modeling. Heat is transfered by a counterflow heat exchanger.</p>
</html>"));
end DryCooler_Physical;
