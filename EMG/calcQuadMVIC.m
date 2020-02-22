function [peakValuesVL, peakValuesVM] = calcQuadMVIC(dataSet)
%CALCGASTOCMVIC Summary of this function goes here
%   Detailed explanation goes here

absData = abs(dataSet.VastusLateralis);

peakValuesVL = max(absData);

absData = abs(dataSet.VastusMedialis);

peakValuesVM = max(absData);

end

