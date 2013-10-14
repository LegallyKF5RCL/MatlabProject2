clear all
close all
clc

load ('project_2_3.mat');
regen_y = zeros(1,length(n));
f = .1;
for i = 1:length(n)
    regen_y(1,i) = cos(2*pi*f*i);
end
regen_x = zeros(1,length(n));
for i = 1:length(n)
    regen_x(1,i) = -sin(2*pi*f*i);
end
A=[regen_x;regen_y];
A = transpose(A);
square = A*transpose(A);
AandT= transpose(A)*pinv(square)*y;
a = AandT(1,1);
b = AandT(2,1);
amp = (a^2+b^2)^(1/2);
theta = atan(b/a);
t = [0:1:length(n)];
r = amp*cos(2*pi*f*t+theta)-amp*sin(2*pi*f*t+theta);
scatter(n,y);
hold all;
plot(t(1:length(n)),r(1:length(n)));