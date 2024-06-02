clear; clc; close all;

%% ----- For 2 Seismic Records -----
% THIS FILE TAKES THE RAW ACCELERATION DATA TO GET THE CORRECTED AND
% FILTERED RECORD CONSIDERING THE FOLLOWING STEPS:
%  INCLUDE ANALYSIS WITH ARIAS INTENSITY

% 1- Take the record
% 2- Baseline correction over the accelerations with different polynomial
% expression according the needs.
% 3- Filtering the signal and get the corrected and filtered acceleration
% 4- Get the velocity and displacements by the integration of the previous
% file
% 5- Get the PSA for the original RAW data and the corrected and filtered acceleration

%% ---- INITIALISATION ----

% RAW DATA 
% ACCELERATION

fid = fopen('S01 - S14.txt', 'r');
a = fscanf(fid, '%g %g', [4 inf]);
a = a';

% LONGITUDINAL COMPONENT
time = a(:,1); % s
xacc_1 = a(:,2); % cm/s2

% TRANSVERSAL COMPONENT
xacc_2 = a(:,4); % cm/s2

% TIME STEP OF THE RECORDS
dt = (1/6.625);

%% ---- FOURIER ANALYSIS ----
 
% Fourier Spectrum response
 
FFT_x1 = abs(fft(xacc_1));
FFT_x2 = abs(fft(xacc_2));

ff = 0:(6.625/(length(xacc_1)-1)):6.625;
ff = ff';
 
figure(3);
 
h(1) = subplot(1,2,1);plot(ff(1:0.5*length(ff)),FFT_x1(1:0.5*length(ff)),'b','LineWidth',1.5);
    title('Fourier Spectrum - Longitudinal')
    ylabel('Fourier [cm/s^2]')
    xlabel('Frequency [hz]')
    axis([0 6.625/2 0 Inf])
    set(gca,'linewidth',1)
    grid on;
    set(gca,'GridAlpha', 0.20);
    set(gca,'linewidth', 0.50);
    set(gca,'MinorGridLineStyle', '-');

    subplot(1,2,2);plot(ff(1:0.5*length(ff)),FFT_x2(1:0.5*length(ff)),'b','LineWidth',1.5);
    title('Fourier Spectrum - Transverse')
    ylabel('Fourier [cm/s^2]')
    xlabel('Frequency [hz]')
    axis([0 6.625/2 0 Inf])
    set(gca,'linewidth',1)
    grid on;
    set(gca,'GridAlpha', 0.20);
    set(gca,'linewidth', 0.50);
    set(gca,'MinorGridLineStyle', '-');  

%% ---- PAD IMPLEMENTATION ----

n = 4; % order of Butterworth filtering
fc = 0.1; % cut-off frequency
Tz_pad = 1.5*n/fc;
time_pad = (0:dt:Tz_pad)'+ time(end);
time = [time;time_pad];

pad = zeros(ceil(length(time_pad)/2),1);
xacc_1 = [pad;xacc_1;pad];
xacc_2 = [pad;xacc_2;pad];

% Tapering before end pad
taper = tukeywin(length(ff),0.25); % adjust tapering degree
taper = [pad;taper;pad];
taper(1:length(taper)/2) = 1;

xacc_1 = xacc_1.*taper;
xacc_2 = xacc_2.*taper;

xacc_1_g = xacc_1/980;
xacc_2_g = xacc_2/980;

%% ---- VELOCITY AND DISPLACEMENT ----

% VELOCITY
vel_1 = cumtrapz(time,xacc_1);
vel_2 = cumtrapz(time,xacc_2);

% DISPLACEMENT
disp_1 = cumtrapz(time,vel_1);
disp_2 = cumtrapz(time,vel_2);

% ---- COMPARISON ORIGINAL ----

% LONGITUDINAL
% figure('units','normalized','outerposition',[0 0 0.55 0.55])
% figure (1);
% subplot(3,1,1),plot(time,xacc_1_g)
%         axis([0 1300 -0.0001 0.0001])
%         title('LONGITUDINAL - RAW')
%         ylabel('Acceleration [g]')
% grid on;
% subplot(3,1,2),plot(time,vel_1)
%          axis([0 1300 -0.002 0.002])
%         ylabel('Velocity [cm/s]')
% grid on;
% subplot(3,1,3),plot(time,disp_1)
%         axis([0 1300 -0.0001 0.0006])
%         xlabel('Time [sec]')
%         ylabel('Displacement [cm]')
% grid on;

