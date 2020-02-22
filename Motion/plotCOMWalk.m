function [] = plotCOMWalk(walkMotionData, walkNamesMotion, i)
%Plot the Movement of the person's COM during each of the walking
    %conditions
%   Detailed explanation goes here

timeAxis = linspace(1,5,1200);

%Sacral Z is estimate of vertical COM
sacralZ = walkMotionData.SacralZ;

%Sacral X is estimate of horizontal COM
sacralX = walkMotionData.SacralX;

figure
hold on
plot(timeAxis,sacralZ);
plot(timeAxis,sacralX);
legend('Vertical Movement','Horizontal Movement','Location','northeast');

xlabel('Time (seconds)');
ylabel('Distance (millimeters)');
title('COM Movement During Walking');
hold off

filename = char(walkNamesMotion(i));
filename(end-3:end)= '.pdf';
saveas(gcf,filename);


end

