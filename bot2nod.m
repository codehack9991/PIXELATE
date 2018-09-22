function [botnod] = bot2nod( img )
%node of arduino
global rgb1;
global rgb2;
img = imresize(img,[240 240]);
bwbot1 = zeros(240,240);
bwbot1 = img(:,:,1)<(rgb1(1)+40) & img(:,:,2)<(rgb1(2)+40)  & img(:,:,3)>(rgb1(3)-40)  ;
bwbot1 = bwareaopen(bwbot1,64);
%imtool(bwbot1);
l1=bwlabel(bwbot1);
stats1 = regionprops(l1);

bwbot2 = zeros(240,240);
bwbot2 = img(:,:,1)>(rgb2(1)-40) & img(:,:,2)<(rgb2(2)+40) & img(:,:,2)>(rgb2(2)-40) & img(:,:,3)<(rgb2(3)+40);
bwbot2 = bwareaopen(bwbot2,64);
%imtool(bwbot2);
l2=bwlabel(bwbot2);
stats2 = regionprops(l2);
cent = (stats1.Centroid + stats2.Centroid)/2;
pos = floor(cent./30);
%disp(cent)
pos = pos + 1;
botnod=(pos(2)-1)*8 + pos(1);
end

