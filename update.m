function [const1 main_mat] = update( const1,main_mat )
%updates correctly placed blocks in main_mat
for i=1:8
    for j=1:8
    if const1(i,j) == main_mat(i,j)+5 & main_mat(i,j)~=0
        main_mat(i,j)=9;
        const1(i,j)=9;
    end
    end
end
end

