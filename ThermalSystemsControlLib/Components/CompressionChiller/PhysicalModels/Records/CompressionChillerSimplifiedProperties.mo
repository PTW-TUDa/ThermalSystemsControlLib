within ThermalSystemsControlLib.Components.CompressionChiller.PhysicalModels.Records;
record CompressionChillerSimplifiedProperties "Basic parameter record for compression chiller models"
      extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Power P_el_nom "Maximum electric power defined as nominal electric power";
  parameter Real f_EER[:,:]
    "Efficiency table matrix for availble thermal cooling power normalized to P_el_nom (grid T_Feed_Temperature = first column, grid T_in_Recooling = first row)";
  parameter Real u_min "Minimum operation point" annotation (Dialog(group="Operating Conditions"));
  parameter SI.Temperature T_Recooling_min "Minimal cool instream temperature";
  parameter SI.Temperature T_Recooling_max "Maximal cool instream temperature";
  parameter SI.Volume V_int_cool "Internal mixin volume";
  parameter SI.Time riseTime "Rise time of the filter (time to reach 99.6 % of the nominal operating point)";
end CompressionChillerSimplifiedProperties;
