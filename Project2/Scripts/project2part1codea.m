clear all
close all
clc

load ('project_2_1.mat');
z=ones(length(x),1);
A = [x,z];
square = A*transpose(A);

ans = transpose(A)*pinv(square)*y;
m=ans(1,1);
b = ans(2,1);
scatter(x,y);
hold all;
plot(x,m*x+b);