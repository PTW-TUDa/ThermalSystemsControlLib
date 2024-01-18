within ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT;
model ETAFactory_HeatingSystems
  extends ThermalSystemsControlLib.BaseClasses.Icons.Applications_Icon;
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT.ThermalNetworks.HNHT HNHT(T_start_ActiveStorage=323.15) annotation (Placement(transformation(extent={{-82,0},{-62,20}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1_HNHT.Strategies.BaseStrategyController Strategy annotation (Placement(transformation(extent={{0,60},{20,80}})));
  ThermalNetworks.Ambient Ambient annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,-50})));
equation
  connect(Strategy.ambientState, HNHT.ambientState) annotation (Line(points={{10,81},{10,80},{-100,80},{-100,-20},{-77,-20},{-77,-1}}));
  connect(HNHT.controlAutomatic, Strategy.hnhtControl) annotation (Line(points={{-77,21},{-77,59},{-4,59}}, color={0,0,0}));
  connect(HNHT.localState1, Strategy.hnhtState) annotation (Line(points={{-67,21},{-67,50},{0,50},{0,59}}, color={0,0,0}));
  connect(Ambient.ambientState, HNHT.ambientState) annotation (Line(points={{10,-39},{10,-20},{-77,-20},{-77,-1}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=604800,
      Interval=60,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end ETAFactory_HeatingSystems;
