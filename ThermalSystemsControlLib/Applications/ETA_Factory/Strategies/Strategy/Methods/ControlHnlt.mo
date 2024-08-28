within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model ControlHnlt
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
   parameter Real fOffset_TargetTemperature_OuterCapillaryTubeMats_Cooling = 1;
   parameter Real fOffset_OuterCapillaryTubeMats_Permission = 10;
   parameter Real fOffset_TargetTemperature_HVFA_HNLT_Heating = 1;
   parameter Real fOffset_HVFA_HNLT_Recooling = 2;
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState hnltState annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  ThermalNetworks.Interfaces.hnltControl            hnltControl            annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_OuterCapillaryTubeMats(bandwidth=6) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_OuterCapillaryTubeMats_Permission(bandwidth=6) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Logical.OnOffController Controller_HVFA_HNLT_HVFALoadingPermission(bandwidth=4) annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_HVFA_HNLT_HVFAUnloadingPermission(bandwidth=4) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Logical.OnOffController Controller_Buffer_HVFA_HNLT_HVFAUnloading(bandwidth=2) annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Blocks.Logical.OnOffController Controller_Buffer_HVFA_HNLT_HVFALoading(bandwidth=4) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Logical.OnOffController Controller_HVFA_HNLT_Recooling(bandwidth=4) annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  ThermalNetworks.Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  BaseClasses.Utilities.RangeCheck RangeCheck(fRestoreDifference=5)
                          annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
equation
  //algortihm permission and general control
  RangeCheck.u = hnltState.fMidTemperature;
  RangeCheck.aTemperatureLimits = strategyState.aTemperatureLimits_HNLT;
  hnltControl.bAlgorithmPermission = RangeCheck.y;
  hnltControl.fFeedTemperature_Heating = strategyState.fFeedTemperature_HNLT_Heating;
  hnltControl.fFeedTemperature_Cooling = strategyState.fFeedTemperature_HNLT_Cooling;

  //outer capillary tube mats control
  Controller_OuterCapillaryTubeMats.reference = hnltState.fUpperTemperature;
  Controller_OuterCapillaryTubeMats.u = strategyState.fTargetTemperature_HNLT_Cooling+fOffset_TargetTemperature_OuterCapillaryTubeMats_Cooling;
  Controller_OuterCapillaryTubeMats_Permission.reference = strategyState.fFeedTemperature_HNLT_Cooling-fOffset_OuterCapillaryTubeMats_Permission;
  Controller_OuterCapillaryTubeMats_Permission.u = ambientState.fOutsideTemperature;

  //hvfa storage control
  Controller_Buffer_HVFA_HNLT_HVFAUnloading.reference = strategyState.fTargetTemperature_HNLT_Heating+fOffset_TargetTemperature_HVFA_HNLT_Heating;
  Controller_Buffer_HVFA_HNLT_HVFAUnloading.u = hnltState.fMidTemperature;
  Controller_Buffer_HVFA_HNLT_HVFALoading.reference = hnltState.fMidTemperature;
  Controller_Buffer_HVFA_HNLT_HVFALoading.u = strategyState.fTargetTemperature_HNLT_Cooling;
  Controller_HVFA_HNLT_HVFAUnloadingPermission.reference = hnltState.fLowerTemperature_ActiveStorage;
  Controller_HVFA_HNLT_HVFAUnloadingPermission.u = strategyState.fTargetTemperature_HNLT_Heating;
  Controller_HVFA_HNLT_HVFALoadingPermission.reference = strategyState.fTargetTemperature_HNLT_Cooling;
  Controller_HVFA_HNLT_HVFALoadingPermission.u = hnltState.fLowerTemperature_ActiveStorage;
  Controller_HVFA_HNLT_Recooling.reference = hnltState.fLowerTemperature_ActiveStorage;
  Controller_HVFA_HNLT_Recooling.u = strategyState.fFeedTemperature_HNLT_Cooling-fOffset_HVFA_HNLT_Recooling;

  if not strategyState.bHeatingModeActivated then
    hnltControl.bSetStatusOn_HVFASystem = (Controller_HVFA_HNLT_HVFALoadingPermission.y and Controller_Buffer_HVFA_HNLT_HVFALoading.y) or (Controller_HVFA_HNLT_HVFAUnloadingPermission.y and Controller_Buffer_HVFA_HNLT_HVFAUnloading.y) or (Controller_HVFA_HNLT_Recooling.y and Controller_OuterCapillaryTubeMats_Permission.y);
    hnltControl.bLoading_HVFASystem = Controller_HVFA_HNLT_HVFALoadingPermission.y and Controller_Buffer_HVFA_HNLT_HVFALoading.y;
    hnltControl.bSetStatusOn_OuterCapillaryTubeMats = (Controller_OuterCapillaryTubeMats.y and Controller_OuterCapillaryTubeMats_Permission.y) or (Controller_HVFA_HNLT_Recooling.y and Controller_OuterCapillaryTubeMats_Permission.y);
  else
    hnltControl.bSetStatusOn_HVFASystem = (Controller_HVFA_HNLT_HVFALoadingPermission.y and Controller_Buffer_HVFA_HNLT_HVFALoading.y) or (Controller_HVFA_HNLT_HVFAUnloadingPermission.y and Controller_Buffer_HVFA_HNLT_HVFAUnloading.y);
    hnltControl.bLoading_HVFASystem = Controller_HVFA_HNLT_HVFALoadingPermission.y and Controller_Buffer_HVFA_HNLT_HVFALoading.y;
    hnltControl.bSetStatusOn_OuterCapillaryTubeMats = Controller_OuterCapillaryTubeMats.y and Controller_OuterCapillaryTubeMats_Permission.y;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlHnlt;
