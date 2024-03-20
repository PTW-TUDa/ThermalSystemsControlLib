within ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records;
record CombinedHeatPower_Properties "Basic parameter record for CHP models"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Power P_el_nominal "Nominal electrical power ";
  parameter SI.Power P_gas_nominal "nominal gas consumption";
  parameter Real f_effPth[:,:]
    "Efficiency table matrix for thermal power normalized to nominal gas power (grid u = first column, grid T_in = first row)";
  parameter Real u_min "Minimum operation point";
  parameter SI.Temperature T_return_min "Min temperature";
  parameter SI.Temperature T_return_max "Max temperature";
  parameter SI.Volume V "Internal Mixing Volume";
  parameter SI.Time riseTime "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";
  parameter SI.PressureDifference dp_nominal "Nominal pressure difference";
  parameter SI.MassFlowRate m_flow_nominal "Nominal mass flow rate";

  annotation(defaultComponentPrefixes = "parameter");
end CombinedHeatPower_Properties;
