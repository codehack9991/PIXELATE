function [const] = checkarena(im)
%converts the image of arena into a matrix with 1 for green and 2 for red
[bw1,bw2]=tanm(im);
%bw1=Convert(im,1,green);
bw2= bwareaopen(bw2,500);
bw1= bwareaopen(bw1,500);
%imtool(bw1);
%imtool(bw2);
se=strel('disk',1);
bw1=imdilate(bw1,se);
bw2=imdilate(bw2,se);
%imtool(bw2);
rstart = 1;
cstart = 1;
flag=0;
for a=1:8 
    rend = rstart + 110 ;
    cstart = 1;
   for b=1:8
         cend = cstart + 116;
         flag = 0;
         const(a,b)= 0;
    for i= cstart:cend
        for j= rstart:rend
            if bw1(j,i)>0 
                flag = flag +1;
                if flag>1000
                    const(a,b) = 1;
                    continue;
                end
            end
            if bw2(j,i)>0 
                flag = flag +1;
                if flag>1000
                    const(a,b) = 2;
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

