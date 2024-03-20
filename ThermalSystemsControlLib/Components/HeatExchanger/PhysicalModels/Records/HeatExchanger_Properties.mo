within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records;
record HeatExchanger_Properties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter Modelica.SIunits.CoefficientOfHeatTransfer U "Coefficient of heat transfer";
  parameter Modelica.SIunits.Area A "Heat Exchange Area";
  parameter Modelica.SIunits.Volume V1 "Volume Stream 1";
  parameter Modelica.SIunits.Volume V2 "Volume Stream 2";
  parameter Modelica.SIunits.PressureDifference dp_nominal_1 "Nominal pressure difference 1";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_1 "Nominal mass flow rate 1";
  parameter Modelica.SIunits.PressureDifference dp_nominal_2 "Nominal pressure difference 2";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_2 "Nominal mass flow rate 2";
end HeatExchanger_Properties;
