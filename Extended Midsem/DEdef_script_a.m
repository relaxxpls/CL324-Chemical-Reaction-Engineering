tic;
clc; clear;

% Vf = 6; % m^3
% T0 = 310; % K
% Taz = 310; % K, at V = 6
% Ta0 = 309.993; % K, guessed for Taz = 310 at V = 0 & mdot_c = 40 kg/s
% % Ta0 = 309.993; % K, guessed for Taz = 310 at V = 0 & mdot_c = 45 kg/s
% % Ta0 = 309.993; % K, guessed for Taz = 310 at V = 0 & mdot_c = 50 kg/s
% % Ta0 = 309.993; % K, guessed for Taz = 310 at V = 0 & mdot_c = 55 kg/s
% % Ta0 = 309.993; % K, guessed for Taz = 310 at V = 0 & mdot_c = 60 kg/s

% IC = [T0 Ta0 0];
% domain = [0, Vf];

% [IVsol, DVsol] = ode23('DEdef', domain, IC);

%% ? Plotting results:

DIR = './part a/';
mdot_c = [40 45 50 55 60]; %kg/h
% ? Results from upper section
X = [0.000294203623245941 0.000294196325631639 0.000294189453808531 0.000294183368991375 0.000294177987717280];

plot(mdot_c, X, 'k');
title('X vs m_c')
xlabel('m_c (kg/h)')
ylabel('X')
fileName = 'X vs m_c.png';
exportgraphics(gcf, fullfile(DIR, fileName), 'Resolution', 300);

toc;
close all;
