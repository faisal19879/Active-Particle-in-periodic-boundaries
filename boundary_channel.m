function [xc,yc,thetac]=boundary_channel(M,Lx,Ly,xn,yn,thetan,R)
xc=xn;
yc=yn;
thetac=thetan;
    for  j=1:M
        % horizontal condition
        if xn(j)>Lx/2
            xc(j) = xn(j)-Lx;
            %yc(j)=yn(j);
        end
        if xn(j)<-Lx/2
            xc(j) = xn(j)+Lx;
            %yc(j)=yn(j);
        end
        %  box vertical condition
        if yn(j)+R>Ly/2
            thetac(j)=-thetan(j);
            yc(j) = Ly/2-abs(Ly/2-yn(j));
            %xc(j) = xn(j);
        end
        if yn(j)-R<-Ly/2
            thetac(j)=-thetan(j);
            yc(j) = -Ly/2+abs(yn(j)+Ly/2);
            %xc(j) = xn(j);
        end
    end
end

%function to define motion of particles

