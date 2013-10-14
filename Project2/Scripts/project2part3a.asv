clear all
close all
clc

load ('project_2_3.mat');
Cosinvalues = zeros(1,length(n));
f = .1;

%array of each cosine value
for i = 1:length(n)
    Cosinvalues(1,i) = cos(2*pi*f*i);
end

%array of each sin value
Sinvalues = zeros(1,length(n));
for i = 1:length(n)
    Sinvalues(1,i) = -sin(2*pi*f*i);
end

%2 by n matrix of the sin and cosine values
A=[Cosinvalues;Sinvalues];
A = transpose(A);

%square matrix A used for y=Ax equation
square = A*transpose(A);
AandT= transpose(A)*pinv(square)*y;

%finding the Amplitude and Phase shifts for the best fit line
a = AandT(1,1);
b = AandT(2,1);
amp = (a^2+b^2)^(1/2);
theta = atan(b/a);

%making the best fit siosoudal fit line for the data
t = [0:1:length(n)];
r = amp*cos(2*pi*f*t+theta);

%plotting the scatter plot of the data with best fit line
scatter(n,y);
hold all;
plot(t(1:length(n)),r(1:length(n)));