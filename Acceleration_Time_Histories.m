clear; clc; close all;

%% ---- INPUT ----

Time = 0:0.05:4000;

MA1 = readtable("ATH - MA1.txt");
MA1 = table2array(MA1);
MA1_full = zeros(length(Time),3);
MA1_full(:,1) = Time;
MA1_full(1:size(MA1,1),2:size(MA1,2)) = MA1(:,2:3);

MA2 = readtable("ATH - MA2.txt");
MA2 = table2array(MA2);
MA2_full = zeros(length(Time),3);
MA2_full(:,1) = Time;
MA2_full(1:size(MA2,1),2:size(MA2,2)) = MA2(:,2:3);

MA3 = readtable("ATH - MA3.txt");
MA3 = table2array(MA3);
MA3_full = zeros(length(Time),3);
MA3_full(:,1) = Time;
MA3_full(1:size(MA3,1),2:size(MA3,2)) = MA3(:,2:3);
MA3_full = MA3_full(1:length(Time),1:3);

MA4 = readtable("ATH - MA4.txt");
MA4 = table2array(MA4);
MA4_full = zeros(length(Time),3);
MA4_full(:,1) = Time;
MA4_full(1:size(MA4,1),2:size(MA4,2)) = MA4(:,2:3);

MA5 = readtable("ATH - MA5.txt");
MA5 = table2array(MA5);
MA5_full = zeros(length(Time),3);
MA5_full(:,1) = Time;
MA5_full(1:size(MA5,1),2:size(MA5,2)) = MA5(:,2:3);
MA5_full = MA5_full(1:length(Time),1:3);

MA6 = readtable("ATH - MA6.txt");
MA6 = table2array(MA6);
MA6_full = zeros(length(Time),3);
MA6_full(:,1) = Time;
MA6_full(1:size(MA6,1),2:size(MA6,2)) = MA6(:,2:3);

MA7 = readtable("ATH - MA7.txt");
MA7 = table2array(MA7);
MA7_full = zeros(length(Time),3);
MA7_full(:,1) = Time;
MA7_full(1:size(MA7,1),2:size(MA7,2)) = MA7(:,2:3);

MA8 = readtable("ATH - MA8.txt");
MA8 = table2array(MA8);
MA8_full = zeros(length(Time),3);
MA8_full(:,1) = Time;
MA8_full(1:size(MA8,1),2:size(MA8,2)) = MA8(:,2:3);

MA9 = readtable("ATH - MA9.txt");
MA9 = table2array(MA9);
MA9_full = zeros(length(Time),3);
MA9_full(:,1) = Time;
MA9_full(1:size(MA9,1),2:size(MA9,2)) = MA9(:,2:3);

MA10 = readtable("ATH - MA10.txt");
MA10 = table2array(MA10);
MA10_full = zeros(length(Time),3);
MA10_full(:,1) = Time;
MA10_full(1:size(MA10,1),2:size(MA10,2)) = MA10(:,2:3);

MA11 = readtable("ATH - MA11.txt");
MA11 = table2array(MA11);
MA11_full = zeros(length(Time),3);
MA11_full(:,1) = Time;
MA11_full(1:size(MA11,1),2:size(MA11,2)) = MA11(:,2:3);

MA12 = readtable("ATH - MA12.txt");
MA12 = table2array(MA12);
MA12_full = zeros(length(Time),3);
MA12_full(:,1) = Time;
MA12_full(1:size(MA12,1),2:size(MA12,2)) = MA12(:,2:3);

MA13 = readtable("ATH - MA13.txt");
MA13 = table2array(MA13);
MA13_full = zeros(length(Time),3);
MA13_full(:,1) = Time;
MA13_full(1:size(MA13,1),2:size(MA13,2)) = MA13(:,2:3);

%% ---- FINAL PLOTS ----

