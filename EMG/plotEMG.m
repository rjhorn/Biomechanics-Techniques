function [] = plotEMG(S1dataEMG, S1data3D, S2dataEMG, S2data3D, condition)
% Plot electromyograms for each muscle for each movement (One figure for
% each movement with both subjects side by side
% For each condition, plots four graphs (one for each muscle) comparing S1 and S2



if condition == "Squat Hold"
    xAxis = linspace(1, 30, 28800);
else
    xAxis = linspace(1, 5, 4800);
end

figure
subplot(4,2,1), plot(xAxis, S1dataEMG.VastusLateralis);
title("Vastus Lateralis S1");
subplot(4,2,2), plot(xAxis, S2dataEMG.VastusLateralis);
title("Vastus Lateralis S2");
subplot(4,2,3); plot(xAxis, S1dataEMG.VastusMedialis);
title("Vastus Medialis S1");
subplot(4,2,4); plot(xAxis, S2dataEMG.VastusMedialis);
title("Vastus Medialis S2");
subplot(4,2,5), plot(xAxis, S1dataEMG.LateralGastroc);
title("Lateral Gastroc S1");
subplot(4,2,6), plot(xAxis, S2dataEMG.LateralGastroc);
title("Lateral Gastroc S2");
subplot(4,2,7), plot(xAxis, S1dataEMG.TibialisAnterior);
title("Tibialis Anterior S1");
subplot(4,2,8), plot(xAxis, S2dataEMG.TibialisAnterior);
title("Tibialis Anterior S2");

sgtitle(condition);


end

