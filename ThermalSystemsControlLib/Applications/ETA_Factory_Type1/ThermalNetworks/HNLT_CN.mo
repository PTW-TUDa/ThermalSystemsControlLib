within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
model HNLT_CN
    extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  input Interfaces.hnltCnLinkageControl   controlAutomatic annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Systems.HNLT_CN.HeatPumpSystem   HeatPumpSystem annotation (Placement(transformation(extent={{80,-12},{60,8}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Components.Pipes.PhysicalModels.Pipe pipe4(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,30})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={90,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    length=3,
    diameter=0.025,
    n_Bending=8) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,-30})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_CN_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Systems.HNLT_CN.UnderfloorHeatingSystem UnderfloorHeatingSystem annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,0})));
  Components.Pipes.PhysicalModels.Pipe pipe8(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-90,30})));
  Components.Pipes.PhysicalModels.Pipe pipe1(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-90,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe2(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe3(
    length=5,
    diameter=0.05,
    n_Bending=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-50,30})));
  Systems.HNLT_CN.InnerCapillaryTubeMatsSystem InnerCapillaryTubeMats annotation (Placement(transformation(extent={{-20,10},{0,-10}})));
  Components.Pipes.PhysicalModels.Pipe pipe9(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-10,50})));
  Components.Pipes.PhysicalModels.Pipe pipe10(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,-50})));
  Components.Pipes.PhysicalModels.Pipe pipe11(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,50})));
  Components.Pipes.PhysicalModels.Pipe pipe12(
    length=7,
    diameter=0.05,
    n_Bending=6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={22,-50})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Modelica.Blocks.Sources.CombiTimeTable
                                      combiTimeTable2(table=[0,-6; 900,-6; 1800,-6; 2700,-6; 3600,-6; 4500,-6; 5400,-6; 6300,-6; 7200,-6; 8100,-6; 9000,-6; 9900,-6; 10800,-7; 11700,-7; 12600,-7; 13500,-7; 14400,-7; 15300,-7; 16200,-7; 17100,-7; 18000,-6; 18900,-6; 19800,-6; 20700,-6; 21600,-6; 22500,-6; 23400,-6; 24300,-6; 25200,-6; 26100,-6; 27000,-6; 27900,-6; 28800,-5; 29700,-5; 30600,-5; 31500,-5; 32400,-5; 33300,-5; 34200,-5; 35100,-5; 36000,-4; 36900,-4; 37800,-4; 38700,-4; 39600,-4; 40500,
        -4; 41400,-4; 42300,-4; 43200,-4; 44100,-4; 45000,-4; 45900,-4; 46800,-4; 47700,-4; 48600,-4; 49500,-4; 50400,-4; 51300,-4; 52200,-4; 53100,-4; 54000,-4; 54900,-4; 55800,-4; 56700,-4; 57600,-5; 58500,-5; 59400,-5; 60300,-5; 61200,-5; 62100,-5; 63000,-5; 63900,-5; 64800,-5; 65700,-5; 66600,-5; 67500,-5; 68400,-5; 69300,-5; 70200,-5; 71100,-5; 72000,-6; 72900,-6; 73800,-6; 74700,-6; 75600,-6; 76500,-6; 77400,-6; 78300,-6; 79200,-6; 80100,-6; 81000,-6; 81900,-6; 82800,-6; 83700,-6; 84600,-6;
        85500,-6; 86400,-6; 87300,-6; 88200,-6; 89100,-6; 90000,-6; 90900,-6; 91800,-6; 92700,-6; 93600,-6; 94500,-6; 95400,-6; 96300,-6; 97200,-7; 98100,-7; 99000,-7; 99900,-7; 100800,-7; 101700,-7; 102600,-7; 103500,-7; 104400,-6; 105300,-6; 106200,-6; 107100,-6; 108000,-6; 108900,-6; 109800,-6; 110700,-6; 111600,-6; 112500,-6; 113400,-6; 114300,-6; 115200,-5; 116100,-5; 117000,-5; 117900,-5; 118800,-5; 119700,-5; 120600,-5; 121500,-5; 122400,-4; 123300,-4; 124200,-4; 125100,-4; 126000,-4; 126900,
        -4; 127800,-4; 128700,-4; 129600,-4; 130500,-4; 131400,-4; 132300,-4; 133200,-4; 134100,-4; 135000,-4; 135900,-4; 136800,-4; 137700,-4; 138600,-4; 139500,-4; 140400,-4; 141300,-4; 142200,-4; 143100,-4; 144000,-5; 144900,-5; 145800,-5; 146700,-5; 147600,-5; 148500,-5; 149400,-5; 150300,-5; 151200,-5; 152100,-5; 153000,-5; 153900,-5; 154800,-5; 155700,-5; 156600,-5; 157500,-5; 158400,-6; 159300,-6; 160200,-6; 161100,-6; 162000,-6; 162900,-6; 163800,-6; 164700,-6; 165600,-6; 166500,-6; 167400,
        -6; 168300,-6; 169200,-6; 170100,-6; 171000,-6; 171900,-6; 172800,-6; 173700,-6; 174600,-6; 175500,-6; 176400,-6; 177300,-6; 178200,-6; 179100,-6; 180000,-6; 180900,-6; 181800,-6; 182700,-6; 183600,-7; 184500,-7; 185400,-7; 186300,-7; 187200,-7; 188100,-7; 189000,-7; 189900,-7; 190800,-6; 191700,-6; 192600,-6; 193500,-6; 194400,-6; 195300,-6; 196200,-6; 197100,-6; 198000,-6; 198900,-6; 199800,-6; 200700,-6; 201600,-5; 202500,-5; 203400,-5; 204300,-5; 205200,-5; 206100,-5; 207000,-5; 207900,
        -5; 208800,-4; 209700,-4; 210600,-4; 211500,-4; 212400,-4; 213300,-4; 214200,-4; 215100,-4; 216000,-4; 216900,-4; 217800,-4; 218700,-4; 219600,-4; 220500,-4; 221400,-4; 222300,-4; 223200,-4; 224100,-4; 225000,-4; 225900,-4; 226800,-4; 227700,-4; 228600,-4; 229500,-4; 230400,-5; 231300,-5; 232200,-5; 233100,-5; 234000,-5; 234900,-5; 235800,-5; 236700,-5; 237600,-5; 238500,-5; 239400,-5; 240300,-5; 241200,-5; 242100,-5; 243000,-5; 243900,-5; 244800,-6; 245700,-6; 246600,-6; 247500,-6; 248400,
        -6; 249300,-6; 250200,-6; 251100,-6; 252000,-6; 252900,-6; 253800,-6; 254700,-6; 255600,-6; 256500,-6; 257400,-6; 258300,-6; 259200,-6; 260100,-6; 261000,-6; 261900,-6; 262800,-6; 263700,-6; 264600,-6; 265500,-6; 266400,-6; 267300,-6; 268200,-6; 269100,-6; 270000,-7; 270900,-7; 271800,-7; 272700,-7; 273600,-7; 274500,-7; 275400,-7; 276300,-7; 277200,-6; 278100,-6; 279000,-6; 279900,-6; 280800,-6; 281700,-6; 282600,-6; 283500,-6; 284400,-6; 285300,-6; 286200,-6; 287100,-6; 288000,-5; 288900,
        -5; 289800,-5; 290700,-5; 291600,-5; 292500,-5; 293400,-5; 294300,-5; 295200,-4; 296100,-4; 297000,-4; 297900,-4; 298800,-4; 299700,-4; 300600,-4; 301500,-4; 302400,-4; 303300,-4; 304200,-4; 305100,-4; 306000,-4; 306900,-4; 307800,-4; 308700,-4; 309600,-4; 310500,-4; 311400,-4; 312300,-4; 313200,-4; 314100,-4; 315000,-4; 315900,-4; 316800,-5; 317700,-5; 318600,-5; 319500,-5; 320400,-5; 321300,-5; 322200,-5; 323100,-5; 324000,-5; 324900,-5; 325800,-5; 326700,-5; 327600,-5; 328500,-5; 329400,
        -5; 330300,-5; 331200,-6; 332100,-6; 333000,-6; 333900,-6; 334800,-6; 335700,-6; 336600,-6; 337500,-6; 338400,-6; 339300,-6; 340200,-6; 341100,-6; 342000,-6; 342900,-6; 343800,-6; 344700,-6; 345600,-6; 346500,-6; 347400,-6; 348300,-6; 349200,-6; 350100,-6; 351000,-6; 351900,-6; 352800,-6; 353700,-6; 354600,-6; 355500,-6; 356400,-7; 357300,-7; 358200,-7; 359100,-7; 360000,-7; 360900,-7; 361800,-7; 362700,-7; 363600,-6; 364500,-6; 365400,-6; 366300,-6; 367200,-6; 368100,-6; 369000,-6; 369900,
        -6; 370800,-6; 371700,-6; 372600,-6; 373500,-6; 374400,-5; 375300,-5; 376200,-5; 377100,-5; 378000,-5; 378900,-5; 379800,-5; 380700,-5; 381600,-4; 382500,-4; 383400,-4; 384300,-4; 385200,-4; 386100,-4; 387000,-4; 387900,-4; 388800,-4; 389700,-4; 390600,-4; 391500,-4; 392400,-4; 393300,-4; 394200,-4; 395100,-4; 396000,-4; 396900,-4; 397800,-4; 398700,-4; 399600,-4; 400500,-4; 401400,-4; 402300,-4; 403200,-5; 404100,-5; 405000,-5; 405900,-5; 406800,-5; 407700,-5; 408600,-5; 409500,-5; 410400,
        -5; 411300,-5; 412200,-5; 413100,-5; 414000,-5; 414900,-5; 415800,-5; 416700,-5; 417600,-6; 418500,-6; 419400,-6; 420300,-6; 421200,-6; 422100,-6; 423000,-6; 423900,-6; 424800,-6; 425700,-6; 426600,-6; 427500,-6; 428400,-6; 429300,-6; 430200,-6; 431100,-6; 432000,-6; 432900,-6; 433800,-6; 434700,-6; 435600,-6; 436500,-6; 437400,-6; 438300,-6; 439200,-6; 440100,-6; 441000,-6; 441900,-6; 442800,-7; 443700,-7; 444600,-7; 445500,-7; 446400,-7; 447300,-7; 448200,-7; 449100,-7; 450000,-6; 450900,
        -6; 451800,-6; 452700,-6; 453600,-6; 454500,-6; 455400,-6; 456300,-6; 457200,-6; 458100,-6; 459000,-6; 459900,-6; 460800,-5; 461700,-5; 462600,-5; 463500,-5; 464400,-5; 465300,-5; 466200,-5; 467100,-5; 468000,-4; 468900,-4; 469800,-4; 470700,-4; 471600,-4; 472500,-4; 473400,-4; 474300,-4; 475200,-4; 476100,-4; 477000,-4; 477900,-4; 478800,-4; 479700,-4; 480600,-4; 481500,-4; 482400,-4; 483300,-4; 484200,-4; 485100,-4; 486000,-4; 486900,-4; 487800,-4; 488700,-4; 489600,-5; 490500,-5; 491400,
        -5; 492300,-5; 493200,-5; 494100,-5; 495000,-5; 495900,-5; 496800,-5; 497700,-5; 498600,-5; 499500,-5; 500400,-5; 501300,-5; 502200,-5; 503100,-5; 504000,-6; 504900,-6; 505800,-6; 506700,-6; 507600,-6; 508500,-6; 509400,-6; 510300,-6; 511200,-6; 512100,-6; 513000,-6; 513900,-6; 514800,-6; 515700,-6; 516600,-6; 517500,-6; 518400,-6; 519300,-6; 520200,-6; 521100,-6; 522000,-6; 522900,-6; 523800,-6; 524700,-6; 525600,-6; 526500,-6; 527400,-6; 528300,-6; 529200,-7; 530100,-7; 531000,-7; 531900,
        -7; 532800,-7; 533700,-7; 534600,-7; 535500,-7; 536400,-6; 537300,-6; 538200,-6; 539100,-6; 540000,-6; 540900,-6; 541800,-6; 542700,-6; 543600,-6; 544500,-6; 545400,-6; 546300,-6; 547200,-5; 548100,-5; 549000,-5; 549900,-5; 550800,-5; 551700,-5; 552600,-5; 553500,-5; 554400,-4; 555300,-4; 556200,-4; 557100,-4; 558000,-4; 558900,-4; 559800,-4; 560700,-4; 561600,-4; 562500,-4; 563400,-4; 564300,-4; 565200,-4; 566100,-4; 567000,-4; 567900,-4; 568800,-4; 569700,-4; 570600,-4; 571500,-4; 572400,
        -4; 573300,-4; 574200,-4; 575100,-4; 576000,-5; 576900,-5; 577800,-5; 578700,-5; 579600,-5; 580500,-5; 581400,-5; 582300,-5; 583200,-5; 584100,-5; 585000,-5; 585900,-5; 586800,-5; 587700,-5; 588600,-5; 589500,-5; 590400,-6; 591300,-6; 592200,-6; 593100,-6; 594000,-6; 594900,-6; 595800,-6; 596700,-6; 597600,-6; 598500,-6; 599400,-6; 600300,-6; 601200,-6; 602100,-6; 603000,-6; 603900,-6])
                                                                         annotation (Placement(transformation(extent={{-40,0},{-50,10}})));
