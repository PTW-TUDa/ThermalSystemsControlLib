within ThermalSystemsControlLib.Applications.HD_UseCase.Records.Converters;
record CondensingBoiler_Heidelberger_15MW
  extends ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties(
    P_gs_nom=15e6,
    f_effPth=[0,0, 393.15; 0,0,0;1,0.9,0.9],
    u_min=0.1,
    T_inMin=273.15 + 20,
    T_inMax=273.15 + 120,
    V_int=1,
    riseTime=60);

  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end CondensingBoiler_Heidelberger_15MW;
