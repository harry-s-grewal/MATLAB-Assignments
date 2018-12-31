% ELG3106 ELECTROMAGNETIC ENGINEERING
% DESIGN STUDY: IMPACT OF BROADBAND ANTIREFLECTION COATING DESIGN ON SOLAR POWER PRODUCTION
% Double-layered system
% Name: Harry Grewal
% November 16, 2018

clear all

% Set layer 2 reflective index range
% Note to TA: Change this value if you want to replot the graphs in the
% report submitted. The ranges are given in the report as well
n2_start = 1;
n2_end = 3;
avg_range = (n2_end - n2_start)/0.1;

cc = hsv(avg_range + 1);
total_power = zeros(1, (avg_range + 1));
g = zeros(1, 2001);
t = zeros(1, 2001);


%loop from 1 to 3 at 0.1
for n2 = n2_start:0.1:n2_end;
    count = single(1+(n2-n2_start)/0.1);
    n_i = [1 1.4 n2 3.5];
    g_i = zeros(1,length(n_i)-1);
    t_i = zeros(1,length(n_i)-1);
    
    %loop through i and calculate reflective and tranmitivity values
    for i = 2:length(n_i);
        g_i(i-1) = (n_i(i-1)-n_i(i))/(n_i(i-1)+n_i(i));
        t_i(i-1) = (2*n_i(i-1))/(n_i(i-1)+n_i(i));
    end

    % dynamical matrix derivations for layers 1-3
    Q0_1 = (1/(t_i(1))).*[1 g_i(1); g_i(1) 1];
    Q1_2 = (1/(t_i(2))).*[1 g_i(2); g_i(2) 1];
    Q2_3 = (1/(t_i(3))).*[1 g_i(3); g_i(3) 1];
    
    
    lambda_c = 650*power(10, -9); % Centered wavelength in meters
    
    % Calculate TMM
    %loop over the wavelength provided in design study 200nm to 2200nm
    for lambda_range = 200:2200;
        lambda = lambda_range*power(10,-9);
        delta = (pi/2).*(lambda_c/(lambda));
        P = [exp((1i*pi/2)*(lambda_c/lambda)) 0; 
        0 exp((-1i*pi/2)*(lambda_c/lambda))];
        T = Q0_1*P*Q1_2*P*Q2_3;
        g(lambda_range - 199) = (T(2,1))/(T(1,1));
        t(lambda_range - 199) = 1/T(1,1);
        
        % Plotting Reflectivity vs Wavelength
        Reflectivity = power(abs(g(lambda_range - 199)),2);
        Transmitivity = power(abs(t(lambda_range - 199)),2)*(n_i(4)/n_i(1));
        graphs(count) = plot(lambda,Reflectivity*100, 'color', cc(count,:));hold on
        
        string = sprintf('n2 = %f',n2);
        strings(count) = {string};
        Intensity = 6.16*power(10,15)/(power(lambda_range, 5)*(exp(2484/lambda_range) - 1));
        
        % remove semi colan below to display total power. Add it before
        % running it for a larger range of n2
        total_power(count) = total_power(count) + Transmitivity*Intensity;

        
    end
    
    
end


%Labels
axis([200*power(10, -9) 2200*power(10,-9) 0 60]);
grid;
legend(graphs, strings);
xlabel('Wavelength (m)');
ylabel('Reflectivity (%)');
figure();
n2 = n2_start:0.1:n2_end;

plot(n2, total_power); hold on
grid;
xlabel('n_2 (Layer 2 Refractive Index)');
ylabel('Total Power (W/m^2)');

