within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records;
record HeatExchanger_Type2_Properties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U "Coefficient of heat transfer";
  parameter Modelica.SIunits.Area A "Heat Exchange Area";
  parameter Modelica.SIunits.Volume V1 "Volume Stream 1";
  parameter Modelica.SIunits.Volume V2 "Volume Stream 2";
  parameter Modelica.SIunits.HeatFlowRate P_th_nom "Nominal thermal power";
  parameter Modelica.SIunits.TemperatureDifference dT_min "Minimal temperature difference between outlets";
  parameter Boolean control_ReturnTemperature=false "=true for controlling return temperature at heat source side" annotation(Evaluate = true);
end HeatExchanger_Type2_Properties;
