function[a]=checkindi1()
global indix;
global indiy;
global vid;
 img=getsnapshot(vid);
 img=imresize(img,[481 481]);
a=0;
%ind=[(1-1)*60+30,(5-1)*60+30];
if (img((indix-1)*60+30,(indiy-1)*60+30,2)>225)
    a=1;
end
if (img((indix-1)*60+30,(indiy-1)*60+30,1)>225)
    a=2;
end
end