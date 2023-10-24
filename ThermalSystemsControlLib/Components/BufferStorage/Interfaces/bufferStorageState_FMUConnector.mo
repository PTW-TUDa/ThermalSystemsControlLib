within ThermalSystemsControlLib.Components.BufferStorage.Interfaces;
model bufferStorageState_FMUConnector
  extends ThermalSystemsControlLib.BaseClasses.Icons.Interface_Icon;
  output Real fUpperTemperature;
  output Real fMidTemperature;
  output Real fLowerTemperature;

  input BufferStorageState localState1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation
  fUpperTemperature = localState1.fUpperTemperature;
  fMidTemperature = localState1.fMidTemperature;
  fLowerTemperature = localState1.fLowerTemperature;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end bufferStorageState_FMUConnector;
