function [fitresult, gof] = createFit2(years, populartion)
%% 拟合: '无标题拟合 1'。
[xData, yData] = prepareCurveData( years, populartion );

% 设置 fittype 和选项。
ft = fittype( 'a+b*yaers', 'independent', 'yaers', 'dependent', 'populartion' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.149294005559057 0.257508254123736];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '无标题拟合 1' );
h = plot( fitresult, xData, yData );
legend( h, 'populartion vs. years', '拟合曲线', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'years', 'Interpreter', 'none' );
ylabel( 'populartion', 'Interpreter', 'none' );
grid on


