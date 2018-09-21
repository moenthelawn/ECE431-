function [y_sampled] = plotSampled(SignalFrequency,SampleFrequency)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

numberOfPeriods = 2; 
t = linspace(0, numberOfPeriods/SignalFrequency, 100) 

n = linspace(0,numberOfPeriods/SignalFrequency,numberOfPeriods*SampleFrequency/SignalFrequency); 
y_sampled = sin(2*pi * SignalFrequency * n); 
y = sin(2 * pi * SignalFrequency * t); 

subplot(3,2,1)
plot(t,y)
subplot(3,2,2)
hold on; 
stem(n,y_sampled) 

%Now we want to create the dirac delta function 
n1 = 0:31; %Create a 32 element sequence 
y_dirac = diracFunction(n1 - 17); %Shif the signal by 17 

subplot(3,2,3) 
hold on; 
stem(n1,y_dirac)

%Now with that plot, we want to create the convolution 
w1 = conv(y_sampled,y_dirac) %Convolve the 2 signals together 
w1_n = 0:(length(w1)-1); %Take the length so we can make it as the new range for the plot arguement 

subplot(3,2,4)
hold on; 
stem(w1_n,w1); 
%----------------------------------------------%
%Now we want to get the sinc delay 
n = 0:31 %31 Sampled sequence to generate the appropriate number of elements 
y_sinc = sincFilter(n, 17.5); 
subplot(3,2,5)
hold on; 
stem(n,y_sinc) 

w2 = conv(y_sampled,y_sinc) 
w2_n = 0 : (length(w2) - 1); 
subplot(3,2,6) 
hold on; 
stem(w2_n,w2); 


end

