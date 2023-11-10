within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels;
model HeatExchanger_Type2
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable package Medium2 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records.HeatExchanger_Type2_Properties deviceData constrainedby ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records.HeatExchanger_Type2_Properties annotation (choicesAllMatching=true);

  SI.Temperature T_in1;
  SI.Temperature T_in2;
  SI.HeatFlowRate Q_flow "Heat flow rate";
  SI.TemperatureDifference dT_log "Logarithmic temperature difference";
  SI.Temperature T_control "Controlled temperature";
  SI.TemperatureDifference dT "Temperature difference along hex";
  SI.SpecificHeatCapacityAtConstantPressure cp1 "Specific heat capacity";
  SI.SpecificHeatCapacityAtConstantPressure cp2 "Specific heat capacity";

    //## PUBLIC COMPONENTS ##

  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{90,-50},{110,-30}}), iconTransformation(extent={{90,-50},{110,-30}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={50,120})));
  Modelica.Blocks.Interfaces.RealInput fControlledTemperature annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-50,120})));
  Modelica.Fluid.Vessels.ClosedVolume volume2(
    redeclare package Medium = Medium2,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V2,
    nPorts=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={10,-30})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHeatFlow2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={40,-30})));
  Modelica.Fluid.Vessels.ClosedVolume
    volume1(
    redeclare package Medium = Medium1,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V1,
    nPorts=2)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={10,50})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHeatFlow1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={40,50})));
  BaseClasses.FluidBaseClasses.IdealSource idealSource1(redeclare package Medium = Medium1, control_m_flow=true) annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  BaseClasses.FluidBaseClasses.IdealSource idealSource2(redeclare package Medium = Medium1, control_m_flow=true) annotation (Placement(transformation(extent={{-40,-50},{-60,-30}})));
protected
  Medium1.ThermodynamicState state_a1_inflow=
    Medium1.setState_phX(port_a1.p, inStream(port_a1.h_outflow), inStream(port_a1.Xi_outflow))
    "state for medium inflowing through port_a1";
  Medium2.ThermodynamicState state_a2_inflow=
    Medium2.setState_phX(port_a2.p, inStream(port_a2.h_outflow), inStream(port_a2.Xi_outflow))
    "state for medium inflowing through port_a2";

equation
  // inlet temperatures
  T_in1 = Medium1.temperature(state_a1_inflow);
  T_in2 = Medium2.temperature(state_a2_inflow);

  // dT_log = dT_min = dT_max
  // 1 - heat source, 2 heat sink
  if fSetPoint > 0 then
    if deviceData.control_ReturnTemperature then
      T_control = max(fControlledTemperature,T_in2+deviceData.dT_min);
      dT = T_in1-T_control;
      dT_log = abs(T_control-T_in2);
    else
      T_control = min(T_in1-deviceData.dT_min,fControlledTemperature);
      dT = T_control-T_in2;
      dT_log = abs(T_control-T_in1);
    end if;
    Q_flow = min(fSetPoint,deviceData.A*deviceData.U*dT_log);
  // 1 - heat sink, 2 heat source
  else
    if deviceData.control_ReturnTemperature then
      T_control = max(fControlledTemperature,T_in1+deviceData.dT_min);
      dT = T_control-T_in2;
      dT_log = abs(T_control-T_in1);
    else
      T_control = min(T_in2-deviceData.dT_min,fControlledTemperature);
      dT = T_in1-T_control;
      dT_log = abs(T_control-T_in2);
    end if;
      Q_flow = max(fSetPoint,-deviceData.A*deviceData.U*dT_log);
  end if;

  // heat capacacities
  cp1 = Medium1.specificHeatCapacityCp(state_a1_inflow);
  cp2 = Medium2.specificHeatCapacityCp(state_a2_inflow);

  // balance equations 1
  idealSource1.m_flow_in = Q_flow/(cp1*dT);
  preHeatFlow1.Q_flow = -Q_flow;

  // balance equations 2
  idealSource2.m_flow_in = Q_flow/(cp2*dT);
  preHeatFlow2.Q_flow = Q_flow;

  connect(preHeatFlow2.port,volume2. heatPort) annotation (Line(points={{30,-30},{20,-30}}, color={191,0,0}));
  connect(preHeatFlow1.port,volume1. heatPort) annotation (Line(points={{30,50},{20,50}}, color={191,0,0}));
  connect(volume1.ports[1], port_b1) annotation (Line(points={{12,40},{100,40}}, color={0,127,255}));
  connect(volume2.ports[1], port_a2) annotation (Line(points={{12,-40},{100,-40}},                   color={0,127,255}));
  connect(volume1.ports[2], idealSource1.port_b) annotation (Line(points={{8,40},{-40,40}}, color={0,127,255}));
  connect(idealSource1.port_a, port_a1) annotation (Line(points={{-60,40},{-100,40}}, color={0,127,255}));
  connect(port_b2, idealSource2.port_b) annotation (Line(points={{-100,-40},{-60,-40}}, color={0,127,255}));
  connect(idealSource2.port_a, volume2.ports[2]) annotation (Line(points={{-40,-40},{8,-40}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
              Icon(graphics={Text(
          extent={{-78,82},{76,38}},
          lineColor={238,46,47},
          textString="HOT"), Text(
          extent={{-60,-40},{62,-84}},
          lineColor={28,108,200},
          textString="COLD")}),
    Documentation(info="<html>
<p>Counterflow heat exchanger model using NTU equations.</p>
</html>"));
end HeatExchanger_Type2;
