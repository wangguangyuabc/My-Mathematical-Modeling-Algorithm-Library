clc;clear
%%
% 本文件用于对比"埃尔米特(Hermite)插值"和"三次样条插值"这两种插值方法的插值效果

%% 埃尔米特(Hermite)插值
x = -pi:pi;
y = sin(x);

new_x = -pi:0.01:pi;
new_Hermite_y = pchip(x,y,new_x);
figure(1)
plot(new_x,new_Hermite_y,'r',x,y,'ob')

%% 三次样条插值
x = -pi:pi;
y = sin(x);

new_x = -pi:0.01:pi;
new_spline_y = interp1(x,y,new_x,'spline');
figure(2)
plot(new_x,new_spline_y,'r',x,y,'ob')

%% 两种插值的对比
figure(3)
plot(new_x,new_spline_y,'r',new_x,new_Hermite_y,'b',new_x,sin(new_x),'y',x,y,'ob')
legend('三次样条插值','埃尔米特(Hermite)插值','真实值','Location','southeast')








