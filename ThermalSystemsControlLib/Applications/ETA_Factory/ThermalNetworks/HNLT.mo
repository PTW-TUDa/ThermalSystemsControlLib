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
        584100,0; 585000,0; 585900,0; 586800,0; 587700,0; 588600,0; 589500,0; 590400,0; 591300,0; 592200,0; 593100,0; 594000,0; 594900,0; 595800,0; 596700,0; 597600,0; 598500,0; 599400,0; 600300,0; 601200,0; 602100,0; 603000,0; 603900,0; 604800,0; 605700,0; 606600,0; 607500,0; 608400,0; 609300,0; 610200,0; 611100,0; 612000,0; 612900,0; 613800,0; 614700,0; 615600,0; 616500,0; 617400,0; 618300,0.01; 619200,8; 620100,8; 621000,5; 621900,5; 622800,1; 623700,1; 624600,1; 625500,1; 626400,8; 627300,8;
        628200,5; 629100,5; 630000,1; 630900,1; 631800,1; 632700,1; 633600,8; 634500,8; 635400,5; 636300,5; 637200,1; 638100,1; 639000,1; 639900,1; 640800,8; 641700,8; 642600,5; 643500,5; 644400,1; 645300,1; 646200,1; 647100,1; 648000,8; 648900,8; 649800,5; 650700,5; 651600,1; 652500,1; 653400,8; 654300,8; 655200,5; 656100,5; 657000,1; 657900,1; 658800,8; 659700,8; 660600,5; 661500,5; 662400,1; 663300,1; 664200,0; 665100,0; 666000,0; 666900,0; 667800,0; 668700,0; 669600,0; 670500,0; 671400,0;
        672300,0; 673200,0; 674100,0; 675000,0; 675900,0; 676800,0; 677700,0; 678600,0; 679500,0; 680400,0; 681300,0; 682200,0; 683100,0; 684000,0; 684900,0; 685800,0; 686700,0; 687600,0; 688500,0; 689400,0; 690300,0; 691200,0; 692100,0; 693000,0; 693900,0; 694800,0; 695700,0; 696600,0; 697500,0; 698400,0; 699300,0; 700200,0; 701100,0; 702000,0; 702900,0; 703800,0; 704700,0.01; 705600,8; 706500,8; 707400,5; 708300,5; 709200,1; 710100,1; 711000,1; 711900,1; 712800,8; 713700,8; 714600,5; 715500,5;
        716400,1; 717300,1; 718200,1; 719100,1; 720000,8; 720900,8; 721800,5; 722700,5; 723600,1; 724500,1; 725400,1; 726300,1; 727200,8; 728100,8; 729000,5; 729900,5; 730800,1; 731700,1; 732600,1; 733500,1; 734400,8; 735300,8; 736200,5; 737100,5; 738000,1; 738900,1; 739800,8; 740700,8; 741600,5; 742500,5; 743400,1; 744300,1; 745200,8; 746100,8; 747000,5; 747900,5; 748800,1; 749700,1; 750600,0; 751500,0; 752400,0; 753300,0; 754200,0; 755100,0; 756000,0; 756900,0; 757800,0; 758700,0; 759600,0;
        760500,0; 761400,0; 762300,0; 763200,0; 764100,0; 765000,0; 765900,0; 766800,0; 767700,0; 768600,0; 769500,0; 770400,0; 771300,0; 772200,0; 773100,0; 774000,0; 774900,0; 775800,0; 776700,0; 777600,0; 778500,0; 779400,0; 780300,0; 781200,0; 782100,0; 783000,0; 783900,0; 784800,0; 785700,0; 786600,0; 787500,0; 788400,0; 789300,0; 790200,0; 791100,0.01; 792000,8; 792900,8; 793800,5; 794700,5; 795600,1; 796500,1; 797400,1; 798300,1; 799200,8; 800100,8; 801000,5; 801900,5; 802800,1; 803700,1;
        804600,1; 805500,1; 806400,8; 807300,8; 808200,5; 809100,5; 810000,1; 810900,1; 811800,1; 812700,1; 813600,8; 814500,8; 815400,5; 816300,5; 817200,1; 818100,1; 819000,1; 819900,1; 820800,8; 821700,8; 822600,5; 823500,5; 824400,1; 825300,1; 826200,8; 827100,8; 828000,5; 828900,5; 829800,1; 830700,1; 831600,8; 832500,8; 833400,5; 834300,5; 835200,1; 836100,1; 837000,0; 837900,0; 838800,0; 839700,0; 840600,0; 841500,0; 842400,0; 843300,0; 844200,0; 845100,0; 846000,0; 846900,0; 847800,0;
        848700,0; 849600,0; 850500,0; 851400,0; 852300,0; 853200,0; 854100,0; 855000,0; 855900,0; 856800,0; 857700,0; 858600,0; 859500,0; 860400,0; 861300,0; 862200,0; 863100,0; 864000,0; 864900,0; 865800,0; 866700,0; 867600,0; 868500,0; 869400,0; 870300,0; 871200,0; 872100,0; 873000,0; 873900,0; 874800,0; 875700,0; 876600,0; 877500,0.01; 878400,8; 879300,8; 880200,5; 881100,5; 882000,1; 882900,1; 883800,1; 884700,1; 885600,8; 886500,8; 887400,5; 888300,5; 889200,1; 890100,1; 891000,1; 891900,1;
        892800,8; 893700,8; 894600,5; 895500,5; 896400,1; 897300,1; 898200,1; 899100,1; 900000,8; 900900,8; 901800,5; 902700,5; 903600,1; 904500,1; 905400,1; 906300,1; 907200,8; 908100,8; 909000,5; 909900,5; 910800,1; 911700,1; 912600,8; 913500,8; 914400,5; 915300,5; 916200,1; 917100,1; 918000,8; 918900,8; 919800,5; 920700,5; 921600,1; 922500,1; 923400,0; 924300,0; 925200,0; 926100,0; 927000,0; 927900,0; 928800,0; 929700,0; 930600,0; 931500,0; 932400,0; 933300,0; 934200,0; 935100,0; 936000,0;
        936900,0; 937800,0; 938700,0; 939600,0; 940500,0; 941400,0; 942300,0; 943200,0; 944100,0; 945000,0; 945900,0; 946800,0; 947700,0; 948600,0; 949500,0; 950400,0; 951300,0; 952200,0; 953100,0; 954000,0; 954900,0; 955800,0; 956700,0; 957600,0; 958500,0; 959400,0; 960300,0; 961200,0; 962100,0; 963000,0; 963900,0.01; 964800,8; 965700,8; 966600,5; 967500,5; 968400,1; 969300,1; 970200,1; 971100,1; 972000,8; 972900,8; 973800,5; 974700,5; 975600,1; 976500,1; 977400,1; 978300,1; 979200,8; 980100,8;
        981000,5; 981900,5; 982800,1; 983700,1; 984600,1; 985500,1; 986400,8; 987300,8; 988200,5; 989100,5; 990000,1; 990900,1; 991800,1; 992700,1; 993600,8; 994500,8; 995400,5; 996300,5; 997200,1; 998100,1; 999000,8; 999900,8; 1000800,5; 1001700,5; 1002600,1; 1003500,1; 1004400,8; 1005300,8; 1006200,5; 1007100,5; 1008000,1; 1008900,1; 1009800,0; 1010700,0; 1011600,0; 1012500,0; 1013400,0; 1014300,0; 1015200,0; 1016100,0; 1017000,0; 1017900,0; 1018800,0; 1019700,0; 1020600,0; 1021500,0; 1022400,
        0; 1023300,0; 1024200,0; 1025100,0; 1026000,0; 1026900,0; 1027800,0; 1028700,0; 1029600,0; 1030500,0; 1031400,0; 1032300,0; 1033200,0; 1034100,0; 1035000,0; 1035900,0; 1036800,0; 1037700,0; 1038600,0; 1039500,0; 1040400,0; 1041300,0; 1042200,0; 1043100,0; 1044000,0; 1044900,0; 1045800,0; 1046700,0; 1047600,0; 1048500,0; 1049400,0; 1050300,0; 1051200,0; 1052100,0; 1053000,0; 1053900,0; 1054800,0; 1055700,0; 1056600,0; 1057500,0; 1058400,0; 1059300,0; 1060200,0; 1061100,0; 1062000,0;
        1062900,0; 1063800,0; 1064700,0; 1065600,0; 1066500,0; 1067400,0; 1068300,0; 1069200,0; 1070100,0; 1071000,0; 1071900,0; 1072800,0; 1073700,0; 1074600,0; 1075500,0; 1076400,0; 1077300,0; 1078200,0; 1079100,0; 1080000,0; 1080900,0; 1081800,0; 1082700,0; 1083600,0; 1084500,0; 1085400,0; 1086300,0; 1087200,0; 1088100,0; 1089000,0; 1089900,0; 1090800,0; 1091700,0; 1092600,0; 1093500,0; 1094400,0; 1095300,0; 1096200,0; 1097100,0; 1098000,0; 1098900,0; 1099800,0; 1100700,0; 1101600,0; 1102500,
        0; 1103400,0; 1104300,0; 1105200,0; 1106100,0; 1107000,0; 1107900,0; 1108800,0; 1109700,0; 1110600,0; 1111500,0; 1112400,0; 1113300,0; 1114200,0; 1115100,0; 1116000,0; 1116900,0; 1117800,0; 1118700,0; 1119600,0; 1120500,0; 1121400,0; 1122300,0; 1123200,0; 1124100,0; 1125000,0; 1125900,0; 1126800,0; 1127700,0; 1128600,0; 1129500,0; 1130400,0; 1131300,0; 1132200,0; 1133100,0; 1134000,0; 1134900,0; 1135800,0; 1136700,0; 1137600,0; 1138500,0; 1139400,0; 1140300,0; 1141200,0; 1142100,0;
        1143000,0; 1143900,0; 1144800,0; 1145700,0; 1146600,0; 1147500,0; 1148400,0; 1149300,0; 1150200,0; 1151100,0; 1152000,0; 1152900,0; 1153800,0; 1154700,0; 1155600,0; 1156500,0; 1157400,0; 1158300,0; 1159200,0; 1160100,0; 1161000,0; 1161900,0; 1162800,0; 1163700,0; 1164600,0; 1165500,0; 1166400,0; 1167300,0; 1168200,0; 1169100,0; 1170000,0; 1170900,0; 1171800,0; 1172700,0; 1173600,0; 1174500,0; 1175400,0; 1176300,0; 1177200,0; 1178100,0; 1179000,0; 1179900,0; 1180800,0; 1181700,0; 1182600,
        0; 1183500,0; 1184400,0; 1185300,0; 1186200,0; 1187100,0; 1188000,0; 1188900,0; 1189800,0; 1190700,0; 1191600,0; 1192500,0; 1193400,0; 1194300,0; 1195200,0; 1196100,0; 1197000,0; 1197900,0; 1198800,0; 1199700,0; 1200600,0; 1201500,0; 1202400,0; 1203300,0; 1204200,0; 1205100,0; 1206000,0; 1206900,0; 1207800,0; 1208700,0],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
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
  HVFASystem.fSetPointAutomatic = 0.7;
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
