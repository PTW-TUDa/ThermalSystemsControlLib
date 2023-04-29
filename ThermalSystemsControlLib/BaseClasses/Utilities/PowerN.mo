within ThermalSystemsControlLib.BaseClasses.Utilities;
model PowerN
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real n;
equation
  y = abs(u)^n;
  annotation(Diagram(coordinateSystem(                                         preserveAspectRatio = true, initialScale=0.1)));
end PowerN;
