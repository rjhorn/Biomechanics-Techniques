function [resultWalkVelocity, resultWalkAcceleration] = ...
    calcCOMWalk(walkMotionData, walkNamesMotion)
%Estimate the person's COM linear velocity and acceleration during the
    %three walking conditions using appopriate marker positions
%   Detailed explanation goes here

timeAxis = linspace(1,5,1200)';

sacralX = walkMotionData.SacralX;

sacralVelocity = sacralX./timeAxis;
sacralAcceleration = sacralVelocity./timeAxis;

resultWalkVelocity = (sacralX(length(sacralX)) - sacralX(1) / 1200);
resultWalkAcceleration = (sacralVelocity(length(sacralX)) - sacralVelocity(1) / 1200);
% figure
% hold on
% plot(timeAxis,sacralVelocity);
% 
% xlabel('Time (seconds)');
% ylabel('Velocity (m/s)');
% title('COM Velocity During Walking');
% hold off
% 
% figure
% hold on
% plot(timeAxis,sacralAcceleration);
% 
% xlabel('Time (seconds)');
% ylabel('Acceleration (m/s^2)');
% title('COM Acceleration During Walking');
% hold off

end

