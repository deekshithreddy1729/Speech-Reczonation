clc;
close all;
clear all;
%create a recorder object
recorder = audiorecorder(16000,8,2);
%record users voice for 5 sec 
disp('please record your voice');
drawnow();
recordblocking(recorder,5);
play(recorder);
data=getaudiodata(recorder);
plot(data)
figure;
%feature extraction
f=voicefeatures(data);
load database
D=[];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D d];
end
%smallest distance
sm=inf;
ind=-1;
for(i=1:length(D))
    if (D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detectedclass=C(ind);
disp('the detected class is: ');
detectedclass