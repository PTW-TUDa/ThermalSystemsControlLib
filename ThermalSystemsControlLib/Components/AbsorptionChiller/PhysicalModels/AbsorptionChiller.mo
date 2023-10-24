within ThermalSystemsControlLib.Components.AbsorptionChiller.PhysicalModels;
model AbsorptionChiller
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidSixPort;
  extends ThermalSystemsControlLib.BaseClasses.Icons.CompressionChiller_Icon;
  import SI = Modelica.SIunits;
  //## EXTENSIONS ##
  outer Modelica.Fluid.System system "System wide properties";

  //## PARAMETERS ##
    // Generator
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nom_GEN = 100195 "Generator - nominal heat flow in J/s";
  parameter Modelica.SIunits.Temp_K T_start_GEN=353.15      "Generator - Start temperature °C";
  parameter Modelica.SIunits.HeatCapacity CA_GEN=67392 "Generator - Heat capacity (= cp*m) J/K";
  parameter Modelica.SIunits.Volume V_GEN=0.2 "Generator - Water Volume m^3";

  //Absorber and Condenser - Hydraulics
  //Condenser
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nom_CD = 86070 "Condenser - nominal heat flow in J/s";
  parameter Modelica.SIunits.Temp_K T_start_CD=303.15     "Condenser - Start temperature °C";
  parameter Modelica.SIunits.HeatCapacity CA_CD=67392 "Condenser - Heat Capacity (= cp*m) in J/K";
  parameter Modelica.SIunits.Volume V_CD=0.2 "Condenser - Water Volume in m^3";
  //Absorber
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nom_ABS = 95447 "Absorber - nominal heat flow at Absorber in J/s";
  parameter Modelica.SIunits.Temp_K T_start_ABS=303.15     "Absorber - Starttemperatur Absorber";
  parameter Modelica.SIunits.HeatCapacity CA_ABS=67392 "Absorber - Heat Capacity of Absorber (= cp*m) in J/K";
  parameter Modelica.SIunits.Volume V_ABS=0.2 "Absorber - Water Volume of the Generator in m^3";

  //Evaporator

  parameter Modelica.SIunits.HeatFlowRate Q_flow_nom_EV = 81321 "Evaporator - nominal heat flow in J/s";
  parameter Modelica.SIunits.Temp_K T_start_EV=283.15      "Evaporator - Start temperature °C";
  parameter Modelica.SIunits.HeatCapacity CA_EV=67392 "Evaporator - Heat capacity (= cp*m) J/K";
  parameter Modelica.SIunits.Volume V_EV=0.2 "Evaporator - Water Volume m^3";

   Modelica.SIunits.Temperature T_G_mean;
   Modelica.SIunits.Temperature T_ABS_mean;
   Modelica.SIunits.Temperature T_CD_mean;
   Modelica.SIunits.Temperature T_EV_mean;

   Real ddT;
   Real R;
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor hot_m_GEN(C=CA_GEN, T(start=T_start_GEN, fixed=true))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-2})));
  Modelica.Fluid.Pipes.StaticPipe hot_pipe_AKM_GEN(
    allowFlowReversal=true,
    length=10,
    height_ab=0,
    diameter=0.05,
    redeclare package Medium = Medium1)                            annotation (
      Placement(transformation(
        origin={-60,41},
        extent={{9,-10},{-11,10}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow hot_Qpkt_GEN(T_ref=353.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-30})));
  Modelica.Fluid.Vessels.ClosedVolume hot_V_GEN(
    redeclare package Medium = Medium1,
    use_portsData=false,
    use_HeatTransfer=true,
    V=V_GEN,
    nPorts=3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,0})));
  Modelica.Fluid.Sensors.Temperature hot_T_out1_GEN(redeclare package Medium = Medium1)
                                            annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,10})));
  Modelica.Blocks.Math.Gain hot_gain_Qpkt_GEN(k=-Q_flow_nom_GEN/100195)
                                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-60})));
  Modelica.Blocks.Tables.CombiTable1Ds Qpkt_AKM_GEN(table=[0,100; 11,5000; 11.6,24354; 11.8,29491; 12.1,33515; 12.5,36970; 12.9,40077; 13.2,42948; 13.6,45647; 14,48215; 14.5,50679; 14.9,53059; 15.3,55369; 15.7,57620; 16.1,59820; 16.5,61977; 16.9,64094; 17.3,66178; 17.7,68231; 18.1,70256; 18.5,72255; 19,74232; 19.4,76188; 19.8,78123; 20.2,80041; 20.6,81942; 21,83827; 21.4,85696; 21.8,87552; 22.2,89394; 22.6,91223; 23,93040; 23.4,94845; 23.8,96639; 24.2,98422; 24.6,100195])
    annotation (Placement(transformation(extent={{-70,-100},{-90,-80}})));
  Modelica.Fluid.Pipes.StaticPipe cool_pipe_AKM_ABSCD(
    allowFlowReversal=true,
    length=10,
    height_ab=0,
    diameter=0.05,
    redeclare package Medium = Medium2)                            annotation (
      Placement(transformation(
        origin={32,-1},
        extent={{-9,-10},{11,10}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow cool_Qpkt_ABS
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={4,-40})));
  Modelica.Fluid.Vessels.ClosedVolume cool_V_ABS(
    redeclare package Medium = Medium2,
    use_portsData=false,
    use_HeatTransfer=true,
    V=V_ABS,
    nPorts=3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={22,-20})));
  Modelica.Blocks.Math.Gain cool_gain_Qpkt_ABS(k=Q_flow_nom_ABS/95447)
                                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-28,-40})));
  Modelica.Blocks.Tables.CombiTable1Ds Qpkt_AKM_ABS(table=[0,0; 11,4200; 11.6,23518; 11.8,28438; 12.1,32287; 12.5,35589; 12.9,38557; 13.2,41296; 13.6,43869; 14,46316; 14.5,48662; 14.9,50926; 15.3,53123; 15.7,55262; 16.1,57351; 16.5,59398; 16.9,61406; 17.3,63381; 17.7,65325; 18.1,67242; 18.5,69134; 19,71003; 19.4,72851; 19.8,74679; 20.2,76489; 20.6,78282; 21,80059; 21.4,81820; 21.8,83568; 22.2,85301; 22.6,87022; 23,88730; 23.4,90426; 23.8,92111; 24.2,93784; 24.6,95447])
    annotation (Placement(transformation(extent={{-8,-80},{-28,-60}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor cool_m_ABS(C=CA_CD, T(start=T_start_CD, fixed=true))
    annotation (Placement(transformation(extent={{12,-40},{32,-60}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow cool_Qpkt_CD
    annotation (Placement(transformation(extent={{-8,30},{12,50}})));
  Modelica.Blocks.Math.Gain cool_gain_Qpkt_CD(k=Q_flow_nom_CD/86070)
                                                   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-28,40})));
  Modelica.Fluid.Vessels.ClosedVolume cool_V_CD(
    redeclare package Medium = Medium2,
    use_portsData=false,
    use_HeatTransfer=true,
    V=V_CD,
    nPorts=3) annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={22,20})));
  Modelica.Blocks.Tables.CombiTable1Ds Qpkt_AKM_CD(table=[0,100; 11,2800; 11.6,19166; 11.8,23893; 12.1,27574; 12.5,30720; 12.9,33538; 13.2,36132; 13.6,38561; 14,40865; 14.5,43069; 14.9,45192; 15.3,47246; 15.7,49242; 16.1,51188; 16.5,53090; 16.9,54954; 17.3,56782; 17.7,58580; 18.1,60349; 18.5,62092; 19,63811; 19.4,65508; 19.8,67184; 20.2,68842; 20.6,70481; 21,72104; 21.4,73710; 21.8,75301; 22.2,76878; 22.6,78441; 23,79991; 23.4,81529; 23.8,83054; 24.2,84567; 24.6,86070])
    annotation (Placement(transformation(extent={{-8,60},{-28,80}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor cool_m_CD(C=CA_CD, T(start=T_start_CD, fixed=true))
    annotation (Placement(transformation(extent={{12,40},{32,60}})));
  Modelica.Fluid.Sensors.Temperature cool_T_out1_ABS_in1_CD(redeclare package Medium = Medium2)
                                                   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-8,-10})));
  Modelica.Fluid.Sensors.Temperature cool_T_out1_CD(redeclare package Medium = Medium2)
                                            annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-8,10})));
  Modelica.Fluid.Pipes.StaticPipe cold_pipe_AKM_EV(
    allowFlowReversal=true,
    length=10,
    height_ab=0,
    diameter=0.05,
    redeclare package Medium = Medium3)                            annotation (
      Placement(transformation(
        origin={90,41},
        extent={{9,-10},{-11,10}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow cold_Qpkt_EV
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-30})));
  Modelica.Fluid.Vessels.ClosedVolume cold_V_EV(
    redeclare package Medium = Medium3,
    use_portsData=false,
    use_HeatTransfer=true,
    V=V_EV,
    nPorts=3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,0})));
  Modelica.Fluid.Sensors.Temperature cold_T_out1_EV(redeclare package Medium = Medium3)
                                            annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={100,10})));
  Modelica.Blocks.Math.Gain cold_gain_Qpkt_EV(k=-Q_flow_nom_EV/81321)
                                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-60})));
  Modelica.Blocks.Tables.CombiTable1Ds Qpkt_AKM_EV1(table=[0,0; 11,2000; 11.6,18330; 11.8,22839; 12.1,26346; 12.5,29340; 12.9,32017; 13.2,34480; 13.6,36784; 14,38966; 14.5,41052; 14.9,43059; 15.3,45000; 15.7,46884; 16.1,48719; 16.5,50511; 16.9,52265; 17.3,53985; 17.7,55674; 18.1,57335; 18.5,58970; 19,60582; 19.4,62171; 19.8,63740; 20.2,65290; 20.6,66821; 21,68336; 21.4,69834; 21.8,71317; 22.2,72786; 22.6,74240; 23,75681; 23.4,77109; 23.8,78525; 24.2,79929; 24.6,81321])
    annotation (Placement(transformation(extent={{80,-80},{60,-100}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor cold_m_EV(C=CA_EV, T(start=T_start_EV, fixed=true))
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort hot_T_in1_GEN(redeclare package Medium = Medium1)
                                                   annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-60,70})));
  Modelica.Fluid.Sensors.TemperatureTwoPort cool_T_in1_ABS(redeclare package Medium = Medium2)
                                                   annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={32,-80})));
  Modelica.Fluid.Sensors.TemperatureTwoPort cold_T_in1_EV(redeclare package Medium = Medium3)
                                                   annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={90,70})));
