within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Methods;
model SelectControlMode
  extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  Modelica.Blocks.Interfaces.BooleanOutput bSetStatusOn annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.LogicalSwitch switch_block annotation (Placement(transformation(extent={{0,10},{20,-10}})));
  Modelica.Blocks.Logical.And and_block annotation (Placement(transformation(extent={{-60,-40},{-40,-60}})));
  Modelica.Blocks.Interfaces.BooleanInput bSetStatusOnAutomatic annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Interfaces.BooleanInput bAlgorithmPermission annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
  Modelica.Blocks.Interfaces.BooleanInput bStatusOn annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  output Interfaces.controlState controlState annotation (Placement(transformation(extent={{40,100},{60,120}})));
  input Interfaces.control control annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
equation
  //read from control struct
  and_block.u1 = control.bAlgorithmModeActivated;
  switch_block.u1 = control.bSetStatusOnAlgorithm;

  //write to controlState struct
  controlState.bStatusOn = bStatusOn;

  if and_block.y then
    controlState.sAccessMode = ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces.Enum_AccessMode.algorithm_mode;
  else
    controlState.sAccessMode = ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces.Enum_AccessMode.automatic_mode;
  end if;
  controlState.nAccessMode = Integer(controlState.sAccessMode)-1;


  //connections
  connect(switch_block.y, bSetStatusOn) annotation (Line(points={{21,0},{110,0}}, color={255,0,255}));
  connect(and_block.y, switch_block.u2) annotation (Line(points={{-39,-50},{-20,-50},{-20,0},{-2,0}},
                                                                                                    color={255,0,255}));
  connect(bSetStatusOnAutomatic, switch_block.u3) annotation (Line(points={{-120,50},{-2,50},{-2,8}}, color={255,0,255}));
  connect(bAlgorithmPermission, and_block.u2) annotation (Line(points={{-120,-50},{-80,-50},{-80,-42},{-62,-42}},
                                                                                                              color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Method to select \"bSetStatusOn\" based on the access mode <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.</p>
</html>"));
end SelectControlMode;
