within ThermalSystemsControlLib.Components.Pipes.PhysicalModels;
model Pipe "Simple pipe considering pressure and temperature differences"
  extends ThermalSystemsControlLib.BaseClasses.Icons.Pipe_Icon;
  extends ThermalSystemsControlLib.BaseClasses.FluidBaseClasses.FluidTwoPort;
  //##PARAMETERS##
  replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium annotation (__Dymola_choicesAllMatching=true);
  parameter Boolean use_PressureLoss = true "= true to consider heat loss to ambient" annotation(Evaluate = true, choices(checkBox=true));
  parameter Boolean use_HeatLoss = false "= true to consider heat loss to ambient" annotation(Evaluate = true, choices(checkBox=true));
  parameter SI.Diameter length "Pipe length";
  parameter SI.Diameter diameter "Pipe diameter";

  //Pressure loss
  parameter Real ceta_Bending = 0.1 "Pressure loss coefficient of a 90° bending" annotation(Dialog(group = "Pressure loss", enable = use_PressureLoss));
  parameter Integer n_Bending "Number of 90° pipe bendings" annotation(Dialog(group="Pressure loss", enable = use_PressureLoss));

  //Heat loss
  replaceable parameter ThermalSystemsControlLib.BaseClasses.Media.SolidMedia.Steel Material_Pipe constrainedby ThermalSystemsControlLib.BaseClasses.Media.SolidMedia.WallMaterial annotation (
    choicesAllMatching=true,
    Dialog(group="Heat loss", enable=use_HeatLoss));
  replaceable parameter ThermalSystemsControlLib.BaseClasses.Media.SolidMedia.MineralWool Material_Insulation constrainedby ThermalSystemsControlLib.BaseClasses.Media.SolidMedia.WallMaterial "Insulation material" annotation (
    choicesAllMatching=true,
    Dialog(group="Heat loss", enable=use_HeatLoss));
  parameter SI.Thickness s_pipe=0.1 "Thickness of pipe" annotation(Dialog(group = "Heat loss", enable = use_HeatLoss));
  parameter SI.Thickness s_ins=0.1 "Thickness of insulation" annotation(Dialog(group = "Heat loss", enable = use_HeatLoss));
  parameter SI.Temperature T_ambient=293.15   "Ambient temperature" annotation(Dialog(group = "Heat loss", enable = use_HeatLoss));

  //##COMPONENTS##
  ThermalSystemsControlLib.Components.Pipes.PhysicalModels.BaseClasses.Generic_HeatLoss generic_HeatLoss(
    redeclare package Medium = Medium,
    V=Con.pi*(diameter/2)^2*length,
    R_th=R_th,
    T_ambient=T_ambient) if use_HeatLoss annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  ThermalSystemsControlLib.Components.Pipes.PhysicalModels.BaseClasses.Generic_PressureLoss generic_PressureLoss(
    redeclare package Medium = Medium,
    length=length,
    diameter=diameter,
    ceta_Bending=ceta_Bending,
    n_Bending=n_Bending) if use_PressureLoss annotation (Placement(transformation(extent={{40,-10},{60,10}})));
protected
    parameter SI.ThermalResistance R_th = (log((s_pipe+diameter/2)/(diameter/2))/Material_Pipe.lambda_h+log((s_pipe+s_ins+diameter/2)/(s_pipe+diameter/2))/Material_Insulation.lambda_h)*1/(2*Con.pi*length) if use_HeatLoss "Thermal resistance of pipe (incl. insulation material)";
equation
  if use_PressureLoss and use_HeatLoss then
    connect(generic_PressureLoss.port_b, port_b);
    connect(generic_HeatLoss.port_b, generic_PressureLoss.port_a);
    connect(generic_HeatLoss.port_a, port_a);
  elseif use_PressureLoss and not use_HeatLoss then
    connect(generic_PressureLoss.port_a, port_a);
    connect(generic_PressureLoss.port_b, port_b);
  elseif not use_PressureLoss and use_HeatLoss then
    connect(generic_HeatLoss.port_b, port_b);
    connect(generic_HeatLoss.port_a, port_a);
  else
    connect(port_a,port_b);
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The model considers pressure losses because of wall friction and bendings. The default value for 90&deg; pipe bending can be applied through a parameter. To consider pressure losses through wall friction, laminar and turbulent flow models are distinguished. For laminar flows the pipe friction number is calculated by the following equation: lambda = 64/Re. In the turbulent area, the Blasius approach for circualr pipe is used. It is assumed, that the dynamic viscosity of the fluid does not change during the simulation and is calculated from the Medium&apos;s default values. If heat losses to the ambient should be taken intpo account, this option can be switched on via the corresponding parameter. The thermal resistance does only consider heat conduction. The ambient temperature is assumed to be constant and can be set by a parameter. The model uses a steady state approach without storing mass or energy. Optional calculation of heat loss to the ambient. </p>
</html>"));
end Pipe;
