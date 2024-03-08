within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNLT
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=318.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={24,-28})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,0})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{-80,80},{-100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Interfaces.hnltControl controlAutomatic annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Systems.HNLT.CompressorSystem CompressorSystem annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Systems.HNLT.HVFAStorageSystem HVFASystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=4,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-28,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=4,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-70,42})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-70,-38})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,80})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    length=100,
    diameter=0.05,
    n_Bending=10)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-50,-80})));
  Systems.HNLT.OuterCapillaryTubeMatsSystem OuterCapillaryTubeMats annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe11(
    length=14,
    diameter=0.05,
    n_Bending=12)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={70,50})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    length=14,
    diameter=0.05,
    n_Bending=12)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={70,-50})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNHT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNHT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,0.01; 14400,8; 15300,8; 16200,5; 17100,5; 18000,1; 18900,1; 19800,1; 20700,1; 21600,8; 22500,8; 23400,5; 24300,5; 25200,1; 26100,1; 27000,1; 27900,1; 28800,8; 29700,8; 30600,5; 31500,5; 32400,1; 33300,1; 34200,1; 35100,1; 36000,8; 36900,8; 37800,5; 38700,5; 39600,1; 40500,1; 41400,1; 42300,1; 43200,8; 44100,8; 45000,5; 45900,5; 46800,1; 47700,1; 48600,8; 49500,
        8; 50400,5; 51300,5; 52200,1; 53100,1; 54000,8; 54900,8; 55800,5; 56700,5; 57600,1; 58500,1; 59400,0; 60300,0; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0; 89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0;
        99000,0; 99900,0.01; 100800,8; 101700,8; 102600,5; 103500,5; 104400,1; 105300,1; 106200,1; 107100,1; 108000,8; 108900,8; 109800,5; 110700,5; 111600,1; 112500,1; 113400,1; 114300,1; 115200,8; 116100,8; 117000,5; 117900,5; 118800,1; 119700,1; 120600,1; 121500,1; 122400,8; 123300,8; 124200,5; 125100,5; 126000,1; 126900,1; 127800,1; 128700,1; 129600,8; 130500,8; 131400,5; 132300,5; 133200,1; 134100,1; 135000,8; 135900,8; 136800,5; 137700,5; 138600,1; 139500,1; 140400,8; 141300,8; 142200,5;
        143100,5; 144000,1; 144900,1; 145800,0; 146700,0; 147600,0; 148500,0; 149400,0; 150300,0; 151200,0; 152100,0; 153000,0; 153900,0; 154800,0; 155700,0; 156600,0; 157500,0; 158400,0; 159300,0; 160200,0; 161100,0; 162000,0; 162900,0; 163800,0; 164700,0; 165600,0; 166500,0; 167400,0; 168300,0; 169200,0; 170100,0; 171000,0; 171900,0; 172800,0; 173700,0; 174600,0; 175500,0; 176400,0; 177300,0; 178200,0; 179100,0; 180000,0; 180900,0; 181800,0; 182700,0; 183600,0; 184500,0; 185400,0; 186300,0.01;
        187200,8; 188100,8; 189000,5; 189900,5; 190800,1; 191700,1; 192600,1; 193500,1; 194400,8; 195300,8; 196200,5; 197100,5; 198000,1; 198900,1; 199800,1; 200700,1; 201600,8; 202500,8; 203400,5; 204300,5; 205200,1; 206100,1; 207000,1; 207900,1; 208800,8; 209700,8; 210600,5; 211500,5; 212400,1; 213300,1; 214200,1; 215100,1; 216000,8; 216900,8; 217800,5; 218700,5; 219600,1; 220500,1; 221400,8; 222300,8; 223200,5; 224100,5; 225000,1; 225900,1; 226800,8; 227700,8; 228600,5; 229500,5; 230400,1;
        231300,1; 232200,0; 233100,0; 234000,0; 234900,0; 235800,0; 236700,0; 237600,0; 238500,0; 239400,0; 240300,0; 241200,0; 242100,0; 243000,0; 243900,0; 244800,0; 245700,0; 246600,0; 247500,0; 248400,0; 249300,0; 250200,0; 251100,0; 252000,0; 252900,0; 253800,0; 254700,0; 255600,0; 256500,0; 257400,0; 258300,0; 259200,0; 260100,0; 261000,0; 261900,0; 262800,0; 263700,0; 264600,0; 265500,0; 266400,0; 267300,0; 268200,0; 269100,0; 270000,0; 270900,0; 271800,0; 272700,0.01; 273600,8; 274500,8;
        275400,5; 276300,5; 277200,1; 278100,1; 279000,1; 279900,1; 280800,8; 281700,8; 282600,5; 283500,5; 284400,1; 285300,1; 286200,1; 287100,1; 288000,8; 288900,8; 289800,5; 290700,5; 291600,1; 292500,1; 293400,1; 294300,1; 295200,8; 296100,8; 297000,5; 297900,5; 298800,1; 299700,1; 300600,1; 301500,1; 302400,8; 303300,8; 304200,5; 305100,5; 306000,1; 306900,1; 307800,8; 308700,8; 309600,5; 310500,5; 311400,1; 312300,1; 313200,8; 314100,8; 315000,5; 315900,5; 316800,1; 317700,1; 318600,0;
        319500,0; 320400,0; 321300,0; 322200,0; 323100,0; 324000,0; 324900,0; 325800,0; 326700,0; 327600,0; 328500,0; 329400,0; 330300,0; 331200,0; 332100,0; 333000,0; 333900,0; 334800,0; 335700,0; 336600,0; 337500,0; 338400,0; 339300,0; 340200,0; 341100,0; 342000,0; 342900,0; 343800,0; 344700,0; 345600,0; 346500,0; 347400,0; 348300,0; 349200,0; 350100,0; 351000,0; 351900,0; 352800,0; 353700,0; 354600,0; 355500,0; 356400,0; 357300,0; 358200,0; 359100,0.01; 360000,8; 360900,8; 361800,5; 362700,5;
        363600,1; 364500,1; 365400,1; 366300,1; 367200,8; 368100,8; 369000,5; 369900,5; 370800,1; 371700,1; 372600,1; 373500,1; 374400,8; 375300,8; 376200,5; 377100,5; 378000,1; 378900,1; 379800,1; 380700,1; 381600,8; 382500,8; 383400,5; 384300,5; 385200,1; 386100,1; 387000,1; 387900,1; 388800,8; 389700,8; 390600,5; 391500,5; 392400,1; 393300,1; 394200,8; 395100,8; 396000,5; 396900,5; 397800,1; 398700,1; 399600,8; 400500,8; 401400,5; 402300,5; 403200,1; 404100,1; 405000,0; 405900,0; 406800,0;
        407700,0; 408600,0; 409500,0; 410400,0; 411300,0; 412200,0; 413100,0; 414000,0; 414900,0; 415800,0; 416700,0; 417600,0; 418500,0; 419400,0; 420300,0; 421200,0; 422100,0; 423000,0; 423900,0; 424800,0; 425700,0; 426600,0; 427500,0; 428400,0; 429300,0; 430200,0; 431100,0; 432000,0; 432900,0; 433800,0; 434700,0; 435600,0; 436500,0; 437400,0; 438300,0; 439200,0; 440100,0; 441000,0; 441900,0; 442800,0; 443700,0; 444600,0; 445500,0; 446400,0; 447300,0; 448200,0; 449100,0; 450000,0; 450900,0;
        451800,0; 452700,0; 453600,0; 454500,0; 455400,0; 456300,0; 457200,0; 458100,0; 459000,0; 459900,0; 460800,0; 461700,0; 462600,0; 463500,0; 464400,0; 465300,0; 466200,0; 467100,0; 468000,0; 468900,0; 469800,0; 470700,0; 471600,0; 472500,0; 473400,0; 474300,0; 475200,0; 476100,0; 477000,0; 477900,0; 478800,0; 479700,0; 480600,0; 481500,0; 482400,0; 483300,0; 484200,0; 485100,0; 486000,0; 486900,0; 487800,0; 488700,0; 489600,0; 490500,0; 491400,0; 492300,0; 493200,0; 494100,0; 495000,0;
        495900,0; 496800,0; 497700,0; 498600,0; 499500,0; 500400,0; 501300,0; 502200,0; 503100,0; 504000,0; 504900,0; 505800,0; 506700,0; 507600,0; 508500,0; 509400,0; 510300,0; 511200,0; 512100,0; 513000,0; 513900,0; 514800,0; 515700,0; 516600,0; 517500,0; 518400,0; 519300,0; 520200,0; 521100,0; 522000,0; 522900,0; 523800,0; 524700,0; 525600,0; 526500,0; 527400,0; 528300,0; 529200,0; 530100,0; 531000,0; 531900,0; 532800,0; 533700,0; 534600,0; 535500,0; 536400,0; 537300,0; 538200,0; 539100,0;
        540000,0; 540900,0; 541800,0; 542700,0; 543600,0; 544500,0; 545400,0; 546300,0; 547200,0; 548100,0; 549000,0; 549900,0; 550800,0; 551700,0; 552600,0; 553500,0; 554400,0; 555300,0; 556200,0; 557100,0; 558000,0; 558900,0; 559800,0; 560700,0; 561600,0; 562500,0; 563400,0; 564300,0; 565200,0; 566100,0; 567000,0; 567900,0; 568800,0; 569700,0; 570600,0; 571500,0; 572400,0; 573300,0; 574200,0; 575100,0; 576000,0; 576900,0; 577800,0; 578700,0; 579600,0; 580500,0; 581400,0; 582300,0; 583200,0;
        584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{-74,-20},{-64,-10}})));
  Modelica.Blocks.Logical.GreaterThreshold
                                        greaterThreshold
                                                      annotation (Placement(transformation(extent={{-62,2},{-56,8}})));
