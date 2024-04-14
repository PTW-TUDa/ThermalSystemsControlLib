within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNHT_Only
  extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=328.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=328.15 "Start value of active storage temperature";
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CHP1System CHP1System annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CondensingBoilerSystem CondensingBoilerSystem annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CHP2System CHP2System annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.StaticHeatingSystem StaticHeatingSystem annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,0})));
  output Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{40,100},{60,120}})));
  input Interfaces.hnhtControl controlAutomatic annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{180,-40},{160,-20}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{80,80},{100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Systems.HNHT.VSIStorageSystem VSIStorageSystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{20,72},{40,52}})));
  Components.Pipes.PhysicalModels.Pipe pipe(
    use_HeatLoss=false,
    length=7.95,
    diameter=0.05,
    n_Bending=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,30})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    use_HeatLoss=false,
    length=7.95,
    diameter=0.05,
    n_Bending=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    use_HeatLoss=false,
    length=1.6,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,30})));
  Components.Pipes.PhysicalModels.Pipe pipe3(
    use_HeatLoss=false,
    length=1.6,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    use_HeatLoss=false,
    length=11.15,
    diameter=0.05,
    n_Bending=13) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,30})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    use_HeatLoss=false,
    length=11.15,
    diameter=0.05,
    n_Bending=13) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,-30})));
  Systems.HNHT.CentralMachineHeatingSystem CentralMachineHeatingSystem annotation (Placement(transformation(extent={{120,10},{140,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    use_HeatLoss=false,
    length=7.5,
    diameter=0.04,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={130,30})));
  Components.Pipes.PhysicalModels.Pipe pipe11(
    use_HeatLoss=false,
    length=7.5,
    diameter=0.04,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={130,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,70})));
  Components.Pipes.PhysicalModels.Pipe pipe15(
    use_HeatLoss=false,
    length=12,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,70})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold annotation (Placement(transformation(extent={{104,-12},{110,-6}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,-0.01; 14400,-15; 15300,-15; 16200,-15; 17100,-15; 18000,-15; 18900,-15; 19800,-15; 20700,-15; 21600,-15; 22500,-15; 23400,-15; 24300,-15; 25200,-10; 26100,-10; 27000,-10; 27900,-10; 28800,-10; 29700,-10; 30600,-10; 31500,-10; 32400,-10; 33300,-10; 34200,-10; 35100,-10; 36000,-10; 36900,-10; 37800,-10; 38700,-10; 39600,-10; 40500,-10; 41400,-10; 42300,-10;
        43200,-10; 44100,-12; 45000,-12; 45900,-12; 46800,-12; 47700,-12; 48600,-12; 49500,-12; 50400,-12; 51300,-12; 52200,-12; 53100,-12; 54000,-12; 54900,-12; 55800,-12; 56700,-12; 57600,-12; 58500,-12; 59400,-12; 60300,-12; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0;
        88200,0; 89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0; 99000,0; 99900,-0.01; 100800,-15; 101700,-15; 102600,-15; 103500,-15; 104400,-15; 105300,-15; 106200,-15; 107100,-15; 108000,-15; 108900,-15; 109800,-15; 110700,-15; 111600,-10; 112500,-10; 113400,-10; 114300,-10; 115200,-10; 116100,-10; 117000,-10; 117900,-10; 118800,-10; 119700,-10; 120600,-10; 121500,-10; 122400,-10; 123300,-10; 124200,-10; 125100,-10; 126000,-10; 126900,-10;
        127800,-10; 128700,-10; 129600,-10; 130500,-12; 131400,-12; 132300,-12; 133200,-12; 134100,-12; 135000,-12; 135900,-12; 136800,-12; 137700,-12; 138600,-12; 139500,-12; 140400,-12; 141300,-12; 142200,-12; 143100,-12; 144000,-12; 144900,-12; 145800,-12; 146700,-12; 147600,0; 148500,0; 149400,0; 150300,0; 151200,0; 152100,0; 153000,0; 153900,0; 154800,0; 155700,0; 156600,0; 157500,0; 158400,0; 159300,0; 160200,0; 161100,0; 162000,0; 162900,0; 163800,0; 164700,0; 165600,0; 166500,0; 167400,
        0; 168300,0; 169200,0; 170100,0; 171000,0; 171900,0; 172800,0; 173700,0; 174600,0; 175500,0; 176400,0; 177300,0; 178200,0; 179100,0; 180000,0; 180900,0; 181800,0; 182700,0; 183600,0; 184500,0; 185400,0; 186300,-0.01; 187200,-15; 188100,-15; 189000,-15; 189900,-15; 190800,-15; 191700,-15; 192600,-15; 193500,-15; 194400,-15; 195300,-15; 196200,-15; 197100,-15; 198000,-10; 198900,-10; 199800,-10; 200700,-10; 201600,-10; 202500,-10; 203400,-10; 204300,-10; 205200,-10; 206100,-10; 207000,-10;
        207900,-10; 208800,-10; 209700,-10; 210600,-10; 211500,-10; 212400,-10; 213300,-10; 214200,-10; 215100,-10; 216000,-10; 216900,-12; 217800,-12; 218700,-12; 219600,-12; 220500,-12; 221400,-12; 222300,-12; 223200,-12; 224100,-12; 225000,-12; 225900,-12; 226800,-12; 227700,-12; 228600,-12; 229500,-12; 230400,-12; 231300,-12; 232200,-12; 233100,-12; 234000,0; 234900,0; 235800,0; 236700,0; 237600,0; 238500,0; 239400,0; 240300,0; 241200,0; 242100,0; 243000,0; 243900,0; 244800,0; 245700,0;
        246600,0; 247500,0; 248400,0; 249300,0; 250200,0; 251100,0; 252000,0; 252900,0; 253800,0; 254700,0; 255600,0; 256500,0; 257400,0; 258300,0; 259200,0; 260100,0; 261000,0; 261900,0; 262800,0; 263700,0; 264600,0; 265500,0; 266400,0; 267300,0; 268200,0; 269100,0; 270000,0; 270900,0; 271800,0; 272700,-0.01; 273600,-15; 274500,-15; 275400,-15; 276300,-15; 277200,-15; 278100,-15; 279000,-15; 279900,-15; 280800,-15; 281700,-15; 282600,-15; 283500,-15; 284400,-10; 285300,-10; 286200,-10; 287100,
        -10; 288000,-10; 288900,-10; 289800,-10; 290700,-10; 291600,-10; 292500,-10; 293400,-10; 294300,-10; 295200,-10; 296100,-10; 297000,-10; 297900,-10; 298800,-10; 299700,-10; 300600,-10; 301500,-10; 302400,-10; 303300,-12; 304200,-12; 305100,-12; 306000,-12; 306900,-12; 307800,-12; 308700,-12; 309600,-12; 310500,-12; 311400,-12; 312300,-12; 313200,-12; 314100,-12; 315000,-12; 315900,-12; 316800,-12; 317700,-12; 318600,-12; 319500,-12; 320400,0; 321300,0; 322200,0; 323100,0; 324000,0;
        324900,0; 325800,0; 326700,0; 327600,0; 328500,0; 329400,0; 330300,0; 331200,0; 332100,0; 333000,0; 333900,0; 334800,0; 335700,0; 336600,0; 337500,0; 338400,0; 339300,0; 340200,0; 341100,0; 342000,0; 342900,0; 343800,0; 344700,0; 345600,0; 346500,0; 347400,0; 348300,0; 349200,0; 350100,0; 351000,0; 351900,0; 352800,0; 353700,0; 354600,0; 355500,0; 356400,0; 357300,0; 358200,0; 359100,-0.01; 360000,-15; 360900,-15; 361800,-15; 362700,-15; 363600,-15; 364500,-15; 365400,-15; 366300,-15;
        367200,-15; 368100,-15; 369000,-15; 369900,-15; 370800,-10; 371700,-10; 372600,-10; 373500,-10; 374400,-10; 375300,-10; 376200,-10; 377100,-10; 378000,-10; 378900,-10; 379800,-10; 380700,-10; 381600,-10; 382500,-10; 383400,-10; 384300,-10; 385200,-10; 386100,-10; 387000,-10; 387900,-10; 388800,-10; 389700,-12; 390600,-12; 391500,-12; 392400,-12; 393300,-12; 394200,-12; 395100,-12; 396000,-12; 396900,-12; 397800,-12; 398700,-12; 399600,-12; 400500,-12; 401400,-12; 402300,-12; 403200,-12;
        404100,-12; 405000,-12; 405900,-12; 406800,0; 407700,0; 408600,0; 409500,0; 410400,0; 411300,0; 412200,0; 413100,0; 414000,0; 414900,0; 415800,0; 416700,0; 417600,0; 418500,0; 419400,0; 420300,0; 421200,0; 422100,0; 423000,0; 423900,0; 424800,0; 425700,0; 426600,0; 427500,0; 428400,0; 429300,0; 430200,0; 431100,0; 432000,0; 432900,0; 433800,0; 434700,0; 435600,0; 436500,0; 437400,0; 438300,0; 439200,0; 440100,0; 441000,0; 441900,0; 442800,0; 443700,0; 444600,0; 445500,0; 446400,0;
        447300,0; 448200,0; 449100,0; 450000,0; 450900,0; 451800,0; 452700,0; 453600,0; 454500,0; 455400,0; 456300,0; 457200,0; 458100,0; 459000,0; 459900,0; 460800,0; 461700,0; 462600,0; 463500,0; 464400,0; 465300,0; 466200,0; 467100,0; 468000,0; 468900,0; 469800,0; 470700,0; 471600,0; 472500,0; 473400,0; 474300,0; 475200,0; 476100,0; 477000,0; 477900,0; 478800,0; 479700,0; 480600,0; 481500,0; 482400,0; 483300,0; 484200,0; 485100,0; 486000,0; 486900,0; 487800,0; 488700,0; 489600,0; 490500,0;
        491400,0; 492300,0; 493200,0; 494100,0; 495000,0; 495900,0; 496800,0; 497700,0; 498600,0; 499500,0; 500400,0; 501300,0; 502200,0; 503100,0; 504000,0; 504900,0; 505800,0; 506700,0; 507600,0; 508500,0; 509400,0; 510300,0; 511200,0; 512100,0; 513000,0; 513900,0; 514800,0; 515700,0; 516600,0; 517500,0; 518400,0; 519300,0; 520200,0; 521100,0; 522000,0; 522900,0; 523800,0; 524700,0; 525600,0; 526500,0; 527400,0; 528300,0; 529200,0; 530100,0; 531000,0; 531900,0; 532800,0; 533700,0; 534600,0;
        535500,0; 536400,0; 537300,0; 538200,0; 539100,0; 540000,0; 540900,0; 541800,0; 542700,0; 543600,0; 544500,0; 545400,0; 546300,0; 547200,0; 548100,0; 549000,0; 549900,0; 550800,0; 551700,0; 552600,0; 553500,0; 554400,0; 555300,0; 556200,0; 557100,0; 558000,0; 558900,0; 559800,0; 560700,0; 561600,0; 562500,0; 563400,0; 564300,0; 565200,0; 566100,0; 567000,0; 567900,0; 568800,0; 569700,0; 570600,0; 571500,0; 572400,0; 573300,0; 574200,0; 575100,0; 576000,0; 576900,0; 577800,0; 578700,0;
        579600,0; 580500,0; 581400,0; 582300,0; 583200,0; 584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,2},{96,12}})));
  Modelica.Blocks.Math.Gain gain(k=1000) annotation (Placement(transformation(extent={{106,4},{112,10}})));
  Modelica.Blocks.Math.MultiSum multiSum_gas(nu=3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-70,90})));
  Modelica.Blocks.Math.MultiSum multiSum_el(nu=2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-70,70})));
  Modelica.Blocks.Interfaces.RealOutput P_gas annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,90})));
  Modelica.Blocks.Interfaces.RealOutput P_el annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,70})));
