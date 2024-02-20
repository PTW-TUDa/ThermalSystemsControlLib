within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model Consumer_ReturnTemperatureControlled
  extends ThermalSystemsControlLib.BaseClasses.Icons.Consumer_Icon;
  import Modelica.Media.Interfaces;
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);

  outer Modelica.Fluid.System system "System wide properties";

  parameter Boolean is_heat_sink "If true then component will be regarded as heat sink, else as cooling sink";
  parameter Modelica.SIunits.TemperatureDifference dT_min "Minimum temperature difference between flow and return. If is_heat_sink is true then return temperature == min(T_r, flow temperature - dT_min) else return temperature = max(T_r, flow temperature + dT_min)";
  Modelica.SIunits.ThermodynamicTemperature T_a;

  Modelica.Blocks.Interfaces.RealInput Q_flow(quantity="Power", unit="W") annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-120})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium)
                                               annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput T_r(quantity="ThermodynamicTemperature", unit="K") annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-120})));
equation
  // Massflow computation
  // Compute massflow depending on flow enthalpy and thermal power demand
  // If flow temperature falls below return temperature, the simulation will continue but first law of thermodynamics will be violated (return temperature > flow temperature)
  port_a.m_flow = if is_heat_sink then Q_flow / (inStream(port_a.h_outflow) - port_b.h_outflow) else Q_flow / (port_b.h_outflow - inStream(port_a.h_outflow));

  // Mass balance (no storage)
  port_a.m_flow + port_b.m_flow = 0;

  T_a = Medium.temperature_phX(port_a.p, inStream(port_a.h_outflow), X = port_a.Xi_outflow);

  // Energy balance (no storage)
  // Enthalpy of return is calculated based on return temperature (T_r)
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = if is_heat_sink then Medium.specificEnthalpy(Medium.setState_pTX(p = port_a.p, T = min(T_r, T_a - dT_min), X = port_a.Xi_outflow)) else Medium.specificEnthalpy(Medium.setState_pTX(p = port_a.p, T = max(T_r, T_a + dT_min), X = port_a.Xi_outflow));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Model of an thermal sink (heating and cooling) which delivers a predefined return temperature.</p>
</html>"));
end Consumer_ReturnTemperatureControlled;
