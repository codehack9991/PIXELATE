function [ const ] = checkbp(meann,im )
%changes the image of blueprint into a matrix using mean of means
rstart = 1;
flagr=0;
cstart = 1;
[m,n,h]=size(im);
for a=1:3 
    rend = rstart + 36 ;
    cstart = 1;
   for b=1:5
         cend = cstart + 38;
         flagr = 0;
         flagg = 0;
         const(a,b)= 0;
    for i= cstart:cend
        for j= rstart:rend
            if (im(j,i,1)> meann(1)+100)&(im(j,i,2)< meann(2))&(im(j,i,3)< meann(3)) 
                flagr = flagr+1;
                if flagr>600
                    const(a,b) = 1;
                    continue;
                end
            end
            if (im(j,i,2)> meann(2)+80)&(im(j,i,1)< meann(1)+30)&(im(j,i,3)< meann(3)+30) 
                flagg = flagg+1;
                if flagg>600
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

