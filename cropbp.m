function [bp,const] = cropbp(arena, bw1, bw2, white)
%UNTITLED Summary of this function goes here
%   Detects the blue print
bpmat=zeros(8,8);
arena = imresize(arena, [481 481]);
const=zeros(8,8);
rstart = 1;
cstart = 1;
flagr=0;
flagg = 0;
flag = 0 ;
for a=1:8
    rend = rstart + 60 ;
    cstart = 1;
    for b=1:8
        if (a==1 | a==2 | a==7 | a==8) &  (b==1 | b==2 | b==7 | b==8)
            cend = cstart + 60;
            flagg = 0;
            flagr = 0;
            flag = 0 ;
            const(a,b)= 0;
            for i= cstart:cend
                for j= rstart:rend
                    if bw1(j,i)>0
                        flagg = flagg +1;
                    end
                    if bw2(j,i)>0
                        flagr = flagr +1;
                    end
                    if ((arena(j,i,1) > (white(1)-20)) & (arena(j,i,2) > (white(2)-20)) & (arena(j,i,3) > (white(3)-20)))
                        flag = flag+1;
                    end
                    
                end
            end
            if ((flagg + flagr)>700 & (flagg + flagr)<2500)
                const(a,b) = 4;
                
            end
            if flag<2800 & flag > 600
                const(a,b) = 4 ;
                
            end
        end
        cstart = cend ;
    end
    rstart = rend;
end
%display(const);
flag = 1;
x=0;
y=0;
for a=1:8
    for b=1:8
        if flag==1
            if const(a,b)==4
                if b == 8
                    if const(a+1,b)==4
                        y = a;
                        x = b;
                        l = 60;
                        w = 100;
                        flag = 0;
                        bpmat(a,b)=4;
                        bpmat(a+1,b)=4;
                    end
                    
                elseif a ==8
                    if const(a,b+1)==4
                        y = a ;
                        x = b ;
                        l = 100;
                        w = 60;
                        flag = 0;
                        bpmat(a,b)=4;
                        bpmat(a,b+1)=4;
                    end
                elseif const(a+1,b)==4
                    y = a;
                    x = b;
                    l = 60;
                    w = 100;
                    flag = 0;
                    bpmat(a,b)=4;
                    bpmat(a+1,b)=4;
                    
                elseif const(a,(b+1)) == 4
                    
                    y = a ;
                    x = b ;
                    l = 100;
                    w = 60;
                    flag = 0;
                    bpmat(a,b)=4;
                    bpmat(a,b+1)=4;
                end
            end
        end
    end
    x1 = (x-1)*60;
    y1 = (y-1)*60;
end
if y==7
    bp = imcrop(arena, [x1 (y1+20) l w]);
    % imtool(t);
    
elseif (y==1 & x ==1) | (y==1 & x ==8) | (y==8 & x ==1)
    bp = imcrop(arena, [x1 y1 l w]);
    % imtool(t);
    
elseif x==7
    bp = imcrop(arena, [(x1+20) y1 l w]);
    %  imtool(t);
end
end