clc;
close all;
clear all;
%reading an audio file
[data, fs]= audioread('sample5.wav');
t=1/fs:1/fs:length(data)/fs;
plot(t,data);
sound(data,fs);
plot(data)
figure;
%feature extraction
f=voicefeatures(data);
%save uesrs data
uno=input('enter the user number: ');
try
    load database
    F=[F;f];
    C=[C;uno];
    save database F C;
catch
    F=f;
    C=uno;
    save database F C
end
msgbox('your voice registered')