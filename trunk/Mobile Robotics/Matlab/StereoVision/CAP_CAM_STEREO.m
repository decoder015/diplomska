url = 'http://192.168.9.171:8080/shot.jpg';
ss  = imread(url);

imshow(image)
while(1)   
  image  = imread(url);
  imshow(image)
  drawnow;
end

% vid1 = videoinput('winvideo',1,'YUY2_320x240');
% vid2 = videoinput('winvideo',3,'YUY2_320x240');
% 
% % Set video input object properties for this application.
% set(vid1,'TriggerRepeat',Inf);
% set(vid2,'TriggerRepeat',Inf);
% 
% vid1.FrameGrabInterval = 1;
% vid2.FrameGrabInterval = 1;
% 
% set(vid1,'ReturnedColorSpace','rgb');
% set(vid2,'ReturnedColorSpace','rgb');
% set(vid1,'FramesPerTrigger', 1000);
% set(vid2,'FramesPerTrigger', 1000);
% 
% temp1=zeros(240,320,3);
% temp2=zeros(240,320,3);
% 
% % Create a figure window.
% h1=imshow(uint8(temp1));
% h2=imshow(uint8(temp2));
% 
% pause(0.01)
% hold on;
% 
% % Start acquiring frames.
% start(vid1);
% start(vid2);
% 
% while(vid1.FramesAcquired<=100 && vid2.FramesAcquired<=100)   % Stop after 100 frames
%     tic
%     data1 = getdata(vid1,1);
%     data2 = getdata(vid2,1);
%     set(h1,'Cdata',data1);
%     set(h2,'Cdata',data2);
%     flushdata(vid1);
%     flushdata(vid2);
%     toc
% end
% stop(vid1)
% stop(vid2)
% delete(vid1)
% delete(vid2)
% % %clear
% % close(gcf