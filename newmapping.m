function [const1] =newmapping( const1,bpmat )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
flag=0;
for i=1:8
    for j=1:8
        if const1(i,j)==5
            corner=[i j];
            flag=1;
            break;
        end
        if flag==1
            break;
        end
    end
end
%disp(corner(1));
row=size(bpmat,1);
column=size(bpmat,2);
const1(corner(1):corner(1)+row-1,corner(2):corner(2)+column-1)=bpmat;
end




