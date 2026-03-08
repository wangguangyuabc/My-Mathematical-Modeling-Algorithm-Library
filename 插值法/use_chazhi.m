clc;clear
%% 输入有缺失值的数据，以矩阵的形式
sales = xlsread('text.xlsx');
[hangs,lies] = size(sales);
%%  异常值及缺失值检测
%缺失值检测 
[r,c]=find(isnan(sales));  %isnan函数来查找数组中的NaN值，返回逻辑数组，看数据是否为缺失值,并返回缺失值的序数值

%% 插值法插入缺失的空格
a = input('请输入插入形式，0是按行插入;1是按列插入:');
S = [];
if a == 0
    for i = 1:hangs
        A = sales(i,:);
        value = return_chazhi(A);
        S = [S;value];
    end

elseif a == 1
    for i = 1:lies
        A = sales(:,i)';
        value = return_chazhi(A);
        S = [S;value];
    end
end

xlswrite('result.xlsx',S','A1');
disp('插值后的数据已存入result.xlsx文件中......')