% TRANSVERSAL
% figure('units','normalized','outerposition',[0 0 0.55 0.55])
% figure (2);
% subplot(3,1,1),plot(time,xacc_2_g)
%         axis([0 1300 -0.0001 0.0001])
%         title('TRANSVERSAL - RAW')
%         ylabel('Acceleration [g]')
% grid on;
% subplot(3,1,2),plot(time,vel_2)
%         axis([0 1300 -0.002 0.002])
%         ylabel('Velocity [cm/s]')
% grid on;
% subplot(3,1,3),plot(time,disp_2)
%         axis([0 1300 -0.0006 0.0001])
%         xlabel('Time [sec]')
%         ylabel('Displacement [cm]')
% grid on;

%% ---- ARIAS INTENSITY ----

xacc_1_m = xacc_1_g*(9.8);
xacc_1_m2= xacc_1_m.*xacc_1_m;
Arias_1 = pi/(2*9.8)*cumtrapz(time,xacc_1_m2);

Arias_1_100 = max(Arias_1);
Arias_11= Arias_1/Arias_1_100;

xacc_2_m = xacc_2_g*(9.8);
xacc_2_m2= xacc_2_m.*xacc_2_m;
Arias_2 = pi/(2*9.8)*cumtrapz(time,xacc_2_m2);

Arias_2_100 = max(Arias_2);
Arias_22= Arias_2/Arias_2_100;

tt1= [12 12];
IA1= [-5 105];

tt2= [150 150];
IA2= [-5 105];

tt3= [44 44];
IA3= [-5 105];

tt4= [138 138];
IA4= [-5 105];

tt5= [50 50];
IA5= [-5 105];

tt6= [140 140];
IA6= [-5 105];

if Arias_1_100 > Arias_2_100
    disp(Arias_1_100*100);
    disp('1')
else
    disp(Arias_2_100*100);
    disp('2')
end

%% ---- BASELINE CORRECTION ----

% LONGITUDINAL
n1 = 1;
p_1 = polyfit(time,xacc_1,n1);
accpoleval_1 = polyval(p_1,time);
acc_corr_1 = xacc_1-accpoleval_1;

% TRANSVERSAL
n2 = 1;
p_2 = polyfit(time,xacc_2,n2);
accpoleval_2 = polyval(p_2,time);
acc_corr_2 = xacc_2-accpoleval_2;

%% ---- FILTERING ----

fs       = 1.0/dt;
fcutlow  = 0.05;   % low cut frequency in Hz
fcuthigh = (6.625/2)-0.0001;    % high cut frequency in Hz
order    = 4;

[b,a] = butter(order,[fcutlow,fcuthigh]/(fs/2),'bandpass'); % Butterworth filter

% LONGITUDINAL
acc_corr_1_fil = filter(b,a,acc_corr_1);
%acc_corr_1_fil = filter(b,a,acc_corr_1_fil);
acc_corr_1_fil_g = acc_corr_1_fil*(1/980);

% TRANSVERSAL
acc_corr_2_fil = filter(b,a,acc_corr_2);
%acc_corr_2_fil = filter(b,a,acc_corr_2_fil);
acc_corr_2_fil_g = acc_corr_2_fil*(1/980);

%% ---- integrate to get vel ----
% LONGITUDINAL
vel_corr_1 = cumtrapz(time,acc_corr_1_fil);

% TRANSVERSAL
vel_corr_2 = cumtrapz(time,acc_corr_2_fil);

%% ---- integrate to get disp ----
% LONGITUDINAL
disp_corr_1 = cumtrapz(time,vel_corr_1);

% TRANSVERSAL
disp_corr_2 = cumtrapz(time,vel_corr_2);

%% ---- FINAL PLOTS ----

% LONGITUDINAL
% ---- COMPARISON ORIGINAL AND CORRECTED AND FILTERED ----

figure(5);
subplot(3,1,1),plot(time,xacc_1_g,time,acc_corr_1_fil)
        title('LONGITUDINAL - BOTH')
        legend('Raw','Corrected and Filtered')
        ylabel('Acceleration [cm/s^2]')
grid on;
subplot(3,1,2),plot(time,vel_1,time,vel_corr_1)
        legend('Raw','Corrected and Filtered')
        ylabel('Velocity [cm/s]')
grid on;
subplot(3,1,3),plot(time,disp_1,time,disp_corr_1)
        legend('Raw','Corrected and Filtered')
        xlabel('Time [sec]')
        ylabel('Displacement [cm]')
grid on;

% ---- CORRECTED AND FILTERED PLOTS ----
figure(6);
subplot(3,1,1),plot(time,acc_corr_1_fil)
        title('LONGITUDINAL CORRECTED AND FILTERED')
        ylabel('Acceleration [cm/s^2]')
