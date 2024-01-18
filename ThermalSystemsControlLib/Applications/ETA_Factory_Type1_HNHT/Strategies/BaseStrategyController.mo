within ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT.Strategies;
model BaseStrategyController
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Methods.ControlHNHT controlHNHT annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  output ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT.ThermalNetworks.Interfaces.hnhtControl hnhtControl annotation (Placement(transformation(extent={{-150,-120},{-130,-100}})));
  input ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,-110})));
  Interfaces.localSetParametersStrategy_FMUConnector localSetParameters annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Methods.SetTemperatures setTemperatures annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
equation
  connect(localSetParameters.localSetParametersStrategy1, setTemperatures.localSetParameters) annotation (Line(points={{-79,0},{-61,0}}, color={0,0,0}));
  connect(controlHNHT.strategyState, setTemperatures.localState) annotation (Line(points={{-70,-39},{-70,-40},{-39,-40},{-39,0.2}}, color={0,0,0}));
  connect(controlHNHT.ambientState, ambientState) annotation (Line(points={{-81,-50},{-90,-50},{-90,80},{0,80},{0,110}}, color={0,0,0}));
  connect(controlHNHT.hnhtControl, hnhtControl) annotation (Line(points={{-75,-61},{-75,-80},{-140,-80},{-140,-110}}, color={0,0,0}));
  connect(controlHNHT.hnhtState, hnhtState) annotation (Line(points={{-65,-61},{-65,-84},{-100,-84},{-100,-110}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseStrategyController;
