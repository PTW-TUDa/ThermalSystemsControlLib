within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model Ambient
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  Interfaces.ambientState_FMUConnector localState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-90,90})));
  Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Math.ContinuousMean mean(t_eps=6*3600) annotation (Placement(transformation(extent={{20,0},{0,20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,10})));
  Modelica.Blocks.Sources.Constant const(k=273.15) annotation (Placement(transformation(extent={{100,40},{80,60}})));
  Modelica.Blocks.Interfaces.RealInput T_ambient "Connector of Real input signal 1" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,0})));
equation

  ambientState.bRain = false;
  ambientState.fOutsideTemperature = add.y;
  ambientState.fOutsideTemperature_Mean = mean.y;
  connect(ambientState, localState.ambientState1) annotation (Line(points={{-110,0},{-79,0},{-79,90}}, color={0,0,0}));
  connect(mean.u, add.y) annotation (Line(points={{22,10},{39,10}}, color={0,0,127}));
  connect(add.u2, const.y) annotation (Line(points={{62,16},{62,50},{79,50}}, color={0,0,127}));
  connect(add.u1, T_ambient) annotation (Line(points={{62,4},{85,4},{85,-8.88178e-16},{120,-8.88178e-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Ambient;