equation
  HeatPumpSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_HeatPump;
  HeatPumpSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  HeatPumpSystem.fSetPointAutomatic = controlAutomatic.fFeedTemperature_HNLT_Heating;
  UnderfloorHeatingSystem.bSetStatusOnAutomatic = true;
  UnderfloorHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  UnderfloorHeatingSystem.fSetPointAutomatic = 0;
  UnderfloorHeatingSystem.bHeatingModeAutomatic = controlAutomatic.bHeatingMode;
  InnerCapillaryTubeMats.bSetStatusOnAutomatic = true;
  InnerCapillaryTubeMats.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission_CN and controlAutomatic.bAlgorithmPermission_HNLT;
  InnerCapillaryTubeMats.fSetPointAutomatic = controlAutomatic.fTargetTemperature_ProductionHall;
  InnerCapillaryTubeMats.bHeatingModeAutomatic = controlAutomatic.bHeatingMode;
  ambientState.fOutsideTemperature =  UnderfloorHeatingSystem.fAmbientTemperature;
  ambientState.fOutsideTemperature = InnerCapillaryTubeMats.fAmbientTemperature;
  connect(HeatPumpSystem.port_a1, pipe5.port_b) annotation (Line(points={{64,8},{64,40},{80,40}},    color={0,127,255}));
  connect(pipe5.port_a, port_a_CN_Producer) annotation (Line(points={{100,40},{100,60}},        color={0,127,255}));
  connect(HeatPumpSystem.port_b1, pipe6.port_a) annotation (Line(points={{64,-12},{64,-20},{80,-20}},    color={0,127,255}));
  connect(pipe6.port_b, port_b_CN_Producer) annotation (Line(points={{100,-20},{100,-60}},         color={0,127,255}));
  connect(pipe4.port_b,port_b_HNLT_Producer)  annotation (Line(points={{40,40},{40,100},{-100,100}}, color={0,127,255}));
  connect(pipe4.port_a, HeatPumpSystem.port_b2) annotation (Line(points={{60,40},{60,8}},            color={0,127,255}));
  connect(pipe7.port_b, HeatPumpSystem.port_a2) annotation (Line(points={{60,-20},{60,-12}},             color={0,127,255}));
  connect(pipe7.port_a, port_a_HNLT_Producer) annotation (Line(points={{40,-20},{40,-100},{-100,-100}},   color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_b_HNLT, pipe1.port_a) annotation (Line(points={{-80,-10},{-80,-40}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_a_HNLT, pipe8.port_b) annotation (Line(points={{-80,10},{-80,40}}, color={0,127,255}));
  connect(pipe8.port_a, port_a_HNLT_Consumer) annotation (Line(points={{-100,40},{-100,60}}, color={0,127,255}));
  connect(pipe1.port_b, port_b_HNLT_Consumer) annotation (Line(points={{-100,-40},{-100,-60}}, color={0,127,255}));
  connect(pipe2.port_b, UnderfloorHeatingSystem.port_a_CN) annotation (Line(points={{-60,-40},{-66,-40},{-66,0},{-76,0},{-76,10}}, color={0,127,255}));
  connect(port_a_CN_Consumer, pipe2.port_a) annotation (Line(points={{100,-100},{80,-100},{80,-80},{-30,-80},{-30,-40},{-40,-40}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.port_b_HNLT1, pipe3.port_a) annotation (Line(points={{-76,-10},{-72,-10},{-72,40},{-60,40}}, color={0,127,255}));
  connect(pipe3.port_b, port_b_CN_Consumer) annotation (Line(points={{-40,40},{-30,40},{-30,80},{100,80},{100,100}}, color={0,127,255}));
  connect(pipe9.port_a, port_a_HNLT_Consumer) annotation (Line(points={{-20,60},{-100,60}}, color={0,127,255}));
  connect(pipe10.port_b, port_b_HNLT_Consumer) annotation (Line(points={{-20,-60},{-100,-60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_a_CN, pipe12.port_b) annotation (Line(points={{-4,10},{-4,0},{12,0},{12,-60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b_HNLT1, pipe11.port_a) annotation (Line(points={{-4,-10},{-4,-4},{10,-4},{10,60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_b_HNLT, pipe10.port_a) annotation (Line(points={{0,-10},{0,-60}}, color={0,127,255}));
  connect(InnerCapillaryTubeMats.port_a_HNLT, pipe9.port_b) annotation (Line(points={{0,10},{0,60}}, color={0,127,255}));
  connect(pipe11.port_b, port_b_CN_Consumer) annotation (Line(points={{30,60},{60,60},{60,100},{100,100}}, color={0,127,255}));
  connect(pipe12.port_a, port_a_CN_Consumer) annotation (Line(points={{32,-60},{80,-60},{80,-100},{100,-100}}, color={0,127,255}));
  connect(UnderfloorHeatingSystem.fHeatFlowRate, combiTimeTable2.y[1]) annotation (Line(points={{-58,3},{-53,3},{-53,5},{-50.5,5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNLT_CN;
