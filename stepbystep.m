%% Step by step

% % step 1, the last link
% counter = size(saved_Hex)
% i =1;
% Hex_link7= [];
% YY7 = [];
% XX7 = [];
% 
% while 7*i < counter(1)
%     Hex_link7(i,:) = saved_Hex(7*i,:);
%     YY7(i) = YY(7*i);
% 
%     i=  i +1;
% end
% 
% Hex_link7 = [Hex_link7(:, 11),Hex_link7(:,12)];
% 
% inv(Hex_link7'*Hex_link7)*Hex_link7'*YY7'


%% Step by step

counter = size(saved_Hex)
i =1;
Hex_link4= [];
YY4 = [];
XX4 = [];

while counter(1) > 0
    Hex_link4(end+1,:) = saved_Hex(1,:);
        Hex_link4(end+1,:) = saved_Hex(2,:);
            Hex_link4(end+1,:) = saved_Hex(3,:);
                Hex_link4(end+1,:) = saved_Hex(4,:);
    saved_Hex(1:7,:) = [];
    YY4(end+1) = YY(1);
        YY4(end+1) = YY(2);
            YY4(end+1) = YY(3);
                YY4(end+1) = YY(4);
                YY(1:7) = [];
                counter = size(saved_Hex)
end



%% What
Hex_link4 = [Hex_link4(:, 1),Hex_link4(:,2),Hex_link4(:, 3),Hex_link4(:,4),Hex_link4(:, 5),Hex_link4(:,6)];

 [U,S,V] = svd(Hex_link4);
 YYY4 = zeros(6,1);
for i = 1:5
    YYY4 = YYY4 + U(:,i)'*YY4'*V(:,i)/S(i,i);
end
YYY4


Hex_link4 (5:8,:) * YYY4