public
  Modelica.Blocks.Sources.RealExpression deltaTtotal(y=ddT)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={160,0})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=6,                                           initType=Modelica.Blocks.Types.Init.InitialState, y_start=20)
                  annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={130,0})));
  Modelica.Fluid.Pipes.StaticPipe cool_pipe_AKM_ABSCD1(
    allowFlowReversal=true,
    length=10,
    height_ab=0,
    diameter=0.05,
    redeclare package Medium = Medium2)                            annotation (
      Placement(transformation(
        origin={32,-41},
        extent={{-9,-10},{11,10}},
        rotation=90)));
equation
   R=1.15;

   T_G_mean     = (hot_T_in1_GEN.T+hot_T_out1_GEN.T)/2;
   T_ABS_mean   = (cool_T_in1_ABS.T+cool_T_out1_ABS_in1_CD.T)/2;
   T_CD_mean    = (cool_T_out1_ABS_in1_CD.T+cool_T_out1_CD.T)/2;
   T_EV_mean    = (cold_T_in1_EV.T+cold_T_out1_EV.T)/2;

   ddT = (T_G_mean-T_ABS_mean)-(T_CD_mean-T_EV_mean)*R; // [K]
  connect(Qpkt_AKM_GEN.y[1],hot_gain_Qpkt_GEN. u)
    annotation (Line(points={{-91,-90},{-90,-90},{-90,-72}},
                                                  color={0,0,127}));
  connect(hot_pipe_AKM_GEN.port_b,hot_V_GEN. ports[1]) annotation (Line(points={{-60,30},{-60,-2.66667}},
                                                       color={0,127,255}));
  connect(hot_T_out1_GEN.port,hot_V_GEN. ports[2])
    annotation (Line(points={{-50,0},{-60,0},{-60,-4.44089e-16}},
                                                 color={0,127,255}));
  connect(hot_V_GEN.heatPort, hot_m_GEN.port) annotation (Line(points={{-70,-10},{-70,-12},{-90,-12}}, color={191,0,0}));
  connect(hot_Qpkt_GEN.port, hot_m_GEN.port) annotation (Line(points={{-90,-20},{-90,-12}}, color={191,0,0}));
  connect(hot_Qpkt_GEN.Q_flow, hot_gain_Qpkt_GEN.y) annotation (Line(points={{-90,-40},{-90,-49}}, color={0,0,127}));
  connect(cool_gain_Qpkt_ABS.y,cool_Qpkt_ABS. Q_flow)
    annotation (Line(points={{-17,-40},{-6,-40}},  color={0,0,127}));
  connect(Qpkt_AKM_ABS.y[1],cool_gain_Qpkt_ABS. u)
    annotation (Line(points={{-29,-70},{-40,-70},{-40,-40}},
                                                   color={0,0,127}));
  connect(cool_m_ABS.port,cool_Qpkt_ABS. port)
    annotation (Line(points={{22,-40},{14,-40}},       color={191,0,0}));
  connect(cool_m_ABS.port, cool_V_ABS.heatPort) annotation (Line(points={{22,-40},{22,-30}}, color={191,0,0}));
  connect(cool_V_CD.heatPort, cool_m_CD.port) annotation (Line(points={{22,30},{22,40}}, color={191,0,0}));
  connect(cool_Qpkt_CD.port, cool_m_CD.port) annotation (Line(points={{12,40},{22,40}}, color={191,0,0}));
  connect(cool_gain_Qpkt_CD.y, cool_Qpkt_CD.Q_flow) annotation (Line(points={{-17,40},{-8,40}}, color={0,0,127}));
  connect(Qpkt_AKM_CD.y[1], cool_gain_Qpkt_CD.u) annotation (Line(points={{-29,70},{-40,70},{-40,40}}, color={0,0,127}));
  connect(cool_T_out1_ABS_in1_CD.port, cool_V_ABS.ports[1]) annotation (Line(points={{-8,-20},{32,-20},{32,-22.6667}}, color={0,127,255}));
  connect(cool_T_out1_CD.port, cool_V_CD.ports[1]) annotation (Line(points={{-8,20},{12,20},{12,22.6667},{32,22.6667}},
                                                                                              color={0,127,255}));
  connect(cool_V_CD.ports[2],port_b2)  annotation (Line(points={{32,20},{32,90},{60,90},{60,100}},      color={0,127,255}));
  connect(cold_V_EV.ports[1], cold_pipe_AKM_EV.port_b) annotation (Line(points={{90,-2.66667},{90,30}}, color={0,127,255}));
  connect(cold_V_EV.ports[2],port_b3)  annotation (Line(points={{90,-4.44089e-16},{90,-50},{90,-100},{100,-100}},
                                                                                              color={0,127,255}));
  connect(cold_m_EV.port, cold_V_EV.heatPort) annotation (Line(points={{60,-10},{80,-10}}, color={191,0,0}));
  connect(cold_Qpkt_EV.port, cold_m_EV.port) annotation (Line(points={{60,-20},{60,-10}}, color={191,0,0}));
  connect(cold_gain_Qpkt_EV.y, cold_Qpkt_EV.Q_flow) annotation (Line(points={{60,-49},{60,-40}}, color={0,0,127}));
  connect(Qpkt_AKM_EV1.y[1], cold_gain_Qpkt_EV.u) annotation (Line(points={{59,-90},{60,-90},{60,-72}}, color={0,0,127}));
  connect(cold_T_out1_EV.port, cold_V_EV.ports[3]) annotation (Line(points={{100,0},{96,0},{96,2.66667},{90,2.66667}}, color={0,127,255}));
  connect(hot_T_in1_GEN.port_b, hot_pipe_AKM_GEN.port_a) annotation (Line(points={{-60,60},{-60,50}}, color={0,127,255}));
  connect(hot_T_in1_GEN.port_a, port_a1) annotation (Line(points={{-60,80},{-60,90},{20,90},{20,100}}, color={0,127,255}));
  connect(cool_T_in1_ABS.port_a,port_a2)  annotation (Line(points={{32,-90},{60,-90},{60,-100}}, color={0,127,255}));
  connect(port_a3, cold_T_in1_EV.port_a) annotation (Line(points={{102,100},{102,90},{90,90},{90,80}},
                                                                                     color={0,127,255}));
  connect(cold_T_in1_EV.port_b, cold_pipe_AKM_EV.port_a) annotation (Line(points={{90,60},{90,50}}, color={0,127,255}));
  connect(deltaTtotal.y,firstOrder. u) annotation (Line(points={{149,0},{142,0}},
                                                        color={0,0,127}));
  connect(firstOrder.y, Qpkt_AKM_CD.u) annotation (Line(points={{119,0},{110,0},{110,110},{-6,110},{-6,70}}, color={0,0,127}));
  connect(firstOrder.y, Qpkt_AKM_GEN.u) annotation (Line(points={{119,0},{110,0},{110,-110},{-68,-110},{-68,-90}}, color={0,0,127}));
  connect(firstOrder.y, Qpkt_AKM_ABS.u) annotation (Line(points={{119,0},{110,0},{110,-110},{-6,-110},{-6,-70}}, color={0,0,127}));
  connect(firstOrder.y, Qpkt_AKM_EV1.u) annotation (Line(points={{119,0},{110,0},{110,-110},{82,-110},{82,-90}}, color={0,0,127}));
  connect(cool_V_ABS.ports[2], cool_pipe_AKM_ABSCD.port_a) annotation (Line(points={{32,-20},{32,-10}}, color={0,127,255}));
  connect(cool_V_CD.ports[3], cool_pipe_AKM_ABSCD.port_b) annotation (Line(points={{32,17.3333},{32,10}}, color={0,127,255}));
  connect(hot_V_GEN.ports[3], port_b1) annotation (Line(points={{-60,2.66667},{-60,-90},{20,-90},{20,-100}}, color={0,127,255}));
  connect(cool_pipe_AKM_ABSCD1.port_b, cool_V_ABS.ports[3]) annotation (Line(points={{32,-30},{32,-17.3333}}, color={0,127,255}));
  connect(cool_pipe_AKM_ABSCD1.port_a, cool_T_in1_ABS.port_b) annotation (Line(points={{32,-50},{32,-70}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Absorption chiller model.</p>
</html>"));
end AbsorptionChiller;
