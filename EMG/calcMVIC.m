function [avg] = calcMVIC(dataSet, start, finish)
%CALCGASTOCMVIC Summary of this function goes here
%   Detailed explanation goes here

absData = abs(dataSet);

avg = mean(dataSet(start:finish, 1));

end

