within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record ViessmannVitodens200
  extends ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties(
    P_gs_nom=26000,
    f_effPth=[0,273.15 + 10,273.15 + 30,273.15 + 60; 0,0,0,0; 0.2,0.2,0.2,0.18; 0.5,0.5,0.5,0.45; 1,1,1,0.91],
    u_min=0.2,
    T_inMin=273.15,
    T_inMax=373.15,
    V_int=0.05,
    riseTime=120);

  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end ViessmannVitodens200;
