within ThermalSystemsControlLib.Applications.ETA_Factory_Type2.Records;
record ViessmannVitodens200
  extends ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties(
    P_gs_nom=26e3,
    f_effPth=[0,273.15 + 10,273.15 + 30,273.15 + 60; 0.2,1,1,0.95; 1,1,1,0.95],
    u_min=0.2,
    T_inMin=273.15,
    T_inMax=353.15,
    V_int=0.05,
    riseTime=180);

  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end ViessmannVitodens200;
