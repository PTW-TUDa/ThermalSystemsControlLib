within ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records;
record HeatExchanger_Properties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U "Coefficient of heat transfer";
  parameter Modelica.Units.SI.Area A "Heat Exchange Area";
  parameter Modelica.Units.SI.Volume V1 "Volume Stream 1";
  parameter Modelica.Units.SI.Volume V2 "Volume Stream 2";
  parameter Modelica.Units.SI.PressureDifference dp_nominal_1 "Nominal pressure difference 1";
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal_1 "Nominal mass flow rate 1";
  parameter Modelica.Units.SI.PressureDifference dp_nominal_2 "Nominal pressure difference 2";
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal_2 "Nominal mass flow rate 2";
end HeatExchanger_Properties;
