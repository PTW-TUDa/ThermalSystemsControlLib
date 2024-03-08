within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model Consumer_ThermalResistanceOnly
    extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter SI.Volume V_int "Fluid volume in heater";
  parameter SI.ThermalResistance R_Wall "Constant thermal resistance to ambient";

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
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=R_Wall)
                                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_ambient annotation (Placement(transformation(extent={{-10,-116},{10,-96}})));
equation

   //connections
  connect(massFlowRate.port_a, port_a) annotation (Line(points={{-80,0},{-100,0}}, color={0,127,255}));
  connect(volume.ports[1], massFlowRate.port_b) annotation (Line(points={{-2,0},{-60,0}}, color={0,127,255}));
  connect(volume.ports[2], port_b) annotation (Line(points={{2,0},{100,0}}, color={0,127,255}));
  connect(thermalResistor.port_a, port_ambient) annotation (Line(points={{-6.66134e-16,-80},{0,-80},{0,-106}}, color={191,0,0}));
  connect(thermalResistor.port_b, volume.heatPort) annotation (Line(points={{0,-60},{0,10},{-10,10}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Model for floor or wall heating according to <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[WISC05]</a>.</p>
</html>"));
end Consumer_ThermalResistanceOnly;
