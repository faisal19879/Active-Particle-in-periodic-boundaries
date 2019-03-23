function [xc,yc,thetac]=collision_agnese(xn,yn,M,R,thetan)
xc=xn;
yc=yn;
thetac=thetan;
    for j=1:M
        for k=(j+1):M
       
            dist=sqrt((xc(j)-xc(k))^2+(yc(j)-yc(k))^2);
            if dist < 2*R && j~=k
                thetac(j)=-thetan(j);
                thetac(k)=-thetan(k);
                %fprintf("particle %d and %d superpose \n",j,k)
                %fprintf("before: xc(%d)=%fum and yc(%d)=%fum \n",j,xc(j)*1e+6,j,yc(j)*1e+6)
                %fprintf("before: xc(%d)=%fum and yc(%d)=%fum \n",k,xc(k)*1e+6,k,yc(k)*1e+6)
                %fprintf("before: particle %d and %d distance= %f \n",j,k,dist*1e+6)
                MPX=(xc(j)+xc(k))/2;
                MPY=(yc(j)+yc(k))/2;
                xjk=(xc(k)-xc(j))/dist;
                yjk=(yc(k)-yc(j))/dist;
                xc(j)=MPX-R*xjk;
                yc(j)=MPY-R*yjk;
                xc(k)=MPX+R*xjk;
                yc(k)=MPY+R*yjk;
                %dist1=sqrt((xc(j)-xc(k))^2+(yc(j)-yc(k))^2);
                %fprintf("after: xc(%d)=%fum and yc(%d)=%fum \n",j,xc(j)*1e+6,j,yc(j)*1e+6)
                %fprintf("after: xc(%d)=%fum and yc(%d)=%fum \n",k,xc(k)*1e+6,k,yc(k)*1e+6)
                %fprintf("after: particle %d and %d distance= %f \n",j,k,dist1*1e+6)
                %pause
                
            end
        end
    end
end