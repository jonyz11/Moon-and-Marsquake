clear; clc; close all;

%%
% PLOTTING SPECTRA
%

H01 = readtable("RS - H01.txt");
H01 = table2array(H01);

H02 = readtable("RS - H02.txt");
H02 = table2array(H02);

H03 = readtable("RS - H03.txt");
H03 = table2array(H03);

H04 = readtable("RS - H04.txt");
H04 = table2array(H04);

H05 = readtable("RS - H05.txt");
H05 = table2array(H05);

C01 = readtable("RS - C01.txt");
C01 = table2array(C01);

C02 = readtable("RS - C02.txt");
C02 = table2array(C02);

C03 = readtable("RS - C03.txt");
C03 = table2array(C03);

C04 = readtable("RS - C04.txt");
C04 = table2array(C04);

C05 = readtable("RS - C05.txt");
C05 = table2array(C05);

L01 = readtable("RS - L01.txt");
L01 = table2array(L01);

L02 = readtable("RS - L02.txt");
L02 = table2array(L02);

S01 = readtable("RS - S01.txt");
S01 = table2array(S01);

S02 = readtable("RS - S02.txt");
S02 = table2array(S02);

S03 = readtable("RS - S03.txt");
S03 = table2array(S03);

A01 = readtable("RS - A01.txt");
A01 = table2array(A01);

A02 = readtable("RS - A02.txt");
A02 = table2array(A02);

A03 = readtable("RS - A03.txt");
A03 = table2array(A03);

A04 = readtable("RS - A04.txt");
A04 = table2array(A04);

A05 = readtable("RS - A05.txt");
A05 = table2array(A05);

%%
clc

m = L02;

i1 = find(m(:,2)==max(m(:,2)),1);
i2 = find(m(:,3)==max(m(:,3)),1);

max1 = m(i1,2);
max2 = m(i2,3);

if max1 > max2
    disp(max1)
    disp('1')
else
    disp(max2)
    disp('2')
end

%%
% LONGITUDINAL

figure('units','normalized','outerposition',[0 0 0.55 0.55])
figure;
plot(H01(:,1),H01(:,2),H02(:,1),H02(:,2),H03(:,1),H03(:,2),H04(:,1),H04(:,2),H05(:,1),H05(:,2),C01(:,1),C01(:,2),C02(:,1),C02(:,2),C03(:,1),C03(:,2),C04(:,1),C04(:,2),C05(:,1),C05(:,2),L01(:,1),L01(:,2),L02(:,1),L02(:,2),S01(:,1),S01(:,2),S02(:,1),S02(:,2),S03(:,1),S03(:,2),A01(:,1),A01(:,2),A02(:,1),A02(:,2),A03(:,1),A03(:,2),A04(:,1),A04(:,2),A05(:,1),A05(:,2));
    set(gca,'xscale','log')
    title('PSA - LONGITUDINAL')
    legend('H01','H02','H03','H04','H05','C01','C02','C03','C04','C05','L01','L02','S01','S02','S03','A01','A02','A03','A04','A05')
    xlabel('Period, T [sec]')
    ylabel('PSA [cm/s^2]')
    grid on;

% TRANSVERSAL

figure('units','normalized','outerposition',[0 0 0.55 0.55])
figure;
plot(H01(:,1),H01(:,3),H02(:,1),H02(:,3),H03(:,1),H03(:,3),H04(:,1),H04(:,3),H05(:,1),H05(:,3),C01(:,1),C01(:,3),C02(:,1),C02(:,3),C03(:,1),C03(:,3),C04(:,1),C04(:,3),C05(:,1),C05(:,3),L01(:,1),L01(:,3),L02(:,1),L02(:,3),S01(:,1),S01(:,3),S02(:,1),S02(:,3),S03(:,1),S03(:,3),A01(:,1),A01(:,3),A02(:,1),A02(:,3),A03(:,1),A03(:,3),A04(:,1),A04(:,3),A05(:,1),A05(:,3));
    set(gca,'xscale','log')
    title('PSA - TRANSVERSE')
    legend('H01','H02','H03','H04','H05','C01','C02','C03','C04','C05','L01','L02','S01','S02','S03','A01','A02','A03','A04','A05')
    xlabel('Period, T [sec]')
    ylabel('PSA [cm/s^2]')
    grid on;
