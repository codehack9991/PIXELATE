function [adj] = AdjMat1(mat)
%creates an adjacent matrix for input arena
temp = ones(7,7);
for i=2:6
    for j = 2:6
        temp(i,j)=mat(i-1,j-1);
    end
end
adj=zeros(25,25);
for i=1:25
    k=mod(i,5) +1;
    l=floor(i/5) +2;
    if k==1
        k = 6;
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
            adj(i,i-5)=1;
        end
        if temp(l+1,k)==0
            adj(i,i+5)=1;
        end
    end
    
end