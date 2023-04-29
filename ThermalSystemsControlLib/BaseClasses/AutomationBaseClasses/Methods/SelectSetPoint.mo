within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Methods;
model SelectSetPoint
    extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  Modelica.Blocks.Logical.And and_block annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Interfaces.BooleanInput bAlgorithmPermission annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput fSetPointAutomatic annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
  Modelica.Blocks.Logical.Switch switch_block annotation (Placement(transformation(extent={{0,10},{20,-10}})));
  Modelica.Blocks.Interfaces.RealOutput fSetPoint "Connector of Real output signal" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  input Interfaces.control control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  input Interfaces.setSetPoint setSetPoint annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  output Interfaces.setPointState setPointState annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Modelica.Blocks.Interfaces.RealInput fOperatingPoint annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
equation
  //read from control and setSetPoint structs
  and_block.u1 = control.bAlgorithmModeActivated;
  switch_block.u1 = setSetPoint.fSetPointAlgorithm;

  //write to state structs
  setPointState.fOperatingPoint = fOperatingPoint;

  //connections
  connect(fSetPointAutomatic, switch_block.u3) annotation (Line(points={{-120,70},{-80,70},{-80,8},{-2,8}},       color={0,0,127}));
  connect(and_block.y, switch_block.u2) annotation (Line(points={{-39,-30},{-20,-30},{-20,0},{-2,0}},   color={255,0,255}));
  connect(bAlgorithmPermission, and_block.u2) annotation (Line(points={{-120,0},{-80,0},{-80,-38},{-62,-38}},
                                                                                                            color={255,0,255}));
  connect(switch_block.y, fSetPoint) annotation (Line(points={{21,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Method to select \"fSetPoint\" based on the access mode <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.</p>
</html>"));
end SelectSetPoint;
