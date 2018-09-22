function [bw] = Convert(im,comp)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n,h]=size(im);
bw=zeros(m,n);
meann = mean(mean(im));
if comp==2
for j=1:m
    for i=1:n
        flagr=0;
         if (im(j,i,1)> meann(1)+100)&(im(j,i,2)< meann(2))&(im(j,i,3)< meann(3)) 
                flagr = flagr+1;
                if flagr>1000
                    bw(j,i) = 1;
                    continue;
                end
         end
    end
end    
end
if comp==1
for j=1:m
    for i=1:n
        if (im(j,i,2)> meann(2)+80)&(im(j,i,1)< meann(1)+30)&(im(j,i,3)< meann(3)+30)
            bw(j,i)=1;
        end
    end
end
end

