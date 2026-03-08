clc;clear
%% 层次分析法求权重
% 输入判断矩阵
A = input('输入判断矩阵:')
% A = readmatrix('text.xls') % 直接读取文件里面的矩阵
% 算数平均法
a = A./sum(A);
ans_one = sum(a,2)/length(A);
disp('算数平均法权重:')
disp(ans_one)

% 几何平均法
% a = (A(:,1).*A(:,2).*A(:,3).*A(:,4).*A(:,5)).^(1/5);
Q = 1;
for i = 1:1:length(A)
    Q = Q.*A(:,i);
end
a = Q.^(1/length(A));

ans_two = a./sum(a);
disp('几何平均法权重:')
disp(ans_two)

% 特征值法
[V,D] = eig(A); % 计算特征值和特征向量
max_r = max(max(D)); % 找到A的最大特征值
[r,c] = size(D);
for i = 1:1:r
    for j = 1:1:c
        if D(i,j) == max_r
            a = V(:,j);
            ans_three = a./sum(a);
        end
    end
end
disp('特征值法法权重:')
disp(ans_three)

% 一致性检验
RI = [0.00001 0.00001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
n = length(A); % n最多就是15，所以决策层只能小于15，这里其实是层次分析法的弊端
CI = (max_r-n)/(n-1);
disp(['一致性指标CI=',num2str(CI)]);
disp(['一致性指标RI=',num2str(RI(n))]);

CR = CI/RI(n);
disp(['一致性指标CR=',num2str(CR)]);

if CR < 0.1
    disp('CR值小于0.1，通过一致性检验，效果良好......')
else
    disp('CR值大于0.1，未通过一致性检验！矩阵需要修改一下(doge)')
end





