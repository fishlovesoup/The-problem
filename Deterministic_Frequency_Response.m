%% 
clear
clc
close all

%% Import Data
% load('Parameters_ieee_12.mat')
Parameters_Bus = 12;
Parameters_CSP = [1,10,1.64890000000000,3700,300,300,100,10,80,1,2,61.5000000000000,61.5000000000000,6,20,15,0,1];
Parameters_CSP_Fro = [0,0,0,0,0,4,0,117,333,600,700,833,858,817,700,650,567,283,8,0,0,8,0,0];
Parameters_Line = [1,1,2,0.170000000000000,100,-100;2,2,3,0.0370000000000000,100,-100;3,1,4,0.258000000000000,100,-100;4,2,4,0.197000000000000,100,-100;5,4,5,0.0370000000000000,100,-100;6,5,6,0.140000000000000,100,-100;7,3,6,0.0180000000000000,100,-100;8,6,7,0.258000000000000,500,-500;9,7,10,0.258000000000000,100,-100;10,7,8,0.170000000000000,100,-100;11,8,9,0.0370000000000000,100,-100;12,10,11,0.0370000000000000,100,-100;13,11,12,0.140000000000000,100,-100;14,9,12,0.0180000000000000,100,-100];
Parameters_Load = [1,3;2,4;3,5;4,9;5,11;6,12]
Parameters_Load_Fro = [26.6400000000000,25.6000000000000,25.0800000000000,24.5600000000000,24.5600000000000,25.0800000000000,26.6400000000000,29.7600000000000,32.6200000000000,34.7000000000000,35.7400000000000,36,35.7400000000000,36,36,35.2200000000000,34.9600000000000,34.9600000000000,34.1800000000000,33.9200000000000,33.9200000000000,34.1800000000000,32.6200000000000,28.7200000000000;106.560000000000,102.400000000000,100.320000000000,98.2400000000000,98.2400000000000,100.320000000000,106.560000000000,119.040000000000,130.480000000000,138.800000000000,142.960000000000,144,142.960000000000,144,144,140.880000000000,139.840000000000,139.840000000000,136.720000000000,135.680000000000,135.680000000000,136.720000000000,130.480000000000,114.880000000000;26.6400000000000,25.6000000000000,25.0800000000000,24.5600000000000,24.5600000000000,25.0800000000000,26.6400000000000,29.7600000000000,32.6200000000000,34.7000000000000,35.7400000000000,36,35.7400000000000,36,36,35.2200000000000,34.9600000000000,34.9600000000000,34.1800000000000,33.9200000000000,33.9200000000000,34.1800000000000,32.6200000000000,28.7200000000000;26.6400000000000,25.6000000000000,25.0800000000000,24.5600000000000,24.5600000000000,25.0800000000000,26.6400000000000,29.7600000000000,32.6200000000000,34.7000000000000,35.7400000000000,36,35.7400000000000,36,36,35.2200000000000,34.9600000000000,34.9600000000000,34.1800000000000,33.9200000000000,33.9200000000000,34.1800000000000,32.6200000000000,28.7200000000000;53.2800000000000,51.2000000000000,50.1600000000000,49.1200000000000,49.1200000000000,50.1600000000000,53.2800000000000,59.5200000000000,65.2400000000000,69.4000000000000,71.4800000000000,72,71.4800000000000,72,72,70.4400000000000,69.9200000000000,69.9200000000000,68.3600000000000,67.8400000000000,67.8400000000000,68.3600000000000,65.2400000000000,57.4400000000000;26.6400000000000,25.6000000000000,25.0800000000000,24.5600000000000,24.5600000000000,25.0800000000000,26.6400000000000,29.7600000000000,32.6200000000000,34.7000000000000,35.7400000000000,36,35.7400000000000,36,36,35.2200000000000,34.9600000000000,34.9600000000000,34.1800000000000,33.9200000000000,33.9200000000000,34.1800000000000,32.6200000000000,28.7200000000000;266.400000000000,256,250.800000000000,245.600000000000,245.600000000000,250.800000000000,266.400000000000,297.600000000000,326.200000000000,347,357.400000000000,360,357.400000000000,360,360,352.200000000000,349.600000000000,349.600000000000,341.800000000000,339.200000000000,339.200000000000,341.800000000000,326.200000000000,287.200000000000]
Parameters_Piecewise_Thermal = [6.03333333333333,6.06800000000000,6.10266666666667;5.51500000000000,5.52500000000000,5.53500000000000;5.83333333333333,6.50000000000000,7.16666666666667;6.03333333333333,6.06800000000000,6.10266666666667]
Parameters_PTDF = [0.634718031013972,-0.0472492106961573,-0.0154633780460151,0.152056550785815,0.120270718135673,0,0,0,0,0,0,0;0.704054666922500,0.850097681801532,-0.0490589405013169,0.482412914929617,0.381569537232465,0,0,0,0,0,0,0;0.365281968986028,0.0472492106961572,0.0154633780460151,-0.152056550785815,-0.120270718135673,0,0,0,0,0,0,0;-0.0693366359085279,0.102653107502311,0.0335955624553019,-0.330356364143802,-0.261298819096792,0,0,0,0,0,0,0;0.295945333077500,0.149902318198468,0.0490589405013170,0.517587085070383,-0.381569537232465,0,0,0,0,0,0,0;0.295945333077500,0.149902318198469,0.0490589405013170,0.517587085070383,0.618430462767535,0,0,0,0,0,0,0;0.704054666922500,0.850097681801532,0.950941059498683,0.482412914929617,0.381569537232465,0,0,0,0,0,0,0;0,0,0,0,0,0,-0.999999999999999,-0.999999999999998,-0.999999999999998,-0.999999999999999,-0.999999999999999,-0.999999999999998;0,0,0,0,0,0,0,-0.257575757575758,-0.313636363636364,-0.609090909090909,-0.553030303030303,-0.340909090909091;0,0,0,0,0,0,8.88178419700125e-16,-0.742424242424241,-0.686363636363635,-0.390909090909090,-0.446969696969696,-0.659090909090907;0,0,0,0,0,0,1.77635683940025e-15,0.257575757575760,-0.686363636363636,-0.390909090909089,-0.446969696969695,-0.659090909090907;0,0,0,0,0,0,0,-0.257575757575758,-0.313636363636364,0.390909090909091,-0.553030303030305,-0.340909090909090;0,0,0,0,0,0,6.66133814775094e-16,-0.257575757575756,-0.313636363636362,0.390909090909092,0.446969696969698,-0.340909090909089;0,0,0,0,0,0,-5.32907051820075e-15,0.257575757575751,0.313636363636359,-0.390909090909098,-0.446969696969695,-0.659090909090914]
Parameters_Thermal = [1,1,150,20,0.000400000000000000,6,50,50,2,4,123,123,1.23000000000000,0.0400000000000000,4,30,20,1,0;2,2,200,50,0.000100000000000000,5.50000000000000,40,40,3,3,373.830000000000,373.830000000000,1.24610000000000,0.0600000000000000,6,40,20,1,0;3,6,300,100,0.00500000000000000,4.50000000000000,60,15,3,2,0,0,1.24620000000000,0.0800000000000000,6,60,20,1,0;4,7,150,20,0.000400000000000000,6,50,50,2,4,123,123,1.23000000000000,0.0400000000000000,6,30,20,0,1]
Parameters_Wind = [1,8,500,4,0.200000000000000,0.140000000000000,1,0]
Parameters_Wind_Fro = [0.740000000000000,0.900000000000000,0.710000000000000,0.650000000000000,0.805000000000000,0.630000000000000,0.750000000000000,0.800000000000000,0.535000000000000,0.750000000000000,0.880000000000000,0.925000000000000,0.901000000000000,0.885000000000000,0.580000000000000,0.705000000000000,0.740000000000000,0.700000000000000,0.790000000000000,0.560000000000000,0.400000000000000,0.550000000000000,0.738000000000000,0.640000000000000]
Nunits_G = length(Parameters_Thermal(:,1));
P_G_Site = Parameters_Thermal(:,2);
P_G_Max = Parameters_Thermal(:,3);
P_G_Min = Parameters_Thermal(:,4);
P_G_a = Parameters_Thermal(:,5);
P_G_b = Parameters_Thermal(:,6);
P_G_c = Parameters_Thermal(:,7);
P_G_Up = Parameters_Thermal(:,8);
T_G_Off = Parameters_Thermal(:,9);
T_G_On = Parameters_Thermal(:,10);
C_G_Up = Parameters_Thermal(:,11);
C_G_Dn = Parameters_Thermal(:,12);
H_G = Parameters_Thermal(:,15);
Cap_G_PFR = Parameters_Thermal(:,16);
Cap_G_SFR = Parameters_Thermal(:,17);

