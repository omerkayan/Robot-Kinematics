%% https://github.com/omerkayan
%% Singularity
%% Stæubli TX90 Robot

clc; clear all; close all;
 
syms theta theta1 theta2 theta3 theta4 theta5 theta6 Rank;
syms w1 w2 w3 w4 w5 w6;
syms x y z;
syms q1 q2 q3 q4 q5 q6;
syms d2 d3 r3 r4;
 
theta1 = 0;
%%theta2 = 0;
%%theta3 = 0;
%%theta4 = 0;
%%theta5 = 0;
%%theta6 = 0;

%%Rotation matrix of X
Rotx(theta) = [ 1      0           0
                0  cos(theta) -sin(theta)
                0  sin(theta)  cos(theta) ];
            
%%Rotation matrix of Y
Roty(theta) = [ cos(theta)  0   sin(theta)
                    0       1       0 
               -sin(theta)  0   cos(theta) ];
            
%%Rotation matrix of Z
Rotz(theta) = [ cos(theta)  -sin(theta)   0
                sin(theta)   cos(theta)   0
                    0            0        1 ];
                
%%W matrices
w1 = [0; 0; 1];
w2 = Rotz(theta1) * [0; 1; 0];
w3 = Rotz(theta1) * Roty(theta2) * [0; 1; 0];
w4 = Rotz(theta1) * Roty(theta2) * Roty(theta3) * [0; 0; 1];
w5 = Rotz(theta1) * Roty(theta2) * Roty(theta3) * Rotz(theta4) * [0; 1; 0];
w6 = Rotz(theta1) * Roty(theta2) * Roty(theta3) * Rotz(theta4) * Roty(theta5) * [0; 0; 1];

%%Q matrices
q1 = [0; 0; 0];
q2 = Rotz(theta1) * [d2; 0; 0];
q3 = Rotz(theta1) * [d2; 0; 0] + Rotz(theta1) * Roty(theta2) * [0; 0; d3] + Rotz(theta1) * Roty(theta2) * [0; r3; 0];
q4 = Rotz(theta1) * [d2; 0; 0] + Rotz(theta1) * Roty(theta2) * [0; 0; d3] + Rotz(theta1) * Roty(theta2) * [0; r3; 0] + Rotz(theta1) * Roty(theta2) * Roty(theta3) * [0; 0; r4];
q5 = Rotz(theta1) * [d2; 0; 0] + Rotz(theta1) * Roty(theta2) * [0; 0; d3] + Rotz(theta1) * Roty(theta2) * [0; r3; 0] + Rotz(theta1) * Roty(theta2) * Roty(theta3) * [0; 0; r4];
q6 = Rotz(theta1) * [d2; 0; 0] + Rotz(theta1) * Roty(theta2) * [0; 0; d3] + Rotz(theta1) * Roty(theta2) * [0; r3; 0] + Rotz(theta1) * Roty(theta2) * Roty(theta3) * [0; 0; r4];
 
%% v = -wi x qi
v1 = cross(-w1, q1);
v2 = cross(-w2, q2);
v3 = cross(-w3, q3);
v4 = cross(-w4, q4);
v5 = cross(-w5, q5);
v6 = cross(-w6, q6);

%Space Jacobian
J = [ w1 w2 w3 w4 w5 w6;
      v1 v2 v3 v4 v5 v6 ];
  
Rank = rank(J)
