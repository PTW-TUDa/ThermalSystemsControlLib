within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Methods;
model ControlHNHT
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  Real fOffset_TargetTemperature_CHP1;
  Real fOffset_TargetTemperature_CHP2;
  Real fOffset_TargetTemperature_CondensingBoiler=2;

  output ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.hnhtControl hnhtControl annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  input ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks.Interfaces.thermalNetworkState hnhtState annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Logical.OnOffController Controller_CondensingBoiler(bandwidth=5) annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  BaseClasses.Utilities.OnOffController_VariableBandwith
                                          Controller_CHP1              annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  BaseClasses.Utilities.OnOffController_VariableBandwith
                                          Controller_CHP2              annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Modelica.Blocks.Logical.OnOffController Controller_StaticHeating(bandwidth=5) annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));

  input ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.OnOffController Controller_CHP_Prioritization(bandwidth=4) annotation (Placement(transformation(extent={{-10,20},{10,40}})));
equation
  Controller_CondensingBoiler.u = hnhtState.fMidTemperature;
  Controller_CHP_Prioritization.u = 273.15+15;
  Controller_CHP1.u = hnhtState.fMidTemperature;
  Controller_CHP2.u = hnhtState.fMidTemperature;
  Controller_StaticHeating.u = ambientState.fOutsideTemperature;

  if Controller_CHP_Prioritization.y then
    fOffset_TargetTemperature_CHP1 = 4;
    fOffset_TargetTemperature_CHP2 = 2;
    Controller_CHP1.bandwidth = 5;
    Controller_CHP2.bandwidth = 5;
  else
    fOffset_TargetTemperature_CHP1 = 2;
    fOffset_TargetTemperature_CHP2 = 4;
    Controller_CHP1.bandwidth = 5;
    Controller_CHP2.bandwidth = 5;
  end if;

  Controller_CondensingBoiler.reference = strategyState.fTargetTemperature_HNHT-fOffset_TargetTemperature_CondensingBoiler;
  Controller_CHP_Prioritization.reference = ambientState.fOutsideTemperature_Mean;
  Controller_CHP1.reference = strategyState.fTargetTemperature_HNHT-fOffset_TargetTemperature_CHP1;
  Controller_CHP2.reference = strategyState.fTargetTemperature_HNHT-fOffset_TargetTemperature_CHP2;
  Controller_StaticHeating.reference = 273.15+15;

  hnhtControl.bSetStatusOn_CondensingBoiler = Controller_CondensingBoiler.y;
  hnhtControl.bSetStatusOn_CHP1 = Controller_CHP1.y;
  hnhtControl.bSetStatusOn_CHP2 = Controller_CHP2.y;
  hnhtControl.bSetStatusOn_StaticHeating = Controller_StaticHeating.y;
  hnhtControl.bSetStatusOn_VSIStorage = false;
  hnhtControl.nControlMode_VSIStorage = 0;

  if hnhtState.fMidTemperature > strategyState.aTemperatureLimits_HNHT[1] and hnhtState.fMidTemperature < strategyState.aTemperatureLimits_HNHT[2] then
    hnhtControl.bAlgorithmPermission = true;
  else
    hnhtControl.bAlgorithmPermission = false;
  end if;
  hnhtControl.fFeedTemperature = strategyState.fFeedTemperature_HNHT;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHNHT;
