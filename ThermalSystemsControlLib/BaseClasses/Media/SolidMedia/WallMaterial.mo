within ThermalSystemsControlLib.BaseClasses.Media.SolidMedia;
record WallMaterial
  parameter Modelica.SIunits.Density rho "Constant density of wall material";
  parameter Modelica.SIunits.ThermalConductivity lambda_h
    "Constant specific thermal conductivity of wall material";
  parameter Modelica.SIunits.SpecificHeatCapacity c_h
    "Constant specific heat capacity of wall material";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end WallMaterial;
