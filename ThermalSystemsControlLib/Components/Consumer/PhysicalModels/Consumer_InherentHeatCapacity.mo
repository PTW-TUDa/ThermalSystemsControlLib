within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model Consumer_InherentHeatCapacity "Extends Consumer_VariableMassFlow with inherent heat capacity to model simple heat demands (e.g. building)"
    extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V_int "Fluid volume";
  parameter SI.HeatCapacity C "Heat capacity of component (= cp*m)";
  parameter SI.ThermalResistance R_MediumToComponent "Constant thermal resistance from medium to component (e.g. heater)";
  parameter SI.ThermalResistance R_ComponentToAmbient "Constant thermal resistance from component to ambient (e.g. building wall)";
  parameter SI.Temperature T_start = 293.15 "Start temperature of component";

  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    redeclare package Medium = Medium,
    use_portsData=false,
    use_HeatTransfer=true,
    V=V_int,
    nPorts=2) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=C,     T(start=T_start))
                                                                            annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=R_ComponentToAmbient)
                                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_ambient annotation (Placement(transformation(extent={{-10,-116},{10,-96}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor1(R=R_MediumToComponent)
                                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-30})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Interfaces.RealOutput T_Consumer "Absolute temperature as output signal" annotation (Placement(transformation(extent={{100,60},{120,80}})));
equation

   //connections
  connect(massFlowRate.port_a, port_a) annotation (Line(points={{-80,0},{-100,0}}, color={0,127,255}));
  connect(volume.ports[1], massFlowRate.port_b) annotation (Line(points={{-2,0},{-60,0}}, color={0,127,255}));
  connect(volume.ports[2], port_b) annotation (Line(points={{2,0},{100,0}}, color={0,127,255}));
  connect(thermalResistor.port_b, heatCapacitor.port) annotation (Line(points={{0,-60},{-30,-60}},         color={191,0,0}));
  connect(thermalResistor.port_a, port_ambient) annotation (Line(points={{-6.66134e-16,-80},{0,-80},{0,-106}}, color={191,0,0}));
  connect(heatCapacitor.port, thermalResistor1.port_a) annotation (Line(points={{-30,-60},{-10,-60},{-10,-40}}, color={191,0,0}));
  connect(thermalResistor1.port_b, volume.heatPort) annotation (Line(points={{-10,-20},{-10,10}}, color={191,0,0}));
  connect(temperatureSensor.port, heatCapacitor.port) annotation (Line(points={{0,70},{-30,70},{-30,-60}},  color={191,0,0}));
  connect(temperatureSensor.T, T_Consumer) annotation (Line(points={{20,70},{110,70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Model for floor or wall heating according to <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[WISC05]</a>.</p>
</html>"));
end Consumer_InherentHeatCapacity;
