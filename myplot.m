function [fig1]=myplot(xn,yn,M,n,Lx,Ly,A,V,dt,fig1)

    cla
    hold on
    for m=1:M
        plot(xn(m)*1e6,yn(m)*1e6,'o','MarkerFaceColor','g')
        
    end
    fill(1e6*[-Lx Lx Lx -Lx -Lx]/2,1e6*[-Ly -Ly Ly Ly -Ly]/2, 'k', 'FaceAlpha', 0)
    hold off
    axis equal 
    title(['velocity = ' num2str(V) ' m/s, ', ...
        'angular velocity = ' num2str(A) ' rad/s'])%, ...
       % 'time = ', num2str(dt*(n+1)) ' s
    xlabel('x [1*10^-6 m]')
    ylabel('y [1*10^-6 m]')
    xlim([-Lx/2-0.5*10^-5 Lx/2+0.5*10^-5]*10^6)
    ylim([-Ly/2-0.5*10^-5 Ly/2+0.5*10^-5]*10^6)
    box on
    drawnow();
    
    
end