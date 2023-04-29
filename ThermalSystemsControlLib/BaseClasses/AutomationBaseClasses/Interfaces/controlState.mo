within ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces;
connector controlState
  Boolean bStatusOn;
  Integer nAccessMode;
  ThermalSystemsControlLib.BaseClasses.AutomationBaseClasses.Interfaces.Enum_AccessMode sAccessMode;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Interfaces holding all variables for \"controlState\" data structure <a href=\"ThermalSystemsControlLib.UsersGuide.References\">[FUHR22]</a>.</p>
</html>"));
end controlState;
