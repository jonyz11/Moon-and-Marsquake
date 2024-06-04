clear; clc; close all;

%%
% PLOTTING SPECTRA
%

ChiChi = readtable("RS - ChiChi.txt");
ChiChi = table2array(ChiChi(1:end,1:2));
ChiChi(:,2) = ChiChi(:,2)*9.8*100;
ChiChi(:,2) = ChiChi(:,2)/ChiChi(1,2);

Friuli = readtable("RS - Friuli.txt");
Friuli = table2array(Friuli(1:end,1:2));
Friuli(:,2) = Friuli(:,2)*9.8*100;
Friuli(:,2) = Friuli(:,2)/Friuli(1,2);

Kobe = readtable("RS - Kobe.txt");
Kobe = table2array(Kobe(1:end,1:2));
Kobe(:,2) = Kobe(:,2)*9.8*100;
Kobe(:,2) = Kobe(:,2)/Kobe(1,2);

LornaPrieta = readtable("RS - Lorna Prieta.txt");
LornaPrieta = table2array(LornaPrieta(1:end,1:2));
LornaPrieta(:,2) = LornaPrieta(:,2)*9.8*100;
LornaPrieta(:,2) = LornaPrieta(:,2)/LornaPrieta(1,2);

Trinidad = readtable("RS - Trinidad.txt");
Trinidad = table2array(Trinidad(1:end,1:2));
Trinidad(:,2) = Trinidad(:,2)*9.8*100;
Trinidad(:,2) = Trinidad(:,2)/Trinidad(1,2);

MA1 = readtable("RS - MA1.txt");
MA1 = table2array(MA1);
MA1(:,2) = MA1(:,2)/MA1(1,2);
MA1(:,3) = MA1(:,3)/MA1(1,3);

MA2 = readtable("RS - MA2.txt");
MA2 = table2array(MA2);
MA2(:,2) = MA2(:,2)/MA2(1,2);
MA2(:,3) = MA2(:,3)/MA2(1,3);

MA3 = readtable("RS - MA3.txt");
MA3 = table2array(MA3);
MA3(:,2) = MA3(:,2)/MA3(1,2);
MA3(:,3) = MA3(:,3)/MA3(1,3);

MA4 = readtable("RS - MA4.txt");
MA4 = table2array(MA4);
MA4(:,2) = MA4(:,2)/MA4(1,2);
MA4(:,3) = MA4(:,3)/MA4(1,3);

MA5 = readtable("RS - MA5.txt");
MA5 = table2array(MA5);
MA5(:,2) = MA5(:,2)/MA5(1,2);
MA5(:,3) = MA5(:,3)/MA5(1,3);

MA6 = readtable("RS - MA6.txt");
MA6 = table2array(MA6);
MA6(:,2) = MA6(:,2)/MA6(1,2);
MA6(:,3) = MA6(:,3)/MA6(1,3);

MA7 = readtable("RS - MA7.txt");
MA7 = table2array(MA7);
MA7(:,2) = MA7(:,2)/MA7(1,2);
MA7(:,3) = MA7(:,3)/MA7(1,3);

MA8 = readtable("RS - MA8.txt");
MA8 = table2array(MA8);
MA8(:,2) = MA8(:,2)/MA8(1,2);
MA8(:,3) = MA8(:,3)/MA8(1,3);

MA9 = readtable("RS - MA9.txt");
MA9 = table2array(MA9);
MA9(:,2) = MA9(:,2)/MA9(1,2);
MA9(:,3) = MA9(:,3)/MA9(1,3);

MA10 = readtable("RS - MA10.txt");
MA10 = table2array(MA10);
MA10(:,2) = MA10(:,2)/MA10(1,2);
MA10(:,3) = MA10(:,3)/MA10(1,3);

MA11 = readtable("RS - MA11.txt");
MA11 = table2array(MA11);
MA11(:,2) = MA11(:,2)/MA11(1,2);
MA11(:,3) = MA11(:,3)/MA11(1,3);

MA12 = readtable("RS - MA12.txt");
MA12 = table2array(MA12);
MA12(:,2) = MA12(:,2)/MA12(1,2);
MA12(:,3) = MA12(:,3)/MA12(1,3);

MA13 = readtable("RS - MA13.txt");
MA13 = table2array(MA13);
MA13(:,2) = MA13(:,2)/MA13(1,2);
MA13(:,3) = MA13(:,3)/MA13(1,3);

% LONGITUDINAL

figure('units','normalized','outerposition',[0 0 0.55 0.55])
figure;
plot(MA1(:,1),MA1(:,2),'r',MA2(:,1),MA2(:,2),'r',MA3(:,1),MA3(:,2),'b',MA4(:,1),MA4(:,2),'k',MA5(:,1),MA5(:,2),'b',MA6(:,1),MA6(:,2),'c',MA7(:,1),MA7(:,2),'k',MA8(:,1),MA8(:,2),'c',MA9(:,1),MA9(:,2),'c',MA10(:,1),MA10(:,2),'k',MA11(:,1),MA11(:,2),'c',MA12(:,1),MA12(:,2),'c',MA13(:,1),MA13(:,2),'k',ChiChi(:,1),ChiChi(:,2),'--',Friuli(:,1),Friuli(:,2),'--',Kobe(:,1),Kobe(:,2),'--',LornaPrieta(:,1),LornaPrieta(:,2),'--',Trinidad(:,1),Trinidad(:,2),'--');
    set(gca,'xscale','log')
    title('Marsquake Normalised Response Spectra','FontSize',12)
    legend('MA1','MA2','MA3','MA4','MA5','MA6','MA7','MA8','MA9','MA10','MA11','MA12','MA13','Chi Chi','Friuli','Kobe','Lorna Prieta','Trinidad')
    xlabel('Period, T [sec]')
    ylabel('Normalised PSA [-]')
    grid on;

% TRANSVERSAL

figure('units','normalized','outerposition',[0 0 0.55 0.55])
figure;
plot(MA1(:,1),MA1(:,3),MA2(:,1),MA2(:,3),MA3(:,1),MA3(:,3),MA4(:,1),MA4(:,3),MA5(:,1),MA5(:,3),MA6(:,1),MA6(:,3),MA7(:,1),MA7(:,3),MA8(:,1),MA8(:,3),MA9(:,1),MA9(:,3),MA10(:,1),MA10(:,3),MA11(:,1),MA11(:,3),MA12(:,1),MA12(:,3),MA13(:,1),MA13(:,3),ChiChi(:,1),ChiChi(:,2),'--',Friuli(:,1),Friuli(:,2),'--',Kobe(:,1),Kobe(:,2),'--',LornaPrieta(:,1),LornaPrieta(:,2),'--',Trinidad(:,1),Trinidad(:,2),'--');
    set(gca,'xscale','log')
    title('NORMALISED RESPONSE SPECTRA - TRANSVERSAL')
    legend('MA1','MA2','MA3','MA4','MA5','MA6','MA7','MA8','MA9','MA10','MA11','MA12','MA13','Chi Chi','Friuli','Kobe','Lorna Prieta','Trinidad')
    xlabel('Period, T [sec]')
    ylabel('PSA [cm/s^2]')
    grid on;
