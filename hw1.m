clc; clear all; close all;

A = 3; F = 4; P = 0; PntS = 1000; TimeMd = 3;
mS = Generator(A,F,P,PntS,TimeMd);
% plot(mS)

fs = 1000; % частота дискретизации
fc = 3; % частота среза ФНЧ
[Bxx, Axx] = butter(3, 2*fc/fs);

yn = zeros(length(mS),1);
buf.zX = zeros(length(Bxx),1); buf.zY = zeros(length(Bxx),1); buf.Pz = 1; 
for i = 1:length(mS)
    [yn(i), buf]  = my_filter(mS(i), Bxx, Axx, buf);
end

plot(mS)
hold on
plot(yn)