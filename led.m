function [ ] = led(connect,a)
%global a;
%global connect;
if a==1
    fwrite(connect,'1');
    pause(1);
    fwrite(connect,'s');
end
if a==2
    fwrite(connect,'2');
    pause(1);
    fwrite(connect,'s');
end
end