Nunits_W = length(Parameters_Wind(:,1));
P_W_Site = Parameters_Wind(:,2);
P_W_Capacity = Parameters_Wind(:,3);
H_W = Parameters_Wind(:,4);%？
Cap_W_PFR = Parameters_Wind(:,5);%？
Cap_W_SFR = Parameters_Wind(:,6);%？
P_Wind_Fore = Parameters_Wind_Fro(:,1:24);

P_L_Max = Parameters_Line(:,5);
P_L_Min = Parameters_Line(:,6);

Nunits_CSP = length(Parameters_CSP(:,1));
P_CSP_Site = Parameters_CSP(:,2);
Cap_SF = Parameters_CSP(:,3);
Q_TES_Max = Parameters_CSP(:,4);
Q_TH_Max = Parameters_CSP(:,5);
Q_HT_Max = Parameters_CSP(:,6);
P_CSP_Max = Parameters_CSP(:,7);
P_CSP_Min = Parameters_CSP(:,8);
P_CSP_Up = Parameters_CSP(:,9);
T_CSP_Off = Parameters_CSP(:,10);
T_CSP_On = Parameters_CSP(:,11);
C_CSP_Up = Parameters_CSP(:,12);
C_CSP_Dn = Parameters_CSP(:,13);
H_CSP = Parameters_CSP(:,14);
Cap_CSP_PFR = Parameters_CSP(:,15);
Cap_CSP_SFR = Parameters_CSP(:,16);
I_DNI = Parameters_CSP_Fro(:,1:24);

