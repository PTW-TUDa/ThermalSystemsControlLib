within ThermalSystemsControlLib.Components.LayeredHeatingStorage;
model LayeredHeatingStorage
  extends ThermalSystemsControlLib.BaseClasses.Icons.LayeredStorage_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  parameter SI.Volume V = 1 "Storage volume";
  parameter Integer n_Seg=7   "Number of volume segments";
  parameter Real delta_T = (T_start_upper-T_start_lower)/n_Seg;
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_lower "Start value of temperature";
  parameter Modelica.Media.Interfaces.Types.Temperature T_start_upper "Start value of temperature";

  HeatMeter.HeatMeter WMZx01(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{80,-38},{60,-58}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Medium) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={62,80})));
  PhysicalModels.LayeredStorage_Physical layeredStorage_Physical(
    redeclare package Medium = Medium,
    n_Seg=n_Seg,
    T_start_upper=353.15,
    T_start_lower=313.15) annotation (Placement(transformation(extent={{38,-16},{58,4}})));
  Interfaces.LayeredStorageState localStorageState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Interfaces.layeredStorageState_FMUConnector layeredStorageState_FMUConnector annotation (Placement(transformation(extent={{-24,2},{-44,22}})));

  Modelica.Blocks.Logical.Switch switch1[n_Seg] annotation (Placement(transformation(extent={{-74,40},{-94,60}})));
  Modelica.Blocks.Sources.Constant const_close(k=0) annotation (Placement(transformation(extent={{-40,26},{-56,42}})));
  Modelica.Blocks.Sources.Constant const_open(k=1) annotation (Placement(transformation(extent={{-40,50},{-56,66}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual[n_Seg] annotation (Placement(transformation(extent={{-8,68},{-28,88}})));
  Modelica.Blocks.Sources.Constant T_lim[n_Seg] annotation (Placement(transformation(extent={{24,50},{4,70}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold[n_Seg-1] annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));
  Modelica.Blocks.Logical.And and1[n_Seg-1] annotation (Placement(transformation(extent={{-82,-48},{-62,-28}})));
equation
  for j in 1:n_Seg-1 loop
    T_lim[j].k = T_start_lower + j*delta_T;
    connect(switch1[j].y,layeredStorage_Physical.layerValve[j]);
    connect(const_close.y,switch1[j].u1);
    connect(const_open.y,switch1[j].u3);
    connect(and1[j].u1,greaterEqual[j].y);
    connect(and1[j].u2,lessThreshold[j].y);
    connect(switch1[j].u2, and1[j].y);
    connect(greaterEqual[j].u1, temperature.T);
    connect(lessThreshold[j].u, temperature.T);
    connect(greaterEqual[j].u2, T_lim[j].y);
    lessThreshold[j].threshold = T_lim[j].y;
  end for;
  // connections for the upper layer
    T_lim[n_Seg].y = T_start_upper - delta_T;
    connect(greaterEqual[n_Seg].u2, T_lim[n_Seg].y);
    connect(switch1[n_Seg].y,layeredStorage_Physical.layerValve[n_Seg]);
    connect(const_close.y,switch1[n_Seg].u1);
    connect(const_open.y,switch1[n_Seg].u3);
    connect(switch1[n_Seg].u2,greaterEqual[n_Seg].y);
    connect(greaterEqual[n_Seg].u1, temperature.T);
  // other connections
  connect(temperature.T, WMZx01.fFeedTemperature) annotation (Line(points={{51,80},{30,80},{30,-48},{58,-48}},   color={0,0,127}));
  connect(WMZx01.port_b, port_a) annotation (Line(points={{60,-58},{60,-100},{100,-100}}, color={0,127,255}));
  connect(temperature.port_a, port_b) annotation (Line(points={{62,90},{62,100},{100,100}}, color={0,127,255}));
  connect(temperature.port_b, layeredStorage_Physical.port_b) annotation (Line(points={{62,70},{62,38},{58,38},{58,4}}, color={0,127,255}));
  connect(WMZx01.port_a, layeredStorage_Physical.port_a) annotation (Line(points={{60,-38},{60,-16},{58,-16}}, color={0,127,255}));
  connect(layeredStorageState_FMUConnector.localState1, layeredStorage_Physical.localState) annotation (Line(points={{-23,12},{48.2,12},{48.2,5}}, color={0,0,0}));
  connect(localStorageState, layeredStorage_Physical.localState) annotation (Line(points={{0,110},{0,12},{48.2,12},{48.2,5}}, color={0,0,0}));
  //connect(const_open.y, switch1.u1) annotation (Line(points={{-56.8,58},{-72,58}}, color={0,0,127}));
  //connect(const_close.y, switch1.u3) annotation (Line(points={{-56.8,34},{-72,34},{-72,42}}, color={0,0,127}));
  //connect(switch1.y, layeredStorage_Physical.layerValve[7]) annotation (Line(points={{-95,50},{-98,50},{-98,-20},{70,-20},{70,-5.14286},{60,-5.14286}}, color={0,0,127}));
  //connect(greaterEqual.y, switch1.u2) annotation (Line(points={{-29,78},{-62,78},{-62,50},{-72,50}}, color={255,0,255}));
  //connect(greaterEqual.u1, temperature.T) annotation (Line(points={{-6,78},{30,78},{30,80},{51,80}}, color={0,0,127}));
  //connect(greaterEqual.u2, t_lim.y) annotation (Line(points={{-6,70},{-6,60},{3,60}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Simple buffer storage model using one-diemensional finite volume discretization.</p>
</html>"));
end LayeredHeatingStorage;
