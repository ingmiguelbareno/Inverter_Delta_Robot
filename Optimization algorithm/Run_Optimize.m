close all, clear, clc, clear all;
tic;
%  Declaration global variables 

global H; % Work area height
global R; % Base radius of work
global Angle_joint_Max; % Maximun angular value 
global Resolution_cloud;
global Penal;
global Rb; % Fixed base radius 
global L;  % Length of links
global Rm; % Movile base radius
global Pv; %Pivot

% Initialization of the constans

%load Poblacion;% Initial population 
R=100;% Cylinder radius
H=200;% Cylinder height
Angle_joint_Max= 180; %Angle max joint
Resolution_cloud=30;
Penal=400;%

% Genetic algorit declaration 
FitnessFunction = @Objective_function; % Function handle to the fitness function
numberOfVariables = 4; % Number of decision variables
PopulationSize_Data = 100;
CrossoverFraction_Data= 0.25;
Max_Generations=1000;
Max_StallGenLimit=750;
%InitialPopulation_Data=Poblacion;
lb = [0;0;0;45]; % Lower bound %%L1,L2,L3,L4
ub = [300;500;190;200]; % Upper bound
A = []; % No linear inequality constraints
b = []; % No linear inequality constraints
Aeq = []; % No linear equality constraints
beq = []; % No linear equality constraints
%Start with the default options
options = gaoptimset;
options = gaoptimset(options,'PopulationSize' ,PopulationSize_Data);
options = gaoptimset(options,'CrossoverFraction' ,CrossoverFraction_Data);
%options = gaoptimset(options,'InitialPopulation' ,InitialPopulation_Data);
options = gaoptimset(options,'Generations',Max_Generations);
options = gaoptimset(options,'StallGenLimit',Max_StallGenLimit);
options = gaoptimset(options,'Display','iter');
% options = gaoptimset(options,'PlotFcns',{  @gaplotbestindiv  @gaplotexpectation @gaplotgenealogy @gaplotrange @gaplotscorediversity @gaplotscores @gaplotselection @gaplotstopping});
%options = gaoptimset(options,'PlotFcns',{  @gaplotdistance @gaplotselection @gaplotgenealogy @gaplotstopping @gaplotmaxconstr @gaplotbestindiv });
[x,Fval,exitFlag,Output,population,scores] = ga(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,[],options)
% [s,Fval]= ga(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,[],options)


figure(1)
plot(x,Fval,'+');
hold on
tiempo=toc;
Output

% Start Verification 
Rb=x(1);
L=x(2);
Rm=x(3);
Pv=x(4);

x = [Rb,L,Rm,Pv]; 

% Corroboration of the values optained 
% F=Simulate_function(x)
