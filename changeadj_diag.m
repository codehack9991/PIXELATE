function [adj] = changeadj_diag(mat,adj,finish)
%makes the adjmat for picking up blocks
temp = ones(10,10);
for i = 2:9
    for j = 2:9
        temp(i,j)=mat(i-1,j-1);
    end
end
k=mod(finish,8) +1;
l=floor(finish/8) +2;
if k==1
    k = 9;
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
        adj(finish,finish-8)=1;
        adj(finish-8,finish) =1;
    end
    if temp(l+1,k)==0
        adj(finish,finish+8)=1;
        adj(finish+8,finish) =1;
    end
    if temp(l-1,k-1)==0
        adj(finish,finish-9)= 1;
        adj(finish-9,finish)= 1;
    end
    if temp(l-1,k+1)==0
        adj(finish,finish-7)=1;
        adj(finish-7,finish)= 1;
    end
    if temp(l+1,k-1)==0
        adj(finish,finish+7)=1;
        adj(finish+7,finish)= 1;
    end
    if temp(l+1,k+1)==0
        adj(finish,finish+9)=1;
        adj(finish+9,finish)= 1;
    end    
end
end

