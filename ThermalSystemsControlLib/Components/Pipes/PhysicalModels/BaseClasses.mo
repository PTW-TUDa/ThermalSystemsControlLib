within ThermalSystemsControlLib.Components.Pipes.PhysicalModels;
package BaseClasses
  extends ThermalSystemsControlLib.BaseClasses.Icons.BaseClass_Icon_Package;
  model Generic_PressureLoss "Generic model for calucalting pressure loss"
    extends Modelica.Fluid.Interfaces.PartialTwoPort;
    outer Modelica.Fluid.System system;

    //## PARAMETERS ##
    parameter SI.Diameter length "Pipe length";
    parameter SI.Diameter diameter "Pipe diameter";
    parameter Real ceta_Bending = 0.1 "Pressure loss coefficient of a 90° bending";
    parameter Integer n_Bending "Number of 90° pipe bendings";

  protected
    parameter Medium.ThermodynamicState state_default=
        Medium.setState_pTX(Medium.p_default,
                            Medium.T_default,
                            Medium.X_default)  "Default medium properties";
    parameter SI.DynamicViscosity mu = Medium.dynamicViscosity(state_default) "Default dynamic viscosity of medium";
    parameter SI.Density d = Medium.density(state_default) "Default density of medium";

    //Initialization
    parameter SI.PressureDifference dp_start = 0 "Start value for pressure difference dp = port_a.p -port_b.p";
    parameter SI.MassFlowRate m_flow_start = system.m_flow_start "Start value for mass flow rate";

    //Dimensionless numbers
    parameter Real ceta_Bending_total = n_Bending*ceta_Bending "Total pressure loss coefficient through pipe bendings";
    Real ceta = lambda*length/diameter+ceta_Bending_total "Total pressure loss coefficent";
    Real lambda "Pipe friction coefficient";
    SI.ReynoldsNumber Re "Reynoldsnumber to determine flow model";

    //Port variables
    SI.MassFlowRate m_flow(start=system.m_flow_start) = port_a.m_flow "Mass flow rate from port a to port b (m_flow > 0: a->b)";
    SI.PressureDifference dp(start=dp_start) = port_a.p-port_b.p "Pressure difference between port a and port b";

  equation
    //Fluid properties
    Re = Modelica.Fluid.Pipes.BaseClasses.CharacteristicNumbers.ReynoldsNumber_m_flow(m_flow = m_flow,mu = mu,D = diameter);

    //Calculation of pipe friction coefficient
    //Smooth to generate two times contiously differentiable function
     lambda =  smooth(2, if noEvent(Re<1187)
                 then 64/(Re+1)
                 else 0.3164/((Re+1))^0.25);

    //Pressure balance
    dp =ThermalSystemsControlLib.Components.Pipes.PhysicalModels.BaseClasses.PressureLossFunction(
      m_flow=m_flow,
      ceta=ceta,
      d=d,
      diameter=diameter);

    //Mass balance
    0 = port_a.m_flow + port_b.m_flow;

    // Isenthalpic state transformation (no storage and no loss of energy)
    port_a.h_outflow = if system.allowFlowReversal then inStream(port_b.h_outflow) else Medium.h_default;
    port_b.h_outflow = inStream(port_a.h_outflow);

    //Transport of Substances (other port variables)
    port_a.Xi_outflow = inStream(port_b.Xi_outflow);
    port_b.Xi_outflow = inStream(port_a.Xi_outflow);

    port_a.C_outflow = inStream(port_b.C_outflow);
    port_b.C_outflow = inStream(port_a.C_outflow);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Generic_PressureLoss;

  model Generic_HeatLoss "Generic model for heat loss to ambient"
    extends Modelica.Fluid.Interfaces.PartialTwoPort;
    //## PARAMETERS ##
    parameter SI.Volume V "Fluid volume";
    parameter SI.ThermalResistance R_th "Thermal resistance";
    parameter SI.Temperature T_ambient=293.15   "Ambient temperature";

    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=R_th) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=T_ambient)
                                                                                     annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
    Modelica.Fluid.Vessels.ClosedVolume volume(
      use_HeatTransfer=true,
      V=V,
      redeclare package Medium = Medium,
      nPorts=2,
      use_portsData=false)
                annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  equation

    connect(fixedTemperature.port, thermalResistor.port_a) annotation (Line(points={{-80,30},{-60,30}}, color={191,0,0}));
    connect(volume.ports[1], port_b) annotation (Line(points={{-2,0},{100,0}}, color={0,127,255}));
    connect(volume.ports[2], port_a) annotation (Line(points={{2,0},{-100,0}}, color={0,127,255}));
    connect(thermalResistor.port_b, volume.heatPort) annotation (Line(points={{-40,30},{-10,30},{-10,10}}, color={191,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Line(
            points={{-156,68}},
            color={230,230,230},
            thickness=0.5)}),                                      Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Generic_HeatLoss;

  function PressureLossFunction "Function for computing pressure loss depending on a given mass flow rate"
     //##IMPORTS##
     import SI = Modelica.SIunits;
     import Con = Modelica.Constants;

     //##Inputs##
     input SI.MassFlowRate m_flow "Mass flow rate in kg/s";
     input Real ceta "Pressure loss coefficient";
     input SI.Density d "Fluid density";
     input SI.Diameter diameter "Pipe diameter";

     //##OUTPUS##
     output SI.PressureDifference dp "Pressure difference between port a and b in Pascal (dp = port_a.p - port_b.p)";

  protected
    SI.Area A = Con.pi*(diameter/2)^2 "Cross sectional area of pipe";

  algorithm
    dp := sign(m_flow)*ceta*(m_flow^2)/(2*d*A^2);
  end PressureLossFunction;

  function PressureLossFunction_PressureDrop "Function for computing pressure loss depending on a given mass flow rate"
     input SI.MassFlowRate m_flow "Mass flow rate in kg/s";
     input Real k "Pressure loss coefficient";
     output SI.PressureDifference dp "Pressure difference between port a and b in Pascal (dp = port_a.p - port_b.p)";

  algorithm
    dp := sign(m_flow)*(m_flow/k)^2;
  end PressureLossFunction_PressureDrop;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseClasses;
