clear;
clc;
deltaT=1*10^-6;
x(1)=0;%initial conditions
y(1)=0;
z(1)=0;
R=1*10^-6; %radius taken in meter
T=300; %temp taken in Kelvin
n=0.001;%viscosity
kx=1*10^-6;%using units N/m
ky=1*10^-6;
kz=0.2*10^-6;
kb=1.38*10^-23; %Boltzmann constant
gamma=6*pi*n*R;
N=1000;

D=(kb*T)/gamma; % diffusion coefficient
v=5*10^-6;%taking velocity as 1*10^-6 m/s
for i=2:N
    
    x(i)= x(i-1)-((1/gamma)*kx*x(i-1)*deltaT+sqrt(2*D*deltaT)*randn())+(v*cos(sqrt(2*D*deltaT)*randn())*deltaT);
   
    y(i)= y(i-1)-((1/gamma)*ky*y(i-1)*deltaT+sqrt(2*D*deltaT)*randn())+(v*sin(sqrt(2*D*deltaT)*randn())*deltaT);
    z(i) = z(i-1) - ((1/gamma)*kz*z(i-1)*deltaT+sqrt(2*D*deltaT)*randn());
end
t=[0:deltaT:(N-1)*deltaT];

plot3(x,y,z);
xlabel('x(m)');
ylabel('y(m)');
zlabel('z [m]')
box on;
axis equal