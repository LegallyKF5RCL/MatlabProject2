%{
EE-2347 Project 2.2
Contributers: Brian McRee
10/13/2013

Published open-source on Git: LegallyKF5RCL/MatlabProject2
%}

clc;
clear all;

%Load data into structure
DataStruct = load('project_2_2.mat');

%separate structure into arrays
Time = DataStruct.t;
Temp = DataStruct.Temp;

%create zero matrices for less lags
MatrixA = zeros([length(Time),3]);
MatrixX = zeros([3,1]);
MatrixB = zeros([length(Time),1]);

%fill matrixA with its data
MatrixA(1:length(Time), 1) = 1;
MatrixA(1:length(Time), 2) = Time(1:length(Time));
MatrixA(1:length(Time), 3) = Time(1:length(Time)).^2;

%fill matrixB with its data
MatrixB(1:length(Time), 1) = Temp;

%A * X = B

%A more readable version of the next line of code
%X = ((At * A)^-1 * At) * B
%X = (The inverse of (The transpose of A, times A)) times B
MatrixX = (inv(MatrixA' * MatrixA) * MatrixA') * MatrixB;

%pull data out of the matrix to make the equation for quadratic regression
%more readable
X0 = MatrixX(1,1);
X1 = MatrixX(2,1);
X2 = MatrixX(3,1);

%create polynomial with Coefficient 
QuadReg = (X0) + (X1 * Time) + (X2 * Time.^2);

%plot the data
plot(Time, Temp, '*');
hold all;
plot(Time, QuadReg);
title('Nonlinear Regression')
xlabel('Time(Hours)')
ylabel('Temperature(F)')
