function [bin] = tanmay2(im ,se)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
%s = size(im);
bin = zeros(880,927);
for i = 1:880
    for j = 1:927
        if ~(im(i,j,1)<100 & im(i,j,3)<100 & im(i,j,2)<100)
            bin(i,j)=1;
        end
    end
end

bin = imdilate(bin,se);
bin = bwareaopen(bin,5000);
end