% Research Techniques in Biomechanics
% Force Assignment

% 1. Find the peak vertical and anterior/posterior (braking and 
% acceleration) ground reaction forces for walking and running. What do 
% these data tell you?
% 2. Calculate vertical and horizontal impulses for the walking and running
% conditions. What do these data tell you?
% 3. Find the peak vertical ground reaction forces in the jumping movements.
% What do these data tell you?
% 4. Find the vertical impulses in the jumping movements (be careful here 
% because I only want the impulse responsible for the jump, not just standing
% or landing on the force plate).
% 5. Calculate the time in flight for each of the jumps.
% 6. Calculate jump height based on flight time.
% 7. Calculate jump height based on impulse.
% 8. Which of these jump height calculation methods do you think gives 
% the most accurate result? Why?

clc
clearvars


%Import data as a table
trialName = "max_verticalT0003_f_1.tsv";
trialData = importfileTSVTable(trialName);
disp(trialName);

%Calculations
[peakV, peakVi] = max(trialData.Force_Z);
[peakAP, peakAPi] = max(trialData.Force_X);
disp(['peakAP = ', num2str(peakAP)]);
[minAP, minAPi] = min(trialData.Force_X);
disp(['minAP = ', num2str(minAP)]);

localMax = max(trialData.Force_Z, [0,3]);
timeCount = linspace(0, 5, 5000);

vertImpulse = trapz(timeCount, trialData.Force_Z);
disp(['Vert Impulse = ', num2str(vertImpulse)]);
horzImpulse = trapz(timeCount, trialData.Force_Y);
disp(['Horz Impulse = ', num2str(horzImpulse)]);

%Graph Data

%Millisecond per unit


%Jump Height from Flight Time
flightTime = 0;

for i = 1:5000
    if (trialData.Force_Z(i) < 25)
        flightTime = flightTime + 1;
    end
end

disp(['flight time = ', num2str(flightTime/1000)]);

jumpHeightFlight = 0.5 * 9.82 * ((flightTime/1000)/2)^2;
disp(['Jump Height (Flight) = ', num2str(jumpHeightFlight)]);


%Jump 


takeOffVelocity = vertImpulse/998;
jumpHeightImpulse = (takeOffVelocity^2)/(9.8*2);
disp(['Jump Height (Impulse) = ', num2str(jumpHeightImpulse)]);


plot(timeCount, trialData.Force_X, 'LineWidth', 2);
% axis([3.5 3.8 -200 1500]);
hold on
plot(timeCount, trialData.Force_Y, 'LineWidth', 2);
plot(timeCount, trialData.Force_Z, 'LineWidth', 2);
% title("Running at a constant speed");
ylabel("Force (N)");
xlabel("Time (s)");
legend("FX", "FY" , "FZ");
% plot((peakVi/1000), peakV, 'o','MarkerSize',8);
% text((peakVi/1000)+.003, peakV+20, ['Peak V = ', num2str(peakV,'%g')]);
% plot((peakAPi/1000), peakAP,'o','MarkerSize',8);
% text((peakAPi/1000)-.008, peakAP+50, ['Peak AP = ', num2str(peakAP, '%0.3g')]);
% plot((minAPi/1000), minAP,'o','MarkerSize',8);
% text((minAPi/1000)-.01, minAP-40, ['Min AP = ', num2str(minAP, '%0.3g')]);
hold off


%trapz uses trapezoidal method to find area under the curve