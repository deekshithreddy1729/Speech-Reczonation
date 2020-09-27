clc;
close all;
clear all;
%reading an audio file
[data, fs]= audioread('sample1.wav');
t=1/fs:1/fs:length(data)/fs;
plot(t,data);
sound(data,fs);
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