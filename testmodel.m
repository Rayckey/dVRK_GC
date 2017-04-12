%% Testing model

% s = [  1.5708  0.0000 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.00  0.0000  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
%   0.0000  0.2794 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.10 -0.1500  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
%  -1.5708  0.3645 0.0 0.0000 1.5708 -2.6179 2.6197 0  0.03 -0.1500  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% 1.5708  0.0000 0.0 0.1506 0.0000 -2.6179 2.6179 0  0.05  0.0000 -0.1500 -0.15    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% -1.5708  0.0000 0.0 0.0000 0.0000 -2.6179 2.6179 0  0.00  0.0000  0.0300 -0.03    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% 1.5708  0.0000 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.00  0.0000 -0.0200  0.02    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
% 0.0000  0.0000 0.0 0.0000 1.5708 -2.6179 2.6179 0  0.00  0.0000  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0];
% 
% 
% d = s(:,4);
% al = s(:,2);
% alpha = s(:,1);
% offset = s(:,5);
% 
%  startup_rvc
% datadump = [zeros(7,1),d,al,alpha];
% L(1) = Link(datadump(1,:),'standard')
% L(2) = Link(datadump(2,:),'standard')
% L(3) = Link(datadump(3,:),'standard')
% L(4) = Link(datadump(4,:),'standard')
% L(5) = Link(datadump(5,:),'standard')
% L(6) = Link(datadump(6,:),'standard')
% L(7) = Link(datadump(7,:),'standard')
% davinci = SerialLink(L, 'name', 'davinci');
% qz = zeros(1,7);
% davinci.offset = offset
% davinci.plot(qz);
% 
% 
% % mdl_puma560
% 
% % p560.plot(qz)
% davinci.fkine(zeros(1,7))

% cg = CodeGenerator(davinci);
% cg.geneverything();
% cg.genfkine();


%% Neglected



syms  standard revolute active th1 th2 th3 th4 th5 th6 th7;

s = [  1.5708  0.0000 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.00  0.0000  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
  0.0000  0.2794 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.10 -0.1500  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
 -1.5708  0.3645 0.0 0.0000 1.5708 -2.6179 2.6197 0  0.03 -0.1500  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
1.5708  0.0000 0.0 0.1506 0.0000 -2.6179 2.6179 0  0.05  0.0000 -0.1500 -0.15    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
-1.5708  0.0000 0.0 0.0000 0.0000 -2.6179 2.6179 0  0.00  0.0000  0.0300 -0.03    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
1.5708  0.0000 0.0 0.0000 -1.5708 -2.6179 2.6179 0  0.00  0.0000 -0.0200  0.02    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0
0.0000  0.0000 0.0 0.0000 1.5708 -2.6179 2.6179 0  0.00  0.0000  0.0000  0.00    0.0001 0.0001 0.0001   1.0 0.0 0.0   0.0 1.0 0.0   0.0 0.0 1.0];


d = double(s(:,4));
theta = [th1,th2, th3, th4, th5, th6, th7];
a = double(s(:,2));
alpha = double(s(:,1));
offset = double(s(:,5));

T = eye(4);

for i = 1:4
    
T = T* [ cos(theta(i)+offset(i)), -sin(theta(i)+offset(i))*cos(alpha(i)) , sin(theta(i)+offset(i))*sin(alpha(i)),a(i)*cos(theta(i)+offset(i));
sin(theta(i)+offset(i)),cos(theta(i)+offset(i))*cos(alpha(i)),-cos(theta(i)+offset(i))*sin(alpha(i)), a(i)*sin(theta(i)+offset(i));
0,sin(alpha(i)),cos(alpha(i)),d(i);
0,0,0,1];
    
 T_saved{i} = T 
end

% simplify(T)


%% Energy
syms MSX1 MSX2 MSX3 MSX4 MSX5 MSX6 MSX7
syms MSY1 MSY2 MSY3 MSY4 MSY5 MSY6 MSY7
syms MSZ1 MSZ2 MSZ3 MSZ4 MSZ5 MSZ6 MSZ7
syms m1 m2 m3 m4 m5 m6 m7

MSX = [MSX1 MSX2 MSX3 MSX4 MSX5 MSX6 MSX7];
MSY = [MSY1 MSY2 MSY3 MSY4 MSY5 MSY6 MSY7];
MSZ = [MSZ1 MSZ2 MSZ3 MSZ4 MSZ5 MSZ6 MSZ7];
ms = [m1 m2 m3 m4 m5 m6 m7];
thetad = [th1,th2, th3, th4, th5, th6, th7];

