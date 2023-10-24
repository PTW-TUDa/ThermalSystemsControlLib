within ThermalSystemsControlLib.Components.HybridCooler.PhysicalModels.Records;
record HybridCoolerProperties
    extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  parameter SI.Temperature T_water_in_min "Min temperature";
  parameter SI.Temperature T_water_in_max "Max temperature";
  parameter SI.MassFlowRate m_flow_nom;
  parameter SI.Area A;
  parameter SI.CoefficientOfHeatTransfer U;
  parameter SI.Volume V1;
  parameter SI.Volume V2;

  //## parameters ##
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData_Ventilation constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (choicesAllMatching=true);
  annotation(defaultComponentPrefixes = "parameter",
               Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HybridCoolerProperties;
