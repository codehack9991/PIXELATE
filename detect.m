function [bin] = detect(im ,se)
%detects indicator,arena and blueprint
bin = zeros(480,480);
im = imresize(im , [480 480]);
for i = 1:480
    for j = 1:480
        if ~(im(i,j,1)<100 & im(i,j,3)<100 & im(i,j,2)<100)
            bin(i,j)=1;
        end
    end
end

bin = imdilate(bin,se);
bin = bwareaopen(bin,5000);
end