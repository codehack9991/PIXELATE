function [  ] = grab(botcent,node)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[k,l] = no2nod(node1);
c = [(l-1)*30+15,(k-1)*30+15];
[pos cent] = loc_bot(img);
dist = (cent(1)-c(1))^2 + (cent(2)-c(2))^2;
if dist<40000
    fwrite(connect,'f');

end

