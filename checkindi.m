function[a]=checkindi(vid)
global indix;
global indiy;
global red;
global green;
img=getsnapshot(vid);

ind=[(indiy-1)*60+30,(indix-1)*60+30];
%val=img(ind(1),ind(2));
immg = imcrop(img , [ind(1)-10 ind(2)-10 20 20]);
m = mean(mean(immg));
if (m(1)> red(1)-20 & m(2)< red(2)+20 & m(3)< red(3)+20)
    a=2;
end
if (m(2)> green(2)-40 & m(1)< green(1)+40 & m(3)< green(3)+40) 
    a=1;
end
end

