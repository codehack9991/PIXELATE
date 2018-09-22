% vid = videoinput('winvideo', 2, 'MJPG_1024x576');
% src.Gain = 64;
% src.Exposure = -5;
% src.Brightness = 128;
% src.Contrast = 40;
% src.Saturation = 157;
% src.Sharpness = 24;
% img = getsnapshot(vid);

%[arena, rect] = imcrop(img);
%vid.ROIPosition = [249 7 576 562];
% 'opened'
%img = imread('img.jpg');
%[arena, rect] = imcrop(img);
arena = imresize(img, [481 481]);
%connect=serial('COM4',Baudrate,9600);
%fopen(connect);
global red;
global green;
global black;
global rgb1;
global rgb2;
red = sampleval(arena);
green = sampleval(arena);
black = sampleval(arena);
rgb1 = sampleval(arena);
rgb2 = sampleval(arena);
%while(1)
    %arena = getsnapshot(vid);
    arena = imresize(arena, [481 481]);
    main_mat = checkarena2(arena);
    adj = AdjMat1(main_mat);
   % while(1)
        [pos, cent] = loc_bot(arena);
        start = bot2nod(arena);
        % a = checkindicator;
        finish = checkshortest(1,start,main_mat);
        [patharr, adj] = dejavu(start,finish,adj,main_mat);
        for i=1:length(patharr)
            disp(patharr(i));
     %   end
        %pick up block
%         [patharr, adj] = dejavu(start,finish,adj,main_mat);
%         for
%             arduino(patharr,arena);
%         end
%fclose(connect);
  %  end
end
