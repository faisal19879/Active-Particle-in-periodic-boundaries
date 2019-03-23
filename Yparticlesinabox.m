clear;
clc;
dt=1*10^-3;%timestep
N=1000;%number of samples
M=10;%number of particles
R=2*10^-6;%particle radius
eta=0.001;%viscosity
T=300;%temperature
V=2000*10^-6;%particle velocity
A=0*pi;%angular velocity
L=20*10^-5;%length of box
kB = 1.38e-23; % Boltzmann constant
gamma = 6*pi*R*eta; % friction coefficient
DT = kB*T/gamma; % translational diffusion coefficient
DR = kB*T/(8*pi*eta*R^3); % rotational diffusion coefficient
x=zeros(N,M);
y=zeros(N,M);
for k=1:M
    x(1,k) = (L)*(rand(1,1)-0.5); % initial conditions
    y(1,k) = (L)*(rand(1,1)-0.5);
end
theta = 0; % initial angle

for i = 1:N
    for j=1:M
        % Translational diffusion step
        
        x(i+1,j) = x(i,j) + sqrt(2*DT*dt)*randn(1,1);
        y(i+1,j) = y(i,j) + sqrt(2*DT*dt)*randn(1,1);
        theta = theta + sqrt(2*DR*dt)*randn(1,1)+dt*A;
        
        % Drift step
        x(i+1,j) = x(i+1,j) + dt*V*cos(theta);
        y(i+1,j) = y(i+1,j) + dt*V*sin(theta);
        % box horizontal condition
        
    end
    
end

%plot
for n=1:N
    cla
    hold on
    for m=1:M
        
        plot(x(n+1,m)*1e6,y(n+1,m)*1e6,'o','MarkerFaceColor','g')
    end
    fill(1e6*[-L L L -L -L]/2,1e6*[-L -L L L -L]/2, 'k', 'FaceAlpha', 0)
    hold off
    axis equal
    title(['velocity = ' num2str(V) ' m/s, ', ...
        'angular velocity = ' num2str(A) ' rad/s, ', ...
        'time = ', num2str(dt*(n+1)) ' s'])
    xlabel('x [1*10^-6 m]')
    ylabel('y [1*10^-6 m]')
    box on
    drawnow();
    
    
end
