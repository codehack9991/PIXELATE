function[]=work(connect,vid)
% global vid;
% global connect;
global a;
global red;
global green;
global black;
global white;
global rgb1;
global rgb2;

while(1)
    arena = getsnapshot(vid);
    arena = imresize(arena, [481 481]);
    [bw1,bw2]=tanm(arena);
    bw2= bwareaopen(bw2,(100*0.62));
    bw1= bwareaopen(bw1,(100*0.62));
    se=strel('disk',1);
    bw1=imdilate(bw1,se);
    bw2=imdilate(bw2,se);
    [bp const]=cropbp(arena,bw1,bw2,white);
    bpmat=newcheckbp2(bp);
    [main_mat const1] = checkarena2(arena,white,const);
    const1=newmapping(const1,bpmat);
    [const1 main_mat]=update(const1,main_mat);
    % while(1)
    [pos, cent] = loc_bot(arena);
    start = bot2nod(arena);
    a = checkindi(vid);
    led(connect,a);
    main_matpick=edgecase(start,main_mat);
     adj = AdjMat_diag(main_matpick);
     finish = checkshortest(a,start,main_mat);
%      if finish <0
%         % kickout(const1,main_mat);
%          blueled();
%          continue;
%      end
    [patharr] = dejavu(start,finish,adj,main_matpick)
    for i=1:length(patharr)
        if (a ~= checkindi(vid))
            flag=1;
            led(connect,checkindi(vid));
           % break;
        end
        arduino(patharr(i),arena,connect,vid);
    end
    if (flag==1)
        continue;
    end
    pickblock();
    start = bot2nod(arena);
    main_matplace=edgecase(start,main_mat);
    adj = AdjMat_diag(main_matplace);
    finish=place(a,start,const1);
    [patharr] = dejavu(start,finish,adj,main_matplace);
    for i=1:length(patharr)
%         if (a ~= checkindi(vid))
%             flag=1;
%             break;
%         end
        arduino(patharr(i),arena,connect,vid);
    end
    leaveblock();
end
end