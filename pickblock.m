function [ ] = pickblock()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global connect;
fwrite(connect,'o');
pause(0.360);
fwrite(connect,'s');
end

