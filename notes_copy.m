%% Loading robot model

% syms  standard revolute active th1 th2 th3 th4 th5 th6 th7;
% 
% s = [  1.5708  0.0000 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.00  0.0000  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
%   0.0000  0.2794 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.10 -0.1500  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
%  -1.5708  0.3645 0.0 0.0000 1.5708 -2.6179 2.6197 0  0.03 -0.1500  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% 1.5708  0.0000 0.0 0.1506 0.0000 -2.6179 2.6179 0  0.05  0.0000 -0.1500 -0.15    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% -1.5708  0.0000 0.0 0.0000 0.0000 -2.6179 2.6179 0  0.00  0.0000  0.0300 -0.03    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% 1.5708  0.0000 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.00  0.0000 -0.0200  0.02    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% 0.0000  0.0000 0.0 0.0000 1.5708 -2.6179 2.6179 0  0.00  0.0000  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0];
% 
% % Extracting data
% d = double(s(:,4));
% theta = [th1,th2, th3, th4, th5, th6, th7];
% a = double(s(:,2));
% alpha = double(s(:,1));
% offset = double(s(:,5));
% 
% T = eye(4);
% %calculating forward kinematcis using DH parameters
% for i = 1:7
%     
% T = T* [ cos(theta(i)+offset(i)), -sin(theta(i)+offset(i))*cos(alpha(i)) , sin(theta(i)+offset(i))*sin(alpha(i)),a(i)*cos(theta(i)+offset(i));
% sin(theta(i)+offset(i)),cos(theta(i)+offset(i))*cos(alpha(i)),-cos(theta(i)+offset(i))*sin(alpha(i)), a(i)*sin(theta(i)+offset(i));
% 0,sin(alpha(i)),cos(alpha(i)),d(i);
% 0,0,0,1];
%     
%  T_saved{i} = T 
% end
% 
% % simplify(T)
% 
% 
% %% Energy
% syms MSX1 MSX2 MSX3 MSX4 MSX5 MSX6 MSX7
% syms MSY1 MSY2 MSY3 MSY4 MSY5 MSY6 MSY7
% syms MSZ1 MSZ2 MSZ3 MSZ4 MSZ5 MSZ6 MSZ7
% syms m1 m2 m3 m4 m5 m6 m7
% 
% % Set up equations for energy
% MSX = [MSX1 MSX2 MSX3 MSX4 MSX5 MSX6 MSX7];
% MSY = [MSY1 MSY2 MSY3 MSY4 MSY5 MSY6 MSY7];
% MSZ = [MSZ1 MSZ2 MSZ3 MSZ4 MSZ5 MSZ6 MSZ7];
% ms = [m1 m2 m3 m4 m5 m6 m7];
% thetad = [th1,th2, th3, th4, th5, th6, th7];
% 
% %big_ass_X = all initial parameters


% 
% big_ass_X = [m1 MSX1 MSY1 MSZ1 m2 MSX2 MSY2 MSZ2 m3 MSX3 MSY3 MSZ3 ...
%     m4 MSX4 MSY4 MSZ5 m5 MSX5 MSY5 MSZ5 m6 MSX6 MSY6 MSZ6 ...
%     m7 MSX7 MSY7 MSZ7 ];



% gt = [0,0,9.81];
% 
% U = 0;
% % calculate potential energy with only gravity
% for j = 1:7
%     T_temp = T_saved{j}
%     U = U + gt* (ms(j)*T_temp(1:3,4) + T_temp(1:3,1:3)*[MSX(j);MSY(j);MSZ(j)])
% end
% % taking the derivitive
% for i = 1:28
% DU(i) = diff(U, big_ass_X(i))
% end
% % taking another derivitive
% for i = 1:7
%     for j = 1 :28
%     Hex(i,j)= diff(DU(j),thetad(i))
%     end
% end
% % Display the H matrix
% Hex

%% Unidentifiable
% 
% % randomly generate a bunch of angles
% for i= 1:80
%     angles(i,:) = -pi/2 + pi*rand(1,7);
% end
% ChaShao = [];
% % plug all angles into the H matrix, and then stack them together call it
% % ChaShao
% for i = 1:80
%     th1 = angles(i,1);th2 = angles(i,2);th3 = angles(i,3);th4 = angles(i,4);
%     th5 = angles(i,5);th6 = angles(i,6);th7 = angles(i,7);
%     Hex_num = vpa(subs(Hex));
%     ChaShao = [ChaShao;Hex_num];
% end
% 
% % if the column of the matrix has a norm of 0, eliminate the columns and 
% % the initial parameters that correlate to it
% counter = size(ChaShao);
% i = 0;
% while i < counter(2)
%     counter = size(ChaShao);
%     i=i+1
%         if norm(ChaShao(:,i)) == 0
%             ChaShao(:,i) = [];
%             big_ass_X(i) = [];
%             i= i-1;
%         end
% end
% 
% 
% j = 0;
% L = [];
% Dbs = [MSZ1]; % linearly independent initial parameters
% Dlin =[MSZ1];% linearly dependent initial parameters
% k =0;
% lin =0;
% alpha = [];
% % Exaime each column of the matrix, if eliminating the column reduces its
% % rank, then add the column to the linearly independent column collection. If
% % not, check if the column is linealy dependent with other columns and
% % calculate it's relation with other columns
% counter = size(ChaShao);

