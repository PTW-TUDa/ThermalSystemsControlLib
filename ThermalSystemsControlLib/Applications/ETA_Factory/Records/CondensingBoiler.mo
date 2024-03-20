within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record CondensingBoiler
  extends ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records.GasBoilerProperties(
    P_gas_nominal=26e3,
    f_effPth=[0,273.15 + 10,273.15 + 30,273.15 + 60; 0.2,1,1,0.95; 1,1,1,0.95],
    u_min=0.2,
    T_return_min=273.15,
    T_return_max=353.15,
    V=0.05,
    riseTime=180);

  annotation(defaultComponentPrefixes = "parameter", Icon(graphics));
end CondensingBoiler;
