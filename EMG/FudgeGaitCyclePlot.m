function [] = FudgeGaitCyclePlot(...
    dataEMG, data3D, dataForce, condition)
% Temporal analysis for each movement for each person. How long are the
% muscles activated? During which phase of the gait cycle are they active
% and for what percentage?

% This should create a figure containing a graph for each of the four
% muscles, a graph for the postion data of the Toe marker, and the force
% plate data. The x axis will be defined by the gait cycle, starting at
% heel strike and finishing at the following heel strike.


%start = initial heel strike defined by Force Plate
%toeOff = toeOff event defined by Force Plate
%finish = the subsequent heel strike defined by Motion Capture Data

indexForces = find(dataForce.Force_Z > 20);

heelStrike = indexForces(1);
toeOff = indexForces(end - 1);

toeOff3D = floor(toeOff/4);

[maxToeZ, index3D] = max(data3D.toeZ((toeOff3D + 25):1200));
heelStrike2 = 4272;

start = heelStrike;
toeOff = toeOff;
finish = heelStrike2;

xAxis = start:finish; 
xAxis3D = floor(start/4):floor(finish/4);

quarter = ((heelStrike2 - heelStrike) * .25) + heelStrike;
half = ((heelStrike2 - heelStrike) * .50) + heelStrike;
threeQuarters = ((heelStrike2 - heelStrike) * .75) + heelStrike;

figure
subplot(3,2,1), plot(xAxis, dataEMG.VastusLateralis([start:finish]));
title("Vastus Lateralis");
xlim([start finish])
xticks([heelStrike quarter half threeQuarters heelStrike2])
xticklabels({'Heel Strike', '25%', '50%', '75%', 'Heel Strike'})
xline(toeOff,'-.', 'DisplayName', 'Toe Off');
xlabel('Gait Cycle');
ylabel('EMG (mV)');

subplot(3,2,2); plot(xAxis, dataEMG.VastusMedialis(start:finish));
title("Vastus Medialis");
xlim([start finish])
xticks([heelStrike quarter half threeQuarters heelStrike2])
xticklabels({'Heel Strike', '25%', '50%', '75%', 'Heel Strike'})
xline(toeOff,'-.', 'DisplayName', 'Toe Off');
xlabel('Gait Cycle');
ylabel('EMG (mV)');

subplot(3,2,3), plot(xAxis, dataEMG.LateralGastroc(start:finish));
title("Lateral Gastroc");
xlim([start finish])
xticks([heelStrike quarter half threeQuarters heelStrike2])
xticklabels({'Heel Strike', '25%', '50%', '75%', 'Heel Strike'})
xline(toeOff,'-.', 'DisplayName', 'Toe Off');
xlabel('Gait Cycle');
ylabel('EMG (mV)');

subplot(3,2,4), plot(xAxis, dataEMG.TibialisAnterior(start:finish));
title("Tibialis Anterior");
xlim([start finish])
xticks([heelStrike quarter half threeQuarters heelStrike2])
xticklabels({'Heel Strike', '25%', '50%', '75%', 'Heel Strike'})
xline(toeOff,'-.', 'DisplayName', 'Toe Off');
xlabel('Gait Cycle');
ylabel('EMG (mV)');

subplot(3,2,5), plot(xAxis, dataForce.Force_Z(start:finish));
title('Vertical GRF');
xlim([start finish])
xticks([heelStrike quarter half threeQuarters heelStrike2])
xticklabels({'Heel Strike', '25%', '50%', '75%', 'Heel Strike'})
xline(toeOff,'-.', 'DisplayName', 'Toe Off');
xlabel('Gait Cycle');
ylabel('Force (N)');

subplot(3,2,6), plot(xAxis3D, data3D.toeZ((floor(start/4)):(floor(finish/4))));
title('Vertical Position of Toe Marker');
xlim([(floor(start/4)) (floor(finish/4))]);
xticks([floor(heelStrike/4) floor(quarter/4) floor(half/4) ...
    floor(threeQuarters/4) floor(heelStrike2/4)]);
xticklabels({'Heel Strike', '25%', '50%', '75%', 'Heel Strike'})
xline(toeOff3D,'-.', 'DisplayName', 'Toe Off');
xlabel('Gait Cycle');
ylabel('Position (mm)');

sgtitle(condition);



end

