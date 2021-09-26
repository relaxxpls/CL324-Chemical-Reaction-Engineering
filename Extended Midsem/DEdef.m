function [Ddv_Div] = DEdef(I, D)
    % ************************************
    % DEdef - Defination of system of ODEs
    %
    % IV, I, IVsol - Independant Variables
    % DV, D, DVsol - Dependant Variables
    % ************************************

    % Part a)
    % mdot_c = [40 45 50 55 60]; %kg/h
    % mdot_c = 60; %kg/h

    % Part b)
    mdot_c = 50; %kg/h

    R = 8.314; %J/mol*K
    Ua = 5 * 10^6; % J/m^3*h*K
    E = 65.7 * 1000; % J/mol
    H = -6900; % J/mol

    K_0 = 31.1; %1/h
    T1 = 360 + 273; %K

    Kc_0 = 3.03;
    T2 = 333; %K

    Fa_0 = 0.9 * 14.7 * 1000; % mol/h
    Cp = 75 * 10^3; % J/kg/K
    Cp_net = 159;
    Ca_0 = 9.3 * 1000; %mol/m^3

    % ? Dependent variables
    T = D(1);
    Ta = D(2);
    X = D(3);

    K = K_0 * exp(- E / R * (1 / T - 1 / T1));
    Kc = Kc_0 * exp(- H / R * (1 / T - 1 / T2));

    C_A = Ca_0 * (1 - X);
    C_B = Ca_0 * X;
    r_A = -1 * K * (C_A - C_B / Kc);

    Ddv_Div = [
            (r_A * H - Ua * (T - Ta)) / (Fa_0 * Cp_net);
            Ua * (T - Ta) / (mdot_c * Cp);
            -1 * r_A / Fa_0
            ];

end
