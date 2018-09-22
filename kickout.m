function [] = kickout( const1,main_mat )
global a;
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
for i=1:8
    for j=1:8
        if main_mat(i,j)==a & const1(i,j)==5
            present=(i-1)*2 + j;
            arduino(present-8,connect,vid);
        end
    end
end
end

