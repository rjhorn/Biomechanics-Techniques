function [stuff]= plotCOMJump(trialMotionData,variable,counter)
%Takes the COM and with its location plots the horizontal and vertical movement over time, in this case the COM is going to be
%set as the Sacral marker. Input the trial/condition motion capture data that you want to
%work with. The files imported are meant to be TSV files read in as a
%table. Then the name of markers should be universal that way when pulling
%from the table it doesn't matter the order the columns are as long as the
%markers are there with correct naming. 

%Initialize Variables%

stuff= variable;
%Plotting the figure
xAxis= linspace(1,5,1200);
verticalMovement= trialMotionData.SacralZ;
horizontalMovement= trialMotionData.SacralX;
% verticalMovement= broadJumpMotionData.SacralZ;
% horizontalMovement= broadJumpMotionData.SacralX;

figure
hold on
plot(xAxis,verticalMovement);

plot(xAxis,horizontalMovement);
legend('Vertical Movements','Horizontal Movements','Location','northeast');

xlabel('Time (seconds)');
ylabel('Distance (millimeters)');
title('COM Movement During Jumping');
hold off

% Saving the image
% filename= char (jumpNamesMotion(i));

filename= char (stuff(counter));
filename(end-3:end)= '.pdf';
saveas(gcf,filename)
  

end

