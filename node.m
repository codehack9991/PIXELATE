function [result, child] = node(wt,vis,matx,n,adj)
%dejavu waala node
result=matx;
child = [];
ctr=1;
for i=1:64
    if adj(i,n)==1
        if vis(i)==0
            child(ctr)=i;
            ctr = ctr + 1;
        end
        if result(1,n)+wt(n,i)<result(1,i)
            result(1,i)=result(1,n)+wt(n,i);
            result(2,i)=n;
        end
        
    end
   % disp(result);
        
end
end

