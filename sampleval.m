function [val] = sampleval(arena)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

img = imcrop(arena);
val = mean(mean(img));
end

