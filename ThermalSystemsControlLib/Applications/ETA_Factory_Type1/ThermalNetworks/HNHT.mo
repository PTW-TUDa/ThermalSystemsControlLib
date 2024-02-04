within ThermalSystemsControlLib.Applications.ETA_Factory_Type1.ThermalNetworks;
model HNHT
  extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=328.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.CHP1System CHP1System annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.CondensingBoilerSystem CondensingBoilerSystem annotation (Placement(transformation(extent={{-160,-10},{-140,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.CHP2System CHP2System annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory_Type1.Systems.HNHT.StaticHeatingSystem StaticHeatingSystem annotation (Placement(transformation(extent={{60,10},{80,-10}})));
  Components.BufferStorage.BufferStorage BufferStorage(n_Seg=6, T_start=T_start)
                                                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,0})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Consumer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  output Interfaces.thermalNetworkState localState1 annotation (Placement(transformation(extent={{40,100},{60,120}})));
  input Interfaces.hnhtControl controlAutomatic annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=200000,
    nPorts=1) annotation (Placement(transformation(extent={{180,-40},{160,-20}})));
  input Interfaces.ambientState ambientState annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  Interfaces.thermalNetworkState_FMUConnector localState annotation (Placement(transformation(extent={{80,80},{100,100}})));
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
                                     T_start=T_start)  annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Systems.HNHT.VSIStorageSystem VSIStorageSystem(T_start=T_start_ActiveStorage) annotation (Placement(transformation(extent={{0,80},{20,60}})));
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
    length=3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,30})));
  Components.Pipes.PhysicalModels.Pipe pipe5(
    use_HeatLoss=false,
    length=3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Components.Pipes.PhysicalModels.Pipe pipe6(
    use_HeatLoss=false,
    length=8.15,
    diameter=0.025,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-130,30})));
  Components.Pipes.PhysicalModels.Pipe pipe7(
    use_HeatLoss=false,
    length=8.15,
    diameter=0.025,
    n_Bending=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-30})));
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
    length=5.3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,70})));
  Components.Pipes.PhysicalModels.Pipe pipe13(
    use_HeatLoss=false,
    length=5.3,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-30,-70})));
  Components.Pipes.PhysicalModels.Pipe pipe15(
    use_HeatLoss=false,
    length=1.75,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,70})));
  Components.Pipes.PhysicalModels.Pipe pipe16(
    use_HeatLoss=false,
    length=1.75,
    diameter=0.05,
    n_Bending=3) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,-68})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,-0.01; 14400,-15; 15300,-15; 16200,-15; 17100,-15; 18000,-15; 18900,-15; 19800,-15; 20700,-15; 21600,-15; 22500,-15; 23400,-15; 24300,-15; 25200,-10; 26100,-10; 27000,-10; 27900,-10; 28800,-10; 29700,-10; 30600,-10; 31500,-10; 32400,-10; 33300,-10; 34200,-10; 35100,-10; 36000,-10; 36900,-10; 37800,-10; 38700,-10; 39600,-10; 40500,-10; 41400,-10; 42300,-10; 43200,
        -10; 44100,-12; 45000,-12; 45900,-12; 46800,-12; 47700,-12; 48600,-12; 49500,-12; 50400,-12; 51300,-12; 52200,-12; 53100,-12; 54000,-12; 54900,-12; 55800,-12; 56700,-12; 57600,-12; 58500,-12; 59400,-12; 60300,-12; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0;
        89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0; 99000,0; 99900,-0.01; 100800,-15; 101700,-15; 102600,-15; 103500,-15; 104400,-15; 105300,-15; 106200,-15; 107100,-15; 108000,-15; 108900,-15; 109800,-15; 110700,-15; 111600,-10; 112500,-10; 113400,-10; 114300,-10; 115200,-10; 116100,-10; 117000,-10; 117900,-10; 118800,-10; 119700,-10; 120600,-10; 121500,-10; 122400,-10; 123300,-10; 124200,-10; 125100,-10; 126000,-10; 126900,-10; 127800,-10;
        128700,-10; 129600,-10; 130500,-12; 131400,-12; 132300,-12; 133200,-12; 134100,-12; 135000,-12; 135900,-12; 136800,-12; 137700,-12; 138600,-12; 139500,-12; 140400,-12; 141300,-12; 142200,-12; 143100,-12; 144000,-12; 144900,-12; 145800,-12; 146700,-12; 147600,0; 148500,0; 149400,0; 150300,0; 151200,0; 152100,0; 153000,0; 153900,0; 154800,0; 155700,0; 156600,0; 157500,0; 158400,0; 159300,0; 160200,0; 161100,0; 162000,0; 162900,0; 163800,0; 164700,0; 165600,0; 166500,0; 167400,0; 168300,0;
        169200,0; 170100,0; 171000,0; 171900,0; 172800,0; 173700,0; 174600,0; 175500,0; 176400,0; 177300,0; 178200,0; 179100,0; 180000,0; 180900,0; 181800,0; 182700,0; 183600,0; 184500,0; 185400,0; 186300,-0.01; 187200,-15; 188100,-15; 189000,-15; 189900,-15; 190800,-15; 191700,-15; 192600,-15; 193500,-15; 194400,-15; 195300,-15; 196200,-15; 197100,-15; 198000,-10; 198900,-10; 199800,-10; 200700,-10; 201600,-10; 202500,-10; 203400,-10; 204300,-10; 205200,-10; 206100,-10; 207000,-10; 207900,-10;
        208800,-10; 209700,-10; 210600,-10; 211500,-10; 212400,-10; 213300,-10; 214200,-10; 215100,-10; 216000,-10; 216900,-12; 217800,-12; 218700,-12; 219600,-12; 220500,-12; 221400,-12; 222300,-12; 223200,-12; 224100,-12; 225000,-12; 225900,-12; 226800,-12; 227700,-12; 228600,-12; 229500,-12; 230400,-12; 231300,-12; 232200,-12; 233100,-12; 234000,0; 234900,0; 235800,0; 236700,0; 237600,0; 238500,0; 239400,0; 240300,0; 241200,0; 242100,0; 243000,0; 243900,0; 244800,0; 245700,0; 246600,0; 247500,
        0; 248400,0; 249300,0; 250200,0; 251100,0; 252000,0; 252900,0; 253800,0; 254700,0; 255600,0; 256500,0; 257400,0; 258300,0; 259200,0; 260100,0; 261000,0; 261900,0; 262800,0; 263700,0; 264600,0; 265500,0; 266400,0; 267300,0; 268200,0; 269100,0; 270000,0; 270900,0; 271800,0; 272700,-0.01; 273600,-15; 274500,-15; 275400,-15; 276300,-15; 277200,-15; 278100,-15; 279000,-15; 279900,-15; 280800,-15; 281700,-15; 282600,-15; 283500,-15; 284400,-10; 285300,-10; 286200,-10; 287100,-10; 288000,-10; 288900,
        -10; 289800,-10; 290700,-10; 291600,-10; 292500,-10; 293400,-10; 294300,-10; 295200,-10; 296100,-10; 297000,-10; 297900,-10; 298800,-10; 299700,-10; 300600,-10; 301500,-10; 302400,-10; 303300,-12; 304200,-12; 305100,-12; 306000,-12; 306900,-12; 307800,-12; 308700,-12; 309600,-12; 310500,-12; 311400,-12; 312300,-12; 313200,-12; 314100,-12; 315000,-12; 315900,-12; 316800,-12; 317700,-12; 318600,-12; 319500,-12; 320400,0; 321300,0; 322200,0; 323100,0; 324000,0; 324900,0; 325800,0; 326700,0;
        327600,0; 328500,0; 329400,0; 330300,0; 331200,0; 332100,0; 333000,0; 333900,0; 334800,0; 335700,0; 336600,0; 337500,0; 338400,0; 339300,0; 340200,0; 341100,0; 342000,0; 342900,0; 343800,0; 344700,0; 345600,0; 346500,0; 347400,0; 348300,0; 349200,0; 350100,0; 351000,0; 351900,0; 352800,0; 353700,0; 354600,0; 355500,0; 356400,0; 357300,0; 358200,0; 359100,-0.01; 360000,-15; 360900,-15; 361800,-15; 362700,-15; 363600,-15; 364500,-15; 365400,-15; 366300,-15; 367200,-15; 368100,-15; 369000,-15;
        369900,-15; 370800,-10; 371700,-10; 372600,-10; 373500,-10; 374400,-10; 375300,-10; 376200,-10; 377100,-10; 378000,-10; 378900,-10; 379800,-10; 380700,-10; 381600,-10; 382500,-10; 383400,-10; 384300,-10; 385200,-10; 386100,-10; 387000,-10; 387900,-10; 388800,-10; 389700,-12; 390600,-12; 391500,-12; 392400,-12; 393300,-12; 394200,-12; 395100,-12; 396000,-12; 396900,-12; 397800,-12; 398700,-12; 399600,-12; 400500,-12; 401400,-12; 402300,-12; 403200,-12; 404100,-12; 405000,-12; 405900,-12;
        406800,0; 407700,0; 408600,0; 409500,0; 410400,0; 411300,0; 412200,0; 413100,0; 414000,0; 414900,0; 415800,0; 416700,0; 417600,0; 418500,0; 419400,0; 420300,0; 421200,0; 422100,0; 423000,0; 423900,0; 424800,0; 425700,0; 426600,0; 427500,0; 428400,0; 429300,0; 430200,0; 431100,0; 432000,0; 432900,0; 433800,0; 434700,0; 435600,0; 436500,0; 437400,0; 438300,0; 439200,0; 440100,0; 441000,0; 441900,0; 442800,0; 443700,0; 444600,0; 445500,-0.01; 446400,-15; 447300,-15; 448200,-15; 449100,-15;
        450000,-15; 450900,-15; 451800,-15; 452700,-15; 453600,-15; 454500,-15; 455400,-15; 456300,-15; 457200,-10; 458100,-10; 459000,-10; 459900,-10; 460800,-10; 461700,-10; 462600,-10; 463500,-10; 464400,-10; 465300,-10; 466200,-10; 467100,-10; 468000,-10; 468900,-10; 469800,-10; 470700,-10; 471600,-10; 472500,-10; 473400,-10; 474300,-10; 475200,-10; 476100,-12; 477000,-12; 477900,-12; 478800,-12; 479700,-12; 480600,-12; 481500,-12; 482400,-12; 483300,-12; 484200,-12; 485100,-12; 486000,-12;
        486900,-12; 487800,-12; 488700,-12; 489600,-12; 490500,-12; 491400,-12; 492300,-12; 493200,0; 494100,0; 495000,0; 495900,0; 496800,0; 497700,0; 498600,0; 499500,0; 500400,0; 501300,0; 502200,0; 503100,0; 504000,0; 504900,0; 505800,0; 506700,0; 507600,0; 508500,0; 509400,0; 510300,0; 511200,0; 512100,0; 513000,0; 513900,0; 514800,0; 515700,0; 516600,0; 517500,0; 518400,0; 519300,0; 520200,0; 521100,0; 522000,0; 522900,0; 523800,0; 524700,0; 525600,0; 526500,0; 527400,0; 528300,0; 529200,0;
        530100,0; 531000,0; 531900,-0.01; 532800,-15; 533700,-15; 534600,-15; 535500,-15; 536400,-15; 537300,-15; 538200,-15; 539100,-15; 540000,-15; 540900,-15; 541800,-15; 542700,-15; 543600,-10; 544500,-10; 545400,-10; 546300,-10; 547200,-10; 548100,-10; 549000,-10; 549900,-10; 550800,-10; 551700,-10; 552600,-10; 553500,-10; 554400,-10; 555300,-10; 556200,-10; 557100,-10; 558000,-10; 558900,-10; 559800,-10; 560700,-10; 561600,-10; 562500,-12; 563400,-12; 564300,-12; 565200,-12; 566100,-12; 567000,
        -12; 567900,-12; 568800,-12; 569700,-12; 570600,-12; 571500,-12; 572400,-12; 573300,-12; 574200,-12; 575100,-12; 576000,-12; 576900,-12; 577800,-12; 578700,-12; 579600,0; 580500,0; 581400,0; 582300,0; 583200,0; 584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0],
                                                                                                   smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,2},{96,12}})));
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
                                                                         annotation (Placement(transformation(extent={{44,2},{54,12}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold annotation (Placement(transformation(extent={{104,-12},{110,-6}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(
    table=[0,0; 900,0; 1800,0; 2700,0; 3600,0; 4500,0; 5400,0; 6300,0; 7200,0; 8100,0; 9000,0; 9900,0; 10800,0; 11700,0; 12600,0; 13500,-0.01; 14400,-15; 15300,-15; 16200,-15; 17100,-15; 18000,-15; 18900,-15; 19800,-15; 20700,-15; 21600,-15; 22500,-15; 23400,-15; 24300,-15; 25200,-10; 26100,-10; 27000,-10; 27900,-10; 28800,-10; 29700,-10; 30600,-10; 31500,-10; 32400,-10; 33300,-10; 34200,-10; 35100,-10; 36000,-10; 36900,-10; 37800,-10; 38700,-10; 39600,-10; 40500,-10; 41400,-10; 42300,-10; 43200,
        -10; 44100,-12; 45000,-12; 45900,-12; 46800,-12; 47700,-12; 48600,-12; 49500,-12; 50400,-12; 51300,-12; 52200,-12; 53100,-12; 54000,-12; 54900,-12; 55800,-12; 56700,-12; 57600,-12; 58500,-12; 59400,-12; 60300,-12; 61200,0; 62100,0; 63000,0; 63900,0; 64800,0; 65700,0; 66600,0; 67500,0; 68400,0; 69300,0; 70200,0; 71100,0; 72000,0; 72900,0; 73800,0; 74700,0; 75600,0; 76500,0; 77400,0; 78300,0; 79200,0; 80100,0; 81000,0; 81900,0; 82800,0; 83700,0; 84600,0; 85500,0; 86400,0; 87300,0; 88200,0;
        89100,0; 90000,0; 90900,0; 91800,0; 92700,0; 93600,0; 94500,0; 95400,0; 96300,0; 97200,0; 98100,0; 99000,0; 99900,-0.01; 100800,-15; 101700,-15; 102600,-15; 103500,-15; 104400,-15; 105300,-15; 106200,-15; 107100,-15; 108000,-15; 108900,-15; 109800,-15; 110700,-15; 111600,-10; 112500,-10; 113400,-10; 114300,-10; 115200,-10; 116100,-10; 117000,-10; 117900,-10; 118800,-10; 119700,-10; 120600,-10; 121500,-10; 122400,-10; 123300,-10; 124200,-10; 125100,-10; 126000,-10; 126900,-10; 127800,-10;
        128700,-10; 129600,-10; 130500,-12; 131400,-12; 132300,-12; 133200,-12; 134100,-12; 135000,-12; 135900,-12; 136800,-12; 137700,-12; 138600,-12; 139500,-12; 140400,-12; 141300,-12; 142200,-12; 143100,-12; 144000,-12; 144900,-12; 145800,-12; 146700,-12; 147600,0; 148500,0; 149400,0; 150300,0; 151200,0; 152100,0; 153000,0; 153900,0; 154800,0; 155700,0; 156600,0; 157500,0; 158400,0; 159300,0; 160200,0; 161100,0; 162000,0; 162900,0; 163800,0; 164700,0; 165600,0; 166500,0; 167400,0; 168300,0;
        169200,0; 170100,0; 171000,0; 171900,0; 172800,0; 173700,0; 174600,0; 175500,0; 176400,0; 177300,0; 178200,0; 179100,0; 180000,0; 180900,0; 181800,0; 182700,0; 183600,0; 184500,0; 185400,0; 186300,-0.01; 187200,-15; 188100,-15; 189000,-15; 189900,-15; 190800,-15; 191700,-15; 192600,-15; 193500,-15; 194400,-15; 195300,-15; 196200,-15; 197100,-15; 198000,-10; 198900,-10; 199800,-10; 200700,-10; 201600,-10; 202500,-10; 203400,-10; 204300,-10; 205200,-10; 206100,-10; 207000,-10; 207900,-10;
        208800,-10; 209700,-10; 210600,-10; 211500,-10; 212400,-10; 213300,-10; 214200,-10; 215100,-10; 216000,-10; 216900,-12; 217800,-12; 218700,-12; 219600,-12; 220500,-12; 221400,-12; 222300,-12; 223200,-12; 224100,-12; 225000,-12; 225900,-12; 226800,-12; 227700,-12; 228600,-12; 229500,-12; 230400,-12; 231300,-12; 232200,-12; 233100,-12; 234000,0; 234900,0; 235800,0; 236700,0; 237600,0; 238500,0; 239400,0; 240300,0; 241200,0; 242100,0; 243000,0; 243900,0; 244800,0; 245700,0; 246600,0; 247500,
        0; 248400,0; 249300,0; 250200,0; 251100,0; 252000,0; 252900,0; 253800,0; 254700,0; 255600,0; 256500,0; 257400,0; 258300,0; 259200,0; 260100,0; 261000,0; 261900,0; 262800,0; 263700,0; 264600,0; 265500,0; 266400,0; 267300,0; 268200,0; 269100,0; 270000,0; 270900,0; 271800,0; 272700,-0.01; 273600,-15; 274500,-15; 275400,-15; 276300,-15; 277200,-15; 278100,-15; 279000,-15; 279900,-15; 280800,-15; 281700,-15; 282600,-15; 283500,-15; 284400,-10; 285300,-10; 286200,-10; 287100,-10; 288000,-10; 288900,
        -10; 289800,-10; 290700,-10; 291600,-10; 292500,-10; 293400,-10; 294300,-10; 295200,-10; 296100,-10; 297000,-10; 297900,-10; 298800,-10; 299700,-10; 300600,-10; 301500,-10; 302400,-10; 303300,-12; 304200,-12; 305100,-12; 306000,-12; 306900,-12; 307800,-12; 308700,-12; 309600,-12; 310500,-12; 311400,-12; 312300,-12; 313200,-12; 314100,-12; 315000,-12; 315900,-12; 316800,-12; 317700,-12; 318600,-12; 319500,-12; 320400,0; 321300,0; 322200,0; 323100,0; 324000,0; 324900,0; 325800,0; 326700,0;
        327600,0; 328500,0; 329400,0; 330300,0; 331200,0; 332100,0; 333000,0; 333900,0; 334800,0; 335700,0; 336600,0; 337500,0; 338400,0; 339300,0; 340200,0; 341100,0; 342000,0; 342900,0; 343800,0; 344700,0; 345600,0; 346500,0; 347400,0; 348300,0; 349200,0; 350100,0; 351000,0; 351900,0; 352800,0; 353700,0; 354600,0; 355500,0; 356400,0; 357300,0; 358200,0; 359100,-0.01; 360000,-15; 360900,-15; 361800,-15; 362700,-15; 363600,-15; 364500,-15; 365400,-15; 366300,-15; 367200,-15; 368100,-15; 369000,-15;
        369900,-15; 370800,-10; 371700,-10; 372600,-10; 373500,-10; 374400,-10; 375300,-10; 376200,-10; 377100,-10; 378000,-10; 378900,-10; 379800,-10; 380700,-10; 381600,-10; 382500,-10; 383400,-10; 384300,-10; 385200,-10; 386100,-10; 387000,-10; 387900,-10; 388800,-10; 389700,-12; 390600,-12; 391500,-12; 392400,-12; 393300,-12; 394200,-12; 395100,-12; 396000,-12; 396900,-12; 397800,-12; 398700,-12; 399600,-12; 400500,-12; 401400,-12; 402300,-12; 403200,-12; 404100,-12; 405000,-12; 405900,-12;
        406800,0; 407700,0; 408600,0; 409500,0; 410400,0; 411300,0; 412200,0; 413100,0; 414000,0; 414900,0; 415800,0; 416700,0; 417600,0; 418500,0; 419400,0; 420300,0; 421200,0; 422100,0; 423000,0; 423900,0; 424800,0; 425700,0; 426600,0; 427500,0; 428400,0; 429300,0; 430200,0; 431100,0; 432000,0; 432900,0; 433800,0; 434700,0; 435600,0; 436500,0; 437400,0; 438300,0; 439200,0; 440100,0; 441000,0; 441900,0; 442800,0; 443700,0; 444600,0; 445500,-0.01; 446400,-15; 447300,-15; 448200,-15; 449100,-15;
        450000,-15; 450900,-15; 451800,-15; 452700,-15; 453600,-15; 454500,-15; 455400,-15; 456300,-15; 457200,-10; 458100,-10; 459000,-10; 459900,-10; 460800,-10; 461700,-10; 462600,-10; 463500,-10; 464400,-10; 465300,-10; 466200,-10; 467100,-10; 468000,-10; 468900,-10; 469800,-10; 470700,-10; 471600,-10; 472500,-10; 473400,-10; 474300,-10; 475200,-10; 476100,-12; 477000,-12; 477900,-12; 478800,-12; 479700,-12; 480600,-12; 481500,-12; 482400,-12; 483300,-12; 484200,-12; 485100,-12; 486000,-12;
        486900,-12; 487800,-12; 488700,-12; 489600,-12; 490500,-12; 491400,-12; 492300,-12; 493200,0; 494100,0; 495000,0; 495900,0; 496800,0; 497700,0; 498600,0; 499500,0; 500400,0; 501300,0; 502200,0; 503100,0; 504000,0; 504900,0; 505800,0; 506700,0; 507600,0; 508500,0; 509400,0; 510300,0; 511200,0; 512100,0; 513000,0; 513900,0; 514800,0; 515700,0; 516600,0; 517500,0; 518400,0; 519300,0; 520200,0; 521100,0; 522000,0; 522900,0; 523800,0; 524700,0; 525600,0; 526500,0; 527400,0; 528300,0; 529200,0;
        530100,0; 531000,0; 531900,-0.01; 532800,-15; 533700,-15; 534600,-15; 535500,-15; 536400,-15; 537300,-15; 538200,-15; 539100,-15; 540000,-15; 540900,-15; 541800,-15; 542700,-15; 543600,-10; 544500,-10; 545400,-10; 546300,-10; 547200,-10; 548100,-10; 549000,-10; 549900,-10; 550800,-10; 551700,-10; 552600,-10; 553500,-10; 554400,-10; 555300,-10; 556200,-10; 557100,-10; 558000,-10; 558900,-10; 559800,-10; 560700,-10; 561600,-10; 562500,-12; 563400,-12; 564300,-12; 565200,-12; 566100,-12; 567000,
        -12; 567900,-12; 568800,-12; 569700,-12; 570600,-12; 571500,-12; 572400,-12; 573300,-12; 574200,-12; 575100,-12; 576000,-12; 576900,-12; 577800,-12; 578700,-12; 579600,0; 580500,0; 581400,0; 582300,0; 583200,0; 584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,-14},{96,-4}})));
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
  StaticHeatingSystem.fSetPointAutomatic = 0;
  VSIStorageSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_VSIStorage;
  VSIStorageSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  VSIStorageSystem.fSetPointAutomatic = 0.5;
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
  connect(pipe7.port_a, pipe5.port_b) annotation (Line(points={{-120,-20},{-80,-20}}, color={0,127,255}));
  connect(pipe6.port_b, pipe4.port_a) annotation (Line(points={{-120,20},{-80,20}}, color={0,127,255}));
  connect(CondensingBoilerSystem.port_a, pipe7.port_b) annotation (Line(points={{-140,-10},{-140,-20}}, color={0,127,255}));
  connect(pipe6.port_a, CondensingBoilerSystem.port_b) annotation (Line(points={{-140,20},{-140,10}}, color={0,127,255}));
  connect(pipe8.port_a, BufferStorage.port_b) annotation (Line(points={{60,20},{40,20},{40,10}}, color={0,127,255}));
  connect(pipe9.port_b, BufferStorage.port_a) annotation (Line(points={{60,-20},{40,-20},{40,-10}}, color={0,127,255}));
  connect(pipe10.port_a, pipe8.port_b) annotation (Line(points={{120,20},{80,20}}, color={0,127,255}));
  connect(pipe11.port_b, pipe9.port_a) annotation (Line(points={{120,-20},{80,-20}}, color={0,127,255}));
  connect(pipe10.port_b,CentralMachineHeatingSystem. port_a) annotation (Line(points={{140,20},{140,10}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.port_b, pipe11.port_a) annotation (Line(points={{140,-10},{140,-20}}, color={0,127,255}));
  connect(pipe12.port_a, VSIStorageSystem.port_b1) annotation (Line(points={{-20,80},{16,80}},
                                                                                             color={0,127,255}));
  connect(pipe12.port_b, pipe4.port_a) annotation (Line(points={{-40,80},{-100,80},{-100,20},{-80,20}}, color={0,127,255}));
  connect(pipe13.port_a, pipe5.port_b) annotation (Line(points={{-40,-60},{-100,-60},{-100,-20},{-80,-20}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a1, pipe13.port_b) annotation (Line(points={{16,60},{16,-60},{-20,-60}},
                                                                                                       color={0,127,255}));
  connect(VSIStorageSystem.port_b2, pipe16.port_a) annotation (Line(points={{20,60},{46,60},{46,-58},{50,-58}}, color={0,127,255}));
  connect(VSIStorageSystem.port_a2, pipe15.port_b) annotation (Line(points={{20,80},{52,80}}, color={0,127,255}));
  connect(StaticHeatingSystem.fHeatFlowRate, combiTimeTable2.y[1]) annotation (Line(points={{58,7},{54.5,7},{54.5,7}}, color={0,0,127}));
  connect(StaticHeatingSystem.port_a, pipe8.port_b) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_b, pipe9.port_a) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(port_b_HNLT_Consumer, pipe8.port_b) annotation (Line(points={{100,60},{100,20},{80,20}}, color={0,127,255}));
  connect(port_a_HNLT_Consumer, pipe9.port_a) annotation (Line(points={{100,-60},{100,-20},{80,-20}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.bSetStatusOnAutomatic, lessThreshold.y) annotation (Line(points={{118,-9},{110.3,-9}}, color={255,0,255}));
  connect(combiTimeTable.y[1], CentralMachineHeatingSystem.fHeatFlowRate) annotation (Line(points={{96.5,7},{106.25,7},{106.25,7},{118,7}}, color={0,0,127}));
  connect(lessThreshold.u, combiTimeTable1.y[1]) annotation (Line(points={{103.4,-9},{96.5,-9},{96.5,-9}}, color={0,0,127}));
  connect(boundary.ports[1], pipe11.port_a) annotation (Line(points={{160,-30},{150,-30},{150,-20},{140,-20}}, color={0,127,255}));
  connect(pipe16.port_b, BufferStorage.port_a) annotation (Line(points={{70,-58},{70,-48},{40,-48},{40,-10}}, color={0,127,255}));
  connect(pipe15.port_a, BufferStorage.port_b) annotation (Line(points={{72,80},{72,50},{40,50},{40,10}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT;
