function [x,y,theta,v]=motion_channel(x,y,DT,dt,A,theta,M,N,DR,V,Lx,Ly,R,VideoName)
fig1= figure();
set(gca,'nextplot','replacechildren'); 
v = VideoWriter(VideoName);
v.FrameRate = 13;
open(v);
for i = 1:N
    for j=1:M
        % Translational diffusion step
        x(i+1,j) = x(i,j) + sqrt(2*DT*dt)*randn(1,1);
        y(i+1,j) = y(i,j) + sqrt(2*DT*dt)*randn(1,1);
        theta(i+1,j) = theta(i,j) + sqrt(2*DR*dt)*randn(1,1)+dt*A;
       % Drift step
        x(i+1,j) = x(i+1,j) + dt*V*cos(theta(i,j));
        y(i+1,j) = y(i+1,j) + dt*V*sin(theta(i,j));
        % box horizontal condition
    end 
  [x(i+1,:),y(i+1,:),theta(i+1,:)]=collision_faisal(x(i+1,:),y(i+1,:),M,R,theta(i+1,:));
  [x(i+1,:),y(i+1,:),theta(i+1,:)]=boundary_channel(M,Lx,Ly,x(i+1,:),y(i+1,:),theta(i+1,:),R);
  
 
   fig1=myplot(x(i+1,:),y(i+1,:),M,i,Lx,Ly,A,V,dt,fig1);

  F=getframe(gcf);
    writeVideo(v,F);
end
end
