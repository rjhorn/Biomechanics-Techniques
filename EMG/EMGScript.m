%Research Techniques in Biomechanics
%EMG Assignment

% *****
% Requires Functions:
% importfile3D.m
% importfileEMG.m
% importfileForce.m
% calcQuadMVIC.m
% calcGastrocMVIC.m
% calcTibMVIC.m
% calcPercentEffort.m
% plotEMG.m
% gaitCyclePlot.m
% *****

% Conditions:
% MVIC Trials (Maximum Voluntary Isometric Contraction)
% Walking at a constant speed
% Running at a constant speed
% Squatting down to 90 degrees and holding that position for 30 seconds

% EMG Data:
% Vastus Lateralis
% Vastus Medialis
% Lateral Gastroc
% Tibialis Anterior

% Calculations:
% 1. Positive and Negative Peak Values for the MVIC Trials
% 2. Calculate the percentage of effort of each muscle for each movement 
%    for each person
% 3. Plot electromyograms for each muscle for each movement (One figure for
% each movement with both subjects side by side
% 4. Temporal analysis for each movement for each person. How long are the
% muscles activated? During which phase of the gait cycle are they active
% and for what percentage?

% For EMG analysis of movement, choose a step and define the swing and
% stance phase and look at that specific stride across the muscles

clc 
clear all

% ---

% 1. Positive and Negative Peak Values for the MVIC Trials
% maxEffortVL, maxEffortVM, maxEffortLG, maxEFfortTA will contain one value
% for each subject representing the average of the peak times (1 or 2 sec)

% Subject 1

S1QuadDataMVIC = importfileEMG("MVIC_Quad0001_S1_a_2.tsv");
[S1peakValuesVL, S1peakValuesVM] = calcQuadMVIC(S1QuadDataMVIC);

S1GastrocDataMVIC = importfileEMG("MVIC_Gastroc0001_S1_a_2.tsv");
S1peakValuesLG = calcGastrocMVIC(S1GastrocDataMVIC);

S1TibDataMVIC = importfileEMG("MVIC_Tibialis0001_S1_a_2.tsv");
S1peakValuesTA = calcTibMVIC(S1TibDataMVIC);

% Subject 2

S2QuadDataMVIC = importfileEMG("MVIC_Quad0001_S2_a_2.tsv");
[S2peakValuesVL, S2peakValuesVM] = calcQuadMVIC(S2QuadDataMVIC);

S2GastrocDataMVIC = importfileEMG("MVIC_Gastroc0001_S2_a_2.tsv");
S2peakValuesLG = calcGastrocMVIC(S2GastrocDataMVIC);

S2TibDataMVIC = importfileEMG("MVIC_Tibialis0001_S2_a_2.tsv");
S2peakValuesTA = calcTibMVIC(S2TibDataMVIC);

% ---

% 2. Calculate the percentage of effort of each muscle for each movement
% for each person
% walkEffortS1, walkEffortS2, runEffortS1, runEffortS2, squatEffortS1,
% squatEffortS2 will contain one value representing the average throught 
% the trial of the EMG data divided by the max effort

S1dataWalkEMG = importfileEMG("walking0002_S1_a_2.tsv");
S1dataRunEMG = importfileEMG("running0002_S1_a_2.tsv");
S1dataSquatEMG = importfileEMG("squat0001_S1_a_2.tsv");

%[walkEffortS1, runEffortS1, squatEffortS1] = calcPercentEffort( ...
%    S1dataWalkEMG, S1dataRunEMG, S1dataSquatEMG, ...
%    S1maxEffortVL, S1maxEffortVM, S1maxEffortLG, S1maxEffortTA);

S2dataWalkEMG = importfileEMG("walking0002_S2_a_2.tsv");
S2dataRunEMG = importfileEMG("running0002_S2_a_2.tsv");
S2dataSquatEMG = importfileEMG("squat0001_S2_a_2.tsv");

%[walkEffortS2, runEffortS2, squatEffortS2] = calcPercentEffort(...
%    S2dataWalkEMG, S2dataRunEMG, S2dataSquatEMG, ...
%    S2maxEffortVL, S2maxEffortVM, S2maxEffortLG, S2maxEffortTA);

% Table / Vector with all of the output efforts

% ---

% 3. Plot electromyograms for each muscle for each movement (One figure for
% each movement with both subjects side by side
% For each condition, plots four graphs (one for each muscle) comparing S1 and S2

% Walking

S1WalkDataEMG = importfileEMG("walking0002_S1_a_2.tsv");
S1WalkData3D = importfile3D("walking0002_S1.tsv");
S2WalkDataEMG = importfileEMG("walking0002_S2_a_2.tsv");
S2WalkData3D = importfile3D("walking0002_S2.tsv");

%plotEMG(S1WalkDataEMG, S1WalkData3D, S2WalkDataEMG, S2WalkData3D, "Walking");

% Running

S1RunDataEMG = importfileEMG("running0002_S1_a_2.tsv");
S1RunData3D = importfile3D("running0002_S1.tsv");
S2RunDataEMG = importfileEMG("running0002_S2_a_2.tsv");
S2RunData3D = importfile3D("running0002_S2.tsv");

%plotEMG(S1RunDataEMG, S1RunData3D, S2RunDataEMG, S2RunData3D, "Running");

% Squat Hold

S1SquatDataEMG = importfileEMG("squat0001_S1_a_2.tsv");
S1SquatData3D = importfile3D("squat0001_S1.tsv");
S2SquatDataEMG = importfileEMG("squat0001_S2_a_2.tsv");
S2SquatData3D = importfile3D("squat0001_S2.tsv");

%plotEMG(S1SquatDataEMG, S1SquatData3D, S2SquatDataEMG, S2SquatData3D, "Squat Hold");


% 4. Temporal analysis for each movement for each person. How long are the
% muscles activated? During which phase of the gait cycle are they active
% and for what percentage?

S1WalkForce = importfileForce("walking0002_S1_f_1.tsv");
S2WalkForce = importfileForce("walking0002_S2_f_1.tsv");
S1RunForce = importfileForce("running0002_S1_f_1.tsv");
S2RunForce = importfileForce("running0002_S2_f_1.tsv");
S1SquatForce = importfileForce("squat0001_S1_f_1.tsv");
S2SquatForce = importfileForce("squat0001_S2_f_1.tsv");


%Each figure will have six plots. We need six figures total, for the three
%conditions and two subjects

% Subject 1
gaitCyclePlot(S1WalkDataEMG, S1WalkData3D, S1WalkForce, "S1 Walking");
gaitCyclePlot(S1RunDataEMG, S1RunData3D, S1RunForce, "S1 Running");
squatPlot(S1SquatDataEMG, S1SquatData3D, S1SquatForce, "S1 Squat Hold");

% Subject 2
FudgeGaitCyclePlot(S2WalkDataEMG, S2WalkData3D, S2WalkForce, "S2 Walking");
gaitCyclePlot(S2RunDataEMG, S2RunData3D, S2RunForce, "S2 Running");
squatPlot(S2SquatDataEMG, S2SquatData3D, S2SquatForce, "S2 Squat Hold");