M = zeros(length(Time),15);
M(:,1) = MA1_full(:,3);
M(:,2) = MA2_full(:,3);
M(:,3) = MA3_full(:,3);
M(:,4) = MA4_full(:,3);
M(:,5) = MA5_full(:,3);
M(:,6) = MA6_full(:,3);
M(:,7) = MA7_full(:,3);
M(:,8) = MA8_full(:,3);
M(:,9) = MA9_full(:,3);
M(:,10) = MA10_full(:,3);
M(:,12) = MA11_full(:,3);
M(:,13) = MA12_full(:,3);
M(:,14) = MA13_full(:,3);

m = 1:13;
j = 0;

% Number of rows and columns
rows = 3;
cols = 5;

% Create a figure
figure;

% Loop through each subplot position
for i = 1:rows*cols-1
    
    if i~=11
        j = j + 1;
        subplot(rows, cols, i);
        
        % Generate sample data for plotting (you can replace this with your actual data)
        t = Time;
        y = M(:,i);
        
        % Plot the sample data
        plot(t, y);
        
        % Add labels and title
        xlabel('Time [secs]');
        ylabel('Acceleration [cm/s^2]');
        title(sprintf('MA%01d', m(j)),'FontSize',12);
        ylim([-max(abs(y)), max(abs(y))]);
        grid on
    end
end

% Adjust the figure size to maintain the aspect ratio
set(gcf, 'Position', [100, 100, 1200, 600]);

%%

% LONGITUDINAL

figure('units','normalized','outerposition',[0 0 0.55 0.55])
subplot(3,5,1),plot(MA1_full(:,1),MA1_full(:,2))
        title('MA1','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,2),plot(MA2_full(:,1),MA2_full(:,2))
        title('MA2','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,3),plot(MA3_full(:,1),MA3_full(:,2))
        title('MA3','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,4),plot(MA4_full(:,1),MA4_full(:,2))
        title('MA4','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,5),plot(MA5_full(:,1),MA5_full(:,2))
        title('MA5','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,6),plot(MA6_full(:,1),MA6_full(:,2))
        title('MA6','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,7),plot(MA7_full(:,1),MA7_full(:,2))
        title('MA7','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,8),plot(MA8_full(:,1),MA8_full(:,2))
        title('MA8','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,9),plot(MA9_full(:,1),MA9_full(:,2))
        title('MA9','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,10),plot(MA10_full(:,1),MA10_full(:,2))
        title('MA10','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,12),plot(MA11_full(:,1),MA11_full(:,2))
        title('MA11','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,13),plot(MA12_full(:,1),MA12_full(:,2))
        title('MA12','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,14),plot(MA13_full(:,1),MA13_full(:,2))
        title('MA13','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

%%
% TRANSVERSAL
% ---- COMPARISON ORIGINAL AND CORRECTED AND FILTERED ----

figure('units','normalized','outerposition',[0 0 0.55 0.55])
subplot(3,5,1),plot(MA1_full(:,1),MA1_full(:,3))
        title('MA1','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,2),plot(MA2_full(:,1),MA2_full(:,3))
        title('MA2','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,3),plot(MA3_full(:,1),MA3_full(:,3))
        title('MA3','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,4),plot(MA4_full(:,1),MA4_full(:,3))
        title('MA4','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,5),plot(MA5_full(:,1),MA5_full(:,3))
        title('MA5','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,6),plot(MA6_full(:,1),MA6_full(:,3))
        title('MA6','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,7),plot(MA7_full(:,1),MA7_full(:,3))
        title('MA7','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,8),plot(MA8_full(:,1),MA8_full(:,3))
        title('MA8','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,9),plot(MA9_full(:,1),MA9_full(:,3))
        title('MA9','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,10),plot(MA10_full(:,1),MA10_full(:,2))
        title('MA10','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,12),plot(MA11_full(:,1),MA11_full(:,2))
        title('MA11','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,13),plot(MA12_full(:,1),MA12_full(:,2))
        title('MA12','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

subplot(3,5,14),plot(MA13_full(:,1),MA13_full(:,2))
        title('MA13','FontSize',12)
        ylabel('Acceleration [cm/s^2]')
        xlabel('Time [secs]')
grid on;

