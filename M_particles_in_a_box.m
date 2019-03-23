clear;
clc;
save('C:\Users\Hp\Desktop\project pics-presentation\');
VideoName='Simulation_M_particles_In_A_box_13.avi';
dt=200*10^-3;%timestep
N=200;%number of samples
M=30;%number of particles
R=1*10^-6;%particle radius
eta=0.001;%viscosity
T=300;%temperature
V=10*10^-6;%particle velocity
A=0*pi;%angular velocity
Lx=100*10^-6;%length of box
Ly=Lx;%width of box
kB = 1.38e-23; % Boltzmann constant
gamma = 6*pi*R*eta; % friction coefficient
DT = kB*T/gamma; % translational diffusion coefficient
DR = kB*T/(8*pi*eta*(R^3)); % rotational diffusion coefficient
x=zeros(N,M);
y=zeros(N,M);
theta = zeros(N,M); % initial angle

[x,y,theta]=initialize(x,y,Lx,Ly,M,theta);

[x,y,theta,v]=motion_box(x,y,DT,dt,A,theta,M,N,DR,V,Lx,Ly,R,VideoName);
close(v)