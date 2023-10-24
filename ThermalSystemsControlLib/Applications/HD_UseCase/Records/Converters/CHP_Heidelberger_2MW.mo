within ThermalSystemsControlLib.Applications.HD_UseCase.Records.Converters;
record CHP_Heidelberger_2MW
  extends Components.CombinedHeatPower.PhysicalModels.Records.CombinedHeatPowerProperties(
    P_el_nom=2.08e6,
    P_gs_nom=5.2e6,
    f_effPth=[0,0, 393.15; 0,0,0;1,0.5,0.5],
    u_min=0.2,
    T_inMin=273.15 + 20,
    T_inMax=273.15 + 100,
    V_int=1,
    riseTime=1);
  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end CHP_Heidelberger_2MW;
