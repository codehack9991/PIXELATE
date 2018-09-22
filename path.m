function [patharr] = dejavu(start,finish,adj)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
temp=inf(2,64);
temp(1,start)=0;
temp(2,start)=start;
vis=zeros(1,64);
i=1;
q=[start];
child=zeros(1,5);
while i<=size(q,2)
    if vis(q(i))==0
        [result child]=node(temp,q(i),adj);
        temp=result;
        vis(q(i))=1;
        q=[q,child];
    end
    i = i+1;
end
i=1;
j=finish;
while temp(2,j)~=start
    patharr(i)=temp(2,j);
       j=temp(2,j);
    i = i+1;
end
end