Nunits_Load = length(Parameters_Load(:,1));
P_Load_Site = Parameters_Load(:,2);
P_Load_Fore = Parameters_Load_Fro(1:Nunits_Load,1:24);
P_Load_total_Fore = Parameters_Load_Fro(Nunits_Load+1,1:24);

Bus = Parameters_Bus;
GSDF = Parameters_PTDF;

%% Parameters
Horizon = 24;
C_G_PFR = 15;
C_W_PFR = 15;
C_CSP_PFR = 15;
C_G_SFR = 20;
C_W_SFR = 20;
C_CSP_SFR = 20;
P_D_Miss = 0.1.*P_Load_total_Fore;
f_0 = 50;
f_RoCoF = 0.5;
f_QSS = 0.5;
D = 0.02;
M_1 = 10000;
M_2 = 10000;
M_3 = 10000;
M_4 = 10000;
T_G = 10;
T_CSP = 7;
SFR_Max = 10;%??
SFR_Min = 10;%??

Eta_SF = 0.42;
Eta_Loss = 0.00031;%储热系统的热损失系数
Eta_HT = 0.99;%储热系统的储热效率
Eta_TH = 0.99;%储热系统的放热效率
Eta_PB = 0.38;
Q_TES_0=0.5 .* Q_TES_Max;

x_G_0 = zeros(Nunits_G,1);
x_CSP_0 = zeros(Nunits_CSP, 1);
Cost_G_Min = P_G_a.*P_G_Min.*P_G_Min + P_G_b.*P_G_Min + P_G_c;
%% Decision Variables
x_G = binvar(Nunits_G,Horizon,'full');%火电机组的状态
u_G = binvar(Nunits_G,Horizon,'full');%火电机组PFR状态
v_G = binvar(Nunits_G,Horizon,'full');%火电机组SFR状态
P_G = sdpvar(Nunits_G,Horizon,'full');%火电机组的出力
P_G_PFR = sdpvar(Nunits_G,Horizon,'full');%火电机组的PFR
P_G_SFR = sdpvar(Nunits_G,Horizon,'full');%火电机组的SFR
C_G_UP = sdpvar(Nunits_G,Horizon,'full');%火电启动成本
Cost_G_SU = sdpvar(Nunits_G,Horizon,'full');%火电启动成本

