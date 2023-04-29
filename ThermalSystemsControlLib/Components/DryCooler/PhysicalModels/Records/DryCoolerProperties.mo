within ThermalSystemsControlLib.Components.DryCooler.PhysicalModels.Records;
record DryCoolerProperties
  extends ThermalSystemsControlLib.BaseClasses.Icons.Record_Icon;
  //## parameters ##
  replaceable parameter ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records.HeatExchangerProperties deviceData_HeatExchanger constrainedby ThermalSystemsControlLib.Components.HeatExchanger.PhysicalModels.Records.HeatExchangerProperties annotation (choicesAllMatching=true);
  replaceable parameter ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties deviceData_Ventilation constrainedby ThermalSystemsControlLib.Components.Pumps.PhysicalModels.Records.IdealPumpProperties annotation (choicesAllMatching=true);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DryCoolerProperties;
