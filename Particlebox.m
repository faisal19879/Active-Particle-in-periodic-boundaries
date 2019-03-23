clear;
clc;
dt=1*10^-3;%timestep
N=1000;%number of samples
R=2*10^-6;%particle radius
eta=0.001;%viscosity
T=300;%temperature
V=20*10^-6;%particle velocity
A=pi;%angular velocity
L=2*10^-5;%length of box
x0=[(2*10^-5)*rand(1,1) (2*10^-5)*rand(1,1)];%initial position;
kB = 1.38e-23; % Boltzmann constant
gamma = 6*pi*R*eta; % friction coefficient 
DT = kB*T/gamma; % translational diffusion coefficient 
DR = 6*DT/(8*R^2); % rotational diffusion coefficient
x(1,:) = x0; % initial conditions
theta = 0; % initial angle
for i = 1:1:N
% Translational diffusion step
x(i+1,:) = x(i,:) + sqrt(2*DT*dt)*randn(1,2);
theta = theta + sqrt(2*DR*dt)*randn(1,1)+dt*A;

% Drift step
x(i+1,:) = x(i+1,:) + dt*V*[cos(theta) sin(theta)];
% box vertical condition
if abs(x(i+1,1))>L/2
x(i+1,1) = sign(x(i+1,1))*(L-abs(x(i+1,1)));
end
%  box horizontal condition
if abs(x(i+1,2))>L/2
x(i+1,2) = sign(x(i+1,2))*(L-abs(x(i+1,2)));
end
% Plot
cla
hold on
plot(x(1:i+1,1)*1e6,x(1:i+1,2)*1e6,'k')
plot(x(i+1,1)*1e6,x(i+1,2)*1e6,'o','MarkerFaceColor','g')
fill(1e6*[-L L L -L -L]/2,1e6*[-L -L L L -L]/2, 'k', 'FaceAlpha', 0)
hold on
axis equal 
title(['velocity = ' num2str(V) ' m/s, ', ...
'angular velocity = ' num2str(A) ' rad/s, ', ...
'time = ', num2str(dt*(i+1)) ' s'])
xlabel('x [1*10^-6 m]')
ylabel('y [1*10^-6 m]')
box on
drawnow();

end
t = [0:dt:(N-1)*dt];



