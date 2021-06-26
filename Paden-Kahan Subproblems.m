%% https://github.com/omerkayan
%% Paden-Kahan Subproblems
%% Stæubli TX90 Robot

clc; clear all; close all; %for fresh starting
 
syms S1 S2 S3 S4 S5 S6 theta1 theta2 theta3 theta4 theta5 theta6 M T T1;
syms d2 d3 r3 r4;
 
d2 = 50; %%millimeter
d3 = 425;
r3 = 50;
r4 = 425;
 
%% HOME POSITION
theta1 = 0; 
theta2 = 0;
theta3 = 0; %no rotation according to home position
theta4 = 0;
theta5 = 0;
theta6 = 0;
 
M = [  0  0 -1 d2+r4
       0  1  0  r3
       1  0  0  d3
       0  0  0  1   ];
  
S1 = [ 0 -1 0 0
       1  0 0 0
       0  0 0 0
       0  0 0 0 ];
 
S2 = [ 0  0  1  0
       0  0  0  0
      -1  0  0 -d2
       0  0  0  0 ];
   
S3 = [ 0  0  1  d3
       0  0  0  0
      -1  0  0 -d2
       0  0  0  0    ];
   
S4 = [ 0  0  0  0
       0  0 -1 -d3
       0  1  0  r3
       0  0  0  0   ];
         
S5 = [ 0  0  1   d3
       0  0  0    0
      -1  0  0 -d2-r4
       0  0  0    0  ];
   
S6 = [ 0  0  0   0
       0  0 -1 -d3
       0  1  0  r3
       0  0  0   0  ];
   
T = expm(S1*theta1) * expm(S2*theta2) * expm(S3*theta3) * expm(S4*theta4) * expm(S5*theta5) * expm(S6*theta6) * M;
 
%Inverse Kinematic with PoE and Paden-Khan
%Finding Theta3 - Subproblem 3
 
T1 = T*inv(M);
 
q4 = [d2+r4, r3, d3]';
p2 = [d2, 0, 0]';
r3 = [d2, r3, d3]';
u = p2 - r3;
v = q4 - r3;
w3 = [0,1,0];
 
K = sqrt(norm(v - r3 .* u)^2);
K1 = sqrt(K^2-(norm(w3*(p2-q4)))^2);
 
u1 = u - w3*w3'*u;
v1 = v - w3*w3'*v;
 
theta0 = atan2( w3 * cross(u1,v1), u1'*v1); %the angle between the vectors u? and v?
thetad = acos( ( ( (norm(u1))^2 + (norm(v1))^2 - K1^2) ) / ( 2 * norm(u1) * norm(v1) ) );
theta3_1 = theta0 + thetad; %Solution 1 radian
theta3_2 = theta0 - thetad; %Solution 2 radian
 
theta3_1_degree = radtodeg(theta3_1)
theta3_2_degree = radtodeg(theta3_2)
