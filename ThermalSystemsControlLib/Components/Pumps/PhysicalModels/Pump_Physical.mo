within ThermalSystemsControlLib.Components.Pumps.PhysicalModels;
model Pump_Physical "Pressure building pump"
    extends ThermalSystemsControlLib.BaseClasses.Icons.Pump_Icon;
    extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  import NonSI = Modelica.SIunits.Conversions.NonSIunits;
  outer Modelica.Fluid.System system;

  //## PARAMETERS ##
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
  parameter Integer pumpType = 1   "Pump type"
  annotation (Evaluate = true,choices(choice=1 "Grundfos_Magna3_25_40", choice=2 "Grundfos_Magna3_25_80", choice=3 "Grundfos_Magna3_25_120", choice=4 "Grundfos_Magna3_32_60F", choice=5 "Grundfos_Magna3_32_120FN", choice=6 "Grundfos_Magna3_40_40F", choice=7 "Grundfos_Magna3_40_60F", choice=8 "Grundfos_Magna3_40_80F", choice=9 "Grundfos_Magna3_40_120F", choice=10 "Grundfos_Magna3_40_150FN", choice=11 "Grundfos_Magna3_50_80F", choice=12 "Grundfos_Unilift_CC9_A1", choice=13 "Heidelberger_CHP_Pump",choice=14 "Heidelberger_Boiler_Pump"));

  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort Temperature_In(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{-70,-90},{-50,-70}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort Temperature_Out(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{50,-90},{70,-70}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
                                 annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=riseTime/5, initType=Modelica.Blocks.Types.Init.InitialState)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  Modelica.Blocks.Tables.CombiTable2D InterpolationTable_Pressure(
    tableOnFile=true,
    tableName="f_dp",
    fileName=fileName,
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) "First column - normalized speed, First row: Volume flow rate" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-32,-30})));
  Modelica.Blocks.Tables.CombiTable2D InterpolationTable_Power(
    tableOnFile=true,
    tableName="f_power",
    fileName=fileName,
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) "First column - normalized speed, First row: Volume flow rate" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-30})));
  BaseClasses.FluidBaseClasses.IdealSource idealSource_simple(redeclare package Medium = Medium, control_m_flow=false) annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealInput fSetPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  BaseClasses.Utilities.ZeroLimiter zeroLimiter(u_min=u_min, u_0=0)
                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,70})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=u_min)            annotation (Placement(transformation(extent={{60,70},{80,90}})));
  Modelica.Blocks.Interfaces.BooleanOutput bStatusOn "Connector of Boolean output signal" annotation (Placement(transformation(extent={{100,70},{120,90}})));
protected
  parameter String pumpTypes[:,:] = ["Grundfos_Magna3_25_40";"Grundfos_Magna3_25_80";"Grundfos_Magna3_25_120";"Grundfos_Magna3_32_60F";"Grundfos_Magna3_32_120FN";"Grundfos_Magna3_40_40F";"Grundfos_Magna3_40_60F";"Grundfos_Magna3_40_80F";"Grundfos_Magna3_40_120F";"Grundfos_Magna3_40_150FN";"Grundfos_Magna3_50_80F";"Grundfos_Unilift_CC9_A1";"Heidelberger_CHP_Pump";"Heidelberger_Boiler_Pump"] "Choosable pump types - [:]";
  parameter String str = Modelica.Utilities.System.getEnvironmentVariable("env_tscl")+"/Resources/Data_Pumps/"+pumpTypes[pumpType,1]+".mat";
  parameter String fileName = ModelicaServices.ExternalReferences.loadResource(str) "File with pump data"
    annotation (loadSelector(filter="Pump data files (*.mat)",
          caption="Open file in which table is present"));
  parameter NonSI.AngularVelocity_rpm speed_nom =  scalar(Modelica.Utilities.Streams.readRealMatrix(fileName,"speed_nom",1,1));
  parameter SI.Time riseTime =  scalar(Modelica.Utilities.Streams.readRealMatrix(fileName,"riseTime",1,1));
  parameter Real u_max = scalar(Modelica.Utilities.Streams.readRealMatrix(fileName,"u_max",1,1)) "Maximum relative speed";
  parameter Real u_min = scalar(Modelica.Utilities.Streams.readRealMatrix(fileName,"u_min",1,1)) "Minimum relative speed";
equation
  connect(port_a, Temperature_In.port_a) annotation (Line(points={{100,-100},{-90,-100},{-90,-80},{-70,-80}},
                                                                                                         color={0,127,255}));
  connect(volumeFlowRate.port_b, Temperature_Out.port_a) annotation (Line(points={{40,-80},{50,-80}}, color={0,127,255}));
  connect(Temperature_Out.port_b, port_b) annotation (Line(points={{70,-80},{90,-80},{90,100},{100,100}},
                                                                                                      color={0,127,255}));
  connect(InterpolationTable_Pressure.y, gain.u) annotation (Line(points={{-43,-30},{-43,-60},{-42,-60}}, color={0,0,127}));
  connect(InterpolationTable_Power.u1, InterpolationTable_Pressure.u1) annotation (Line(points={{18,-24},{-20,-24}},
                                                                                                                   color={0,0,127}));
  connect(volumeFlowRate.V_flow, InterpolationTable_Pressure.u2) annotation (Line(points={{30,-69},{30,-50},{0,-50},{0,-36},{-20,-36}}, color={0,0,127}));
  connect(InterpolationTable_Power.u2, InterpolationTable_Pressure.u2) annotation (Line(points={{18,-36},{-20,-36}}, color={0,0,127}));
  connect(firstOrder.y, InterpolationTable_Pressure.u1) annotation (Line(points={{-2.22045e-15,19},{-2.22045e-15,-24},{-20,-24}},
                                                                                                          color={0,0,127}));
  connect(Temperature_In.port_b, idealSource_simple.port_a) annotation (Line(points={{-50,-80},{-10,-80}}, color={0,127,255}));
  connect(idealSource_simple.port_b, volumeFlowRate.port_a) annotation (Line(points={{10,-80},{20,-80}}, color={0,127,255}));
  connect(gain.y, idealSource_simple.dp_in) annotation (Line(points={{-19,-60},{6,-60},{6,-68}}, color={0,0,127}));
  connect(firstOrder.y, fOperatingPoint) annotation (Line(points={{-2.22045e-15,19},{40,19},{40,40},{110,40}},
                                                                                                      color={0,0,127}));
  connect(firstOrder.u, zeroLimiter.y) annotation (Line(points={{2.22045e-15,42},{0,42},{0,59}}, color={0,0,127}));
  connect(fSetPoint, zeroLimiter.u) annotation (Line(points={{0,120},{0,82}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, bStatusOn) annotation (Line(points={{81,80},{110,80}}, color={255,0,255}));
  connect(greaterEqualThreshold.u, fOperatingPoint) annotation (Line(points={{58,80},{40,80},{40,40},{110,40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Centrifugal, pressure building pump using linear interpolation on pressure and power curves. This model uses two-dimensional tables to interpolate (linearly) the pressure difference and electrical power consumption depending on the operating point [0,1] and the volume flow rate. A limiter ensures that the operating point is always in the allowed range. The dynamic behavior is modeled using a PT1 element. Steady-state model without storing mass or energy. </p>
</html>"));
end Pump_Physical;
