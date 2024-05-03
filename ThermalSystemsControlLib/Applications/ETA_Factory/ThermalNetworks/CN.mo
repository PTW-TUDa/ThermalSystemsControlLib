within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model CN
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=288.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-30})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,0})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Systems.CN.CentralMachineCoolingSystem CentralMachineCoolingSystem annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={90,0})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.cnControl   controlAutomatic annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=30,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=30,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-50})));
  Systems.CN.eChillerSystem eChillerSystem annotation (Placement(transformation(extent={{-60,10},{-40,-10}})));
  Systems.HNLT.HVFAStorageSystem HVFASystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{-100,10},{-80,-10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                     annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)                                     annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,42})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-70,-38})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-50,80})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,-80})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,0.01; 14400,4; 15300,4; 16200,4; 17100,4; 18000,4; 18900,4; 19800,4; 20700,4; 21600,4; 22500,4; 23400,4; 24300,4; 25200,4; 26100,4; 27000,4; 27900,4; 28800,4; 29700,4; 30600,4; 31500,4; 32400,4; 33300,4; 34200,4; 35100,4; 36000,4; 36900,4; 37800,4; 38700,4; 39600,4; 40500,4; 41400,4; 42300,4; 43200,2; 44100,2; 45000,2; 45900,2; 46800,2; 47700,2; 48600,2; 49500,
        2; 50400,2; 51300,2; 52200,2; 53100,2; 54000,2; 54900,2; 55800,2; 56700,2; 57600,2; 58500,2; 59400,2; 60300,2; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0; 89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0;
        99000,0; 99900,0.01; 100800,4; 101700,4; 102600,4; 103500,4; 104400,4; 105300,4; 106200,4; 107100,4; 108000,4; 108900,4; 109800,4; 110700,4; 111600,4; 112500,4; 113400,4; 114300,4; 115200,4; 116100,4; 117000,4; 117900,4; 118800,4; 119700,4; 120600,4; 121500,4; 122400,4; 123300,4; 124200,4; 125100,4; 126000,4; 126900,4; 127800,4; 128700,4; 129600,2; 130500,2; 131400,2; 132300,2; 133200,2; 134100,2; 135000,2; 135900,2; 136800,2; 137700,2; 138600,2; 139500,2; 140400,2; 141300,2; 142200,2;
        143100,2; 144000,2; 144900,2; 145800,2; 146700,2; 147600,0; 148500,0; 149400,0; 150300,0; 151200,0; 152100,0; 153000,0; 153900,0; 154800,0; 155700,0; 156600,0; 157500,0; 158400,0; 159300,0; 160200,0; 161100,0; 162000,0; 162900,0; 163800,0; 164700,0; 165600,0; 166500,0; 167400,0; 168300,0; 169200,0; 170100,0; 171000,0; 171900,0; 172800,0; 173700,0; 174600,0; 175500,0; 176400,0; 177300,0; 178200,0; 179100,0; 180000,0; 180900,0; 181800,0; 182700,0; 183600,0; 184500,0; 185400,0; 186300,0.01;
        187200,4; 188100,4; 189000,4; 189900,4; 190800,4; 191700,4; 192600,4; 193500,4; 194400,4; 195300,4; 196200,4; 197100,4; 198000,4; 198900,4; 199800,4; 200700,4; 201600,4; 202500,4; 203400,4; 204300,4; 205200,4; 206100,4; 207000,4; 207900,4; 208800,4; 209700,4; 210600,4; 211500,4; 212400,4; 213300,4; 214200,4; 215100,4; 216000,2; 216900,2; 217800,2; 218700,2; 219600,2; 220500,2; 221400,2; 222300,2; 223200,2; 224100,2; 225000,2; 225900,2; 226800,2; 227700,2; 228600,2; 229500,2; 230400,2;
        231300,2; 232200,2; 233100,2; 234000,0; 234900,0; 235800,0; 236700,0; 237600,0; 238500,0; 239400,0; 240300,0; 241200,0; 242100,0; 243000,0; 243900,0; 244800,0; 245700,0; 246600,0; 247500,0; 248400,0; 249300,0; 250200,0; 251100,0; 252000,0; 252900,0; 253800,0; 254700,0; 255600,0; 256500,0; 257400,0; 258300,0; 259200,0; 260100,0; 261000,0; 261900,0; 262800,0; 263700,0; 264600,0; 265500,0; 266400,0; 267300,0; 268200,0; 269100,0; 270000,0; 270900,0; 271800,0; 272700,0.01; 273600,4; 274500,4;
        275400,4; 276300,4; 277200,4; 278100,4; 279000,4; 279900,4; 280800,4; 281700,4; 282600,4; 283500,4; 284400,4; 285300,4; 286200,4; 287100,4; 288000,4; 288900,4; 289800,4; 290700,4; 291600,4; 292500,4; 293400,4; 294300,4; 295200,4; 296100,4; 297000,4; 297900,4; 298800,4; 299700,4; 300600,4; 301500,4; 302400,2; 303300,2; 304200,2; 305100,2; 306000,2; 306900,2; 307800,2; 308700,2; 309600,2; 310500,2; 311400,2; 312300,2; 313200,2; 314100,2; 315000,2; 315900,2; 316800,2; 317700,2; 318600,2;
        319500,2; 320400,0; 321300,0; 322200,0; 323100,0; 324000,0; 324900,0; 325800,0; 326700,0; 327600,0; 328500,0; 329400,0; 330300,0; 331200,0; 332100,0; 333000,0; 333900,0; 334800,0; 335700,0; 336600,0; 337500,0; 338400,0; 339300,0; 340200,0; 341100,0; 342000,0; 342900,0; 343800,0; 344700,0; 345600,0; 346500,0; 347400,0; 348300,0; 349200,0; 350100,0; 351000,0; 351900,0; 352800,0; 353700,0; 354600,0; 355500,0; 356400,0; 357300,0; 358200,0; 359100,0.01; 360000,4; 360900,4; 361800,4; 362700,4;
        363600,4; 364500,4; 365400,4; 366300,4; 367200,4; 368100,4; 369000,4; 369900,4; 370800,4; 371700,4; 372600,4; 373500,4; 374400,4; 375300,4; 376200,4; 377100,4; 378000,4; 378900,4; 379800,4; 380700,4; 381600,4; 382500,4; 383400,4; 384300,4; 385200,4; 386100,4; 387000,4; 387900,4; 388800,2; 389700,2; 390600,2; 391500,2; 392400,2; 393300,2; 394200,2; 395100,2; 396000,2; 396900,2; 397800,2; 398700,2; 399600,2; 400500,2; 401400,2; 402300,2; 403200,2; 404100,2; 405000,2; 405900,2; 406800,0;
        407700,0; 408600,0; 409500,0; 410400,0; 411300,0; 412200,0; 413100,0; 414000,0; 414900,0; 415800,0; 416700,0; 417600,0; 418500,0; 419400,0; 420300,0; 421200,0; 422100,0; 423000,0; 423900,0; 424800,0; 425700,0; 426600,0; 427500,0; 428400,0; 429300,0; 430200,0; 431100,0; 432000,0; 432900,0; 433800,0; 434700,0; 435600,0; 436500,0; 437400,0; 438300,0; 439200,0; 440100,0; 441000,0; 441900,0; 442800,0; 443700,0; 444600,0; 445500,0; 446400,0; 447300,0; 448200,0; 449100,0; 450000,0; 450900,0;
        451800,0; 452700,0; 453600,0; 454500,0; 455400,0; 456300,0; 457200,0; 458100,0; 459000,0; 459900,0; 460800,0; 461700,0; 462600,0; 463500,0; 464400,0; 465300,0; 466200,0; 467100,0; 468000,0; 468900,0; 469800,0; 470700,0; 471600,0; 472500,0; 473400,0; 474300,0; 475200,0; 476100,0; 477000,0; 477900,0; 478800,0; 479700,0; 480600,0; 481500,0; 482400,0; 483300,0; 484200,0; 485100,0; 486000,0; 486900,0; 487800,0; 488700,0; 489600,0; 490500,0; 491400,0; 492300,0; 493200,0; 494100,0; 495000,0;
        495900,0; 496800,0; 497700,0; 498600,0; 499500,0; 500400,0; 501300,0; 502200,0; 503100,0; 504000,0; 504900,0; 505800,0; 506700,0; 507600,0; 508500,0; 509400,0; 510300,0; 511200,0; 512100,0; 513000,0; 513900,0; 514800,0; 515700,0; 516600,0; 517500,0; 518400,0; 519300,0; 520200,0; 521100,0; 522000,0; 522900,0; 523800,0; 524700,0; 525600,0; 526500,0; 527400,0; 528300,0; 529200,0; 530100,0; 531000,0; 531900,0; 532800,0; 533700,0; 534600,0; 535500,0; 536400,0; 537300,0; 538200,0; 539100,0;
        540000,0; 540900,0; 541800,0; 542700,0; 543600,0; 544500,0; 545400,0; 546300,0; 547200,0; 548100,0; 549000,0; 549900,0; 550800,0; 551700,0; 552600,0; 553500,0; 554400,0; 555300,0; 556200,0; 557100,0; 558000,0; 558900,0; 559800,0; 560700,0; 561600,0; 562500,0; 563400,0; 564300,0; 565200,0; 566100,0; 567000,0; 567900,0; 568800,0; 569700,0; 570600,0; 571500,0; 572400,0; 573300,0; 574200,0; 575100,0; 576000,0; 576900,0; 577800,0; 578700,0; 579600,0; 580500,0; 581400,0; 582300,0; 583200,0;
        584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{48,-12},{58,-2}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation (Placement(transformation(extent={{64,4},{74,14}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-108},{-90,-88}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Blocks.Math.Gain gain(k=1000) annotation (Placement(transformation(extent={{66,-10},{72,-4}})));
equation
   //states
  localState1.fUpperTemperature =BufferStorage.localStorageState.fUpperTemperature;
  localState1.fMidTemperature =BufferStorage.localStorageState.fMidTemperature;
  localState1.fLowerTemperature =BufferStorage.localStorageState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage =HVFASystem.localStorageState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage =HVFASystem.localStorageState.fLowerTemperature;

  //controls
  CentralMachineCoolingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CentralMachineCoolingSystem.fSetPointAutomatic = 3;
  HVFASystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HVFASystem;
  HVFASystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  HVFASystem.fSetPointAutomatic = 40;
  HVFASystem.bLoadingAutomatic = controlAutomatic.bLoading_HVFASystem;
  eChillerSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_eChiller;
  eChillerSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  eChillerSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  ambientState.fOutsideTemperature = eChillerSystem.fAmbientTemperature;
  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}},
                                                                                                            color={0,0,0}));
  connect(port_b_HNLT_Producer, BufferStorage.port_b) annotation (Line(points={{-100,60},{0,60},{0,10}}, color={0,127,255}));
  connect(pipe10.port_b, HVFASystem.port_a1) annotation (Line(points={{-60,-90},{-84,-90},{-84,-10}}, color={0,127,255}));
  connect(pipe7.port_a, HVFASystem.port_b2) annotation (Line(points={{-80,-48},{-80,-10},{-80,-10}}, color={0,127,255}));
  connect(pipe9.port_a, HVFASystem.port_b1) annotation (Line(points={{-60,70},{-84,70},{-84,10}}, color={0,127,255}));
  connect(pipe9.port_b, BufferStorage.port_b) annotation (Line(points={{-40,70},{0,70},{0,10}}, color={0,127,255}));
  connect(pipe6.port_b, HVFASystem.port_a2) annotation (Line(points={{-80,52},{-80,10}}, color={0,127,255}));
  connect(pipe6.port_a, BufferStorage.port_b) annotation (Line(points={{-60,52},{0,52},{0,10}}, color={0,127,255}));
  connect(pipe4.port_a, BufferStorage.port_b) annotation (Line(points={{-20,40},{0,40},{0,10}}, color={0,127,255}));
  connect(pipe4.port_b, eChillerSystem.port_a) annotation (Line(points={{-40,40},{-40,10}}, color={0,127,255}));
  connect(eChillerSystem.port_b, pipe5.port_a) annotation (Line(points={{-40,-10},{-40,-20}}, color={0,127,255}));
  connect(pipe1.port_b, CentralMachineCoolingSystem.port_a) annotation (Line(points={{80,-60},{100,-60},{100,-10}}, color={0,127,255}));
  connect(CentralMachineCoolingSystem.port_b, pipe8.port_a) annotation (Line(points={{100,10},{100,60},{80,60}}, color={0,127,255}));
  connect(pipe8.port_b, BufferStorage.port_b) annotation (Line(points={{60,60},{0,60},{0,10}}, color={0,127,255}));
  connect(greaterThreshold.y, CentralMachineCoolingSystem.bSetStatusOnAutomatic) annotation (Line(points={{74.5,9},{78,9}},               color={255,0,255}));
  connect(pipe10.port_a, BufferStorage.port_a) annotation (Line(points={{-40,-90},{0,-90},{0,-10}}, color={0,127,255}));
  connect(pipe1.port_a, BufferStorage.port_a) annotation (Line(points={{60,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(pipe5.port_b, BufferStorage.port_a) annotation (Line(points={{-20,-20},{0,-20},{0,-10}}, color={0,127,255}));
  connect(pipe7.port_b, BufferStorage.port_a) annotation (Line(points={{-60,-48},{0,-48},{0,-10}}, color={0,127,255}));
  connect(port_a_HNLT_Producer, BufferStorage.port_a) annotation (Line(points={{-100,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(boundary.ports[1], BufferStorage.port_a) annotation (Line(points={{30,-20},{30,-10},{0,-10}}, color={0,127,255}));
  connect(port_b_HNLT_Consumer, BufferStorage.port_a) annotation (Line(points={{-100,-98},{0,-98},{0,-10}}, color={0,127,255}));
  connect(port_a_HNLT_Consumer, BufferStorage.port_b) annotation (Line(points={{-100,100},{0,100},{0,10}}, color={0,127,255}));
  connect(combiTimeTable.y[1], gain.u) annotation (Line(points={{58.5,-7},{62.25,-7},{62.25,-7},{65.4,-7}}, color={0,0,127}));
  connect(gain.y, CentralMachineCoolingSystem.fHeatFlowRate) annotation (Line(points={{72.3,-7},{75.15,-7},{75.15,-7},{78,-7}}, color={0,0,127}));
  connect(greaterThreshold.u, gain.u) annotation (Line(points={{63,9},{60,9},{60,-7},{65.4,-7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CN;
