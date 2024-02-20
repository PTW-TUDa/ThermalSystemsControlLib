within ThermalSystemsControlLib.Applications.ETA_Factory.ThermalNetworks;
model HNHT
  extends ThermalSystemsControlLib.BaseClasses.Icons.Systems_Icon;
  parameter SI.Temperature T_start=328.15 "Start value of buffer storage temperature";
  parameter SI.Temperature T_start_ActiveStorage=293.15 "Start value of active storage temperature";
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CHP1System CHP1System annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CondensingBoilerSystem CondensingBoilerSystem annotation (Placement(transformation(extent={{-160,-10},{-140,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.CHP2System CHP2System annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ThermalSystemsControlLib.Applications.ETA_Factory.Systems.HNHT.StaticHeatingSystem StaticHeatingSystem annotation (Placement(transformation(extent={{60,10},{80,-10}})));
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
        579600,0; 580500,0; 581400,0; 582300,0; 583200,0; 584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0; 604800,0; 605700,0; 606600,0; 607500,0; 608400,0; 609300,0; 610200,0; 611100,0; 612000,0; 612900,0; 613800,0; 614700,0; 615600,0; 616500,0; 617400,0; 618300,-0.01; 619200,-15; 620100,-15; 621000,-15; 621900,-15;
        622800,-15; 623700,-15; 624600,-15; 625500,-15; 626400,-15; 627300,-15; 628200,-15; 629100,-15; 630000,-10; 630900,-10; 631800,-10; 632700,-10; 633600,-10; 634500,-10; 635400,-10; 636300,-10; 637200,-10; 638100,-10; 639000,-10; 639900,-10; 640800,-10; 641700,-10; 642600,-10; 643500,-10; 644400,-10; 645300,-10; 646200,-10; 647100,-10; 648000,-10; 648900,-12; 649800,-12; 650700,-12; 651600,-12; 652500,-12; 653400,-12; 654300,-12; 655200,-12; 656100,-12; 657000,-12; 657900,-12; 658800,-12;
        659700,-12; 660600,-12; 661500,-12; 662400,-12; 663300,-12; 664200,-12; 665100,-12; 666000,0; 666900,0; 667800,0; 668700,0; 669600,0; 670500,0; 671400,0; 672300,0; 673200,0; 674100,0; 675000,0; 675900,0; 676800,0; 677700,0; 678600,0; 679500,0; 680400,0; 681300,0; 682200,0; 683100,0; 684000,0; 684900,0; 685800,0; 686700,0; 687600,0; 688500,0; 689400,0; 690300,0; 691200,0; 692100,0; 693000,0; 693900,0; 694800,0; 695700,0; 696600,0; 697500,0; 698400,0; 699300,0; 700200,0; 701100,0; 702000,
        0; 702900,0; 703800,0; 704700,-0.01; 705600,-15; 706500,-15; 707400,-15; 708300,-15; 709200,-15; 710100,-15; 711000,-15; 711900,-15; 712800,-15; 713700,-15; 714600,-15; 715500,-15; 716400,-10; 717300,-10; 718200,-10; 719100,-10; 720000,-10; 720900,-10; 721800,-10; 722700,-10; 723600,-10; 724500,-10; 725400,-10; 726300,-10; 727200,-10; 728100,-10; 729000,-10; 729900,-10; 730800,-10; 731700,-10; 732600,-10; 733500,-10; 734400,-10; 735300,-12; 736200,-12; 737100,-12; 738000,-12; 738900,-12;
        739800,-12; 740700,-12; 741600,-12; 742500,-12; 743400,-12; 744300,-12; 745200,-12; 746100,-12; 747000,-12; 747900,-12; 748800,-12; 749700,-12; 750600,-12; 751500,-12; 752400,0; 753300,0; 754200,0; 755100,0; 756000,0; 756900,0; 757800,0; 758700,0; 759600,0; 760500,0; 761400,0; 762300,0; 763200,0; 764100,0; 765000,0; 765900,0; 766800,0; 767700,0; 768600,0; 769500,0; 770400,0; 771300,0; 772200,0; 773100,0; 774000,0; 774900,0; 775800,0; 776700,0; 777600,0; 778500,0; 779400,0; 780300,0;
        781200,0; 782100,0; 783000,0; 783900,0; 784800,0; 785700,0; 786600,0; 787500,0; 788400,0; 789300,0; 790200,0; 791100,-0.01; 792000,-15; 792900,-15; 793800,-15; 794700,-15; 795600,-15; 796500,-15; 797400,-15; 798300,-15; 799200,-15; 800100,-15; 801000,-15; 801900,-15; 802800,-10; 803700,-10; 804600,-10; 805500,-10; 806400,-10; 807300,-10; 808200,-10; 809100,-10; 810000,-10; 810900,-10; 811800,-10; 812700,-10; 813600,-10; 814500,-10; 815400,-10; 816300,-10; 817200,-10; 818100,-10; 819000,
        -10; 819900,-10; 820800,-10; 821700,-12; 822600,-12; 823500,-12; 824400,-12; 825300,-12; 826200,-12; 827100,-12; 828000,-12; 828900,-12; 829800,-12; 830700,-12; 831600,-12; 832500,-12; 833400,-12; 834300,-12; 835200,-12; 836100,-12; 837000,-12; 837900,-12; 838800,0; 839700,0; 840600,0; 841500,0; 842400,0; 843300,0; 844200,0; 845100,0; 846000,0; 846900,0; 847800,0; 848700,0; 849600,0; 850500,0; 851400,0; 852300,0; 853200,0; 854100,0; 855000,0; 855900,0; 856800,0; 857700,0; 858600,0;
        859500,0; 860400,0; 861300,0; 862200,0; 863100,0; 864000,0; 864900,0; 865800,0; 866700,0; 867600,0; 868500,0; 869400,0; 870300,0; 871200,0; 872100,0; 873000,0; 873900,0; 874800,0; 875700,0; 876600,0; 877500,-0.01; 878400,-15; 879300,-15; 880200,-15; 881100,-15; 882000,-15; 882900,-15; 883800,-15; 884700,-15; 885600,-15; 886500,-15; 887400,-15; 888300,-15; 889200,-10; 890100,-10; 891000,-10; 891900,-10; 892800,-10; 893700,-10; 894600,-10; 895500,-10; 896400,-10; 897300,-10; 898200,-10;
        899100,-10; 900000,-10; 900900,-10; 901800,-10; 902700,-10; 903600,-10; 904500,-10; 905400,-10; 906300,-10; 907200,-10; 908100,-12; 909000,-12; 909900,-12; 910800,-12; 911700,-12; 912600,-12; 913500,-12; 914400,-12; 915300,-12; 916200,-12; 917100,-12; 918000,-12; 918900,-12; 919800,-12; 920700,-12; 921600,-12; 922500,-12; 923400,-12; 924300,-12; 925200,0; 926100,0; 927000,0; 927900,0; 928800,0; 929700,0; 930600,0; 931500,0; 932400,0; 933300,0; 934200,0; 935100,0; 936000,0; 936900,0;
        937800,0; 938700,0; 939600,0; 940500,0; 941400,0; 942300,0; 943200,0; 944100,0; 945000,0; 945900,0; 946800,0; 947700,0; 948600,0; 949500,0; 950400,0; 951300,0; 952200,0; 953100,0; 954000,0; 954900,0; 955800,0; 956700,0; 957600,0; 958500,0; 959400,0; 960300,0; 961200,0; 962100,0; 963000,0; 963900,-0.01; 964800,-15; 965700,-15; 966600,-15; 967500,-15; 968400,-15; 969300,-15; 970200,-15; 971100,-15; 972000,-15; 972900,-15; 973800,-15; 974700,-15; 975600,-10; 976500,-10; 977400,-10; 978300,
        -10; 979200,-10; 980100,-10; 981000,-10; 981900,-10; 982800,-10; 983700,-10; 984600,-10; 985500,-10; 986400,-10; 987300,-10; 988200,-10; 989100,-10; 990000,-10; 990900,-10; 991800,-10; 992700,-10; 993600,-10; 994500,-12; 995400,-12; 996300,-12; 997200,-12; 998100,-12; 999000,-12; 999900,-12; 1000800,-12; 1001700,-12; 1002600,-12; 1003500,-12; 1004400,-12; 1005300,-12; 1006200,-12; 1007100,-12; 1008000,-12; 1008900,-12; 1009800,-12; 1010700,-12; 1011600,0; 1012500,0; 1013400,0; 1014300,0;
        1015200,0; 1016100,0; 1017000,0; 1017900,0; 1018800,0; 1019700,0; 1020600,0; 1021500,0; 1022400,0; 1023300,0; 1024200,0; 1025100,0; 1026000,0; 1026900,0; 1027800,0; 1028700,0; 1029600,0; 1030500,0; 1031400,0; 1032300,0; 1033200,0; 1034100,0; 1035000,0; 1035900,0; 1036800,0; 1037700,0; 1038600,0; 1039500,0; 1040400,0; 1041300,0; 1042200,0; 1043100,0; 1044000,0; 1044900,0; 1045800,0; 1046700,0; 1047600,0; 1048500,0; 1049400,0; 1050300,0; 1051200,0; 1052100,0; 1053000,0; 1053900,0; 1054800,
        0; 1055700,0; 1056600,0; 1057500,0; 1058400,0; 1059300,0; 1060200,0; 1061100,0; 1062000,0; 1062900,0; 1063800,0; 1064700,0; 1065600,0; 1066500,0; 1067400,0; 1068300,0; 1069200,0; 1070100,0; 1071000,0; 1071900,0; 1072800,0; 1073700,0; 1074600,0; 1075500,0; 1076400,0; 1077300,0; 1078200,0; 1079100,0; 1080000,0; 1080900,0; 1081800,0; 1082700,0; 1083600,0; 1084500,0; 1085400,0; 1086300,0; 1087200,0; 1088100,0; 1089000,0; 1089900,0; 1090800,0; 1091700,0; 1092600,0; 1093500,0; 1094400,0;
        1095300,0; 1096200,0; 1097100,0; 1098000,0; 1098900,0; 1099800,0; 1100700,0; 1101600,0; 1102500,0; 1103400,0; 1104300,0; 1105200,0; 1106100,0; 1107000,0; 1107900,0; 1108800,0; 1109700,0; 1110600,0; 1111500,0; 1112400,0; 1113300,0; 1114200,0; 1115100,0; 1116000,0; 1116900,0; 1117800,0; 1118700,0; 1119600,0; 1120500,0; 1121400,0; 1122300,0; 1123200,0; 1124100,0; 1125000,0; 1125900,0; 1126800,0; 1127700,0; 1128600,0; 1129500,0; 1130400,0; 1131300,0; 1132200,0; 1133100,0; 1134000,0; 1134900,
        0; 1135800,0; 1136700,0; 1137600,0; 1138500,0; 1139400,0; 1140300,0; 1141200,0; 1142100,0; 1143000,0; 1143900,0; 1144800,0; 1145700,0; 1146600,0; 1147500,0; 1148400,0; 1149300,0; 1150200,0; 1151100,0; 1152000,0; 1152900,0; 1153800,0; 1154700,0; 1155600,0; 1156500,0; 1157400,0; 1158300,0; 1159200,0; 1160100,0; 1161000,0; 1161900,0; 1162800,0; 1163700,0; 1164600,0; 1165500,0; 1166400,0; 1167300,0; 1168200,0; 1169100,0; 1170000,0; 1170900,0; 1171800,0; 1172700,0; 1173600,0; 1174500,0;
        1175400,0; 1176300,0; 1177200,0; 1178100,0; 1179000,0; 1179900,0; 1180800,0; 1181700,0; 1182600,0; 1183500,0; 1184400,0; 1185300,0; 1186200,0; 1187100,0; 1188000,0; 1188900,0; 1189800,0; 1190700,0; 1191600,0; 1192500,0; 1193400,0; 1194300,0; 1195200,0; 1196100,0; 1197000,0; 1197900,0; 1198800,0; 1199700,0; 1200600,0; 1201500,0; 1202400,0; 1203300,0; 1204200,0; 1205100,0; 1206000,0; 1206900,0; 1207800,0; 1208700,0],
                                                                                                   smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                             annotation (Placement(transformation(extent={{86,2},{96,12}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold annotation (Placement(transformation(extent={{104,-12},{110,-6}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_HNLT_Producer(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
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
  VSIStorageSystem.bSetStatusOnAutomatic = controlAutomatic.bSetStatusOn_VSIStorage;
  VSIStorageSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  VSIStorageSystem.fSetPointAutomatic = 0.5;
  VSIStorageSystem.bLoadingAutomatic = controlAutomatic.bLoading_VSIStorage;
  CentralMachineHeatingSystem.bAlgorithmPermission = controlAutomatic.bAlgorithmPermission;
  CentralMachineHeatingSystem.fSetPointAutomatic  = 0.3;
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
  connect(StaticHeatingSystem.port_a, pipe8.port_b) annotation (Line(points={{80,10},{80,20}}, color={0,127,255}));
  connect(StaticHeatingSystem.port_b, pipe9.port_a) annotation (Line(points={{80,-10},{80,-20}}, color={0,127,255}));
  connect(port_b_HNLT_Consumer, pipe8.port_b) annotation (Line(points={{100,60},{100,20},{80,20}}, color={0,127,255}));
  connect(port_a_HNLT_Consumer, pipe9.port_a) annotation (Line(points={{100,-60},{100,-20},{80,-20}}, color={0,127,255}));
  connect(CentralMachineHeatingSystem.bSetStatusOnAutomatic, lessThreshold.y) annotation (Line(points={{118,-9},{110.3,-9}}, color={255,0,255}));
  connect(combiTimeTable.y[1], CentralMachineHeatingSystem.fHeatFlowRate) annotation (Line(points={{96.5,7},{106.25,7},{106.25,7},{118,7}}, color={0,0,127}));
  connect(boundary.ports[1], pipe11.port_a) annotation (Line(points={{160,-30},{150,-30},{150,-20},{140,-20}}, color={0,127,255}));
  connect(pipe16.port_b, BufferStorage.port_a) annotation (Line(points={{70,-58},{70,-48},{40,-48},{40,-10}}, color={0,127,255}));
  connect(pipe15.port_a, BufferStorage.port_b) annotation (Line(points={{72,80},{72,50},{40,50},{40,10}}, color={0,127,255}));
  connect(port_b_HNLT_Producer, BufferStorage.port_a) annotation (Line(points={{100,-100},{40,-100},{40,-10}}, color={0,127,255}));
  connect(port_a_HNLT_Producer, BufferStorage.port_b) annotation (Line(points={{100,100},{40,100},{40,10}}, color={0,127,255}));
  connect(lessThreshold.u, CentralMachineHeatingSystem.fHeatFlowRate) annotation (Line(points={{103.4,-9},{100,-9},{100,7},{118,7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HNHT;
