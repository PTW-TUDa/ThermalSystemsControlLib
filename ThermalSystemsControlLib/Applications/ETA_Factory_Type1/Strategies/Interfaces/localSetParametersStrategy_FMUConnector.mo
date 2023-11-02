within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Strategies.Interfaces;
model localSetParametersStrategy_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Boolean bProductionModeActivated=false annotation(Evaluate=false);

  localSetParametersStrategy localSetParametersStrategy1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  localSetParametersStrategy1.bProductionModeActivated = bProductionModeActivated;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end localSetParametersStrategy_FMUConnector;
