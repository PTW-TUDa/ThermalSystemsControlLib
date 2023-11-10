within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records;
record HeatExchanger_Type1_Properties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U "Coefficient of heat transfer";
  parameter Modelica.SIunits.Area A "Heat Exchange Area";
  parameter Modelica.SIunits.Volume V1 "Volume Stream 1";
  parameter Modelica.SIunits.Volume V2 "Volume Stream 2";
end HeatExchanger_Type1_Properties;
