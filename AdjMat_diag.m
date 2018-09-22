function [adj] = AdjMat_diag(mat)
%creates an adjacent matrix for input arena
temp = ones(10,10);
for i=2:9
    for j = 2:9
        temp(i,j)=mat(i-1,j-1);
    end
end
adj=zeros(64,64);
for i=1:64
    k=mod(i,8) +1;
    l=floor(i/8) +2;
    if k==1
        k = 9;
        l = l-1;
    end
    
    if temp(l,k)==0
        if temp(l,k-1)==0
            adj(i,i-1)= 1;
        end
        if temp(l,k+1)==0
            adj(i,i+1)=1;
        end
        if temp(l-1,k)==0
            adj(i,i-8)=1;
        end
        if temp(l+1,k)==0
            adj(i,i+8)=1;
        end
        if temp(l-1,k-1)==0
            adj(i,i-9)= 1;
        end
        if temp(l-1,k+1)==0
            adj(i,i-7)=1;
        end
        if temp(l+1,k-1)==0
            adj(i,i+7)=1;
        end
        if temp(l+1,k+1)==0
            adj(i,i+9)=1;
        end
    end
    
end