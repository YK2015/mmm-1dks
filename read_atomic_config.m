function ac = read_atomic_config(n)
% Input:
%   n : electron number
ac = atomic_configuration;
switch(n)    
    case 1
        % H
        ac.atom_name = 'H';
        ac.Z = 1;
        ac.focc = 1;
        ac.fnl   = "1s";
        ac.E_ref = -0.445671; % nist
        ac.n_angular = 1;
        ac.ev_index  = [0 1];

    case 2
        % He50(3)
        ac.atom_name = 'He';
        ac.Z = 2;
        ac.focc = 2;
        ac.fnl   = "1s";
        ac.E_ref = -2.834836; % nist
        ac.n_angular = 1;
        ac.ev_index  = [0 1];
        %
        % Li 50(3)
    case 3
        ac.atom_name = 'Li';
        ac.Z     = 3;
        ac.focc  = [2 1];
        ac.fnl   = ["1s" "2s"];
        ac.E_ref = -7.335195; % nist
        ac.n_angular = 1;
        ac.ev_index  = [0 2];

    case 4
        % Be 50(3)
        ac.atom_name = 'Be';
        ac.Z     = 4;
        ac.focc  = [2 2];
        ac.fnl   = ["1s" "2s"];
        ac.E_ref = -14.447209; % nist
        ac.n_angular = 1;
        ac.ev_index  = [0 2];

    case 5
        % B 50(4,-24.34419763889955)
        ac.atom_name = 'B';
        ac.Z     = 5;
        ac.focc  = [2 2 1];
        ac.fnl   = ["1s" "2s" "2p"];
        ac.E_ref = -24.344198; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 2 3];

    case 6
        % C 100(3,-37.42574850)
        ac.atom_name = 'C';
        ac.Z     = 6;
        ac.focc  = [2 2 2];
        ac.fnl   = ["1s" "2s" "2p"];
        ac.E_ref = -37.425749; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 2 3];

    case 7
        %  N 90(3,-54.02501603457713) 100(3,-54.02501608)
        ac.atom_name = 'N';
        ac.Z     = 7;
        ac.focc  = [2 2 3];
        ac.fnl   = ["1s" "2s" "2p"];
        ac.E_ref = -54.025016; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 2 3];

    case 8
        %  O 90(3,-74.47307660034488)  120(3,-74.47307676)
        ac.atom_name = 'O';
        ac.Z     = 8;
        ac.focc  = [2 2 4];
        ac.fnl   =["1s" "2s" "2p"];
        ac.E_ref = -74.473077; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 2 3];

    case 9
        % F 90(3,-99.09964771712379) 120(3,-99.09964801)
        ac.atom_name = 'F';
        ac.Z     = 9;
        ac.focc  = [2 2 5];
        ac.fnl   = ["1s" "2s" "2p"];
        ac.E_ref = -99.099648; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 2 3];

    case 10
        % Ne 90(3,-128.23348006326171)  100(4,-128.23348078109660)
        ac.atom_name = 'Ne';
        ac.Z     = 10;
        ac.focc  = [2 2 6];
        ac.fnl   = ["1s" "2s" "2p"];
        ac.E_ref = -128.233481; % nist 128.233481
        ac.n_angular = 2;
        ac.ev_index  = [0 2 3]; % for the i-th evp, calculate ev_index[i]+1:ev_index[i+1]

    case 11
        %  Na 80(3,-161.44005952679174)
        %     32(3,-161.44005963)
        ac.atom_name = 'Na';
        ac.Z     = 11;
        ac.focc  = [2 2 1 6 ];
        ac.fnl   = ["1s" "2s" "3s" "2p"];
        ac.E_ref = -161.440060; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 3 4];

    case 12
        %  Mg 80(3,-199.13940585)
        %     32(5,-199.13940571)
        ac.atom_name = 'Mg';
        ac.Z     = 12;
        ac.focc  = [2 2 2 6];
        ac.fnl   =["1s" "2s" "3s" "2p"];
        ac.E_ref = -199.139406; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 3 4];

    case 13
        % Al 80(3,-241.31557289)
        %    32(4,-241.31557284)
        ac.atom_name = 'Al';
        ac.Z     = 13;
        ac.focc  = [2 2 2 6 1];
        ac.fnl   = ["1s" "2s" "3s" "2p" "3p"];
        ac.E_ref = -241.315573; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 3 5];

    case 14
        %  Si  96(3no,-288.19839630) 112(3no,-288.19839645)
        %      128(3,-288.19839654)132(3,-288.19839655)
        %      32(3no,-288.19839579) 48(3,-288.19839653)
        ac.atom_name = 'Si';
        ac.Z     = 14;
        ac.focc  = [2 2 2 6 2];
        ac.fnl   = ["1s" "2s" "3s" "2p" "3p"];
        ac.E_ref = -288.198397; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 3 5];

    case 15
        %  P  96(3,-339.94621842) 112(3,-339.94621879)
        %    48(3,-339.94621876)
        ac.atom_name = 'P';
        ac.Z     = 15;
        ac.focc  = [2 2 2 6 3];
        ac.fnl   = ["1s" "2s" "3s" "2p" "3p"];
        ac.E_ref = -339.946219; % nist
        ac.n_angular = 2;
        ac.ev_index  =  [0 3 5];

    case 16
        %      S  128£¨3no£¬-396.71608026£©132(3no,-396.71608047)144(3no,-396.71608037)160(3no,-396.71608043)192(3no,-396.71608048)224(3,-396.71608050£©228(3,-396.71608050)
        %         48(4no,-396.71608013)64(3no,-396.71608042)72(3no£¬-396.71608046)80(3no,-396.71608049)112(3,396.71608051)
        ac.atom_name = 'S';
        ac.Z     = 16;
        ac.focc  = [2 2 2 6 4];
        ac.fnl   = ["1s" "2s" "3s" "2p" "3p"];
        ac.E_ref = -396.716081; % nist
        ac.n_angular = 2;
        ac.ev_index  =  [0 3 5];

    case 17
        %  Cl 112(3,-458.66417866)  128(3,-458.66417904)
        %      64 (3,-458.66417932)80(3,-458.66417945)   96(3,-458.66417949)
        ac.atom_name = 'Cl';
        ac.Z     = 17;
        ac.focc  = [2 2 2 6 5];
        ac.fnl   = ["1s" "2s" "3s" "2p" "3p"];
        ac.E_ref = -458.664179; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 3 5];

    case 18
        %  Ar128(3no,-525.94619412)132(3no,-525.94619423) 144(3no,-525.94619445)160(3,-525.94619464)
        %  64(3,-525.94619458)
        ac.atom_name = 'Ar';
        ac.Z     = 18;
        ac.focc  = [2 2 2 6 6];
        ac.fnl   = ["1s" "2s" "3s" "2p" "3p" ];
        ac.E_ref = -525.946195; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 3 5];

    case 19
        %  K 128£¨3£¬-598.20058789£©312(3,-598.20058804)
        %    100(3,-598.20058804)196(3,-598.20058805)256(3,-598.20058804)
        ac.atom_name = 'K';
        ac.Z     = 19;
        ac.focc  = [2 2 2 1 6 6];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p"];
        ac.E_ref = -598.200590; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 4 6];

    case 20
        %  Ca 112(3no,-675.74228216)132(3no,-675.74228240)144(3no,-675.74228246) 160(3,-675.74228250)
        %     64£¨3no£¬-675.74228248£©80£¨3£¬-675.74228254£©
        ac.atom_name = 'Ca';
        ac.Z     = 20;
        ac.focc  = [2 2 2 2 6 6];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p"];
        ac.E_ref = -675.742283; % nist
        ac.n_angular = 2;
        ac.ev_index  = [0 4 6];

    case 21
        % Sc 128(3,-758.67927514) 136(3,-758.67927521) 160(3,-758.67927522)
        %   64(3,-758.67927528)  80(3,-758.67927534)
        ac.atom_name = 'Sc';
        ac.Z     = 21;
        ac.focc  = [2 2 2 2 6 6 1];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -758.679275; % nist
        ac.n_angular = 3;
        ac.ev_index  =  [0 4 6 7];

    case 22
        %  Ti 128(3,-847.27721558)
        %     48(3,-847.27721511) 64(3,-847.27721574)
        ac.atom_name = 'Ti';
        ac.Z     = 22;
        ac.focc  = [2 2 2 2 6 6 2];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -847.277216; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 23
        %  V 120(3,-941.67890378)
        %     48(4no,-941.67890325)64(3,-941.67890413)
        ac.atom_name = 'V';
        ac.Z     = 23;
        ac.focc  = [2 2 2 2 6 6 3];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -941.678904; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];



    case 24
        %  Cr 128(3,-1042.03023754) 340(3,-1042.03023484)360(-1042.03023570)
        %     48(4no,-1042.03023672) 64(3,-1042.03023777)
        ac.atom_name = 'Cr';
        ac.Z     = 24;
        ac.focc  = [2 2 2 1 6 6 5];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1042.030238; %
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 25
        %  Mn128(3,-1148.44937184)
        %   48(4no,-1148.44937059)64£¨3£¬-1148.44937214£©
        ac.atom_name = 'Mn';
        ac.Z     = 25;
        ac.focc  = [2 2 2 2 6 6 5];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1148.449372; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 26
        %  Fe128(3no,-1380.09126328) 144(3no,-1261.09305543)160(3,-1261.09305562)176(3,-1261.09305571)256(3,-1261.09305584)
        %  64 (3no,-1261.09305544)   80(4,-1261.09305575) 128£¨3£¬-1261.09305586£©
        ac.atom_name = 'Fe';
        ac.Z     = 26;
        ac.focc  = [2 2 2 2 6 6 6];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1261.093055844; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 27
        %  Co 144(3,-1380.09126370)512(3,-1380.09126422)
        %      64(3,-1380.09126369)
        ac.atom_name = 'Co';
        ac.Z     = 27;
        ac.focc  = [2 2 2 2 6 6 7];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1380.091264; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];



    case 28
        %  Ni132(4no,-1505.58019574)496(3,-1505.58019672) 160(3no,-1505.58019635)176(3no-1505.58019649)192(3,-1505.58019658)512(3,-1505.58019672)
        %     64(4no,-1505.58019606)  80(3,-1505.58019654)128(4,-1505.58019558)
        ac.atom_name = 'Ni';
        ac.Z     = 28;
        ac.focc  = [2 2 2 2 6 6 8];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1505.580197; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 29
        %  Cu368(3,-1637.78586074) 400(3,-1637.78586072) 512(4,-1637.78586091)
        %     80(3no,-1637.78586038)
        ac.atom_name = 'Cu';
        ac.Z     = 29;
        ac.focc  = [2 2 2 1 6 6 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1637.785861; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 30
        %  Zn 296(10,-1776.57384967))512(3,-1776.57384968)400(3,-1776.57384968)
        %     112(3,-1776.57384967)
        ac.atom_name = 'Zn';
        ac.Z     = 30;
        ac.focc  = [2 2 2 2 6 6 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "3d"];
        ac.E_ref = -1776.573850; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 6 7];

    case 31
        %  Ga 400(3,-1921.84645580)312(3,-1921.84645579)256(5no,-1921.84639273)
        ac.atom_name = 'Ga';
        ac.Z     = 31;
        ac.focc  = [2 2 2 2 6 6 1 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -1921.846456; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 7 8];

    case 32
        %  Ge 296(3,-2073.80733194)
        ac.atom_name = 'Ge';
        ac.Z     = 32;
        ac.focc  = [2 2 2 2 6 6 2 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -2073.807332; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 4 7 8];

    case 33
        %  As 280(4,-2232.53497846)296(3,-2232.53497844)
        ac.atom_name = 'As';
        ac.Z     = 33;
        ac.focc  = [2 2 2 2 6 6 3 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -2232.534978; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 4 7 8];

    case 34
        %  Se 296(4,-2398.11144018)
        ac.atom_name = 'Se';
        ac.Z     = 34;
        ac.focc  = [2 2 2 2 6 6 4 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -2398.111440; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 4 7 8];

    case 35
        %  Br 256(5,-2570.62069987)296(7,-2570.62069993)
        ac.atom_name = 'Br';
        ac.Z     = 35;
        ac.focc  = [2 2 2 2 6 6 5 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -2570.620700; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 4 7 8];

    case 36
        %  Kr 256(7.-2750.14794040) 296(7,-2750.14794038)
        ac.atom_name = 'Kr';
        ac.Z     = 36;
        ac.focc  = [2 2 2 2 6 6 6 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -2750.147940; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 7 8];

    case 37
        % Rb
        % 6-order(32)
        ac.atom_name = 'Rb';
        ac.Z     = 37;
        ac.focc  = [2 2 2 2 1 6 6 6 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -2936.337293; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 5 8 9];

    case 38
        % Sr
        ac.atom_name = 'Sr';
        ac.Z     = 38;
        ac.focc  = [2 2 2 2 2 6 6 6 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d"];
        ac.E_ref = -3129.453161; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 5 8 9];

    case 39
        %  Y
        ac.atom_name = 'Y';
        ac.Z     = 39;
        ac.focc  = [2 2 2 2 2 6 6 6 10 1];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -3329.520604; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 40
        %  Zr
        ac.atom_name = 'Zr';
        ac.Z     = 40;
        ac.focc  = [2 2 2 2 2 6 6 6 10 2];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -3536.737751; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 41
        %  Nb
        ac.atom_name = 'Nb';
        ac.Z     = 41;
        ac.focc  = [2 2 2 2 1 6 6 6 10 4];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -3751.196175; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 42
        %  Mo
        ac.atom_name = 'Mo';
        ac.Z     = 42;
        ac.focc  = [2 2 2 2 1 6 6 6 10 5];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -3973.013235; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 43
        % Tc
        ac.atom_name = 'Tc';
        ac.Z     = 43;
        ac.focc  = [2 2 2 2 2 6 6 6 10 5];
        ac.fnl   =["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -4202.188857; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 5 8 10];

    case 44
        % Ru
        ac.atom_name = 'Ru';
        ac.Z     = 44;
        ac.focc  = [2 2 2 2 1 6 6 6 10 7];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -4438.981228; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 45
        % Rh
        ac.atom_name = 'Rh';
        ac.Z     = 45;
        ac.focc  = [2 2 2 2 1 6 6 6 10 8];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -4683.301031; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 46
        % Pd
        ac.atom_name = 'Pd';
        ac.Z     = 46;
        ac.focc  = [2 2 2 2 6 6 6 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s"  "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -4935.368406; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 4 7 9];

    case 47
        % Ag
        ac.atom_name = 'Ag';
        ac.Z     = 47;
        ac.focc  = [2 2 2 2 1 6 6 6 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -5195.031215; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 48
        %  Cd
        ac.atom_name = 'Cd';
        ac.Z     = 48;
        ac.focc  = [2 2 2 2 2 6 6 6 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "3d" "4d"];
        ac.E_ref = -5462.390982; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 8 10];

    case 49
        % ln
        ac.atom_name = 'In';
        ac.Z     = 49;
        ac.focc  =  [2 2 2 2 2 6 6 6 1 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -5737.309064; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 9 11];

    case 50
        %  Sn
        ac.atom_name = 'Sn';
        ac.Z     = 50;
        ac.focc  = [2 2 2 2 2 6 6 6 2 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -6019.953353; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 9 11];

    case 51
        % Sb
        ac.atom_name = 'Sb';
        ac.Z     = 51;
        ac.focc  = [2 2 2 2 2 6 6 6 3 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -6310.376268; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 5 9 11];

    case 52
        %  Te
        ac.atom_name = 'Te';
        ac.Z     =52;
        ac.focc  = [2 2 2 2 2 6 6 6 4 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -6608.631413; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 5 9 11];

    case 53
        % I
        ac.atom_name = 'I';
        ac.Z     = 53;
        ac.focc  = [2 2 2 2 2 6 6 6 5 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -6914.773092; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 9 11];

    case 54
        % Xe
        ac.atom_name = 'Xe';
        ac.Z     = 54;
        ac.focc  = [2 2 2 2 2 6 6 6 6 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -7228.856107; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 5 9 11];

    case 55
        % Cs
        ac.atom_name = 'Cs';
        ac.Z     = 55;
        ac.focc  =[2 2 2 2 2 1 6 6 6 6 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -7550.557710; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 6 10 12];

    case 56
        % Ba
        ac.atom_name = 'Ba';
        ac.Z     = 56;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d"];
        ac.E_ref = -7880.111578; % nist
        ac.n_angular = 3;
        ac.ev_index  =[0 6 10 12];

    case 57
        % La
        ac.atom_name = 'La';
        ac.Z     = 57;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 1];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d"];
        ac.E_ref = -8217.575230; % nist
        ac.n_angular = 3;
        ac.ev_index  = [0 6 10 13];

    case 58
        % Ce
        ac.atom_name = 'Ce';
        ac.Z     = 58;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 1 1];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -8563.360285; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 59
        % Pr
        ac.atom_name = 'Pr';
        ac.Z     = 59;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 3];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -8917.664369; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 12 13];

    case 60
        % Nd
        ac.atom_name = 'Nd';
        ac.Z     = 60;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 4];
        ac.fnl   =  ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -9280.311037; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 6 10 12 13];

    case 61
        % Pm
        ac.atom_name = 'Pm';
        ac.Z     = 61;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 5];
        ac.fnl   =  ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -9651.484134; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 6 10 12 13];

    case 62
        %  Sm
        ac.atom_name = 'Sm';
        ac.Z     = 62;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 6];
        ac.fnl   =  ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -10031.259090; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 6 10 12 13];

    case 63
        % Eu
        ac.atom_name = 'Eu';
        ac.Z     = 63;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 7];
        ac.fnl   =  ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -10419.710775; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 12 13];

    case 64
        %  Gd
        ac.atom_name = 'Gd';
        ac.Z     = 64;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 1 7];
        ac.fnl   =["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -10816.653877; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 65
        %  Tb
        ac.atom_name = 'Tb';
        ac.Z     = 65;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 9];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -11222.941975; % nist
        ac.n_angular = 4;
        ac.ev_index  =[0 6 10 12 13];

    case 66
        % Dy
        ac.atom_name = 'Dy';
        ac.Z     = 66;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 10];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -11637.869664; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 12 13];

    case 67
        %  Ho
        ac.atom_name = 'Ho';
        ac.Z     = 67;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 11];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -12061.770549; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 12 13];

    case 68
        % Er
        ac.atom_name = 'Er';
        ac.Z     = 68;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 12];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -12494.718304; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 12 13];

    case 69
        % Tm
        ac.atom_name = 'Tm';
        ac.Z     = 69;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 13];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -12936.786494; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 12 13];

    case 70
        % Yb
        ac.atom_name = 'Yb';
        ac.Z     = 70;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "4f"];
        ac.E_ref = -13388.048594; % nist
        ac.n_angular = 4;
        ac.ev_index  =[0 6 10 12 13];

    case 71
        %  Lu
        ac.atom_name = 'Lu';
        ac.Z     = 71;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 1 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -13848.230375; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];


    case 72
        %      Hf
        ac.atom_name = 'Hf';
        ac.Z     =72;
        ac.focc  =  [2 2 2 2 2 2 6 6 6 6 10 10 2 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -14317.493720; % nist
        ac.n_angular =4;
        ac.ev_index  = [0 6 10 13 14];

    case 73
        %      Ta
        ac.atom_name = 'Ta';
        ac.Z     = 73;
        ac.focc  =  [2 2 2 2 2 2 6 6 6 6 10 10 3 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -14795.884202; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 6 10 13 14];

    case 74
        %      W
        ac.atom_name = 'W';
        ac.Z     = 74;
        ac.focc  =  [2 2 2 2 2 2 6 6 6 6 10 10 4 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -15283.448822; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 75
        %      Re
        ac.atom_name = 'Re';
        ac.Z     = 75;
        ac.focc  =  [2 2 2 2 2 2 6 6 6 6 10 10 5 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -15780.236024; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 6 10 13 14];

    case 76
        %      Os
        ac.atom_name = 'Os';
        ac.Z     = 76;
        ac.focc  =  [2 2 2 2 2 2 6 6 6 6 10 10 6 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -16286.295408; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 77
        %      Ir
        ac.atom_name = 'Ir';
        ac.Z     = 77;
        ac.focc  =  [2 2 2 2 2 2 6 6 6 6 10 10 7 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -16801.677471; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 78
        %  Pt
        ac.atom_name = 'Pt';
        ac.Z     = 78;
        ac.focc  =  [2 2 2 2 2 1 6 6 6 6 10 10 9 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -17326.576377; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 79
        %  Au % L =100
        ac.atom_name = 'Au';
        ac.Z     = 79;
        ac.focc  =  [2 2 2 2 2 1 6 6 6 6 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -17860.790943; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 80
        %  Hg
        ac.atom_name = 'Hg';
        ac.Z     = 80;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -18404.274220; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 10 13 14];

    case 81
        %  Tl
        ac.atom_name = 'Tl';
        ac.Z     = 81;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 1 10 10 10  14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -18956.957627; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 6 11 14 15];

    case 82
        %  Pb
        ac.atom_name = 'Pb';
        ac.Z     = 82;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 2 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -19518.993145; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 11 14 15];

    case 83
        % Bi
        ac.atom_name = 'Bi';
        ac.Z     = 83;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 3 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -20090.414449; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 11 14 15];

    case 84
        %  Bo % L =80
        ac.atom_name = 'Bo';
        ac.Z     = 84;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 4 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -20671.256539; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 11 14 15];

    case 85
        % At % L =80
        ac.atom_name = 'At';
        ac.Z     = 85;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 5 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -21261.555215; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 11 14 15];

    case 86
        % Rn % L = 80
        ac.atom_name = 'Rn';
        ac.Z     = 86;
        ac.focc  = [2 2 2 2 2 2 6 6 6 6 6 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -21861.346869; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 6 11 14 15];

    case 87
        %  Fr
        ac.atom_name = 'Fr';
        ac.Z     = 87;
        ac.focc  =[2 2 2 2 2 2 1 6 6 6 6 6 10 10 10 14];
        ac.fnl   =["1s" "2s" "3s" "4s" "5s" "6s" "7s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -22470.319655; % nist
        ac.n_angular = 4;
        ac.ev_index  =  [0 7 12 15 16];

    case 88
        % Ra
        ac.atom_name = 'Ra';
        ac.Z     = 88;
        ac.focc  = [2 2 2 2 2 2 2 6 6 6 6 6 10 10 10 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "7s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "4f"];
        ac.E_ref = -23088.688083; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 7 12 15 16];

    case 89
        % Ac
        ac.atom_name = 'Ac';
        ac.Z     = 89;
        ac.focc  = [2 2 2 2 2 2 2 6 6 6 6 6 10 10 10 1 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "7s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "6d" "4f"];
        ac.E_ref = -23716.496952; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 7 12 16 17];

    case 90
        %  Th
        ac.atom_name = 'Th';
        ac.Z     = 90;
        ac.focc  = [2 2 2 2 2 2 2 6 6 6 6 6 10 10 10 2 14];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "7s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "6d" "4f"];
        ac.E_ref = -24353.832231; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 7 12 16 17];

    case 91
        %  Pa
        ac.atom_name = 'Pa';
        ac.Z     = 91;
        ac.focc  = [2 2 2 2 2 2 2 6 6 6 6 6 10 10 10 1 14 2];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "7s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "6d" "4f" "5f"];
        ac.E_ref = -25001.291382; % nist
        ac.n_angular = 4;
        ac.ev_index  = [0 7 12 16 18];

    case 92
        %      U128(4,-25658.41777899)  160(5,-25658.41785001)420£¨10no£¬-25658.41788831£©
        %     112(4,-25658.41788631)
        ac.atom_name = 'U';
        ac.Z     = 92;
        ac.focc  = [2 2 2 2 2 2 2 6 6 6 6 6 10 10 10 1 14 3];
        ac.fnl   = ["1s" "2s" "3s" "4s" "5s" "6s" "7s" "2p" "3p" "4p" "5p" "6p" "3d" "4d" "5d" "6d" "4f" "5f"];
        ac.E_ref = -25658.41788885; % fe-atom
        ac.n_angular = 4;
        ac.ev_index  =[0 7 12 16 18];

    otherwise
        error('Element with number %d is not considered',n);
end

end