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
walkingNamesMotion = ["walkConstant0002.tsv", "walkAccelerate0002.tsv", ...
    "walkDecelerate0002.tsv"];
walkingNamesForce = ["walkConstant0002_f_1.tsv", "walkAccelerate0002_f_1.tsv", ...
    "walkDecelerate0002_f_1.tsv"];
jumpNamesMotion = ["jumpVertical0002.tsv", "jumpBroad0002.tsv"];
jumpNamesForce = ["jumpVertical0002_f_1.tsv", "jumpBroad0002_f_1.tsv"];



%initialize calculation result vectors
resultStaticCalc = [zeros(1, numel(trialNamesMotion))];
resultWalkVelocity = [zeros(1, numel(walkingNamesMotion))];
resultWalkAcceleration = [zeros(1, numel(trialNamesMotion))];
resultJumpCalc = [zeros(1, numel(trialNamesMotion))];


% Static Loop

for i = 1:(numel(staticNamesMotion))

staticMotionData = importfileMotionData(staticMotion(i));
staticForceData = importfileForceData(staticNamesForce(i);

%Using an appropriate set of markers on the pelvis, calculate an
%estimate of the person's COM while standing
resultStaticCalc(i) = calcCOMStatic(trialMotionData, trialForceData);

end

% - - - - - 

% Walking Loop

for i = 1:(numel(walkingNamesMotion))

    walkMotionData = importfileMotionData(walkingNamesMotion(i));
    walkForceData = importfileForceData(walkingNamesForce(i));
    
    %Plot the Movement of the person's COM during each of the walking
    %conditions
    
    plotCOMWalk(trialMotionData, trialForceData);


    %Estimate the person's COM linear velocity and acceleratoin during the
    %three walking conditions using appopriate marker positions
    
    [resultWalkVelocity(i), resultWalkAcceleration(i)] = ...
        calcCOMWalk(trialMotionData, trialForceData);

end

% - - - - - 

% Jumping Loop, will loop through the conditions we have
counter= [];

for i = 1:(numel(jumpNamesMotion))
    
    jumpMotionData = importfileMotionData(jumpNamesMotion(i));
    jumpForceData = importfileForceData(jumpNamesForce(i));
    
    %Plot the horizaontal and vertical movments of the COM in each jump
    %condition
    
    plotCOMJump(jumpMotionData,jumpNamesMotion,i);
    
    %Calculate vertical and horizontal displacement in each of the jumping
    %conditions. What markers did you use and why?
    
    %For horizontal displacement will use the toe to start and the heel
    %point when landing (can cite articles that do Broad jumps, is how the
    %combine does it)
    % For vertical displacement maybe just use the chest since it is a spot
    % on the body that rises in line with Center of Mass? OR put it as it
    % is hard to extend the chest higher when jumping like you could with
    % legs by tucking them up, plus chest doesn't "move" as much during the
    % jumping motion (legs have counter movement and have to support the
    % landing)
    %     resultJumpCalc(i) = calcDispJump(trialMotionData, trialForceData);
end
