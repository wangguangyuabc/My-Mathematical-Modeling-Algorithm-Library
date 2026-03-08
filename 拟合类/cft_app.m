clc;clear
%% data1
% 导入数据
load data1.mat
% 拟合
[fitresult, gof] = createFit(x, y)


%% data2
load data2.mat
% 拟合
[fitresult, gof] = createFit2(years, populartion)

