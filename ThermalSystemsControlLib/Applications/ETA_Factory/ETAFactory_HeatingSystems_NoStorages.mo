within ThermalSystemsControlLib.Applications.ETA_Factory;
model ETAFactory_HeatingSystems_NoStorages
  extends ThermalSystemsControlLib.BaseClasses.Icons.Applications_Icon;
  ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.HNHT HNHT annotation (Placement(transformation(extent={{-82,0},{-62,20}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.HNHT_HNLT HNHT_HNLT annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.HNLT HNLT annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Strategies.Strategy_NoStorages.StrategyController_NoStorages Strategy annotation (Placement(transformation(extent={{0,60},{20,80}})));
  ThermalNetworks.Ambient Ambient annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,-50})));
  ThermalNetworks.HNLT_CN HNLT_CN annotation (Placement(transformation(extent={{40,0},{60,20}})));
  ThermalNetworks.CN CN annotation (Placement(transformation(extent={{80,0},{100,20}})));
equation
  connect(HNHT.port_b_HNLT_Consumer, HNHT_HNLT.port_a_HNHT_Consumer) annotation (Line(points={{-62,16},{-40,16}},                 color={0,127,255}));
  connect(HNHT.port_a_HNLT_Consumer, HNHT_HNLT.port_b_HNHT_Consumer) annotation (Line(points={{-62,4},{-40,4}},               color={0,127,255}));
  connect(Ambient.ambientState, HNHT.ambientState) annotation (Line(points={{10,-39},{10,-20},{-77,-20},{-77,-1}},                     color={0,0,0}));
  connect(Strategy.ambientState, HNHT.ambientState) annotation (Line(points={{10,81},{10,80},{-100,80},{-100,-20},{-77,-20},{-77,-1}}));
  connect(HNLT.ambientState, HNHT.ambientState) annotation (Line(points={{10,-1},{10,-20},{-77,-20},{-77,-1}}));
  connect(HNLT.port_a_HNHT_Producer, HNHT_HNLT.port_b_HNLT_Producer) annotation (Line(points={{0,20},{-20,20}}, color={0,127,255}));
  connect(HNHT_HNLT.port_a_HNLT_Producer, HNLT.port_b_HNHT_Producer) annotation (Line(points={{-20,0},{0,0}}, color={0,127,255}));
  connect(HNLT_CN.port_a_CN_Producer,CN. port_b_HNLT_Producer) annotation (Line(points={{60,16},{80,16}}, color={0,127,255}));
  connect(CN.port_a_HNLT_Producer,HNLT_CN. port_b_CN_Producer) annotation (Line(points={{80,4},{60,4}}, color={0,127,255}));
  connect(CN.ambientState, HNHT.ambientState) annotation (Line(points={{90,-1},{90,-20},{-77,-20},{-77,-1}}));
  connect(HNHT.controlAutomatic, Strategy.hnhtControl) annotation (Line(points={{-77,21},{-77,59},{-4,59}}, color={0,0,0}));
  connect(HNHT.localState1, Strategy.hnhtState) annotation (Line(points={{-67,21},{-67,50},{0,50},{0,59}}, color={0,0,0}));
  connect(HNHT_HNLT.controlAutomatic, Strategy.hnhtHnltLinkageControl) annotation (Line(points={{-30,21},{-30,40},{4,40},{4,59}}, color={0,0,0}));
  connect(Strategy.hnltControl, HNLT.controlAutomatic) annotation (Line(points={{12,59},{12,21},{15,21}}, color={0,0,0}));
  connect(Strategy.hnltState, HNLT.localState1) annotation (Line(points={{8,59},{8,21},{5,21}}, color={0,0,0}));
  connect(Strategy.hnltCnLinkageControl,HNLT_CN. controlAutomatic) annotation (Line(points={{16,59},{16,40},{50,40},{50,21}}, color={0,0,0}));
  connect(Strategy.cnState,CN. localState1) annotation (Line(points={{20,59},{20,50},{85,50},{85,21}}, color={0,0,0}));
  connect(Strategy.cnControl,CN. controlAutomatic) annotation (Line(points={{24,59},{96,59},{96,21},{95,21}}, color={0,0,0}));
  connect(HNLT.port_a_CN_Producer,HNLT_CN. port_b_HNLT_Producer) annotation (Line(points={{20,20},{40,20}}, color={0,127,255}));
  connect(HNLT.port_b_CN_Producer,HNLT_CN. port_a_HNLT_Producer) annotation (Line(points={{20,0},{40,0}}, color={0,127,255}));
  connect(HNLT.port_b_CN_Consumer, HNLT_CN.port_a_HNLT_Consumer) annotation (Line(points={{20,16},{40,16}}, color={0,127,255}));
  connect(HNLT_CN.port_b_HNLT_Consumer, HNLT.port_a_CN_Consumer) annotation (Line(points={{40,4},{20,4}}, color={0,127,255}));
  connect(HNLT_CN.port_b_CN_Consumer, CN.port_a_HNLT_Consumer) annotation (Line(points={{60,20},{80,20}}, color={0,127,255}));
  connect(HNLT_CN.port_a_CN_Consumer, CN.port_b_HNLT_Consumer) annotation (Line(points={{60,0},{70,0},{70,0.2},{80,0.2}}, color={0,127,255}));
  connect(HNLT_CN.ambientState, HNHT.ambientState) annotation (Line(points={{50,-1},{50,-20},{-77,-20},{-77,-1}}));
  connect(HNHT_HNLT.port_b_HNHT_Producer, HNHT.port_a_HNLT_Producer) annotation (Line(points={{-40,20},{-62,20}}, color={0,127,255}));
  connect(HNHT.port_b_HNLT_Producer, HNHT_HNLT.port_a_HNHT_Producer) annotation (Line(points={{-62,0},{-40,0}}, color={0,127,255}));
  connect(HNHT_HNLT.port_a_HNLT_Consumer, HNLT.port_b_HNHT_Consumer) annotation (Line(points={{-20,16},{0,16}}, color={0,127,255}));
  connect(HNHT_HNLT.port_b_HNLT_Consumer, HNLT.port_a_HNHT_Consumer) annotation (Line(points={{-20,4},{0,4}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=604800,
      Interval=59.9999616,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end ETAFactory_HeatingSystems_NoStorages;
