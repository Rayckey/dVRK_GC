%% Post process

clear YY
clear XX
% counter = size(X)
% i =1;
[rows, cols] = size(X)
for i = 1:rows
    for j = 1:6
        
        XX((i-1)*6 + j) = X(i,j);
        size(XX)
                YY((i-1)*6 + j) = Y(i,j);
                size(YY)

    end
end

% Y(:,1) = zeros(42,1);

% YY = [];
% Y(:,5) = [];
% Y(:,5) = [];
% Y(:,5) = [];
% Y(:,5) = [];
% 
% for i = 1:rows
%     for j = 1:4
%         
%         YY((i-1)*4 + j) = Y(i,j)
% 
%     end
% end


%% chop chop
% 
%         [rows, col] = size(Y);
% Y1 = Y;
% Y2 = Y;
% YY1= [];
% YY2 = [];
% X1 = X;
% X2 = X;
% 
% i = 0;
% BSLOL = 0;
% while i < rows
%     i = i+1;
%     if BSLOL ~= 0;
%         Y1(i,:) = [];
%         X1(i,:) = [];
%         i = i-1
%     end
%         [rows, col] = size(Y1);
% end
% 
% for i = 1:rows
%     for j = 1:6
%                 XX1((i-1)*6 + j) = X(i,j)
%         YY1((i-1)*6 + j) = Y1(i,j)
% 
%     end
% end
% 
% i = 0;
% 
% while i < rows
%     i = i+1
%     if Y2(i,2) < 0.5
%         Y2(i,:) = [];
%                 X2(i,:) = [];
%         i = i-1
%     end
%         [rows, col] = size(Y2);
% end
% 
% for i = 1:rows
%     for j = 1:4
%         
%         YY2((i-1)*4 + j) = Y2(i,j)
% 
%     end
% end


