clear; clc; close all;

%% ---- INPUT ----

MA1 = readtable("FS - MA1.txt");
MA1 = table2array(MA1);

MA2 = readtable("FS - MA2.txt");
MA2 = table2array(MA2);

MA3 = readtable("FS - MA3.txt");
MA3 = table2array(MA3);

MA4 = readtable("FS - MA4.txt");
MA4 = table2array(MA4);

MA5 = readtable("FS - MA5.txt");
MA5 = table2array(MA5);

MA6 = readtable("FS - MA6.txt");
MA6 = table2array(MA6);

MA7 = readtable("FS - MA7.txt");
MA7 = table2array(MA7);

MA8 = readtable("FS - MA8.txt");
MA8 = table2array(MA8);

MA9 = readtable("FS - MA9.txt");
MA9 = table2array(MA9);

MA10 = readtable("FS - MA10.txt");
MA10 = table2array(MA10);

MA11 = readtable("FS - MA11.txt");
MA11 = table2array(MA11);

MA12 = readtable("FS - MA12.txt");
MA12 = table2array(MA12);

MA13 = readtable("FS - MA13.txt");
MA13 = table2array(MA13);

%% ---- FINAL PLOTS ----

% LONGITUDINAL

figure('units','normalized','outerposition',[0 0 0.55 0.55])
subplot(3,5,1),plot(MA1(:,1),MA1(:,2))
        title('MA1','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,2),plot(MA2(:,1),MA2(:,2))
        title('MA2','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,3),plot(MA3(:,1),MA3(:,2))
        title('MA3','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,4),plot(MA4(:,1),MA4(:,2))
        title('MA4','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,5),plot(MA5(:,1),MA5(:,2))
        title('MA5','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,6),plot(MA6(:,1),MA6(:,2))
        title('MA6','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,7),plot(MA7(:,1),MA7(:,2))
        title('MA7','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,8),plot(MA8(:,1),MA8(:,2))
        title('MA8','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,9),plot(MA9(:,1),MA9(:,2))
        title('MA9','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,10),plot(MA10(:,1),MA10(:,2))
        title('MA10','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,12),plot(MA11(:,1),MA11(:,2))
        title('MA11','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,13),plot(MA12(:,1),MA12(:,2))
        title('MA12','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,14),plot(MA13(:,1),MA13(:,2))
        title('MA13','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

%%
% TRANSVERSAL
% ---- COMPARISON ORIGINAL AND CORRECTED AND FILTERED ----

figure('units','normalized','outerposition',[0 0 0.55 0.55])
subplot(3,5,1),plot(MA1(:,1),MA1(:,3))
        title('MA1','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,2),plot(MA2(:,1),MA2(:,3))
        title('MA2','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,3),plot(MA3(:,1),MA3(:,3))
        title('MA3','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,4),plot(MA4(:,1),MA4(:,3))
        title('MA4','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,5),plot(MA5(:,1),MA5(:,3))
        title('MA5','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,6),plot(MA6(:,1),MA6(:,3))
        title('MA6','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,7),plot(MA7(:,1),MA7(:,3))
        title('MA7','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,8),plot(MA8(:,1),MA8(:,3))
        title('MA8','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,9),plot(MA9(:,1),MA9(:,3))
        title('MA9','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,10),plot(MA10(:,1),MA10(:,2))
        title('MA10','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,12),plot(MA11(:,1),MA11(:,2))
        title('MA11','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,13),plot(MA12(:,1),MA12(:,2))
        title('MA12','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;

subplot(3,5,14),plot(MA13(:,1),MA13(:,2))
        title('MA13','FontSize',12)
        ylabel('Fourier [cm/s^2]')
        xlabel('Frequency [Hz]')
grid on;
