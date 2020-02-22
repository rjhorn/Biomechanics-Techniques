function [peakValues] = calcGastrocMVIC(dataSet)
%CALCGASTOCMVIC Summary of this function goes here
%   Detailed explanation goes here

absData = abs(dataSet.LateralGastroc);

peakValues = max(absData);
end