% for i = 1:counter(2)
%     i
%     counter = size(ChaShao);
%         compare_L = rank(L)
%         j= j+1
%         L(:,j) = ChaShao(:,i);
%         if compare_L < rank(L)
%             k = k+1;
%             Dbs(:,k) = big_ass_X(i);
%             recorder(j) = i;
%         else
%             L(:,j) =[];
%             j = j-1
%             lin= lin+1
%             Dlin(lin) = big_ass_X(i);
%             % Values of alpha are not used
% %             alpha_size = size (inv(L'*L)*L'*ChaShao(:,i))
% %             if alpha_size(1) <= counter(2);
% %                 alpha(:,lin) = [inv(L'*L)*L'*ChaShao(:,i);zeros(rank(ChaShao) - alpha_size(1),1)];
% %             end
%         end
% 
% 
% end

%% calculate inital parameters
Hex_num = [];
% Load in all the collected angles data into Hex
for i = 1:169
    th1 = X(i,1);th2 = X(i,2);th3 = X(i,3);th4 = X(i,4);
    th5 = X(i,5);th6 = X(i,6);th7 = X(i,7)
    temp_Hex = vpa(subs(Hex));
    Hex_num = [Hex_num;temp_Hex];
end


i = 0;
j = 0;
% if the column of the matrix has a norm of 0, eliminate the columns
            counter = size(Hex_num);
while i < counter(2)

    i=i+1
        if norm(Hex_num(:,i)) == 0
            Hex_num(:,i) = [];

            i= i-1;
        end
            counter = size(Hex_num);
end

% Pull out the linearly independent columns
saved_Hex = [];
Dlin = [];
Dbs = [m1];

for i = 1:counter(2)
    counter = size(Hex_num);
        compare_L = rank(saved_Hex)

        saved_Hex(:,end+1) = Hex_num(:,i)
        if compare_L < rank(saved_Hex)
%             Dbs(:,end+1) = big_ass_X(i)
        else
            saved_Hex(:,end) =[]

%             Dlin(:,end+1) = big_ass_X(i)
        end


end
    

% Use SVD on the independent columns 
 [U,S,V] = svd(saved_Hex);
 YYY = zeros(12,1);
% Calculate the initial parameters
for i = 1:10
    YYY = YYY + U(:,i)'*YY'*V(:,i)/S(i,i);
end
YYY

%% Testing the results


Hex_num = [];
% Load in all the collected angles data into Hex
for i = 1:37
    th1 = X1(i,1);th2 = X1(i,2);th3 = X1(i,3);th4 = X1(i,4);
    th5 = X1(i,5);th6 = X1(i,6);th7 = X1(i,7);
    temp_Hex = vpa(subs(Hex));
    Hex_num = [Hex_num;temp_Hex];
end


i = 0;
j = 0;
% if the column of the matrix has a norm of 0, eliminate the columns
            counter = size(Hex_num);
while i < counter(2)

    i=i+1
        if norm(Hex_num(:,i)) == 0
            Hex_num(:,i) = [];
            j = j+1;
            recorder1(j) = i;
            i= i-1;
        end
            counter = size(Hex_num);
end

% Pull out the linearly independent columns
saved_Hex = [];
    for j = 1:12
        saved_Hex(:,j) = Hex_num(:,recorder(j));
        saved_X(j) = big_ass_X(recorder(j))
    end
    

% Use SVD on the independent columns 
 [U,S,V] = svd(saved_Hex);
 YYY1 = zeros(12,1);
% Calculate the initial parameters
for i = 1:10
    YYY1 = YYY1 + U(:,i)'*YY1'*V(:,i)/S(i,i);
end





% calculate the torque from initial paramenters
% LALALA = Hex;
% 
% LALALA_end = [];
%     for j = 1:5
%        LALALA( :,recorder1(j)) = [];
%     end
%     
%     for j = 1:12
%         DUDUDUD(:,j) = LALALA(:,recorder(j));
%     end
%    
%     i =6
%     th1 = X(i,1);th2 = X(i,2);th3 = X(i,3);th4 = X(i,4);
%     th5 = X(i,5);th6 = X(i,6);th7 = X(i,7);
%     DUDUDUD2 = subs(DUDUDUD)
%     
%     DUDUDUD2 * YYY
