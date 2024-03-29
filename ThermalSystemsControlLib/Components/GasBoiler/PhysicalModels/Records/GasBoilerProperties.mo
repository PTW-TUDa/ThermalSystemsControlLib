within ThermalSystemsControlLib.Components.GasBoiler.PhysicalModels.Records;
record GasBoilerProperties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Power P_gas_nominal "nominal gas consumption";
  parameter Real f_effPth[:,:]
    "Efficiency table matrix for thermal power normalized to nominal gas power (grid u = first column, grid T_in = first row)";
  parameter Real u_min "Minimum operation point";
  parameter SI.Temperature T_return_min "Min temperature";
  parameter SI.Temperature T_return_max "Max temperature";
  parameter SI.Volume V "Internal Mixing Volume";
  parameter SI.Time riseTime "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";
end GasBoilerProperties;