P_G_PFR_1 = sdpvar(Nunits_G,Horizon,'full');%火电机组的PFR
P_G_SFR_1 = sdpvar(Nunits_G,Horizon,'full');%火电机组的SFR

x_CSP = binvar(Nunits_CSP,Horizon,'full');%光热机组的状态
u_CSP = binvar(Nunits_CSP,Horizon,'full');%光热机组PFR状态
v_CSP = binvar(Nunits_CSP,Horizon,'full');%光热机组SFR状态
Q_SF = sdpvar(Nunits_CSP,Horizon,'full');%
Q_TES = sdpvar(Nunits_CSP,Horizon,'full');%
Q_HT = sdpvar(Nunits_CSP,Horizon,'full');%
Q_TH = sdpvar(Nunits_CSP,Horizon,'full');%
a_CSP_Cha = binvar(Nunits_CSP,Horizon,'full');%光热机组SFR状态
a_CSP_Dis = binvar(Nunits_CSP,Horizon,'full');%光热机组SFR状态

P_CSP = sdpvar(Nunits_CSP,Horizon,'full');%光热机组的出力
P_CSP_PFR = sdpvar(Nunits_CSP,Horizon,'full');%光热机组的
P_CSP_SFR = sdpvar(Nunits_CSP,Horizon,'full');%光热机组的SFR
C_CSP_UP = sdpvar(Nunits_CSP,Horizon,'full');%光热机组启动成本
Cost_CSP_SU = sdpvar(Nunits_CSP,Horizon,'full');%光热机组启动成本

P_CSP_PFR_1 = sdpvar(Nunits_CSP,Horizon,'full');%光热机组的
P_CSP_SFR_1 = sdpvar(Nunits_CSP,Horizon,'full');%光热机组的SFR

u_W = binvar(Nunits_W,Horizon,'full');%风电PFR状态
v_W = binvar(Nunits_W,Horizon,'full');%风电SFR状态
P_W = sdpvar(Nunits_W,Horizon,'full');%出力
P_W_Cur = sdpvar(Nunits_W,Horizon,'full');%弃风
P_W_PFR = sdpvar(Nunits_W,Horizon,'full');%PFR 
P_W_SFR = sdpvar(Nunits_W,Horizon,'full');%SFR 



P_D_Cur = sdpvar(Nunits_Load ,Horizon,'full');%预测场景下切负荷

Vartheta_G = sdpvar(Nunits_G,Horizon,'full');%辅助变量
Vartheta_CSP = sdpvar(Nunits_CSP,Horizon,'full');%辅助变量

Gamma_G = sdpvar(Nunits_G,Horizon,'full');%辅助变量
Gamma_CSP = sdpvar(Nunits_CSP,Horizon,'full');%辅助变量

Cost_G_Oper = sdpvar(Nunits_G,Horizon,'full');%辅助变量
%% PTDF 计算
PTDF_G = [];
for g = 1:Nunits_G
    i = P_G_Site(g,1); % Generator is on the bus
    PTDF_G = [PTDF_G GSDF(:,i)]; % draw out the GSDF on the generator bus
end
PTDF_W=[];
for w=1:Nunits_W
    j = P_W_Site(w,1); % Wind is on the bus
    PTDF_W = [PTDF_W GSDF(:,j)]; % draw out the GSDF on the wind bus
end
PTDF_CSP=[];
for c=1:Nunits_CSP
    m = P_CSP_Site(c,1); % CSP is on the bus
    PTDF_CSP = [PTDF_CSP GSDF(:,m)]; % draw out the GSDF on the CSP bus
end
PTDF_D=[];
for d=1:Nunits_Load 
    n = P_Load_Site(d,1); % CSP is on the bus
    PTDF_D = [PTDF_D GSDF(:,n)]; % draw out the GSDF on the CSP bus
end
%% Constraints
constraints=[];
%% 功率平衡约束
for t=1:Horizon
    constraints = [constraints, sum(P_G(:,t)) + sum(P_W(:,t))+ sum(P_CSP(:,t)) + sum(P_D_Cur(:,t)) == P_Load_total_Fore(t)]; % 功率平衡约束 
    constraints = [constraints, 0 <= P_D_Cur(:,t) <= P_Load_Fore(:,t)];
