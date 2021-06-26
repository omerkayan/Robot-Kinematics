%% https://github.com/omerkayan
%% Forward Kinematic Analysis
%% Product of Exponentials Method
%% Kuka KR210 R2700 Extra Robot

clc; clear all; close all; %for fresh starting
 
syms S1 S2 S3 S4 S5 S6 theta1 theta2 theta3 theta4 theta5 theta6 M T_PoE;
syms L1 L2 W1 W2 H1 H2;
syms mx my mz s1x s1y s1z s2x s2y s2z s3x s3y s3z;
syms s4x s4y s4z s5x s5y s5z s6x s6y s6z;
syms q1 q2 q3 q4 q5 q6;
format short; %% to show very small values as zero

A1 = 350; %% millimeter
A2 = 1150;
A5 = 1200;
A6 = 215;
D1 = 675; 
D4 = 41;
 
%% Joint Angles
theta1 = pi/3;
theta2 = pi/2;
theta3 = -pi/2;
theta4 = pi/4;
theta5 = 0;
theta6 = 0;

w1 = [0 1 0];
w2 = [0 1 0]; 
w3 = [1 0 0]; 
w4 = [0 1 0];
w5 = [1 0 0]; 
w6 = [1 0 0]; 

q1 = [A1       0  D1];
q2 = [A1       0 A2+D1+D4];
q3 = [A1       0  A2+D1];
q4 = [A1+A5    0  A2+D1];
q5 = [A1+A5    0  A2+D1];
q6 = [A1+A5+A6 0  A2+D1];

v1 = cross(w1,q1);
v2 = cross(w2,q2);
v3 = cross(w3,q3);
v4 = cross(w4,q4);
v5 = cross(w5,q5);
v6 = cross(w6,q6);

s1x=v1(1,1);     s1y=v1(1,2);     s1z=v1(1,3); 
s2x=v2(1,1);     s2y=v2(1,2);     s2z=v2(1,3); 
s3x=v3(1,1);     s3y=v3(1,2);     s3z=v3(1,3); 
s4x=v4(1,1);     s4y=v4(1,2);     s4z=v4(1,3); 
s5x=v5(1,1);     s5y=v5(1,2);     s5z=v5(1,3); 
s6x=v6(1,1);     s6y=v6(1,2);     s6z=v6(1,3); 

M = [  0  0  1 s6x
       0  1  0 s6y
      -1  0  0 s6z
       0  0  0  1   ];
  
S1 = [ 0  0  1 s1x
       0  0  0 s1y
      -1  0  0 s1z
       0  0  0 0    ];
 
S2 = [ 0  0  1 s2x
       0  0  0 s2y
      -1  0  0 s2z
       0  0  0  0   ];
   
S3 = [ 0 0  0  s3x
       0 0 -1  s3y
       0 1  0  s3z
       0 0  0  0    ];
   
S4 = [ 0  0  1 s4x
       0  0  0 s4y
      -1  0  0 s4z
       0  0  0  0   ];
      
S5 = [ 0  0  0 s5x
       0  0 -1 s5y
       0  1  0 s5z
       0  0  0   0  ];
   
S6 = [ 0  0  0 s6x
       0  0 -1 s6y
       0  1  0 s6z
       0  0  0  0   ];
  
T_PoE = expm(S1*theta1) * expm(S2*theta2) * expm(S3*theta3) * expm(S4*theta4) * expm(S5*theta5) * expm(S6*theta6) * M;
