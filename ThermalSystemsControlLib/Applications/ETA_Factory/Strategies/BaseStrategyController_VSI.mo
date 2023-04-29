within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies;
model BaseStrategyController_VSI
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Methods.ControlHNHT_VSI controlHNHT annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtControl hnhtControl annotation (Placement(transformation(extent={{-120,-120},{-100,-100}})));
  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtHnltLinkageControl hnhtHnltLinkageControl annotation (Placement(transformation(extent={{-40,-120},{-20,-100}})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-110})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{0,-120},{20,-100}})));
  Interfaces.localSetParametersStrategy_FMUConnector localSetParameters annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Methods.SetTemperatures setTemperatures annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Methods.ControlHnhtHnltLinkage controlHnhtHnltLinkage annotation (Placement(transformation(extent={{-42,-60},{-22,-40}})));
  Methods.ControlHnlt controlHnlt annotation (Placement(transformation(extent={{20,-60},{0,-40}})));
  ThermalNetworks.Interfaces.hnltControl hnltControl1 annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
equation
  connect(localSetParameters.localSetParametersStrategy1, setTemperatures.localSetParameters) annotation (Line(points={{-79,0},{-61,0}}, color={0,0,0}));
  connect(controlHNHT.strategyState, setTemperatures.localState) annotation (Line(points={{-70,-39},{-70,-40},{-39,-40},{-39,0.2}}, color={0,0,0}));
  connect(controlHNHT.ambientState, ambientState) annotation (Line(points={{-81,-50},{-90,-50},{-90,80},{0,80},{0,110}}, color={0,0,0}));
  connect(controlHnhtHnltLinkage.hnhtHnltLinkageControl, hnhtHnltLinkageControl) annotation (Line(points={{-31.8,-61},{-31.8,-80},{-30,-80},{-30,-110}},     color={0,0,0}));
  connect(controlHnhtHnltLinkage.strategyState, setTemperatures.localState) annotation (Line(points={{-32,-39},{-32,0.2},{-39,0.2}}, color={0,0,0}));
  connect(controlHnlt.strategyState, setTemperatures.localState) annotation (Line(points={{10,-39},{10,0},{-39,0},{-39,0.2}}, color={0,0,0}));
  connect(controlHnlt.hnltControl, hnltControl1) annotation (Line(points={{9.8,-61},{9.8,-80},{50,-80},{50,-110}}, color={0,0,0}));
  connect(controlHnlt.hnltState, hnltState) annotation (Line(points={{1,-61},{1,-101.5},{10,-101.5},{10,-110}}, color={0,0,0}));
  connect(controlHnhtHnltLinkage.hnltState, hnltState) annotation (Line(points={{-23,-61},{-23,-80},{1,-80},{1,-101.5},{10,-101.5},{10,-110}}));
  connect(hnhtControl, controlHNHT.hnhtControl) annotation (Line(points={{-110,-110},{-110,-80},{-75,-80},{-75,-61}}, color={0,0,0}));
  connect(controlHNHT.hnhtState, hnhtState) annotation (Line(points={{-65,-61},{-65,-100.5},{-70,-100.5},{-70,-110}}, color={0,0,0}));
  connect(controlHnhtHnltLinkage.hnhtState, hnhtState) annotation (Line(points={{-41,-61},{-41,-80},{-65,-80},{-65,-100.5},{-70,-100.5},{-70,-110}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseStrategyController_VSI;