end
%% 火电 + 光热 PFR和SFR容量约束
for t=1:Horizon
    constraints = [constraints, P_G(:,t) + P_G_PFR(:,t) + P_G_SFR(:,t) <= x_G(:,t) .* P_G_Max];% 上限约束
    constraints = [constraints, x_G(:,t) .* P_G_Min <= P_G(:,t) - P_G_PFR_1(:,t) - P_G_SFR_1(:,t)];% 下限约束
    constraints = [constraints, P_CSP(:,t) + P_CSP_PFR(:,t) + P_CSP_SFR(:,t) <= x_CSP(:,t) .* P_CSP_Max];% 上限约束
    constraints = [constraints, x_CSP(:,t) .* P_CSP_Min <= P_CSP(:,t) - P_CSP_PFR_1(:,t) - P_CSP_SFR_1(:,t)];% 下限约束
end
%% CSP 运行约束
for t = 1:Horizon
     constraints=[constraints, Q_SF(:,t) == Eta_SF .* Cap_SF.*I_DNI(:,t)];
     constraints=[constraints, Q_SF(:,t) == Q_HT(:,t)./Eta_HT - Q_TH(:,t).*Eta_TH + P_CSP(:,t)./Eta_PB];
     constraints=[constraints, 0 <= Q_TH(:,t) <= Q_TH_Max.*a_CSP_Dis(:,t).*300];
     constraints=[constraints, 0 <= Q_HT(:,t)<= Q_HT_Max.*a_CSP_Cha(:,t).*300];
     constraints=[constraints, a_CSP_Cha(:,t) + a_CSP_Dis(:,t)<=1];
end
for t=2:Horizon
     constraints=[constraints,Q_TES(:,t)==(1-Eta_Loss).*Q_TES(:,t-1)+ Q_HT(:,t) - Q_TH(:,t)];%(2)蓄热系统能流平衡
     constraints=[constraints,Q_TES_Max.*0.1<=Q_TES(:,t)<=Q_TES_Max];%(2)蓄热系统能流平衡
end
for t = 1:1
     constraints=[constraints,Q_TES(:,t) == (1-Eta_Loss).*Q_TES_0 + Q_HT(:,t) - Q_TH(:,t)];
end

%% 火电+光热爬坡约束：FRS
for t = 2:Horizon
    constraints=[constraints, P_G(:,t) + P_G_PFR(:,t) + P_G_SFR(:,t) - P_G(:,t-1) + P_G_PFR(:,t-1) + P_G_SFR(:,t-1)...
                              <= P_G_Max - x_G(:,t-1).*(P_G_Min-P_G_Up) - x_G(:,t).*(P_G_Max-P_G_Min)];
    constraints=[constraints, P_G(:,t-1) + P_G_PFR(:,t-1) + P_G_SFR(:,t-1) - P_G(:,t) - P_G(:,t) + P_G_PFR(:,t) + P_G_SFR(:,t)...
                              <= P_G_Max - x_G(:,t).*(P_G_Min-P_G_Up) - x_G(:,t-1).*(P_G_Max-P_G_Min)];
    constraints=[constraints, P_CSP(:,t) + P_CSP_PFR(:,t) + P_CSP_SFR(:,t) - P_CSP(:,t-1) + P_CSP_PFR(:,t-1) + P_CSP_SFR(:,t-1)...
                              <= P_CSP_Max - x_CSP(:,t-1).*(P_CSP_Min-P_CSP_Up) - x_CSP(:,t).*(P_CSP_Max-P_CSP_Min)];
    constraints=[constraints, P_CSP(:,t-1) + P_CSP_PFR(:,t-1) + P_CSP_SFR(:,t-1) - P_CSP(:,t) - P_CSP(:,t) + P_CSP_PFR(:,t) + P_CSP_SFR(:,t)...
                              <= P_CSP_Max - x_G(:,t).*(P_CSP_Min-P_CSP_Up) - x_CSP(:,t-1).*(P_CSP_Max-P_CSP_Min)];
end

%% 风电+ P_W_PFR(:,t) + P_W_SFR(:,t)
for t = 1:Horizon
    constraints=[constraints, P_W(:,t) + P_W_Cur(:,t) + P_W_PFR(:,t) + P_W_SFR(:,t)== P_Wind_Fore(:,t).*P_W_Capacity];%
    constraints=[constraints, P_W_Cur(:,t) >= 0];
    constraints=[constraints, P_W(:,t) >= 0];
