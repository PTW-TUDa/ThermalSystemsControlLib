within ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels;
model HybridCooler_Physical
  outer ThermalSystemsControlLib.Applications.HD_UseCase.Weather weather;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CoolingTower_Icon;

  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels.Records.HybridCoolerProperties deviceData constrainedby ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels.Records.HybridCoolerProperties annotation (choicesAllMatching=true);

  Boolean WetCooling;
  Modelica.SIunits.Temperature T_wb "Wet Bulb Temperature";

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
    redeclare package Medium1 = Modelica.Media.Air.DryAirNasa,
    redeclare package Medium2 = Medium,
    redeclare Applications.HD_UseCase.Records.Converters.HybridCooler_HD deviceData) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(
    redeclare package Medium = Modelica.Media.Air.DryAirNasa,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,20})));
  Pumps.PhysicalModels.IdealPump_Physical idealPump_Physical(redeclare package Medium = Modelica.Media.Air.DryAirNasa,deviceData=deviceData.deviceData_Ventilation)
                                                             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,20})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(
    redeclare package Medium = Modelica.Media.Air.DryAirNasa,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,20})));


equation


    T_wb = weather.T_ambient*atan(0.151977*(weather.relative_humidity*100 + 8.313659)^(1/2)) + atan(weather.T_ambient + weather.relative_humidity*100)- atan(weather.relative_humidity*100 - 1.676331) + (0.00391838*(weather.relative_humidity*100)^(3/2))*atan(0.023101*weather.relative_humidity*100)- 4.686035; //in °C

  if T_wb < 2 then
    WetCooling=true;
    else
    WetCooling=false;
  end if;

  if WetCooling then
    boundary.T_in=T_wb;
  else
    boundary.T_in=weather.T_ambient;
  end if;
  connect(port_a,port_a)  annotation (Line(points={{-100,0},{-100,0}},                   color={0,127,255}));
  connect(idealPump_Physical.port_a, boundary.ports[1]) annotation (Line(points={{-20,10},{-40,10},{-40,20},{-60,20}},
                                                                                                   color={0,127,255}));
  connect(fSetPoint, idealPump_Physical.fSetPoint) annotation (Line(points={{0,120},{0,116},{-30,116},{-30,32}},
                                                                                                             color={0,0,127}));
  connect(idealPump_Physical.fOperatingPoint, fOperatingPoint) annotation (Line(points={{-19,24},{20,24},{20,40},{110,40}},color={0,0,127}));
  connect(heatExchanger_Physical.port_b1, boundary1.ports[1]) annotation (Line(points={{10,14},{16,14},{16,20},{40,20}}, color={0,127,255}));
  connect(idealPump_Physical.port_b, heatExchanger_Physical.port_a1) annotation (Line(points={{-20,30},{-16,30},{-16,14},{-10,14}}, color={0,127,255}));
  connect(port_a, heatExchanger_Physical.port_a2) annotation (Line(points={{-100,0},{-16,0},{-16,6},{-9.8,6}}, color={0,127,255}));
  connect(heatExchanger_Physical.port_b2, port_b) annotation (Line(points={{10,6},{16,6},{16,0},{100,0}}, color={0,127,255}));
  connect(idealPump_Physical.bStatusOn, bStatusOn) annotation (Line(points={{-19,28},{10,28},{10,80},{110,80}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(initialScale=0.1)),
    Documentation(info="<html>
<p>Hybrid cooler model using an ideal pump for ventilation modeling. Heat is transfered by a counterflow heat exchanger considering wet bulb temperature calculated by an outer weather model which must be created during setting up an application model.</p>
</html>"));
end HybridCooler_Physical;
