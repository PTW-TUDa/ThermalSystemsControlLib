within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses;
partial model ActuatorContinuous
  extends Actuator2Point;
  Modelica.Blocks.Interfaces.RealInput fSetPointAutomatic annotation (Placement(transformation(extent={{-140,-10},{-100,30}})));
  Methods.SelectSetPoint selectSetPoint annotation (Placement(transformation(extent={{-80,40},{-60,20}})));
  Interfaces.setSetPoint_FMUConnector setSetPoint annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,50})));
  Interfaces.setPointState_FMUConnector setPointState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,10})));
  Modelica.Blocks.Interfaces.RealOutput fOperatingPoint annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
equation
  connect(selectSetPoint.bAlgorithmPermission, bAlgorithmPermission) annotation (Line(points={{-82,30},{-100,30},{-100,50},{-120,50}},
                                                                                                                                     color={255,0,255}));
  connect(setSetPoint.setSetPoint1, selectSetPoint.setSetPoint) annotation (Line(points={{-61,50},{-65,50},{-65,41}}, color={0,0,0}));
  connect(selectSetPoint.setPointState, setPointState.setPointState1) annotation (Line(points={{-65,19},{-65,10},{-61,10}}, color={0,0,0}));
  connect(fOperatingPoint, selectSetPoint.fOperatingPoint) annotation (Line(points={{0,110},{0,0},{-70,0},{-70,18}}, color={0,0,127}));
  connect(selectControlMode.control, selectSetPoint.control) annotation (Line(points={{-75,81},{-75,60.5},{-75,19},{-75,19}}, color={0,0,0}));
  connect(fSetPointAutomatic, selectSetPoint.fSetPointAutomatic) annotation (Line(points={{-120,10},{-90,10},{-90,23},{-82,23}}, color={0,0,127}));
  annotation (Documentation(info="<html>
Automation base model for a continuous actuator <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.
</html>"));
end ActuatorContinuous;
