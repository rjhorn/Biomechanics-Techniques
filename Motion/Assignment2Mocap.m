% Research Techniques in Biomechanics
% Motion Capture Assignment

% Requires Functions:
% importfileMotionData
% importfileForceData
% calcCOMStatic
% plotCOMWalk
% calcCOMWalk
% plotCOMJump
% calcDispJump

clc
clear all

%List of all trial names, for the program to iterate through
staticNamesMotion = ["Static0001.tsv"];
staticNamesForce = ["Static0001_f_1.tsv"];
walkNamesMotion = ["walkConstant0002.tsv", "walkAccelerate0002.tsv", ...
    "walkDecelerate0002.tsv"];
walkNamesForce = ["walkConstant0002_f_1.tsv", "walkAccelerate0002_f_1.tsv", ...
    "walkDecelerate0002_f_1.tsv"];
jumpNamesMotion = ["jumpVertical0002.tsv", "jumpBroad0002.tsv"];
jumpNamesForce = ["jumpVertical0002_f_1.tsv", "jumpBroad0002_f_1.tsv"];



%initialize calculation result vectors
resultStaticCalc = [zeros(1, numel(staticNamesMotion))];
resultWalkVelocity = [zeros(1, numel(walkNamesMotion))];
resultWalkAcceleration = [zeros(1, numel(walkNamesMotion))];
resultJumpCalc = [zeros(1, numel(jumpNamesMotion))];


% Static Loop

for i = 1:(numel(staticNamesMotion))

    staticMotionData = importfileMotionData(staticNamesMotion(i));
    staticForceData = importfileForceData(staticNamesForce(i));

    %Using an appropriate set of markers on the pelvis, calculate an
    %estimate of the person's COM while standing
    resultStaticCalc(i, 1:3) = calcCOMStatic(staticMotionData, staticForceData);

end

% - - - - - 

% Walking Loop

for i = 1:(numel(walkNamesMotion))

    walkMotionData = importfileMotionData(walkNamesMotion(i));
    %walkForceData = importfileForceData(walkNamesForce(i));
    
    %Plot the Movement of the person's COM during each of the walking
    %conditions
    
    %plotCOMWalk(walkMotionData, walkNamesMotion, i);

    %Estimate the person's COM linear velocity and acceleration during the
    %three walking conditions using appopriate marker positions
    
    [resultWalkVelocity(i), resultWalkAcceleration(i)] = ...
       calcCOMWalk(walkMotionData, walkNamesMotion);

end

% - - - - - 

% Jumping Loop


for i = 1:(numel(jumpNamesMotion))
    
    jumpMotionData = importfileMotionData(jumpNamesMotion(i));
    jumpForceData = importfileForceData(jumpNamesForce(i));
    
    %Plot the horizontal and vertical movments of the COM in each jump
    %condition

    %plotCOMJump(jumpMotionData, jumpNamesMotion, i);


    %Calculate vertical and horizontal displacement in each of the jumping
    %conditions. What markers did you use and why?

    %resultJumpCalc(i) = calcDispJump(jumpMotionData, jumpForceData);
    
end
