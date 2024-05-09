within ThermalSystemsControlLib.Applications.ETA_Factory.Strategies.Interfaces;
model localSetParametersStrategy_FMUConnector
    extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  parameter Real bProductionModeActivated=1 annotation(Evaluate=false);
  parameter Real bHeatingModeActivated=1 annotation(Evaluate=false);

  localSetParametersStrategy localSetParametersStrategy1 annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.RealToBoolean R2B_bProductionModeActivated(threshold=0.1) annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Math.RealToBoolean R2B_bHeatingModeActivated(threshold=0.1) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
equation
  //convert real to boolean because eta utility can only handle reals
  R2B_bProductionModeActivated.u = bProductionModeActivated;
  localSetParametersStrategy1.bProductionModeActivated = R2B_bProductionModeActivated.y;
  R2B_bHeatingModeActivated.u = bHeatingModeActivated;
  localSetParametersStrategy1.bHeatingModeActivated = R2B_bHeatingModeActivated.y;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end localSetParametersStrategy_FMUConnector;
