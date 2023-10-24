within ThermalSystemsControlLib.Applications.ETA_Factory;
function MATLAB_fileConverter

  input String filename="ETAFactory_HeatingSystems_VSI.mat" "File to be converted" annotation (Dialog(__Dymola_loadSelector(filter="Matlab files (*.mat)",caption="Select the results trajectory file")));
  input String varOrigNames[:]={"Time","Strategy.controlHNHT.hnhtControl.bSetStatusOn_CHP1",
  "Strategy.controlHNHT.hnhtControl.bSetStatusOn_CHP2",
  "Strategy.controlHNHT.hnhtControl.bSetStatusOn_CondensingBoiler",
  "Strategy.controlHNHT.hnhtControl.bSetStatusOn_VSIStorage",
  "Strategy.hnhtState.fMidTemperature",
  "Strategy.hnltState.fMidTemperature",
  "Strategy.hnhtState.fLowerTemperature_ActiveStorage"} "Variable names/headers in the file in modelica syntax";
  input String varReNames[:]={"Time","bSetStatusOn_CHP1",
  "bSetStatusOn_CHP2",
  "bSetStatusOn_CondensingBoiler",
  "bSetStatusOn_VSIStorage",
  "HNHT_Buffer_T_Mid",
  "HNLT_Buffer_T_Mid",
  "HNHT_ActiveStorage_T_Low"}
  "Variable names which will appear in the MATLAB results file";
  input String outputFilename="Results_TSCL_ETA_HNHT_VSI.mat";
protected
  Integer noRows "Number of rows in the trajectory being converted";
  Integer noColumn=12 "Number of columns in the trajectory being converted";
  Real data[:,:] "Data read in from trajectory file";
  Real dataDump[:,:] "Sacrificial dump variable for writeMatrix command";
  Integer i=2 "Loop counter";
algorithm
  noRows := DymolaCommands.Trajectories.readTrajectorySize(filename);
  data := DymolaCommands.Trajectories.readTrajectory(
  filename,
  varOrigNames,
  noRows);
  data := transpose(data);
  noColumn := size(data, 2);
  while i <= noColumn loop
  dataDump := [data[:, 1],data[:, i]];
  if i == 2 then
  DymolaCommands.MatrixIO.writeMatrix(
  outputFilename,
  varReNames[i],
  dataDump);
  else
  DymolaCommands.MatrixIO.writeMatrix(
  outputFilename,
  varReNames[i],
  dataDump,
  true);
  end if;
  i := i + 1;
  end while;
  annotation (Documentation(info="<html>
<p>Reference: https://www.claytex.com/wp-content/uploads/2017/09/simpleMATLAB_fileConverter-2.pdf</p>
</html>"));
end MATLAB_fileConverter;
