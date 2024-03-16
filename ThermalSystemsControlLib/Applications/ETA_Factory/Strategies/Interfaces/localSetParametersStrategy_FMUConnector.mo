within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Interfaces;
model localSetParametersStrategy_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Real bProductionModeActivated=0 annotation(Evaluate=false);

  localSetParametersStrategy localSetParametersStrategy1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.RealToBoolean R2B_bProductionModeActivated(threshold=0.1) annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
equation
  //convert real to boolean because eta utility can only handle reals
  R2B_bProductionModeActivated.u = bProductionModeActivated;
  localSetParametersStrategy1.bProductionModeActivated = R2B_bProductionModeActivated.y;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end localSetParametersStrategy_FMUConnector;
