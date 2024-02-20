within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy_NoStorages.Methods;
model ControlHnlt
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
   parameter Real fOffset_TargetTemperature_OuterCapillaryTubeMats_Cooling = 1;
   parameter Real fOffset_OuterCapillaryTubeMats_Permission = 10;

  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnltControl            hnltControl            annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_OuterCapillaryTubeMats(bandwidth=6) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_OuterCapillaryTubeMats_Permission(bandwidth=6) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  //algortihm permission and general control
  if hnltState.fMidTemperature > strategyState.aTemperatureLimits_HNLT[1] and hnltState.fMidTemperature < strategyState.aTemperatureLimits_HNLT[2] then
    hnltControl.bAlgorithmPermission = true;
  else
    hnltControl.bAlgorithmPermission = false;
  end if;
  hnltControl.fFeedTemperature_Heating = strategyState.fFeedTemperature_HNLT_Heating;
  hnltControl.fFeedTemperature_Cooling = strategyState.fFeedTemperature_HNLT_Cooling;

  //outer capillary tube mats control
  Controller_OuterCapillaryTubeMats.reference = hnltState.fUpperTemperature;
  Controller_OuterCapillaryTubeMats.u = strategyState.fTargetTemperature_HNLT_Cooling+fOffset_TargetTemperature_OuterCapillaryTubeMats_Cooling;
  Controller_OuterCapillaryTubeMats_Permission.reference = strategyState.fFeedTemperature_HNLT_Cooling-fOffset_OuterCapillaryTubeMats_Permission;
  Controller_OuterCapillaryTubeMats_Permission.u = ambientState.fOutsideTemperature;

  //hvfa storage control
  hnltControl.bSetStatusOn_HVFASystem = false;
  hnltControl.bLoading_HVFASystem = false;
  hnltControl.bSetStatusOn_OuterCapillaryTubeMats = Controller_OuterCapillaryTubeMats.y and Controller_OuterCapillaryTubeMats_Permission.y;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnlt;
