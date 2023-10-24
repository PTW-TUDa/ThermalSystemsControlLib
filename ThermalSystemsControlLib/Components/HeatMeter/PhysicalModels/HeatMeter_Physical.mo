within ThermalSystemsControlLib.Components.HeatMeter.PhysicalModels;
model HeatMeter_Physical
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatMeter_Icon;

  SI.SpecificHeatCapacityAtConstantPressure cp "Specific heat capacity";
  Medium.ThermodynamicState state_port=
      Medium.setState_phX(port_a.p,
                          noEvent(actualStream(port_a.h_outflow)),
                          noEvent(actualStream(port_a.Xi_outflow)))  "Medium properties in port";

  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Return(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,50})));
  Modelica.Blocks.Interfaces.RealInput fFeedTemperature annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,0})));
  output Interfaces.heatMeterState sensorState annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
  Modelica.Blocks.Interfaces.RealOutput fHeatFlowRate "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-10})));
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{-60,40},{-80,60}})));
equation
    cp = Medium.specificHeatCapacityCp(state_port);

    sensorState.fFeedTemperature = fFeedTemperature;
    sensorState.fReturnTemperature = T_Return.T;
    sensorState.fTemperatureDifference =fFeedTemperature - T_Return.T;
    sensorState.fHeatFlowRate =massFlowRate.m_flow*cp*(fFeedTemperature - T_Return.T);
    sensorState.fVolumeFlowRate = volumeFlowRate.V_flow;
    sensorState.fHeatEnergy = integrator.y;
    fHeatFlowRate = sensorState.fHeatFlowRate;

    integrator.u = sensorState.fHeatFlowRate;

  connect(massFlowRate.port_a, port_a) annotation (Line(points={{-4.44089e-16,-80},{-4.44089e-16,-100},{100,-100}},
                                                                                              color={0,127,255}));
  connect(T_Return.port_b, port_b) annotation (Line(points={{0,60},{0,100},{100,100}}, color={0,127,255}));
  connect(massFlowRate.port_b, volumeFlowRate.port_a) annotation (Line(points={{6.66134e-16,-60},{6.66134e-16,-40},{-5.55112e-16,-40},{-5.55112e-16,-20}}, color={0,127,255}));
  connect(volumeFlowRate.port_b, T_Return.port_a) annotation (Line(points={{6.10623e-16,0},{6.66134e-16,10},{0,10},{0,40}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Combined sensor model to measure feed and return temperature, temperature difference, volume flow rate and heat flow rate.</p>
</html>"));
end HeatMeter_Physical;
