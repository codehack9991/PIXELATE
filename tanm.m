function [ bw1,bw2 ] = tanm(im )
%finds red and green colour in arena
global red;
global green;
global black;
% red = sampleval(im);
% green = sampleval(im);
% black = sampleval(im);
% disp(red);
% disp(green);
% disp(black);
% [m,n,h]=size(im);
%meann=mean(mean(im));

         
 for j= 1:481
     for i= 1:481
         bw1(j,i) = 0;
         bw2(j,i) = 0;
            if (im(j,i,1)> red(1)-50)&(im(j,i,2)< red(2)+50)&(im(j,i,3)< red(3)+50) 
                    bw2(j,i) = 1;
            end
            if (im(j,i,2)> green(2)-40)&(im(j,i,1)< green(1)+40)&(im(j,i,3)< green(3)+40) 
                    bw1(j,i) = 1;
            end
        end
 end
end

