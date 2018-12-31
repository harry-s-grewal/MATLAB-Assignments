
clear
c0=0.5;
t=-5*pi:0.02:5*pi;
w0=1;

%N=number of term
x=c0;
N=50;
for n=1:N
    n
    
    %for exponential wave
    %a0=0.504;
    %c(n)=0.504*(2/sqrt(1+16*(n^2)));
    %theta(n)=-atan(4*n);
    
    %for sawtooth
    c0=0.5;
    c(n)=1/(pi*n);
    theta(n)=pi/2;
    
    
    %for square wave
    %a0=0.5;
    %c(n)=abs((2/(n*pi))*sin(n*pi/2));  
    %if rem(n,4)==3                          
    %    theta(n)=-pi;
    %else theta(n)=0;
    %end
    
    c(n)
    theta(n)
    x=x+c(n)*cos(n*w0*t+theta(n));

    
    
    subplot (3,1,1), plot (t,c(n)*cos(n*w0*t+theta(n)))
    axis ([-15 15 -0.5 0.5])
    xlabel('time');
    ylabel('New Harmonic')
    
    for i=1:n   
        
        subplot (3,1,2), plot (t,c(n)*cos(n*w0*t+theta(n)))
        %axis ([-15 15 -0.5 0.5])
        hold on
        xlabel('time');
        ylabel('Harmonics')
    end
    
    
    subplot (3,1,3), plot (t,c0)
    axis ([-15 15 0 1])
    hold on
    subplot(3,1,3), plot(t,x)
    xlabel('time');
    ylabel('x(t)');
    hold off
    pause
end