function [finish] = place(a,start,mat)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
i=0;
j=0;
max=[0,0];
dmax=0;
[l,k]=no2nod(start);
for i=1:8
    for j=1:8
        if mat(i,j) == a+5
            if ((i-l)^2 + (j-k)^2) > dmax
                dmax = (i-l)^2 + (j-k)^2;
                max=[i,j];
            end
        end
    end
end
%disp(min);
finish=(max(1)-1)*8 + max(2);
end

