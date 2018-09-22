function [finish] = checkshortest(a,start,mat)
%returns the node number of the nearest block to pick up
i=0;
j=0;
min=[0,0];
dmin=inf;
[l,k]=no2nod(start);
for i=1:8
    for j=1:8
        if mat(i,j) == a
            if ((i-l)^2 + (j-k)^2) < dmin & (i~=l | j~=k)
                dmin = (i-l)^2 + (j-k)^2;
                min=[i,j];
            end
        end
    end
end
%disp(min);
finish=(min(1)-1)*8 + min(2);
end