big_ass_X = [m1 MSX1 MSY1 MSZ1 m2 MSX2 MSY2 MSZ2 m3 MSX3 MSY3 MSZ3 ...
    m4 MSX4 MSY4 MSZ5 m5 MSX5 MSY5 MSZ5 m6 MSX6 MSY6 MSZ6 ...
    m7 MSX7 MSY7 MSZ7 ];
gt = [0,0,9.81];

U = 0;

for j = 1:4
    T_temp = T_saved{j}
    U = U + gt* (ms(j)*T_temp(1:3,4) + T_temp(1:3,1:3)*[MSX(j);MSY(j);MSZ(j)])
end

for i = 1:16
DU(i) = diff(U, big_ass_X(i))
    
end

for i = 1:4
    for j = 1 :16
    Hex(i,j)= diff(DU(j),thetad(i))
    
    end
end
Hex

%% Unidentifiable


% for i= 1:80
%     angles(i,:) = -pi/2 + pi*rand(1,4);
% end
% ChaShao = [];
% 
% for i = 1:80
%     th1 = angles(i,1);th2 = angles(i,2);th3 = angles(i,3);th4 = angles(i,4);
% 
%     Hex_num = vpa(subs(Hex));
%     ChaShao = [ChaShao;Hex_num];
% end
% 
% counter = size(ChaShao);
% i = 0;
% while i < counter(2)
%     counter = size(ChaShao);
%     i=i+1
%     if i <= counter(2)
%         if norm(ChaShao(:,i)) == 0
%             ChaShao(:,i) = [];
%             big_ass_X(i) = [];
%             i= i-1;
%         end
%     end
% end
% 
% %% step 3 
% j = 0;
% L = [];
% Dbs = [MSZ1];
% Dlin =[MSZ1];
% k =0;
% lin =0;
% alpha = [];
% 
% counter = size(ChaShao);
% 
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
% 
% 
%         end
% 
% 
% end

%% calculate inital parameters 1 
Hex_num = [];
% Load in all the collected angles data into Hex
for i = 1:10
    th1 = X1(i,1);th2 = X1(i,2);th3 = X1(i,3);th4 = X1(i,4);
    temp_Hex = subs(Hex);
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
            big_ass_X(i) = [];
            j = j+1;
            recorder1(j) = i;
            i= i-1;
        end
            counter = size(Hex_num);
end

j = 0;
L = [];
Dbs = [MSZ1];
Dlin =[MSZ1];
k =0;
lin =0;
alpha = [];

counter = size(Hex_num);

for i = 1:counter(2)
    i
        compare_L = rank(L)
        j= j+1
        L(:,j) = Hex_num(:,i);
        if compare_L < rank(L)
            k = k+1;
            Dbs(k) = big_ass_X(i);
            recorder(j) = i;
        else
            L(:,j) =[];
            j = j-1
        end
        counter = size(Hex_num);
end

% Pull out the linearly independent columns
saved_Hex = [];
    for j = 1:6
        saved_Hex(:,j) = Hex_num(:,recorder(j));
        saved_X(j) = big_ass_X(recorder(j))
    end
    
%% SVD
% Use SVD on the independent columns 
 [U,S,V] = svd(saved_Hex);
 YYY1 = zeros(6,1);
% Calculate the initial parameters
for i = 1:5
    YYY1 = YYY1 + U(:,i)'*YY1'*V(:,i)/S(i,i);
end
YYY1

%% calculate inital parameters 2
Hex_num = [];
% Load in all the collected angles data into Hex
for i = 1:44
    th1 = X2(i,1);th2 = X2(i,2);th3 = X2(i,3);th4 = X2(i,4);
    temp_Hex = subs(Hex);
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
    for j = 1:6
        saved_Hex(:,j) = Hex_num(:,recorder(j));
        saved_X(j) = big_ass_X(recorder(j))
    end
    
%% SVD 2
% Use SVD on the independent columns 
 [U,S,V] = svd(saved_Hex);
 YYY2 = zeros(6,1);
% Calculate the initial parameters
for i = 1:5
    YYY2 = YYY2 + U(:,i)'*YY2'*V(:,i)/S(i,i);
end
YYY2