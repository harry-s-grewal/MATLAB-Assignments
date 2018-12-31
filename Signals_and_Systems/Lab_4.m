dt = .05;
t = -10:dt:10;
Nt = length(t);
x1 = sin(5*t);
x = upsample(x1,2);
X = fft(x,max(1001,Nt))*dt;
X = fftshift(X);
Nw = length(X);
k = -(Nw-1)/2:1:(Nw-1)/2;
w = k*2*pi/Nw/dt;

figure(2)

subplot(211);plot(x);grid

xlabel('x(t)=x(t/2)')

subplot(212);plot(w,abs(X));grid

xlabel('frequency')