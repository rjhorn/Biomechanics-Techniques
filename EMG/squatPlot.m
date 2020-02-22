function [] = squatPlot(...
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

start = 1;
finish = length(dataEMG.VastusLateralis);

xAxis = start:finish; 
xAxis3D = 1:7200;

figure
subplot(3,2,1), plot(xAxis, dataEMG.VastusLateralis([start:finish]));
title("Vastus Lateralis");
xlim([start finish]);
xticks([1 14400 28800])
xticklabels({'0', '15', '30'})
xlabel('Time (s)');
ylabel('EMG (mV)');

subplot(3,2,2); plot(xAxis, dataEMG.VastusMedialis(start:finish));
title("Vastus Medialis");
xlim([start finish]);
xlabel('Time (s)');
ylabel('EMG (mV)');

subplot(3,2,3), plot(xAxis, dataEMG.LateralGastroc(start:finish));
title("Lateral Gastroc");
xlim([start finish]);
xlabel('Time (s)');
ylabel('EMG (mV)');

subplot(3,2,4), plot(xAxis, dataEMG.TibialisAnterior(start:finish));
title("Tibialis Anterior");
xlim([start finish]);
xlabel('Time (s)');
ylabel('EMG (mV)');

subplot(3,2,5), plot(xAxis, dataForce.Force_Z(start:finish));
title('Vertical GRF');
xlim([start finish]);
xlabel('Time (s)');
ylabel('Force (N)');

subplot(3,2,6), plot(xAxis3D, data3D.sacralZ(1:7200));
title('Vertical Position of Sacral Marker');
xlim([(floor(start/4)) (floor(finish/4))]);
xlabel('Time (s)');
ylabel('Position (mm)');

sgtitle(condition);



end