end
%% FRS上下限约束
for t = 1:Horizon
     constraints=[constraints, 0 <= P_G_PFR(:,t) <= Cap_G_PFR .* u_G(:,t)];
     constraints=[constraints, 0 <= P_W_PFR(:,t) <= Cap_W_PFR.*P_W_Capacity.*  u_W(:,t)];
     constraints=[constraints, 0 <= P_CSP_PFR(:,t) <= Cap_CSP_PFR.*  u_CSP(:,t)];
     
     constraints=[constraints, 0 <= P_G_PFR_1(:,t) <= 20];
     constraints=[constraints, 0 <= P_CSP_PFR_1(:,t) <= 20];
     
     constraints=[constraints, 0 <= P_G_SFR(:,t) <= Cap_G_SFR .*  v_G(:,t)];
     constraints=[constraints, 0 <= P_W_SFR(:,t) <= Cap_W_SFR.*P_W_Capacity .*  v_W(:,t)];
     constraints=[constraints, 0 <= P_CSP_SFR(:,t) <= Cap_CSP_SFR.*  v_CSP(:,t)];
     
     constraints=[constraints, 0 <= P_G_SFR_1(:,t) <= 20];
     constraints=[constraints, 0 <= P_CSP_SFR_1(:,t) <= 20];
end

%% FRS上逻辑约束
for t = 1:Horizon
     constraints=[constraints, u_G(:,t) <= x_G(:,t)];
     constraints=[constraints, u_CSP(:,t) <= x_CSP(:,t)];
    
     constraints=[constraints, v_G(:,t) <= x_G(:,t)];
     constraints=[constraints, v_CSP(:,t) <= x_CSP(:,t)];
end

%% 火电+光热启停时间约束
for t = 2:Horizon
    for g = 1:Nunits_G
        indicator = x_G(g,t)-x_G(g,t-1);
        range = t:min(Horizon,t+T_G_On(g)-1);
        constraints = [constraints, x_G(g,range) >= indicator];%启动时间
    end
    for c = 1:Nunits_CSP
        indicator = x_CSP(c,t)-x_CSP(c,t-1);
        range = t:min(Horizon,t+T_CSP_On(c)-1);
        constraints = [constraints, x_CSP(c,range) >= indicator];%启动时间
    end
end%开机时间
for t = 2:Horizon
    for g = 1:Nunits_G
        indicator = x_G(g,t-1)-x_G(g,t);
        range = t:min(Horizon,t+T_G_Off(g)-1);
        constraints = [constraints, x_G(g,range) <= 1-indicator];%停止时间
    end
    for c = 1:Nunits_CSP
        indicator = x_CSP(c ,t-1) - x_CSP(c ,t);
        range = t:min(Horizon,t + T_CSP_Off(c )-1);
        constraints = [constraints, x_CSP(c ,range) <= 1-indicator];%停止时间
    end
end%停机时间

%% 联络线约束
% for t=1:Horizon
%     constraints = [constraints, P_L_Min <= PTDF_G*P_G(:,t)+PTDF_W*P_W(:,t) + PTDF_CSP*P_CSP(:,t)-PTDF_D*(P_Load_Fore(:,t)-P_D_Cur(:,t)) <= P_L_Max]; %+PTDF_CSP*P_CSP(:,t)
% end

%% Qss
for t = 1:Horizon
    constraints = [constraints,10*P_D_Miss(t) - sum(P_G_PFR(:,t)) - sum(P_W_PFR(:,t)) -sum(P_CSP_PFR(:,t)) <= f_QSS*D*P_Load_total_Fore(t)];
end

%% 启停费用
for t = 2:Horizon
    constraints=[constraints, Cost_G_SU(:,t)>=C_G_Up.*(x_G(:,t)-x_G(:,t-1))];
    constraints=[constraints, Cost_G_SU(:,t)>=0];
    constraints=[constraints, Cost_CSP_SU(:,t)>=C_CSP_Up.*(x_CSP(:,t)-x_CSP(:,t-1))];
    constraints=[constraints, Cost_CSP_SU(:,t)>=0];   
