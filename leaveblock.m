function [] = leaveblock( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global connect;
fwrite(connect,'b');
pause(0.30);
fwrite(connect,'s');
fwrite(connect,'c');
pause(0.350);
fwrite(connect,'s');
fwrite(connect,'b');
pause(0.30);
fwrite(connect,'s');
end

