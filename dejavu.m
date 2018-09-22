function [patharr] = dejavu(start,finish,adj,mat)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
patharr = [];
wt=ones(64,64);
for i=1:64
    if ((i-9)>=1 & mod(i-9,8)~=0 & (i-9)<=64)
        wt(i,i-9)=1.4;
    end
    if ((i-7)>=1 & mod(i-7,8)~=1 & (i-7)<=64)
        wt(i,i-7)=1.4;
    end
    if ((i+7)>=1 & mod(i+7,8)~=0 & (i+7)<=64)
        wt(i,i+7)=1.4;
    end
    if ((i+9)>=1 & mod(i+9,8)~=1 & (i+9)<=64)
        wt(i,i+9)=1.4;
    end
end
adj=changeadj_diag(mat,adj,finish);
temp=inf(2,64);
temp(1,start)=0;
temp(2,start)=start;
vis=zeros(1,64);
i=1;
q = [start];
%disp(start)
%child=zeros(1,7);
while i<=size(q,2)
    if vis(q(i))==0
        [result, child]=node(wt,vis,temp,q(i),adj);
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

    i = i + 1;
    %     if j==inf
    %         break;
    %     end
end
%disp(temp);
patharr=patharr(end:-1:1);
patharr = [patharr,finish];
end