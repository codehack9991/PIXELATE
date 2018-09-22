function [ pos] = adr2nod( img )
%node of arduino
img = imresize(img,[240 240]);
bwbot1 = zeros(240,240);
bwbot1 = img(:,:,1)<20 & img(:,:,2)>150 & img(:,:,3)<245  ;
bwbot1 = bwareaopen(bwbot1,25);

l1=bwlabel(bwbot1);
stats1 = regionprops(l1);
bwbot2 = zeros(240,240);
bwbot2 = img(:,:,1)>250 & img(:,:,2)>200 & img(:,:,3)<20;
l2=bwlabel(bwbot2);
%imtool(bwbot2);
stats2 = regionprops(l2);
cent = (stats1.Centroid + stats2.Centroid)/2;
pos = floor(cent./30);

pos = pos + 1;
end