grid on;
subplot(3,1,2),plot(time,vel_corr_1)
        ylabel('Velocity [cm/s]')
grid on;
subplot(3,1,3),plot(time,disp_corr_1)
        xlabel('Time [sec]')
        ylabel('Displacement [cm]')
grid on;


% TRANSVERSAL
% ---- COMPARISON ORIGINAL AND CORRECTED AND FILTERED ----

figure(7);
subplot(3,1,1),plot(time,xacc_2_g,time,acc_corr_2_fil)
        title('TRANSVERSAL - BOTH')
        legend('Raw','Corrected and Filtered')
        ylabel('Acceleration [cm/s^2]')
grid on;
subplot(3,1,2),plot(time,vel_2,time,vel_corr_2)
        legend('Raw','Corrected and Filtered')
        ylabel('Velocity [cm/s]')
grid on;
subplot(3,1,3),plot(time,disp_2,time,disp_corr_2)
        legend('Raw','Corrected and Filtered')
        xlabel('Time [sec]')
        ylabel('Displacement [cm]')
grid on;

% ---- CORRECTED AND FILTERED PLOTS ----
figure(8);
subplot(3,1,1),plot(time,acc_corr_2_fil)
        title('TRANSVERSAL CORRECTED AND FILTERED')
        ylabel('Acceleration [cm/s^2]')
grid on;
subplot(3,1,2),plot(time,vel_corr_2)
        ylabel('Velocity [cm/s]')
grid on;
subplot(3,1,3),plot(time,disp_corr_2)
        xlabel('Time [sec]')
        ylabel('Displacement [cm]')
grid on;

% PLOTTING SPECTRA
%

damping = 5/100;
%period = [0.01; 0.02; 0.03; 0.04; 0.05; 0.06; 0.075; 0.1; 0.15; 0.2; 0.25; 0.3; 0.4; 0.5; 0.75; 1; 1.5; 2; 3; 4; 5; 7.5; 10];

period2= logspace(-2,1,500);
period22 = transpose(period2);


% *****  VERY IMPORTANT *****
% dt related to the input motion
dt = 1/6.625;

% LONGITUDINAL
[sa_xacc_1] = responseSpectrum(dt,xacc_1,period22,damping);
[sa_acc_corr_1_fil] = responseSpectrum(dt,acc_corr_1_fil,period22,damping);

figure(9);
plot(period2,sa_xacc_1,period2,sa_acc_corr_1_fil);
    set(gca,'xscale','log')
    title('PSA - LONGITUDINAL')
    legend('Raw','Corrected and Filtered')
    xlabel('Period, T [sec]')
    ylabel('PSA [cm/s^2]')
    grid on;

% TRANSVERSAL
[sa_xacc_2] = responseSpectrum(dt,xacc_2,period22,damping);
[sa_acc_corr_2_fil] = responseSpectrum(dt,acc_corr_2_fil,period22,damping);

figure(10);
plot(period2,sa_xacc_2,period2,sa_acc_corr_2_fil);
    set(gca,'xscale','log')
    title('PSA - TRANSVERSAL')
    legend('Raw','Corrected and Filtered')
    xlabel('Period, T [sec]')
    ylabel('PSA [cm/s^2]')
    grid on;

%% ---- OUTPUT ----

% Acceleration Time Histories
acc_time_history = zeros(length(acc_corr_1_fil),3);
acc_time_history(:,1) = time; % s
acc_time_history(:,2) = acc_corr_1_fil; % cm/s2
acc_time_history(:,3) = acc_corr_2_fil; % cm/s2

% PSA
response_spectra = zeros(length(sa_acc_corr_1_fil),3);
response_spectra(:,1) = period2; % s
response_spectra(:,2) = sa_acc_corr_1_fil; % cm/s2
response_spectra(:,3) = sa_acc_corr_2_fil; % cm/s2

% Fourier Spectra
fourier_spectra = zeros(ceil(0.5*length(ff)),3);
fourier_spectra(:,1) = ff(1:ceil(0.5*length(ff)));
fourier_spectra(:,2) = FFT_x1(1:ceil(0.5*length(ff)));
fourier_spectra(:,3) = FFT_x2(1:ceil(0.5*length(ff)));

writematrix(acc_time_history,"Acc Time History.txt","Delimiter","tab");
writematrix(response_spectra,"Response Spectra.txt","Delimiter","tab");
writematrix(fourier_spectra,"Fourier Spectra.txt","Delimiter","tab");

close all

%% Arias Intensity Plot

figure;
plot(time,Arias_22)