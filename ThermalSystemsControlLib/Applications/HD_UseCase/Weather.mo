within ThermalSystemsControlLib.Applications.HD_UseCase;
model Weather
  //## IMPORTS ##
  import SI = Modelica.SIunits;

  SI.ThermodynamicTemperature T_ambient;
  Real relative_humidity;

  Modelica.Blocks.Sources.Sine sine(
    amplitude=20,
    freqHz=1/(365*24*3600),
    phase=-1.5707963267949,
    offset=283.15) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Noise.UniformNoise uniformNoise(
    samplePeriod=5*3600,
    y_min=-2,
    y_max=2) annotation (Placement(transformation(extent={{-60,62},{-40,82}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Noise.UniformNoise uniformNoise1(
    samplePeriod=5*3600,
    y_min=0.4,
    y_max=0.6)
             annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
equation
  T_ambient = add.y;
  relative_humidity = uniformNoise1.y;
  connect(uniformNoise.y, add.u1) annotation (Line(points={{-39,72},{-26,72},{-26,56},{-12,56}}, color={0,0,127}));
  connect(sine.y, add.u2) annotation (Line(points={{-39,30},{-26,30},{-26,44},{-12,44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Weather;
