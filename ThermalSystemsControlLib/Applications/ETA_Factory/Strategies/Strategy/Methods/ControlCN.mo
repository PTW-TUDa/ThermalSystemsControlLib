within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model ControlCN
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
      parameter Real fOffset_TargetTemperature_eChiller = 2.5;
      parameter Real fOffset_TargetTemperature_HVFA_CN = 1;
      parameter Real fOffset_TargetTemperature_HVFA_CN_Permission = 2.5;
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState cnState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  ThermalNetworks.Interfaces.cnControl cnControl annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_eChiller(bandwidth=7) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_HVFA_CN_UnloadingPermission(bandwidth=1) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Logical.OnOffController Controller_Buffer_HVFA_CN_Unloading(bandwidth=2) annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  BaseClasses.Utilities.RangeCheck RangeCheck(fRestoreDifference=2)
                          annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  ThermalNetworks.Interfaces.hnltCnLinkageControl hnltCnLinkageControl annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  //algortihm permission and general control
  RangeCheck.u = cnState.fMidTemperature;
  RangeCheck.aTemperatureLimits = strategyState.aTemperatureLimits_CN;
  cnControl.bAlgorithmPermission = RangeCheck.y;
  cnControl.fFeedTemperature = strategyState.fFeedTemperature_CN;

  //eChiller control
  Controller_eChiller.reference = cnState.fMidTemperature;
  Controller_eChiller.u = strategyState.fTargetTemperature_CN+fOffset_TargetTemperature_eChiller;
  cnControl.bSetStatusOn_eChiller = Controller_eChiller.y;

  //hvfa storage control
  Controller_HVFA_CN_UnloadingPermission.reference = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_HVFA_CN_Permission;
  Controller_HVFA_CN_UnloadingPermission.u = cnState.fLowerTemperature_ActiveStorage;
  Controller_Buffer_HVFA_CN_Unloading.reference = cnState.fMidTemperature;
  Controller_Buffer_HVFA_CN_Unloading.u = strategyState.fTargetTemperature_CN+fOffset_TargetTemperature_HVFA_CN;

  cnControl.bSetStatusOn_HVFASystem = (Controller_Buffer_HVFA_CN_Unloading.y and Controller_HVFA_CN_UnloadingPermission.y) or (hnltCnLinkageControl.bSetStatusOn_HeatPump and not Controller_Buffer_HVFA_CN_Unloading.y and not Controller_HVFA_CN_UnloadingPermission.y);
  cnControl.bLoading_HVFASystem = not (Controller_Buffer_HVFA_CN_Unloading.y and Controller_HVFA_CN_UnloadingPermission.y);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlCN;
