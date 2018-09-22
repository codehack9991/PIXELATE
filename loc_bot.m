function [botv cent] = loc_bot( img )
%loactes bot in arena and centroid of bot
%stats1 = 0 ;
arena = img;
global rgb1;
global rgb2;
se=strel('square',2);
ju=strel('square',20);
%rgb1 = sampleval(arena);
%rgb2 = sampleval(arena);
%disp(rgb2);
img = imresize(img,[480 480]);

bwbot1 = zeros(480,480);
bwbot1 = img(:,:,1)<(rgb1(1)+40) & img(:,:,2)<(rgb1(2)+40) & img(:,:,3)>(rgb1(3)-40);
bwbot1 = bwareaopen(bwbot1,100);
bwbot1=imdilate(bwbot1,se);
imtool(bwbot1);
l1=bwlabel(bwbot1);
stats1 = regionprops(l1);

bwbot2 = zeros(480,480);
bwbot2 = img(:,:,1)>(rgb2(1)-40) & img(:,:,2)<(rgb2(2)+40) & img(:,:,3)<(rgb2(3)+40);
bwbot2 = bwareaopen(bwbot2,100);
bwbot1=imdilate(bwbot1,ju);
imtool(bwbot2);
l2=bwlabel(bwbot2);
stats2 = regionprops(l2);

cent = (stats1.Centroid + stats2.Centroid)/2;
botv=complex(stats1.Centroid(1)-stats2.Centroid(1),stats1.Centroid(2)-stats2.Centroid(2));
%disp(cent);
end