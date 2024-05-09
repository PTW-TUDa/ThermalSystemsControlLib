within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Strategy.Methods;
model ControlCN
      extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
      parameter Real fOffset_TargetTemperature_eChiller = 0.5;
      parameter Real fOffset_TargetTemperature_HVFA_CN = 1;
      parameter Real fOffset_TargetTemperature_HVFA_CN_Permission = 2.5;
  input Interfaces.BaseStrategyState strategyState annotation (Placement(transformation(extent={{-10,100},{10,120}})));

  input ThermalNetworks.Interfaces.thermalNetworkState cnState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  ThermalNetworks.Interfaces.cnControl cnControl annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  Modelica.Blocks.Logical.OnOffController Controller_eChiller(bandwidth=7) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_HVFA_CN_LoadingPermission(bandwidth=1) annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Logical.OnOffController Controller_HVFA_CN_UnloadingPermission(bandwidth=1) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Logical.OnOffController Controller_Buffer_HVFA_CN_Unloading(bandwidth=2) annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Blocks.Logical.OnOffController Controller_Buffer_HVFA_CN_Loading(bandwidth=2) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
equation
  //algortihm permission and general control
  if cnState.fMidTemperature > strategyState.aTemperatureLimits_CN[1] and cnState.fMidTemperature < strategyState.aTemperatureLimits_CN[2] then
    cnControl.bAlgorithmPermission = true;
  else
    cnControl.bAlgorithmPermission = false;
  end if;
  cnControl.fFeedTemperature = strategyState.fFeedTemperature_CN;

  //eChiller control
  Controller_eChiller.reference = cnState.fMidTemperature;
  Controller_eChiller.u = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_eChiller;
  cnControl.bSetStatusOn_eChiller = Controller_eChiller.y;

  //hvfa storage control
  Controller_HVFA_CN_LoadingPermission.reference = cnState.fLowerTemperature_ActiveStorage;
  Controller_HVFA_CN_LoadingPermission.u = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_HVFA_CN_Permission;
  Controller_HVFA_CN_UnloadingPermission.reference = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_HVFA_CN_Permission;
  Controller_HVFA_CN_UnloadingPermission.u = cnState.fLowerTemperature_ActiveStorage;
  Controller_Buffer_HVFA_CN_Loading.reference = strategyState.fTargetTemperature_CN-fOffset_TargetTemperature_HVFA_CN;
  Controller_Buffer_HVFA_CN_Loading.u = cnState.fMidTemperature;
  Controller_Buffer_HVFA_CN_Unloading.reference = cnState.fMidTemperature;
  Controller_Buffer_HVFA_CN_Unloading.u = strategyState.fTargetTemperature_CN+fOffset_TargetTemperature_HVFA_CN;

  if not strategyState.bHeatingModeActivated then
    cnControl.bSetStatusOn_HVFASystem = false;
    cnControl.bLoading_HVFASystem = false;
  else
    cnControl.bSetStatusOn_HVFASystem = (Controller_Buffer_HVFA_CN_Unloading.y and Controller_HVFA_CN_UnloadingPermission.y) or (cnControl.bSetStatusOn_eChiller and not Controller_Buffer_HVFA_CN_Unloading.y and Controller_HVFA_CN_LoadingPermission.y);
    cnControl.bLoading_HVFASystem = not (Controller_Buffer_HVFA_CN_Unloading.y and Controller_HVFA_CN_UnloadingPermission.y);
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControlCN;
