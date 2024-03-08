within ThermalSystemsControlLib.Components.CombinedHeatPower.PhysicalModels.Records;
record CombinedHeatPower_Properties "Basic parameter record for CHP models"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Power P_el_nom "Nominal electrical power ";
  parameter SI.Power P_gs_nom "nominal gas consumption";
  parameter Real f_effPth[:,:]
    "Efficiency table matrix for thermal power normalized to nominal gas power (grid u = first column, grid T_in = first row)";
  parameter Real u_min "Minimum operation point";
  parameter SI.Temperature T_inMin "Min temperature";
  parameter SI.Temperature T_inMax "Max temperature";
  parameter SI.Volume V_int "Internal Mixing Volume";
  parameter SI.Time riseTime "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";

  annotation(defaultComponentPrefixes = "parameter");
end CombinedHeatPower_Properties;
