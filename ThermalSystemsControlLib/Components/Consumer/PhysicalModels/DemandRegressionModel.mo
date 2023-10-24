within ThermalSystemsControlLib.Components.Consumer.PhysicalModels;
model DemandRegressionModel
  Modelica.Blocks.Interfaces.RealInput T_amb annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Tables.CombiTable1D relativeHourlyLoad(table=HourlyCurve)
                                                         annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Sources.SawTooth hours(
    amplitude=24,
    period=24*3600,
    startTime=hourOffset)
                         annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  parameter Modelica.SIunits.Time hourOffset=0 "time offset for simulation. 5 equals starttime of 05:00";
  parameter Real dayOffset=0 "daily offset for simulation. 0 equals monday as weekday";
  parameter Real workdayScalingFactor=1
                                      "scaling factor for demand during workdays. Between 0 and 1";
  parameter Real weekendScalingFactor=0.2
                                      "scaling factor for demand during weekend. Between 0 and 1";
  parameter Real TemperatureCurve[:,:]=[263.15,12000000; 288.15,800000; 293.15,800000] "heating demand as a linear function of ambient temperature";
  parameter Real HourlyCurve[:,:]=[0,0.4; 1,0.5; 2,0.5; 3,0.5; 4,0.5; 5,0.6; 6,0.7; 7,1; 8,1; 9,1; 10,0.7; 11,0.6; 12,0.6; 13,0.6; 14,0.6; 15,0.6; 16,0.5; 17,0.5; 18,0.4; 19,0.3; 20,0.3; 21,0.3; 22,0.3; 23,0.3; 24,0.3]
                                              "heating demand as a function of time";
  Modelica.Blocks.Sources.BooleanPulse weekday(
    width=(5/7)*100,
    period=7*24*3600,
    startTime=dayOffset*24*3600 + hourOffset)
                         annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{-8,-60},{12,-40}})));
  Modelica.Blocks.Sources.Constant const(k=workdayScalingFactor)
                                         annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Blocks.Sources.Constant const1(k=weekendScalingFactor)
                                          annotation (Placement(transformation(extent={{-60,-90},{-40,-70}})));
  Modelica.Blocks.Interfaces.RealOutput Q_demand annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Tables.CombiTable1D DailyLoad(table=TemperatureCurve)
                                                annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{20,-36},{40,-16}})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(hours.y, relativeHourlyLoad.u[1]) annotation (Line(points={{-39,50},{-12,50}},
                                                                                       color={0,0,127}));
  connect(weekday.y, switch1.u2) annotation (Line(points={{-39,-50},{-10,-50}}, color={255,0,255}));
  connect(const.y, switch1.u1) annotation (Line(points={{-39,-20},{-20,-20},{-20,-42},{-10,-42}}, color={0,0,127}));
  connect(const1.y, switch1.u3) annotation (Line(points={{-39,-80},{-20,-80},{-20,-58},{-10,-58}}, color={0,0,127}));
  connect(product1.u2, switch1.y) annotation (Line(points={{18,-32},{18,-50},{13,-50}}, color={0,0,127}));
  connect(product1.u1, DailyLoad.y[1]) annotation (Line(points={{18,-20},{18,0},{11,0}}, color={0,0,127}));
  connect(product2.y, Q_demand) annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(product1.y, product2.u2) annotation (Line(points={{41,-26},{50,-26},{50,-6},{58,-6}}, color={0,0,127}));
  connect(relativeHourlyLoad.y[1], product2.u1) annotation (Line(points={{11,50},{50,50},{50,6},{58,6}}, color={0,0,127}));
  connect(T_amb, DailyLoad.u[1]) annotation (Line(points={{-120,0},{-66,0},{-66,0},{-12,0}}, color={0,0,127}));
end DemandRegressionModel;
