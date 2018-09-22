function [const const1] = checkarena2(im, white, const)
%converts the resized image of arena into a matrix with 1 for green and 2 for red
im = imresize(im, [481 481]);
%imtool(im);
global indix;
global indiy;
[bw1,bw2]=tanm(im);
%bw1=Convert(im,1,green);
bw2= bwareaopen(bw2,(100*0.62));
bw1= bwareaopen(bw1,(100*0.62));
%imtool(bw1);
%imtool(bw2);
se=strel('disk',1);
bw1=imdilate(bw1,se);
bw2=imdilate(bw2,se);
% imtool(bw1);
% imtool(bw2);
rstart = 2;
cstart = 2;
flagr=0;
flagg = 0;
flag = 0 ;
flagw=0;
for a=1:8
    rend = rstart + 58 ;
    cstart = 2;
    for b=1:8
        cend = cstart + 58;
        flagg = 0;
        flagr = 0;
        flag = 0 ;
        flagw = 0;
        %const(a,b)= 0;
        const1(a,b)=0;
        for i= cstart:cend
            for j= rstart:rend
                if bw1(j,i)>0
                    flagg = flagg +1;
                    if flagg>150
                        if const(a,b)<4
                            const(a,b) = 1;
                        end
                        %continue;
                    end
                end
                
                if bw1(j,i)>0
                    flag = flag +1;
                    if flag>3000
                        if const(a,b)<4
                            const(a,b) = 3;
                            indix = a;
                            indiy = b;
                            %continue;
                        end
                    end
                end
                if bw2(j,i)>0
                    flagr = flagr +1;
                    if flagr>150
                        if const(a,b)<4
                            const(a,b) = 2;
                        end
                        %continue;
                    end
                end
                if bw2(j,i)>0
                    flag = flag +1;
                    if flag>3000
                        if const(a,b)<4
                            const(a,b) = 3;
                            indix = a;
                            indiy = b;
                            %continue;
                        end
                    end
                end
                if (im(j,i,1) > (white(1)-20) & im(j,i,2) > (white(2)-20) & im(j,i,3) > (white(3)-20))
                    flagw = flagw + 1;
                    
                end
            end
        end
        %disp(flag);
        if flagw > 2000
            if const(a,b)<4
                const(a,b)=0;
                const1(a,b)=5;
            end
        end
        if flagw > 2000 & flagg > 150 & flagg < 500
            if const(a,b)<4
                const(a,b)=1;
                const1(a,b)=5;
            end
        end
        if flagw > 2000 & flagr > 150 & flagr < 600
            if const(a,b)<4
                const(a,b)=2;
                const1(a,b)=5;
            end
        end
        cstart = cend+2;
    end
    rstart = rend+2;
end
end

