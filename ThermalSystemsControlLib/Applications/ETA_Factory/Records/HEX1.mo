within ThermalSystemsControlLib.Applications.ETA_Factory.Records;
record HEX1
  extends Components.HeatExchanger.PhysicalModels.Records.HeatExchanger_Properties(
    U=1490,
  A=1.12,
  V1=0.0015,
  V2=0.00123,
  dp_nominal_1=5040,
  dp_nominal_2=4640,
  m_flow_nominal_1=0.47,
  m_flow_nominal_2=0.47);
end HEX1;
