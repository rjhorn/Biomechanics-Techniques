clc
clearvars


%Import data as a table

trialName = "max_verticalT0001_f_1.tsv";
trialData = importfileTSVTable(trialName);

%Calculations
[peakV, peakVi] = max(trialData.Force_Z);
[peakAP, peakAPi] = max(trialData.Force_X);
[minAP, minAPi] = min(trialData.Force_X);

timeCount = linspace(0, 5, 5000);

%Calculations
[peakV, peakVi] = max(trialData.Force_Z);
[peakAP, peakAPi] = max(trialData.Force_X);
[minAP, minAPi] = min(trialData.Force_X);

vertImpulse = trapz(timeCount, trialData.Force_Z);
horzImpulse = trapz(timeCount, trialData.Force_Y);

gaitConditionNames = {...
    "WalkConstant1"; "WalkConstant2"; "WalkConstant3"; ...
    "WalkAccel1"; "WalkAccel2"; "WalkAccel3"; ...
    "WalkDecel1"; "WalkDecel2"; "WalkDecel3"; ...
    "RunConstant1"; "RunConstant2"; "RunConstant3"};

gaitPeakVert = [730.16; 725.34; 744.79; 789.47; 836.09; 890.5; 849.92; ...
    859.15; 859.15; 1433.4; 1444.2; 1371.5];
gaitPeakAP = [144.83; 158.12; 165.92; 202.89; 208.88; 220.62; 106.93; ...
    84.22; 95.34; 166.06; 123.2; 164.36];
gaitMinAP = [-166.04; -148.58; -151.03; -114.96; -145.35; -109.94; ...
    -235.51; -241.52; -225.26; -174.43; -198.1; -147.41];
gaitVertImpulse = [303.05; 283.5; 285.56; 252.95; 251.53; 232.34; ...
    385.83; 382.90; 395.4; 211.22; 230.2; 212.78];
gaitHorzImpulse = [-5.13; -5.63; -10.06; -3.596; -4.45; -7.88; -2.6;...
    -13.32; -12.39; -0.45; -4.81; -1.85];


gaitTable = table(gaitConditionNames, gaitPeakVert, gaitPeakAP, gaitMinAP, gaitVertImpulse, gaitHorzImpulse);


jumpConditionNames = {...
    "JumpSubMax1"; "JumpSubMax2"; "JumpSubMax3";...
    "JumpMax1"; "JumpMax2"; "JumpMax3"};

jumpPeakVert = [3122.9; 2968.1; 4287.2; 3810.2; 3909.1; 4471.1;];
jumpVertImpulse = [2155.2; 2227.2; 2142.4; 2272.3; 2228.1; 2270.8;];
jumpHeightFlight = [0.284; 0.286; 0.286; 0.389; 0.365; 0.38;];
jumpHeightImpulse = [1.28; 1.29; 1.28; 1.28; 1.27; 1.29;];

jumpTable = table(jumpConditionNames, jumpPeakVert, jumpVertImpulse, ...
    jumpHeightFlight, jumpHeightImpulse);



