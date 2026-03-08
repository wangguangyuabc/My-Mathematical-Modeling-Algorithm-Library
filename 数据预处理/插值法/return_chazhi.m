function [value] = return_chazhi(A)
    Q_lie = find(isnan(A));
    list = A;
    indices = Q_lie;

    % 删除指定索引的值
    for i = numel(list):-1:1
        if ismember(i, indices)
            list(i) = [];
        end
    end
    y = list; % y准备好了
    list_x = 1:length(A);
    for i = numel(list_x):-1:1
        if ismember(i, indices)
            list_x(i) = [];
        end
    end
    x = list_x;
    % value = interp1(x,y,Q_lie,'spline');
    A(Q_lie) = interp1(x,y,Q_lie,'spline');
    value = A;

end