equation
   //states
  localState1.fUpperTemperature = BufferStorage.localStorageState.fUpperTemperature;
  localState1.fMidTemperature = BufferStorage.localStorageState.fMidTemperature;
  localState1.fLowerTemperature = BufferStorage.localStorageState.fLowerTemperature;
  localState1.fUpperTemperature_ActiveStorage =HVFASystem.localStorageState.fUpperTemperature;
  localState1.fLowerTemperature_ActiveStorage =HVFASystem.localStorageState.fLowerTemperature;

  //controls
  OuterCapillaryTubeMats.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_OuterCapillaryTubeMats;
  OuterCapillaryTubeMats.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  OuterCapillaryTubeMats.fSetPointAutomatic = controlAutomatic.fFeedTemperature_Cooling;
  HVFASystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HVFASystem;
  HVFASystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  HVFASystem.fSetPointAutomatic = 70;
  HVFASystem.bLoadingAutomatic = controlAutomatic.bLoading_HVFASystem;
  CompressorSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CompressorSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_Heating;
  ambientState.fOutsideTemperature = OuterCapillaryTubeMats.fAmbientTemperature;

  connect(localState.thermalNetworkState1, localState1) annotation (Line(points={{-79,90},{-50,90},{-50,110}}, color={0,0,0}));
  connect(HVFASystem.port_a1, pipe9.port_b) annotation (Line(points={{-84,10},{-84,70},{-60,70}}, color={0,127,255}));
  connect(HVFASystem.port_b1, pipe10.port_a) annotation (Line(points={{-84,-10},{-84,-90},{-60,-90}}, color={0,127,255}));
  connect(HVFASystem.port_a2, pipe7.port_b) annotation (Line(points={{-80,-10},{-80,-48}}, color={0,127,255}));
  connect(HVFASystem.port_b2, pipe6.port_a) annotation (Line(points={{-80,10},{-80,52}}, color={0,127,255}));
  connect(CompressorSystem.port_b, pipe4.port_a) annotation (Line(points={{-26,10},{-26,40},{-38,40}},
                                                                                              color={0,127,255}));
  connect(CompressorSystem.port_a, pipe5.port_b) annotation (Line(points={{-26,-10},{-26,-16},{-40,-16},{-40,-20}},
                                                                                                color={0,127,255}));
  connect(pipe5.port_a, BufferStorage.port_a) annotation (Line(points={{-20,-20},{0,-20},{0,-10}}, color={0,127,255}));
  connect(pipe4.port_b, BufferStorage.port_b) annotation (Line(points={{-18,40},{0,40},{0,10}}, color={0,127,255}));
  connect(pipe9.port_a, BufferStorage.port_b) annotation (Line(points={{-40,70},{0,70},{0,10}}, color={0,127,255}));
  connect(pipe7.port_a, BufferStorage.port_a) annotation (Line(points={{-60,-48},{0,-48},{0,-10}}, color={0,127,255}));
  connect(pipe6.port_b, BufferStorage.port_b) annotation (Line(points={{-60,52},{0,52},{0,10}}, color={0,127,255}));
  connect(pipe10.port_b, BufferStorage.port_a) annotation (Line(points={{-40,-90},{0,-90},{0,-10}}, color={0,127,255}));
  connect(OuterCapillaryTubeMats.port_a, pipe11.port_b) annotation (Line(points={{80,10},{80,60}}, color={0,127,255}));
  connect(OuterCapillaryTubeMats.port_b, pipe12.port_a) annotation (Line(points={{80,-10},{80,-60}}, color={0,127,255}));
  connect(port_b_HNHT_Producer, BufferStorage.port_a) annotation (Line(points={{-100,-100},{0,-100},{0,-10}}, color={0,127,255}));
  connect(port_a_HNHT_Producer, BufferStorage.port_b) annotation (Line(points={{-100,100},{0,100},{0,10}}, color={0,127,255}));
  connect(port_a_CN_Producer, BufferStorage.port_b) annotation (Line(points={{100,100},{0,100},{0,10}},          color={0,127,255}));
  connect(boundary.ports[1], BufferStorage.port_a) annotation (Line(points={{24,-18},{4,-18},{4,-10},{0,-10}}, color={0,127,255}));
  connect(port_b_CN_Consumer, BufferStorage.port_b) annotation (Line(points={{100,60},{100,80},{0,80},{0,10}}, color={0,127,255}));
  connect(port_a_CN_Consumer, BufferStorage.port_a) annotation (Line(points={{100,-60},{100,-80},{0,-80},{0,-10}}, color={0,127,255}));
  connect(pipe11.port_a, BufferStorage.port_b) annotation (Line(points={{60,60},{0,60},{0,10}}, color={0,127,255}));
  connect(pipe12.port_b, BufferStorage.port_a) annotation (Line(points={{60,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(port_b_HNHT_Consumer, BufferStorage.port_b) annotation (Line(points={{-100,60},{0,60},{0,10}}, color={0,127,255}));
  connect(port_a_HNHT_Consumer, BufferStorage.port_a) annotation (Line(points={{-100,-60},{0,-60},{0,-10}}, color={0,127,255}));
  connect(greaterThreshold.y, CompressorSystem.bSetStatusOnAutomatic) annotation (Line(points={{-55.7,5},{-54,5},{-54,9},{-48,9}}, color={255,0,255}));
  connect(greaterThreshold.u, combiTimeTable.y[1]) annotation (Line(points={{-62.6,5},{-63.5,5},{-63.5,-15}}, color={0,0,127}));
  connect(CompressorSystem.fHeatFlowRate, combiTimeTable.y[1]) annotation (Line(points={{-48,-3},{-60,-3},{-60,-15},{-63.5,-15}}, color={0,0,127}));
  connect(port_b_CN_Producer, BufferStorage.port_a) annotation (Line(points={{100,-100},{0,-100},{0,-10}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT;
