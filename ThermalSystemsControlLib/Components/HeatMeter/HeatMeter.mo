within ThermalSystemsControlLib.Components.HeatMeter;
model HeatMeter
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.HeatMeter_Icon;
  PhysicalModels.HeatMeter_Physical heatMeter_Physical annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput fFeedTemperature annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,0})));
  Modelica.Blocks.Interfaces.RealOutput fHeatFlowRate "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
  Interfaces.heatMeterState_FMUConnector sensorState annotation (Placement(transformation(extent={{40,20},{20,40}})));
equation
  connect(heatMeter_Physical.port_a, port_a) annotation (Line(points={{80,-10},{80,-100},{100,-100}}, color={0,127,255}));
  connect(heatMeter_Physical.port_b, port_b) annotation (Line(points={{80,10},{80,100},{100,100}}, color={0,127,255}));
  connect(heatMeter_Physical.fFeedTemperature, fFeedTemperature) annotation (Line(points={{82,0},{94,0},{94,-1.11022e-15},{120,-1.11022e-15}}, color={0,0,127}));
  connect(heatMeter_Physical.fHeatFlowRate, fHeatFlowRate) annotation (Line(points={{59,0},{-110,0}}, color={0,0,127}));
  connect(sensorState.sensorState, heatMeter_Physical.sensorState) annotation (Line(points={{41,30},{61,30},{61,11}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Combined sensor model to measure feed and return temperature, temperature difference, volume flow rate and heat flow rate.</p>
</html>"));
end HeatMeter;
