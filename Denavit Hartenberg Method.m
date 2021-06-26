%% https://github.com/omerkayan
%% Forward Kinematic Analysis
%% Denavit Hartenberg Method
%% Kuka KR210 R2700 Extra Robot

clc; clear all; close all; %for fresh starting
 
syms a1 a2 a3 a4 a5 a6;
syms alpha1 alpha2 alpha3 alpha4 alpha5 alpha6;
syms d1 d2 d3 d4 d5 d6;
syms theta1 theta2 theta3 theta4 theta5 theta6;
syms T1_0 T2_1 T3_2 T4_3 T5_4 T6_5 T6_0 T6_0;
format short; %% to show very small values as zero

a1 = 350 ;
a2 = 1150;
a3 = 0;
a4 = 0;
a5 = 1200;
a6 = 215;
 
alpha1 = -pi/2;
alpha2 = 0;
alpha3 = -pi/2;
alpha4 = pi/2;
alpha5 = -pi/2;
alpha6 = 0;
 
d1 = 675;
d2 = 0;
d3 = 0;
d4 = 41;
d5 = 0;
d6 = 0;

%This is joint angles
theta1 = 0;
theta2 = -pi/2;
theta3 = pi/2;
theta4 = 0;
theta5 = 0;
theta6 = 0;
 
T1_0 = [ cos(theta1) -cos(alpha1)*sin(theta1) sin(theta1)*sin(alpha1) a1*cos(theta1)
         sin(theta1) cos(theta1)*cos(alpha1) -cos(theta1)*sin(alpha1) a1*sin(theta1)
         0 sin(alpha1) cos(alpha1) d1
         0 0 0 1 ];
 
T2_1 = [ cos(theta2) -sin(theta2)*cos(alpha2) sin(theta2)*sin(alpha2) a2*cos(theta2)
         sin(theta2) cos(theta2)*cos(alpha2) -cos(theta2)*sin(alpha2) a2*sin(theta2)
         0 sin(alpha2) cos(alpha2) d2
         0 0 0 1 ];
       
T3_2 = [ cos(theta3) -sin(theta3)*cos(alpha3) sin(theta3)*sin(alpha3) a3*cos(theta3)
         sin(theta3) cos(theta3)*cos(alpha3) -cos(theta3)*sin(alpha3) a3*sin(theta3)
         0 sin(alpha3) cos(alpha3) d3
         0 0 0 1 ];
     
 T4_3 = [ cos(theta4) -sin(theta4)*cos(alpha4) sin(theta4)*sin(alpha4) a4*cos(theta4)
         sin(theta4) cos(theta4)*cos(alpha4) -cos(theta4)*sin(alpha4) a4*sin(theta4)
         0 sin(alpha4) cos(alpha4) d4
         0 0 0 1 ];
     
 T5_4 = [ cos(theta5) -sin(theta5)*cos(alpha5) sin(theta5)*sin(alpha5) a5*cos(theta5)
         sin(theta5) cos(theta5)*cos(alpha5) -cos(theta5)*sin(alpha5) a5*sin(theta5)
         0 sin(alpha5) cos(alpha5) d5
         0 0 0 1 ];
     
 T6_5 = [ cos(theta6) -sin(theta6)*cos(alpha6) sin(theta6)*sin(alpha6) a6*cos(theta6)
         sin(theta6) cos(theta6)*cos(alpha6) -cos(theta6)*sin(alpha6) a6*sin(theta6)
         0 sin(alpha6) cos(alpha6) d6
         0 0 0 1 ];
     
 T6_0 = T1_0 * T2_1 * T3_2 * T4_3 * T5_4 * T6_5;
