within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
model Ambient
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  Interfaces.ambientState_FMUConnector localState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-90,90})));
  output Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Sources.BooleanStep bRain(startTime=172800) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,-50})));
  Modelica.Blocks.Sources.Sine fOutsideTemperature(
    amplitude=10,
    freqHz=1/(24*3600),
    offset=278.15) annotation (Placement(transformation(extent={{100,0},{80,20}})));
  Modelica.Blocks.Math.ContinuousMean mean(t_eps=6*3600) annotation (Placement(transformation(extent={{20,0},{0,20}})));
equation

  ambientState.bRain = bRain.y;
  ambientState.fOutsideTemperature = fOutsideTemperature.y;
  ambientState.fOutsideTemperature_Mean = mean.y;
  connect(ambientState, localState.ambientState1) annotation (Line(points={{-110,0},{-79,0},{-79,90}}, color={0,0,0}));
  connect(fOutsideTemperature.y, mean.u) annotation (Line(points={{79,10},{22,10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Ambient;
