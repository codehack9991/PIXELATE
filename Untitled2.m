function [ output_args ] = Untitled2( bpmat, const1, const )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
c=1;
[i j] = size(bpmat);
for a=1:8
    for b= 1:8
        if const1(a,b)==5
            k=mod(c,3) ;
            l=floor(c/3) +1;
            if k==0
                k = 3;
                l = l-1;
            end
        end
    end
end

end