equation
  //states
  localState1.fUpperTemperature =BufferStorage.localStorageState.fUpperTemperature;
  localState1.fMidTemperature =BufferStorage.localStorageState.fMidTemperature;
  localState1.fLowerTemperature =BufferStorage.localStorageState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage =VSIStorageSystem.localStorageState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage =VSIStorageSystem.localStorageState.fLowerTemperature;

  //controls
  CondensingBoilerSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_CondensingBoiler;
  CondensingBoilerSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CondensingBoilerSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  CHP1System.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_CHP1;
  CHP1System.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CHP1System.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  CHP2System.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_CHP2;
  CHP2System.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CHP2System.fSetPointAutomatic = controlAutomatic.fFeedTemperature;
  StaticHeatingSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_StaticHeating;
  StaticHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  StaticHeatingSystem.fSetPointAutomatic = controlAutomatic.fTargetTemperature_ProductionHall;
  //VSIStorageSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_VSIStorage;
  VSIStorageSystem.bSetStatusOnAutomatic = true;
  VSIStorageSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  VSIStorageSystem.fSetPointAutomatic = 100;
  VSIStorageSystem.bLoadingAutomatic = controlAutomatic.bLoading_VSIStorage;
  CentralMachineHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CentralMachineHeatingSystem.fSetPointAutomatic  = 100;
  ambientState.fOutsideTemperature = StaticHeatingSystem.fAmbientTemperature;

  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{79,90},{50,90},{50,110}},    color={0,0,0}));
  connect(pipe.port_a, CHP1System.port_b) annotation (Line(points={{0,20},{0,10}}, color={0,127,255}));
  connect(pipe.port_b, BufferStorage.port_b) annotation (Line(points={{20,20},{40,20},{40,10}}, color={0,127,255}));
  connect(pipe1.port_a, BufferStorage.port_a) annotation (Line(points={{20,-20},{40,-20},{40,-10}}, color={0,127,255}));
  connect(pipe1.port_b, CHP1System.port_a) annotation (Line(points={{0,-20},{0,-10}}, color={0,127,255}));
  connect(pipe2.port_b, pipe.port_a) annotation (Line(points={{-20,20},{0,20}}, color={0,127,255}));
  connect(pipe2.port_a, CHP2System.port_b) annotation (Line(points={{-40,20},{-40,10}}, color={0,127,255}));
  connect(pipe3.port_a, pipe1.port_b) annotation (Line(points={{-20,-20},{0,-20}}, color={0,127,255}));
  connect(pipe3.port_b, CHP2System.port_a) annotation (Line(points={{-40,-20},{-40,-10}}, color={0,127,255}));
  connect(pipe4.port_b, pipe2.port_a) annotation (Line(points={{-60,20},{-40,20}}, color={0,127,255}));
  connect(pipe5.port_a, pipe3.port_b) annotation (Line(points={{-60,-20},{-40,-20}}, color={0,127,255}));
  connect(pipe8.port_a, BufferStorage.port_b) annotation (Line(points={{60,20},{40,20},{40,10}}, color={0,127,255}));
  connect(pipe9.port_b, BufferStorage.port_a) annotation (Line(points={{60,-20},{40,-20},{40,-10}}, color={0,127,255}));
  connect(pipe10.port_a, pipe8.port_b) annotation (Line(points={{120,20},{80,20}}, color={0,127,255}));
  connect(pipe11.port_b, pipe9.port_a) annotation (Line(points={{120,-20},{80,-20}}, color={0,127,255}));
  connect(pipe10.port_b,CentralMachineHeatingSystem. port_a) annotation (Line(points={{140,20},{140,10}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.port_b, pipe11.port_a) annotation (Line(points={{140,-10},{140,-20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_a, pipe8.port_b) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_b, pipe9.port_a) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.bSetStatusOnAutomatic, lessThreshold.y) annotation (Line(points={{118,-9},{110.3,-9}}, color={255,0,255}));
  connect(boundary.ports[1], pipe11.port_a) annotation (Line(points={{160,-30},{150,-30},{150,-20},{140,-20}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_a, pipe5.port_b) annotation (Line(points={{-80,-10},{-80,-20}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_b, pipe4.port_a) annotation (Line(points={{-80,10},{-80,20}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a2, pipe15.port_b) annotation (Line(points={{40,72},{40,80},{52,80}}, color={0,127,255}));
  connect(pipe15.port_a, BufferStorage.port_b) annotation (Line(points={{72,80},{72,60},{50,60},{50,20},{40,20},{40,10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_b1, pipe12.port_a) annotation (Line(points={{36,72},{36,80},{0,80}}, color={0,127,255}));
  connect(VSIStorageSystem.port_b2, BufferStorage.port_a) annotation (Line(points={{40,52},{46,52},{46,-10},{40,-10}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a1, BufferStorage.port_a) annotation (Line(points={{36,52},{36,-10},{40,-10}}, color={0,127,255}));
  connect(pipe12.port_b, BufferStorage.port_b) annotation (Line(points={{-20,80},{-20,40},{40,40},{40,10}}, color={0,127,255}));
  connect(combiTimeTable.y[1], gain.u) annotation (Line(points={{96.5,7},{101.25,7},{101.25,7},{105.4,7}}, color={0,0,127}));
  connect(gain.y, CentralMachineHeatingSystem.fHeatFlowRate) annotation (Line(points={{112.3,7},{114.15,7},{114.15,7},{118,7}}, color={0,0,127}));
  connect(lessThreshold.u, gain.u) annotation (Line(points={{103.4,-9},{100,-9},{100,7},{105.4,7}}, color={0,0,127}));
  connect(multiSum_gas.y, P_gas) annotation (Line(points={{-77.02,90},{-110,90}}, color={0,0,127}));
  connect(multiSum_el.y, P_el) annotation (Line(points={{-77.02,70},{-110,70}}, color={0,0,127}));
  connect(CHP2System.P_gas, multiSum_gas.u[1]) annotation (Line(points={{-39,-1},{-30,-1},{-30,87.2},{-64,87.2}}, color={0,0,127}));
  connect(CHP1System.P_gas, multiSum_gas.u[2]) annotation (Line(points={{1,-1},{10,-1},{10,90},{-64,90}}, color={0,0,127}));
  connect(CHP1System.P_el, multiSum_el.u[1]) annotation (Line(points={{1,1},{6,1},{6,67.9},{-64,67.9}}, color={0,0,127}));
  connect(CHP2System.P_el, multiSum_el.u[2]) annotation (Line(points={{-39,1},{-32,1},{-32,72.1},{-64,72.1}}, color={0,0,127}));
  connect(multiSum_gas.u[3], CondensingBoilerSystem.P_gas) annotation (Line(points={{-64,92.8},{-70,92.8},{-70,1},{-79,1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT_Only;
