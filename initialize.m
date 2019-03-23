function [x,y,theta]=initialize(x,y,Lx,Ly,M,theta)
for k=1:M
    x(1,k) = (Lx)*(rand(1,1)-0.5); % initial conditions
    y(1,k) = (Ly)*(rand(1,1)-0.5);
    theta(1,k)=2*pi*rand(1,1);
end
end