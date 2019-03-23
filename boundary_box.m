function [xc,yc,thetac]=boundary_box(M,Lx,Ly,xn,yn,thetan,R)
xc=xn;
yc=yn;
thetac=thetan;
for  j=1:M
    % horizontal condition
    
    %  box vertical condition
    if  yc(j)+R>Ly/2
        %fprintf("theta of particle %d before: %f um\n",j,thetac(j))
        %fprintf("y position of particle %d before: %f um\n",j,yc(j)*1e+6)
        
        %fprintf("theta of particle %d after: %f um\n",j,thetac(j))
        yc(j) = Ly/2-abs(yc(j)-Ly/2);
        thetac(j)=-thetan(j);
        %fprintf("y position of particle %d after: %f um\n",j,yc(j)*1e+6)
        %xc(j) = xn(j);
    end
    if yc(j)-R<-Ly/2
        %fprintf("y position of particle %d before: %f um\n",j,yc(j)*1e+6)
        %fprintf("theta of particle %d before: %f um\n",j,thetac(j))
        
        %fprintf("theta of particle %d after: %f um\n",j,thetac(j))
        yc(j) = -Ly/2+abs(yc(j)+Ly/2);
        thetac(j)=-thetan(j);
        %fprintf("y position of particle %d after: %f um\n",j,yc(j)*1e+6)
        %xc(j) = xn(j);
    end
    if xc(j)+R>Lx/2
        
        %fprintf("x position of particle %d before: %f um\n",j,xc(j)*1e+6)
        
        %fprintf("theta of particle %d after: %f um\n",j,thetac(j))
        xc(j) = Lx/2-abs(Lx/2-xc(j));
        thetac(j)=-thetac(j);
        %fprintf("x position of particle %d after: %f um\n",j,xc(j)*1e+6)
        %yc(j)=yn(j);
    end
    if xc(j)-R<-Ly/2
        %fprintf("theta of particle %d before: %f um\n",j,thetac(j))
        %fprintf("x position of particle %d before: %f um\n",j,xc(j)*1e+6)
      
        %fprintf("theta of particle %d after: %f um\n",j,thetac(j))
        xc(j) =-Ly/2+abs(xc(j)+Lx/2);
          thetac(j)=-thetac(j);
        %fprintf("x position of particle %d after: %f um\n",j,xc(j)*1e+6)
        %pause
        %yc(j)=yn(j);
    end
end
end

%function to define motion of particles

