function [staticCOM] = calcCOMStatic(trialMotionData, trialForceData)
%Using an appropriate set of markers on the pelvis, calculate an
    %estimate of the person's COM while standing
%   Detailed explanation goes here



%We are using the sacral marker to approximate the participant's COM

sacralX = mean(trialMotionData.SacralX);
sacralY = mean(trialMotionData.SacralY);
sacralZ = mean(trialMotionData.SacralZ);

staticCOM = [sacralX, sacralY, sacralZ];

end

