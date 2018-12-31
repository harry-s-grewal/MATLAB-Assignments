T=2;T1=0.5;omega0=2*pi/T;
t=-4:0.001:4;a_0=1/2;
x_approx=ones(1,length(t))*a_0;
N_a=9;

x_approx1=x_approx;

for k=1:(N_a-1)/2
	a_k1=((2*sin((k*pi)/2))/(1i*(1j*(k*pi)^2)))*(exp(-1j*((k*pi)/2)));
	x_approx1=x_approx1+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
	end

N_a=27;

x_approx2=x_approx;

for k=1:(N_a-1)/2
	a_k1=((2*sin((k*pi)/2))/(1i*(1j*(k*pi)^2)))*(exp(-1j*((k*pi)/2)));
	x_approx2=x_approx2+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
end

N_a=201;

x_approx3=x_approx;

for k=1:(N_a-1)/2
	a_k1=((2*sin((k*pi)/2))/(1*(1j*(k*pi)^2)))*(exp(-1j*((k*pi)/2)));
	x_approx3=x_approx3+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
end

subplot(3,1,1); plot(t,x_approx1),grid
subplot(3,1,2); plot(t,x_approx2),grid
subplot(3,1,3); plot(t,x_approx3),grid

%--------------------------------------------------------

T=1000;T1=0.5;omega0=2*pi/T;
t=-7:0.001:7;a_0=0.5;
a1=-0.20944;
a2=0;
a3=-0.03056;
a4=0;
a5=-0.02;
x_approx=ones(1,length(t))*a_0;
N_a=10;
x_approx1=x_approx;
 
a_k1=a_0;
x_approx1=x_approx1+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
a_k1=a1;
x_approx1=x_approx1+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
a_k1=a2;
x_approx1=x_approx1+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
a_k1=a3;
x_approx1=x_approx1+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
a_k1=a4;
x_approx1=x_approx1+2*abs(a_k1)*cos(k*omega0.*t+angle(a_k1));
a_k1=a5;
 
subplot(3,1,1); plot(t,x_approx1),grid