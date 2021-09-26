tic;
clc; clear;
DIR = './part b/';

Vf = 6; % m^3
T0 = 310; % K
Taz = 310; % K, at V = 6
Ta0 = 309.995; % K, guessed for Taz = 310 at V = 0

IC = [T0 Ta0 0];
domain = [0, Vf];

[IVsol, DVsol] = ode23('DEdef', domain, IC);

plot(IVsol, DVsol(:, 1), 'k'); % T
title('V vs T')
xlabel('V (m^3)')
ylabel('T (K)')
fileName = 'V vs T.png';
exportgraphics(gcf, fullfile(DIR, fileName), 'Resolution', 300);

plot(IVsol, DVsol(:, 2), 'k'); % Ta
title('V vs Ta')
xlabel('V (m^3)')
ylabel('Ta (K)')
fileName = 'V vs Ta.png';
exportgraphics(gcf, fullfile(DIR, fileName), 'Resolution', 300);

plot(IVsol, DVsol(:, 3), 'k'); % X
title('V vs X')
xlabel('V (m^3)')
ylabel('X')
fileName = 'V vs X.png';
exportgraphics(gcf, fullfile(DIR, fileName), 'Resolution', 300);

%% Finding Xe:

R = 8.314; %J/mol*K
H = -6900; % J/mol
Kc_0 = 3.03;
T2 = 333; %K
T = DVsol(:, 1);
Kc = Kc_0 .* exp(- H ./ R .* (1 ./ T - 1 ./ T2));
Xe = Kc ./ (Kc + 1);

plot(IVsol, Xe, 'k'); % Xe
title('V vs Xe')
xlabel('V (m^3)')
ylabel('Xe')
fileName = 'V vs Xe.png';
exportgraphics(gcf, fullfile(DIR, fileName), 'Resolution', 300);

toc;
close all;
