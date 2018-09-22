function [adj] = changeadj1(mat,adj,finish)
%makes the adjmat for picking up blocks
temp = ones(7,7);
for i = 2:6
    for j = 2:6
        temp(i,j)=mat(i-1,j-1);
    end
end
k=mod(finish,5) +1;
l=floor(finish/5) +2;
if k==1
    k = 6;
    l = l-1;
end
if temp(l,k)~=0
    if temp(l,k-1)==0
        adj(finish,finish-1) =1;
        adj(finish-1,finish) =1;
    end
    if temp(l,k+1)==0
        adj(finish,finish+1)=1;
        adj(finish+1,finish)=1;
    end
    if temp(l-1,k)==0
        adj(finish,finish-5)=1;
        adj(finish-5,finish) =1;
    end
    if temp(l+1,k)==0
        adj(finish,finish+5)=1;
        adj(finish+5,finish) =1;
    end
    
end
end

