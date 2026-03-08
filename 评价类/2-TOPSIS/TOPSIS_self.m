clc;clear
%% TOPSIS法评价模型
% 导入数据
A = xlsread('20条河流的水质情况数据.xlsx');

% 原始矩阵正向化
index_judge = input('请输入那几列需要正向化,例"[1,2,3]",如果不需要正向化请输"[]":');
index_zxh = input('极小型为1,中间型为2,区间型为3,例[1,2,3],如果不需要正向化请输"[]":');
o = 1;
if length(index_zxh) ~= length(index_judge)
    disp('列数不对应，输入错误，请重启代码')
    o = 0;
end
if o == 1
    n = 1;
    for i = index_judge
        if index_zxh(n) == 1 % 极小型
%             A(:,i) = 1./A(:,i); % 如果数据里面全都是正数的话用这个,也可以不用
            A(:,i) = max(A(:,i)) - A(:,i);% 反之用这个
    
        elseif index_zxh(n) == 2 % 中间型
            best_value = input(['请输入第',num2str(i),'列最佳值:']);
            A(:,i) =1-abs(A(:,i)-best_value)/2;
        
        elseif index_zxh(n) == 3 % 区间型
            a = input(['请输入第',num2str(i),'列下界:']);
            b = input(['请输入第',num2str(i),'列上界:']);
            for r = 1:length(A(:,i))
                if A(r,i) < a
                    A(r,i) =1-abs(A(r,i)-a)/2;
    
                elseif A(r,i) > b
                    A(r,i) =1-abs(A(r,i)-b)/2;
                    
                else 
                    A(r,i) = 1;
                end
    
            end

        else
            disp('输入的index_zxh有错误，出现了非1，2，3的数字，请检查后再重新启动程序')

        end
    
        n = n+1;
    
    end
end

% 正向化矩阵标准化
Z = A./(sum(A.^2).^0.5);

% 计算得分并归一化
Z_MAX = max(Z);
Z_min = min(Z);

D_A = (sum((Z_MAX-Z).^2,2)).^(1/2);
D_D = (sum((Z_min-Z).^2,2)).^(1/2);

% 未归一化的评分
Si = D_D ./(D_D+D_A);

% 评分归一化
disp('评分如下:')
result_S = Si/sum(Si)

% write_posit = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z';];
% 保存到xls文件里面
% a = [write_posit(length(A(1,:))+2) num2str(2)];
% xlswrite('result.xlsx',result_S,1,a);
% disp('已经写入result.xlsx文件')




