within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy;
model StrategyController_HNHT_Only
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Methods.ControlHNHT controlHNHT annotation (Placement(transformation(extent={{18,-60},{-2,-40}})));
  Interfaces.localSetParametersStrategy_FMUConnector localSetParameters(bProductionModeActivated=true)
                                                                        annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Methods.SetTemperatures setTemperatures annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  output ThermalNetworks.Interfaces.hnhtControl                                                         hnhtControl annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  input ThermalNetworks.Interfaces.thermalNetworkState                                                         hnhtState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-110})));
  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
equation
  connect(localSetParameters.localSetParametersStrategy1,setTemperatures. localSetParameters) annotation (Line(points={{-79,0},{-61,0}}, color={0,0,0}));
  connect(controlHNHT.strategyState,setTemperatures. localState) annotation (Line(points={{8,-39},{8,0},{-40,0},{-40,0.2},{-39,0.2}},
                                                                                                                                    color={0,0,0}));
  connect(controlHNHT.ambientState,ambientState)  annotation (Line(points={{-3,-50},{-20,-50},{-20,80},{0,80},{0,110}},  color={0,0,0}));
  connect(controlHNHT.hnhtControl,hnhtControl)  annotation (Line(points={{3,-61},{3,-80},{-50,-80},{-50,-110}},       color={0,0,0}));
  connect(controlHNHT.hnhtState,hnhtState)  annotation (Line(points={{13,-61},{13,-70},{14,-70},{14,-80},{50,-80},{50,-110}},
                                                                                                                  color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StrategyController_HNHT_Only;
