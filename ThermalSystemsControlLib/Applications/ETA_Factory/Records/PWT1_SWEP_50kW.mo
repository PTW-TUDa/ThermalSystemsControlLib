within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record PWT1_SWEP_50kW
  extends Components.HeatExchanger.PhysicalModels.Records.HeatExchangerProperties(
  U=1700,
  A=1.12,
  V1=0.0015,
  V2=0.00123);
end PWT1_SWEP_50kW;
