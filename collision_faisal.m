function [xc,yc,thetac]=collision_faisal(xn,yn,M,R,thetan)
xc=xn;
yc=yn;
thetac=thetan;
for j=1:M
    for k=(j+1):M
        
        dist=sqrt((xc(j)-xc(k))^2+(yc(j)-yc(k))^2);
        if (dist < 2*R && j~=k)
            thetac(j)=-thetan(j);
            thetac(k)=-thetan(k);
              %fprintf("particle %d and %d superpose \n",j,k)
             %fprintf("before: xc(%d)=%fum and yc(%d)=%fum \n",j,xc(j)*1e+6,j,yc(j)*1e+6)
              %fprintf("before: xc(%d)=%fum and yc(%d)=%fum \n",k,xc(k)*1e+6,k,yc(k)*1e+6)
              %fprintf("before: particle %d and %d distance= %f \n",j,k,dist*1e+6)
            %d=R-0.5*abs(xc(z,p+1)-xc(z,p));
            xc(j)=0.5*(((2*R)/abs(xc(j)-xc(k)))+1)* xc(j)-0.5*(((2*R)/abs(xc(j)-xc(k)))-1)* xc(k);
            xc(k)=-0.5*(((2*R)/abs(xc(j)-xc(k)))-1)* xc(j)+0.5*(((2*R)/abs(xc(j)-xc(k)))+1)* xc(k);
            yc(j)=0.5*((2*R)/abs(yc(j)-yc(k))+1)* yc(j)-0.5*(((2*R)/abs(yc(j)-yc(k)))-1)* yc(k);
            yc(k)=-0.5*((2*R)/abs(yc(j)-yc(k))-1)* yc(j)+0.5*(((2*R)/abs(yc(j)-yc(k)))+1)* yc(k);
           %fprintf("before: xc(%d)=%fum and yc(%d)=%fum \n",j,xc(j)*1e+6,j,yc(j)*1e+6)
           %fprintf("before: xc(%d)=%fum and yc(%d)=%fum \n",k,xc(k)*1e+6,k,yc(k)*1e+6)
           %pause
        end
         

        
    end
end
end