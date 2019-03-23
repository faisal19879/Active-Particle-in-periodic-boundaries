clear;
clc;
%SaveFileTo='C:\Users\Hp\Desktop\project pics-presentation\';
save('C:\Users\Hp\Desktop\project pics-presentation\');
VideoName='Simulation_M_particlesInAboxchannel_13.avi';
dt=500*10^-3;%timestep
N=240;%number of samples
M=10;%number of particles
R=3*10^-6;%particle radius
eta=0.001;%viscosity
T=300;%temperature
V=15*10^-6;%particle velocity
A=0.1*pi;%angular velocity
Lx=60*10^-5;%length of box
Ly=20*10^-5;%width of box
kB = 1.38e-23; % Boltzmann constant
gamma = 6*pi*R*eta; % friction coefficient
DT = kB*T/gamma; % translational diffusion coefficient
DR = 6*DT/(8*R^2); % rotational diffusion coefficient
x=zeros(N,M);

y=zeros(N,M);
theta = zeros(N,M); % initial angle

[x,y,theta]=initialize(x,y,Lx,Ly,M,theta);
[x,y,theta,v]=motion_channel(x,y,DT,dt,A,theta,M,N,DR,V,Lx,Ly,R,VideoName);
close(v)