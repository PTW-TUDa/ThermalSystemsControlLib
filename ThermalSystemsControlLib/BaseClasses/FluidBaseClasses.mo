within ThermalSystemsControlLib.BaseClasses;
package FluidBaseClasses
  extends ThermalSystemsControlLib.BaseClasses.Icons.BaseClass_Icon_Package;
  partial model FluidTwoPort
    //## parameters ##
    replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
      annotation (__Dymola_choicesAllMatching=true);

      //## components##
    Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,90},{110,110}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end FluidTwoPort;

  partial model FluidThreePort
    //## parameters ##
    replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
      annotation (__Dymola_choicesAllMatching=true);

      //## components##
    Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{90,90},{110,110}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium)
                                                                                    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end FluidThreePort;

  partial model FluidFourPort_CounterFlow
    //## parameters ##
    replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
    replaceable package Medium2 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);

  //## components ##
    Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{50,90},{70,110}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{90,90},{110,110}})));
     annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end FluidFourPort_CounterFlow;

  partial model FluidFourPort_ParallelFlow
    //## parameters ##
    replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
    replaceable package Medium2 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);

  //## components ##
    Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{50,90},{70,110}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{90,90},{110,110}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium = Medium2) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
     annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end FluidFourPort_ParallelFlow;

  partial model FluidSixPort
      //## parameters ##
      replaceable package Medium1 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
      replaceable package Medium2 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
      replaceable package Medium3 = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);

      //## components ##
    Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{10,90},{30,110}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium = Medium1) annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium = Medium2)
                                                                                    annotation (Placement(transformation(extent={{50,-110},{70,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium = Medium2)
                                                                                    annotation (Placement(transformation(extent={{50,90},{70,110}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a3(redeclare package Medium = Medium3)
                                                                                    annotation (Placement(transformation(extent={{92,90},{112,110}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b3(redeclare package Medium = Medium3)
                                                                                    annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      annotation (__Dymola_choicesAllMatching=true,
                Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end FluidSixPort;

  model IdealSource "Ideal pressure or mass flow source with two ports"
    //## EXTENSIONS ##
    extends Modelica.Fluid.Interfaces.PartialTwoPortTransport;

    //## PARAMETERS ##
    parameter Boolean control_m_flow
      "if true, then the mass flow rate is equal to the value of m_flow_in"
      annotation(Evaluate = true);
    parameter Boolean control_dp = not control_m_flow
      "if true, then the head is equal to the value of dp_in"
      annotation(Evaluate = true);

    //## VARIABLES ##

    //## PUBLIC COMPONENTS ##

    //## PROTECTED COMPONENTS ##

    Modelica.Blocks.Interfaces.RealInput m_flow_in(unit="kg/s") if control_m_flow
      "Prescribed mass flow rate"
      annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=-90,
          origin={-50,120}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=-90,
          origin={-60,120})));
    Modelica.Blocks.Interfaces.RealInput dp_in(unit="Pa") if control_dp
      "Prescribed pressure difference port_a.p-port_b.p"
      annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=-90,
          origin={50,120}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=-90,
          origin={60,120})));

  protected
    Modelica.Blocks.Interfaces.RealInput m_flow_internal(unit="kg/s")
      "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput dp_internal(unit="Pa")
      "Needed to connect to conditional connector";

  equation
    // Ideal control
    if control_m_flow then
      m_flow = m_flow_internal;
    else
      m_flow_internal = 0;
    end if;
    if control_dp then
      dp = dp_internal;
    else
      dp_internal = 0;
    end if;

    connect(dp_internal, dp_in);
    connect(m_flow_internal, m_flow_in);

    // Energy balance (no storage)
    port_a.h_outflow = if allowFlowReversal then inStream(port_b.h_outflow) else Medium.h_default;
    port_b.h_outflow = inStream(port_a.h_outflow);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={230,230,230},
            fillPattern=FillPattern.Solid),
          Line(
            points={{59,-69},{-56,-69}},
            color={0,128,255},
            visible=showDesignFlowDirection),
          Polygon(
            points={{24,-54},{64,-69},{24,-84},{24,-54}},
            lineColor={0,128,255},
            fillColor={0,128,255},
            fillPattern=FillPattern.Solid,
            visible=showDesignFlowDirection),
          Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={28,108,200},
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None),
          Rectangle(
            extent={{-100,-20},{100,-24}},
            lineColor={191,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Backward,
            pattern=LinePattern.None),
          Rectangle(
            extent={{-100,24},{100,20}},
            lineColor={191,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Backward,
            pattern=LinePattern.None),
          Polygon(
            points={{24,-59},{54,-69},{24,-79},{24,-59}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            visible=allowFlowReversal),
          Text(
            extent={{-58,14},{54,-12}},
            lineColor={255,255,255},
            textString="dp, m_flow > 0")}),                        Diagram(coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<p> Model follows <span style=\"font-family: Courier New;\">IBPSA</span> library (IBPSA_v300.Fluid.Movers.BaseClasses.IdealSource)</p>
</html>"));
  end IdealSource;

  model ConditionCheck_OneTemperature "Checks one temperature"

    //## PARAMETERS ##
    parameter Modelica.SIunits.Temperature T_inMin "Minimal instream temperature";
    parameter Modelica.SIunits.Temperature T_inMax "Maximal instream temperature";

    //## COMPONENTS ##

    Modelica.Blocks.Interfaces.RealInput fSetPoint "operating point reference" annotation (Placement(transformation(extent={{-120,40},{-100,60}}, rotation=0), iconTransformation(extent={{-120,40},{-100,60}})));
    Modelica.Blocks.Interfaces.RealOutput fSetPointInternal "resulting operating point" annotation (Placement(transformation(extent={{100,-60},{120,-40}}), iconTransformation(extent={{100,-60},{120,-40}})));
    Modelica.Blocks.Interfaces.RealInput T_in(final unit="K") "instream temperature" annotation (Placement(transformation(extent={{-120,-60},{-100,-40}},
                                                                                                                                     rotation=0),
          iconTransformation(extent={{-120,-60},{-100,-40}})));
  equation
  if T_in < T_inMin or T_in > T_inMax then
      fSetPointInternal = 0;
  else
      fSetPointInternal = fSetPoint;
  end if;
    annotation (Icon(graphics={ Rectangle(extent={{-100,100},{100,-100}},      lineColor=
                {0,0,255},                                                                              pattern=
                LinePattern.None,                                                                                                   fillColor=
                {153,153,153},
              fillPattern=FillPattern.Solid),                                                                                                                                                   Rectangle(extent={{
                96,-96},{-96,96}},                                                                                                                                                                                                        lineColor=
                {0,0,255},                                                                                                                                                                                                        pattern=
                LinePattern.None,                                                                                                                                                                                                        fillColor=
                {230,230,230},
              fillPattern=FillPattern.Solid),                                                                                                                                                                                                        Text(extent={{-100,-100},{100,-140}},
                                                                                                                                                                                                        lineColor={28,108,200},
                                                                                                                                                                                                        fillColor={122,255,107},
              fillPattern=FillPattern.Solid,
            textString="%name")}));
  end ConditionCheck_OneTemperature;

  model ConditionCheck_TwoTemperatures "Checks two temperatures"

    //## PARAMETERS ##
    parameter Modelica.SIunits.Temperature T2_min "Minimal T2";
    parameter Modelica.SIunits.Temperature T2_max "Maximal T2";
    parameter Modelica.SIunits.Temperature T1_min "Minimal T1";
    parameter Modelica.SIunits.Temperature T1_max "Maximal T1";

    //## COMPONENTS ##

    Modelica.Blocks.Interfaces.RealInput fSetPoint "operating point reference" annotation (Placement(transformation(extent={{-120,-10},{-100,10}}, rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));
    Modelica.Blocks.Interfaces.RealOutput fSetPointInternal "resulting operating point" annotation (Placement(transformation(extent={{100,-60},{120,-40}}), iconTransformation(extent={{100,-60},{120,-40}})));
    Modelica.Blocks.Interfaces.RealInput T2(final unit="K") "instream temperature" annotation (Placement(transformation(extent={{-120,-60},{-100,-40}}, rotation=0), iconTransformation(extent={{-120,-60},{-100,-40}})));
    Modelica.Blocks.Interfaces.RealInput T1(final unit="K") annotation (Placement(transformation(extent={{-120,40},{-100,60}}, rotation=0), iconTransformation(extent={{-120,40},{-100,60}})));
  equation
    if T2 < T2_min or T2 > T2_max or T1 < T1_min or T1 > T1_max then
      fSetPointInternal = 0;
  else
      fSetPointInternal = fSetPoint;
  end if;
    annotation (Icon(graphics={ Rectangle(extent={{-100,100},{100,-100}},      lineColor=
                {0,0,255},                                                                              pattern=
                LinePattern.None,                                                                                                   fillColor=
                {153,153,153},
              fillPattern=FillPattern.Solid),                                                                                                                                                   Rectangle(extent={{
                96,-96},{-96,96}},                                                                                                                                                                                                        lineColor=
                {0,0,255},                                                                                                                                                                                                        pattern=
                LinePattern.None,                                                                                                                                                                                                        fillColor=
                {230,230,230},
              fillPattern=FillPattern.Solid),                                                                                                                                                                                                        Text(extent={{-100,-100},{100,-140}},
                                                                                                                                                                                                        lineColor={28,108,200},
                                                                                                                                                                                                        fillColor={122,255,107},
              fillPattern=FillPattern.Solid,
            textString="%name")}));
  end ConditionCheck_TwoTemperatures;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This package contains all fluid base models for building component or system models using the TSCL.</p>
<p>More information can be found in  <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end FluidBaseClasses;
