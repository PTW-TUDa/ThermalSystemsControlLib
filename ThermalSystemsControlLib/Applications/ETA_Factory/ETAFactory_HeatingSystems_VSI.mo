within ThermalSystemsControlLib.Applications.ETA_Factory;
model ETAFactory_HeatingSystems_VSI
  extends ThermalSystemsControlLib.BaseClasses.Icons.Applications_Icon;
  ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.HNHT HNHT(T_start_ActiveStorage=323.15)
                                                                              annotation (Placement(transformation(extent={{-42,0},{-22,20}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.HNHT_HNLT HNHT_HNLT annotation (Placement(transformation(extent={{0,0},{20,20}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.HNLT HNLT annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Strategies.BaseStrategyController_VSI                                               Strategy annotation (Placement(transformation(extent={{-4,50},{16,70}})));
  ThermalNetworks.Ambient Ambient annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-50})));
equation
  connect(HNHT.port_b_HNLT_Linkage, HNHT_HNLT.port_a_HNHT) annotation (Line(points={{-22,16},{0,16}}, color={0,127,255}));
  connect(HNHT.port_a_HNLT_Linkage, HNHT_HNLT.port_b_HNHT) annotation (Line(points={{-22,4},{0,4}}, color={0,127,255}));
  connect(HNHT_HNLT.port_b_HNLT, HNLT.port_a_HNHT_Linkage) annotation (Line(points={{20,16},{40,16}}, color={0,127,255}));
  connect(HNHT_HNLT.port_a_HNLT, HNLT.port_b_HNHT_Linakge) annotation (Line(points={{20,4},{40,4}}, color={0,127,255}));
  connect(Strategy.hnhtHnltLinkageControl, HNHT_HNLT.controlAutomatic) annotation (Line(points={{3,49},{3,32},{10,32},{10,21}}, color={0,0,0}));
  connect(HNHT.controlAutomatic, Strategy.hnhtControl) annotation (Line(points={{-27,21},{-27,40},{-5,40},{-5,49}},
                                                                                                                  color={0,0,0}));
  connect(Ambient.ambientState, HNHT.ambientState) annotation (Line(points={{1.9984e-15,-39},{1.9984e-15,-20},{-31.8,-20},{-31.8,-1}}, color={0,0,0}));
  connect(Strategy.ambientState, HNHT.ambientState) annotation (Line(points={{6,71},{6,80},{-60,80},{-60,-20},{-31.8,-20},{-31.8,-1}}));
  connect(Strategy.hnhtState, HNHT.localState1) annotation (Line(points={{-1,49},{-1,32},{-37,32},{-37,21}}, color={0,0,0}));
  connect(Strategy.hnltState, HNLT.localState1) annotation (Line(points={{7,49},{7,40},{45,40},{45,21}}, color={0,0,0}));
  connect(Strategy.hnltControl1, HNLT.controlAutomatic) annotation (Line(points={{11,49},{55,49},{55,21}}, color={0,0,0}));
  connect(HNLT.ambientState, HNHT.ambientState) annotation (Line(points={{50,-1},{50,-20},{-31.8,-20},{-31.8,-1}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Interval=5.00000256,
      __Dymola_Algorithm="Cvode"));
end ETAFactory_HeatingSystems_VSI;