end
for t = 1:1
    constraints=[constraints, Cost_G_SU(:,1)>=C_G_Up.*(x_G(:,1)-x_G_0(:,1))];
    constraints=[constraints, Cost_G_SU(:,1)>=0];
    constraints=[constraints, Cost_CSP_SU(:,1)>=C_CSP_Up.*(x_CSP(:,1) - x_CSP_0(:,1))];
    constraints=[constraints, Cost_CSP_SU(:,1)>=0];
end

%% 目标函数
Objective = 0;
Objective_G_Energy=0;
Objective_G_SU=0;
Objective_G_PFR=0;
Objective_G_SFR=0;
Objective_VER_Cur=0;
Objective_L_Cur=0;
Punish_VRE=500;
Punish_D=5000;
Objective_CSP_SU=0;
Objective_CSP_PFR = 0;
Objective_CSP_SFR = 0;

for t = 1:Horizon
    Objective = Objective + sum(Parameters_Piecewise_Thermal(:,1).*P_G(:,t).*P_G(:,t) + Parameters_Piecewise_Thermal(:,2).*P_G(:,t) + Parameters_Piecewise_Thermal(:,3))+ sum(C_G_PFR.*P_G_PFR(:,t)) + sum(C_CSP_PFR.*P_CSP_PFR(:,t)) + sum(C_W_PFR.*P_W_PFR(:,t)) + sum(Cost_G_SU(:,t))+Punish_VRE*(sum(P_W_Cur(:,t)))+Punish_D.*sum(P_D_Cur(:,t));
end
% Objective = sum(sum(P_G(:,:)));
%% CPLEX
options = sdpsettings('verbose',2,'solver','gurobi','allownonconvex',0,'debug', 1);
options.gurobi.MIPGap=0.0001;
options.gurobi.NodeFileStart=0.5;
options.gurobi.PreSparsify=1;
result = optimize(constraints, Objective, options);
double(Objective)

%% 可行性诊断
% [model,recoverymodel] = export(constraints,Objective,options);
% iis = gurobi_iis(model);%查看冲突约束的序号
% dsds=find(iis.Arows(:,1)==1);
% gurobi_write(model, 'TestModel.lp');%根据约束冲突的序号找变量名，进而从m文件中找出约束linprog
% 
% disp('开始求解')
% diagnostics=optimize(constraints,Objective,options);
% if diagnostics.problem==0
%     disp('Solver thinks it is feasible')
% elseif diagnostics.problem==1
%     disp('Solver thinks it is infeasible')
%     pause();
% else
%     disp('Timeout,Display the current optimal solution')
% end

%% Read Data
P_G=value(P_G');
x_G=value(x_G');
u_G=value(u_G');
v_G=value(v_G');
Q_SF=value(Q_SF');
Q_TES=value(Q_TES');
Q_HT=value(Q_HT');
Q_TH=value(Q_TH');
P_CSP=value(P_CSP');
x_CSP=value(x_CSP');
u_CSP=value(u_CSP');
v_CSP=value(v_CSP');
P_W = value(P_W');
P_W_Cur = value(P_W_Cur');
P_D_Cur = value(P_D_Cur');
P_G_PFR = value(P_G_PFR);
P_G_SFR = value(P_G_SFR);
P_W_PFR = value(P_W_PFR);
P_W_SFR = value(P_W_SFR);
P_CSP_PFR = value(P_CSP_PFR);
P_CSP_SFR = value(P_CSP_SFR);
u_W = value(u_W);

Objective=value(Objective);
Objective_G_Energy=value(Objective_G_Energy);
Objective_G_SU=value(Objective_G_SU);
Objective_G_PFR=value(Objective_G_PFR);
Objective_G_SFR=value(Objective_G_SFR);
Objective_VER_Cur=value(Objective_VER_Cur);
Objective_L_Cur=value(Objective_L_Cur);
Objective_CSP_SU=value(Objective_CSP_SU);
Objective_CSP_PFR =value(Objective_CSP_PFR);
Objective_CSP_SFR =value(Objective_CSP_SFR);
for t= 1:Horizon
    A(:,t) = PTDF_G*P_G(t,:)'+PTDF_W*P_W(t,:)'-PTDF_D*(P_Load_Fore(:,t)-P_D_Cur(t,:)');
end

