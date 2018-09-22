function [mat] = edgecase(start,mat)
%makes coordinate of start 0
[r,c]=no2nod(start);
if mat(r,c)~=0
mat(r,c)=0;
end
end

