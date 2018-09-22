function [ const ] = checkbp2(im )
%changes the image of blueprint into a matrix using mean of means
global green;
global red;
rstart = 1;
flagr=0;
flagg=0;
cstart = 1;
disp(red);
[l,m,n]=size(im);
if l>m
    im = imresize(im,[101 61]);
else
    im = imresize(im,[61 101]);
end
[l,m,n]=size(im);
for a=1:((l-1)/20)
    rend = rstart + 20 ;
    cstart = 1;
   for b=1:((m-1)/20)
         cend = cstart + 20;
         flagr = 0;
         flagg = 0;         
         const(a,b)= 0;
    for i= cstart:cend
        for j= rstart:rend
            %disp(i);
            %disp(j);
            if im(j,i,1)< (red(1)+30) & im(j,i,1) >red(1)-30 & im(j,i,2)<red(2)+30 & im(j,i,2)>red(2)-30 & im(j,i,3)<red(3)+20 & im(j,i,3)>red(3)-20
                flagr = flagr+1;
                if flagr>150
                    const(a,b) = 2;
                    continue;
                end
            end
            if im(j,i,2)< green(2)+30 & im(j,i,2)> green(2)-20 & im(j,i,1)< green(1)+20 & im(j,i,1)> green(1)-30 & im(j,i,3)< green(3)+30 & im(j,i,3)>green(3)-30
                flagg = flagg+1;
                if flagg>150
                    const(a,b) = 1;
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

