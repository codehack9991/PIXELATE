function [ l,k ] = no2nod( i)
%converts node number to co-ordinates
k=mod(i,8) ;
l=floor(i/8) +1;
if k==0
    k = 8;
    l = l-1;
end
end

