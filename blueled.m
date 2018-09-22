function [ ] = blueled(connect)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
fwrite(connect,'3');
pause(1);
disp('blue led');
fwrite(connect,'s');
end

