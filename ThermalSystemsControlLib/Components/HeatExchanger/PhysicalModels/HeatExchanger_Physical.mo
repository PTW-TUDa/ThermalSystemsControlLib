within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels;
model HeatExchanger_Physical
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatExchanger_Icon;
  replaceable package Medium1 = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable package Medium2 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records.HeatExchangerProperties deviceData constrainedby ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records.HeatExchangerProperties annotation (choicesAllMatching=true);

  Modelica.SIunits.Efficiency eps;
  Modelica.SIunits.Efficiency NTU;
  Medium1.Temperature T_in1 "Inlet temperature medium 1";
  Medium2.Temperature T_in2 "Inlet temperature medium 2";
  Modelica.SIunits.ThermalConductance C1_flow "Heat capacity flow rate medium 1";
  Modelica.SIunits.ThermalConductance C2_flow "Heat capacity flow rate medium 2";
  Modelica.SIunits.ThermalConductance CMax_flow(min=0);
  Modelica.SIunits.ThermalConductance CMin_flow(min=0);
  Modelica.SIunits.HeatFlowRate QMax_flow "Maximum heat flow rate into medium 1";
  Modelica.SIunits.HeatFlowRate Q_flow;
  constant Real e=Modelica.Math.exp(1.0);

    //## PUBLIC COMPONENTS ##
  Modelica.Fluid.Vessels.ClosedVolume volume2(
    redeclare package Medium = Medium2,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V2,
    nPorts=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,-30})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHeatFlow2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-30})));

  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{90,-50},{110,-30}}), iconTransformation(extent={{90,-50},{110,-30}})));
  Modelica.Fluid.Vessels.ClosedVolume
    volume1(
    redeclare package Medium = Medium1,
    use_portsData=false,
    use_HeatTransfer=true,
    V=deviceData.V1,
    nPorts=2)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,50})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHeatFlow1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,50})));
protected
  Medium1.ThermodynamicState state_a1_inflow=
    Medium1.setState_phX(port_a1.p, inStream(port_a1.h_outflow), inStream(port_a1.Xi_outflow))
    "state for medium inflowing through port_a1";
  Medium2.ThermodynamicState state_a2_inflow=
    Medium2.setState_phX(port_a2.p, inStream(port_a2.h_outflow), inStream(port_a2.Xi_outflow))
    "state for medium inflowing through port_a2";

equation
  T_in1 = Medium1.temperature(state_a1_inflow);
  T_in2 = Medium2.temperature(state_a2_inflow);
  C1_flow = abs(port_a1.m_flow)* Medium1.specificHeatCapacityCp(state_a1_inflow);
  C2_flow = abs(port_a2.m_flow)* Medium2.specificHeatCapacityCp(state_a2_inflow);
  CMin_flow = min(C1_flow, C2_flow);
  CMax_flow = max(C1_flow, C2_flow);
  QMax_flow = CMin_flow*(T_in2 - T_in1);

  if Modelica.Math.isEqual(CMin_flow,0.0) == true then
    NTU = 0;
    eps = 1;
  elseif Modelica.Math.isEqual(CMin_flow/CMax_flow,1.0) == true then
    NTU = deviceData.U*deviceData.A/CMin_flow;
    eps = NTU/(1+NTU);
  else
    NTU = deviceData.U*deviceData.A/CMin_flow;
    eps = (1-e^(-(1-CMin_flow/CMax_flow)*NTU))/(1-CMin_flow/CMax_flow*e^(-(1-CMin_flow/CMax_flow)*NTU));
  end if;

  Q_flow = QMax_flow * eps;
  preHeatFlow1.port.Q_flow = -Q_flow;
  preHeatFlow2.port.Q_flow = Q_flow;

  connect(preHeatFlow2.port, volume2.heatPort) annotation (Line(points={{20,-30},{10,-30}}, color={191,0,0}));
  connect(preHeatFlow1.port, volume1.heatPort) annotation (Line(points={{20,50},{10,50}}, color={191,0,0}));
  connect(volume1.ports[1], port_b1) annotation (Line(points={{2,40},{100,40}},  color={0,127,255}));
  connect(volume1.ports[2], port_a1) annotation (Line(points={{-2,40},{-100,40}}, color={0,127,255}));
  connect(port_b2, volume2.ports[1]) annotation (Line(points={{-100,-40},{2,-40}}, color={0,127,255}));
  connect(volume2.ports[2], port_a2) annotation (Line(points={{-2,-40},{50,-40},{50,-40},{100,-40}}, color={0,127,255}));
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
end HeatExchanger_Physical;
