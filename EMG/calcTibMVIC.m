function [peakValues] = calcTibMVIC(dataSet)
%CALCGASTOCMVIC Summary of this function goes here
%   Detailed explanation goes here

absData = abs(dataSet.TibialisAnterior);

peakValues = max(absData);

end

