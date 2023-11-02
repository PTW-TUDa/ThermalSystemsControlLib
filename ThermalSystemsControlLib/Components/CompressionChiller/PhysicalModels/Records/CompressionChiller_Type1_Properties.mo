within ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records;
record CompressionChiller_Type1_Properties "Basic parameter record for compression chiller models"
    extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Power P_el_nom "Maximum electric power defined as nominal electric power";
  parameter SI.Power P_th_cool_nom "Maximum thermal cooling power defined as nominal thermal cooling power";
  parameter Real f_PthMax[:,:]
    "Efficiency table matrix for availble thermal cooling power normalized to P_th_cool_nom (grid T_in_cool = first column, grid T_in_heat = first row)";
  parameter Real f_PelMax[:,:]
    "Efficiency table matrix for reqired electric power normalized to P_el_nom (grid T_in_cool = first column, grid T_in_heat = first row)";
  parameter Real f_Pel_partLoad[:,:]
    "Part load behavior of required electric power normalized to P_el_nom (grid u = first column)";
  parameter Real u_min "Minimum operation point" annotation (Dialog(group="Operating Conditions"));
  parameter SI.Temperature T_in_cool_min "Minimal cool instream temperature";
  parameter SI.Temperature T_in_cool_max "Maximal cool instream temperature";
  parameter SI.Temperature T_in_heat_min "Minimal heated instream temperature";
  parameter SI.Temperature T_in_heat_max "Maximal heated instream temperature";
  parameter SI.Volume V_int_cool "Internal Cool Mixing Volume";
  parameter SI.Volume V_int_heat "Internal Heat Mixing Volume";
  parameter SI.Time riseTime "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";
end CompressionChiller_Type1_Properties;
