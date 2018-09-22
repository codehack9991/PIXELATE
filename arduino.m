function [ ] = arduino(node1,img ,connect ,vid)
%gives signal to arduino
% connect =  serial('COM8','BaudRate',9600);
% fopen(connect);
% pause(2);
%voila bot move1s!!!
%global vid;

% global connect;
global a;
img = getsnapshot(vid);
img = imresize(img, [480 480]);
indi = checkindi1();
% if (a~=indi)
%     work();
% end
[k,l]=no2nod(node1);
c1=[(l-1)*60+30,(k-1)*60+30];

[botv cent]=loc_bot(img)
nodev=complex(c1(1)-cent(1),c1(2)-cent(2))
while abs(nodev)>15
    img = getsnapshot(vid);
    [k,l]=no2nod(node1);
    c1=[(l-1)*60+30,(k-1)*60+30];
    
    [botv cent]=loc_bot(img);
    nodev=complex(c1(1)-cent(1),c1(2)-cent(2));
    %angle(pos);
    %angle(nodev);
    if abs(angle(botv)-angle(nodev))<=0.15
        disp('move1 forward');
        % move1 = 'f';
        dist = abs(nodev);
        %disp(dist);
        tf = (0.6)*dist/60;
        fwrite(connect,'f');
        pause(tf);
        fwrite(connect,'s');
        pause(0.5);
    end
    if (angle(botv)-angle(nodev))<(-0.15)
        disp('go right');
        % move1='r';
        ang = abs(angle(botv)-angle(nodev));
        tf = (0.43/1.57) * ang;
        fwrite(connect,'r');
        pause(tf);
        fwrite(connect,'s');
        pause(0.3);
    end
    if ((angle(botv)-angle(nodev))>0.15)
        disp('go left');
        % move1 = 'l';       
        ang = abs(angle(botv)-angle(nodev));
        tf = (0.43/1.57) * ang;
        fwrite(connect,'l');
        pause(tf);
        fwrite(connect,'s');
        pause(0.3);
    end
    % disp(move1);
    
    
end

end
