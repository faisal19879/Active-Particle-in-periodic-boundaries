clear;
clc;
kB = 1.38e-23; % Boltzmann constant [J/K]
R=1*10^-6;
N=1000;
eta=0.001;
y1=0;
x1=0;
z1=0;
kb=1.38*10^-23;
T=300;
Dt=1*10^-6
gamma = 6*pi*R*eta; % friction coefficient
D = kB*T/gamma; % diffusion coefficient
x(1)=x1;y(1)=y1;z(1)=z1; % initial condition
kx=1*10^-6;
ky=1*10^-6;
kz=0.2*10^-6
for i = 2:1:N
% Deterministic step
x(i) = x(i-1) - kx*Dt/gamma*x(i-1);
y(i) = y(i-1) - ky*Dt/gamma*y(i-1);
z(i) = z(i-1) - kz*Dt/gamma*z(i-1);
% Diffusive step
x(i) = x(i) + sqrt(2*D*Dt)*randn();
y(i) = y(i) + sqrt(2*D*Dt)*randn();
z(i) = z(i) + sqrt(2*D*Dt)*randn();
end
t = [0:Dt:(N-1)*Dt];
figure
plot3(x,y,z)
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
axis equal;
