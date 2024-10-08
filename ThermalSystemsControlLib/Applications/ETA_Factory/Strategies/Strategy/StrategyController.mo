within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy;
model StrategyController
  extends ThermalSystemsControlLib.BaseClasses.Icons.Automation_Icon;
  Methods.ControlHNHT controlHNHT annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtControl hnhtControl annotation (Placement(transformation(extent={{-150,-120},{-130,-100}})));
  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtHnltLinkageControl hnhtHnltLinkageControl annotation (Placement(transformation(extent={{-70,-120},{-50,-100}})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,-110})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{-30,-120},{-10,-100}})));
  Interfaces.localSetParametersStrategy_FMUConnector localSetParameters annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Methods.SetTemperatures setTemperatures annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Methods.ControlHnhtHnltLinkage controlHnhtHnltLinkage annotation (Placement(transformation(extent={{-42,-60},{-22,-40}})));
  Methods.ControlHnlt controlHnlt annotation (Placement(transformation(extent={{20,-60},{0,-40}})));
  ThermalNetworks.Interfaces.hnltControl hnltControl annotation (Placement(transformation(extent={{10,-120},{30,-100}})));
  ThermalNetworks.Interfaces.hnltCnLinkageControl hnltCnLinkageControl annotation (Placement(transformation(extent={{50,-120},{70,-100}})));
  ThermalNetworks.Interfaces.cnControl cnControl annotation (Placement(transformation(extent={{130,-120},{150,-100}})));
  ThermalNetworks.Interfaces.thermalNetworkState cnState annotation (Placement(transformation(extent={{90,-120},{110,-100}})));
  Methods.ControlHnltCnLinkage controlHnltCnLinkage annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Methods.ControlCN controlCN annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
equation
  connect(localSetParameters.localSetParametersStrategy1, setTemperatures.localSetParameters) annotation (Line(points={{-79,0},{-61,0}}, color={0,0,0}));
  connect(controlHNHT.strategyState, setTemperatures.localState) annotation (Line(points={{-70,-39},{-70,-40},{-39,-40},{-39,0.2}}, color={0,0,0}));
  connect(controlHNHT.ambientState, ambientState) annotation (Line(points={{-81,-50},{-90,-50},{-90,80},{0,80},{0,110}}, color={0,0,0}));
  connect(controlHnhtHnltLinkage.strategyState, setTemperatures.localState) annotation (Line(points={{-32,-39},{-32,0.2},{-39,0.2}}, color={0,0,0}));
  connect(controlHnlt.strategyState, setTemperatures.localState) annotation (Line(points={{10,-39},{10,0},{-39,0},{-39,0.2}}, color={0,0,0}));
  connect(controlHnltCnLinkage.strategyState, setTemperatures.localState) annotation (Line(points={{50,-39},{50,0},{-39,0},{-39,0.2}}));
  connect(controlCN.strategyState, setTemperatures.localState) annotation (Line(points={{90,-39},{90,0},{-39,0},{-39,0.2}}));
  connect(controlHNHT.hnhtControl, hnhtControl) annotation (Line(points={{-75,-61},{-75,-80},{-140,-80},{-140,-110}}, color={0,0,0}));
  connect(controlHNHT.hnhtState, hnhtState) annotation (Line(points={{-65,-61},{-65,-84},{-100,-84},{-100,-110}}, color={0,0,0}));
  connect(controlHnhtHnltLinkage.hnhtState, hnhtState) annotation (Line(points={{-41,-61},{-41,-84},{-100,-84},{-100,-110}}));
  connect(controlHnhtHnltLinkage.hnhtHnltLinkageControl, hnhtHnltLinkageControl) annotation (Line(points={{-31.8,-61},{-31.8,-86},{-60,-86},{-60,-110}}, color={0,0,0}));
  connect(controlHnhtHnltLinkage.hnltState, hnltState) annotation (Line(points={{-23,-61},{-23,-82},{-20,-82},{-20,-110}}, color={0,0,0}));
  connect(controlHnlt.hnltState, hnltState) annotation (Line(points={{1,-61},{1,-82},{-20,-82},{-20,-110}}));
  connect(controlHnlt.hnltControl, hnltControl) annotation (Line(points={{9.8,-61},{9.8,-80},{20,-80},{20,-110}}, color={0,0,0}));
  connect(controlHnltCnLinkage.hnltState, hnltState) annotation (Line(points={{41,-61},{41,-82},{-20,-82},{-20,-110}}));
  connect(controlHnltCnLinkage.hnltCnLinkageControl, hnltCnLinkageControl) annotation (Line(points={{50.2,-61},{50.2,-62},{50,-62},{50,-84},{60,-84},{60,-110}}, color={0,0,0}));
  connect(controlHnltCnLinkage.cnState, cnState) annotation (Line(points={{59,-61},{59,-82},{100,-82},{100,-110}}, color={0,0,0}));
  connect(controlCN.cnControl, cnControl) annotation (Line(points={{99,-61},{99,-80},{140,-80},{140,-110}}, color={0,0,0}));
  connect(controlCN.cnState, cnState) annotation (Line(points={{90,-61},{90,-82},{100,-82},{100,-110}}));
  connect(controlHnlt.ambientState, ambientState) annotation (Line(points={{-1,-50},{0,-50},{0,110}}));
  connect(controlHnltCnLinkage.hnltCnLinkageControl, controlCN.hnltCnLinkageControl) annotation (Line(points={{50.2,-61},{50.2,-50},{79,-50}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end StrategyController;
