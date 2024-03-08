within ThermalSystemsControlLib.Applications.ETA_Factory;
model ETAFactory_HeatingSystems_HNHT_Only "Using full strategy for hnht"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Applications_Icon;
  ThermalNetworks.HNHT_Only HNHT annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  ThermalNetworks.Ambient Ambient annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-30})));
  Strategies.Strategy.StrategyController_HNHT_Only BaseStrategyController annotation (Placement(transformation(extent={{-20,40},{0,60}})));
equation
  connect(Ambient.ambientState, HNHT.ambientState) annotation (Line(points={{-10,-19},{-10,-1},{-10,-1}}, color={0,0,0}));
  connect(HNHT.controlAutomatic, BaseStrategyController.hnhtControl) annotation (Line(points={{-15,21},{-15,30.5},{-15,30.5},{-15,39}}, color={0,0,0}));
  connect(BaseStrategyController.hnhtState, HNHT.localState1) annotation (Line(points={{-5,39},{-5,30.5},{-5,30.5},{-5,21}}, color={0,0,0}));
  connect(BaseStrategyController.ambientState, Ambient.ambientState) annotation (Line(points={{-10,61},{-10,80},{-40,80},{-40,-19},{-10,-19}}, color={0,0,0}));
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
end ETAFactory_HeatingSystems_HNHT_Only;
