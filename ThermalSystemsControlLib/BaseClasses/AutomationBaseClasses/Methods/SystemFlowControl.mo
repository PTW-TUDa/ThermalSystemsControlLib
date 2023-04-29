within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Methods;
model SystemFlowControl
  extends ThermalSystemsControlLib.BaseClasses.Icons.Methods_Icon;
  parameter Integer nComponents "Number of following states without stand-by";

  Modelica.Blocks.Interfaces.BooleanInput bSetStatusOn annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanVectorInput bStatusOn_Components[nComponents] annotation (Placement(transformation(extent={{-20,90},{20,130}})));
  Modelica.Blocks.Interfaces.BooleanOutput bSetStatusOn_Components[nComponents] annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Interfaces.systemState systemState annotation (Placement(transformation(extent={{80,100},{100,120}})));
algorithm
   for i in 1:nComponents loop
     if bSetStatusOn then
       if i>1 then
         bSetStatusOn_Components[i] :=pre(bStatusOn_Components[i - 1]) and bSetStatusOn;
         systemState.nOperatingState :=i;
       else
         bSetStatusOn_Components[i] :=bSetStatusOn;
         systemState.nOperatingState :=0;
       end if;
     else
       if i<nComponents then
         bSetStatusOn_Components[i] :=pre(bStatusOn_Components[i + 1]) or bSetStatusOn;
       else
         bSetStatusOn_Components[i] :=bSetStatusOn;
       end if;
       systemState.nOperatingState :=i;
     end if;
   end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Method to enable a flow control for subsystems <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[BORS23]</a>.</p>
</html>"));
end SystemFlowControl;
