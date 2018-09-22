function [ const ] = checkr(im )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
rstart = 1;
flagr=0;
cstart = 1;
[m,n,h]=size(im);
meann=mean(mean(im));
for a=1:8 
    rend = rstart + 110 ;
    cstart = 1;
   for b=1:8
         cend = cstart + 116;
         flagr = 0;
         flagg = 0;
         const(a,b)= 0;
    for i= cstart:cend
        for j= rstart:rend
            if (im(j,i,1)> meann(1)+100)&(im(j,i,2)< meann(2))&(im(j,i,3)< meann(3)) 
                flagr = flagr+1;
                if flagr>1000
                    const(a,b) = 1;
                    continue;
                end
            end
            if (im(j,i,2)> meann(2)+80)&(im(j,i,1)< meann(1)+30)&(im(j,i,3)< meann(3)+30) 
                flagg = flagg+1;
                if flagg>1000
                    const(a,b) = 2;
                    continue;
                end
            end
        end
    end
    cstart = cend ;
   end
   rstart = rend;
end
            
end

