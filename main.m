% Name: Edward E. Daisey
% Date: March 10th, 2022
% Description: To capture demineralization as a function of position and time for each chemical constituent of the reaction-diffusion equations.
% Tested in Matlab 2012 and Matlab 2022, with this version being the 2022 version.

% Purpose - This function defines the spatio-temporal domains and calls the pdepe functions. The results are mapped to the variables u, v, w, and z.
% These variables coorespond to the different chemical constituents. The desired results are then plotted.
function main
m = 0;
x = linspace(0, 10, 101);
t = linspace(0, 10, 101);
sol = pdepe(m,@pdefun,@pdeic,@pdebc,x,t);

% Purpose - The results are mapped to the variables u, v, w, and z that coorespond to the different chemical constituents.
u = (sol(:,:,1));
v = (sol(:,:,2));
w = (sol(:,:,3));
z = (sol(:,:,4));

% Purpose - The desired results are then plotted.
xplot = 101;
figure (1)
hold on
plot(x(1:xplot), u(101,1:xplot), 'LineWidth', 2);
plot(x(1:xplot), v(101,1:xplot), 'LineWidth', 2);
plot(x(1:xplot), w(101,1:xplot), 'LineWidth', 2);
plot(x(1:xplot), z(101,1:xplot), 'LineWidth', 2);
hold off

% Purpose - The x-axis of the plot is implemented.
xlabel('x');
ax = gca;
ax.FontSize = 12;

% Purpose - The y-axis of the plot is implemented.
ylabel('Concentrations');
ay = gca;
ay.FontSize = 12;

% Purpose - The title of the plot is implemented.
legend('[HA]', '[A-]', '[HB]', '[B-]')
title('Concentrations(x,t_f)', 'FontSize', 14);
end


% Purpose - This function allows one to define the reaction-diffusion equation. Points of interest include the diffusion coefficient (d), the
% forward reaction rate constant (k1), and the reverse reaction rate constant (km1).
function [c,f,s] = pdefun(x,t,u,dudx)
c = [1;1;1;1];
d = 1;
f = d*dudx;
k1 = 0.8;
km1 = 0.7;
s = [-u(1)*u(4)+u(2)*u(3); ... 
      u(1)*u(4)-u(2)*u(3); ...
      u(1)*u(4)-u(2)*u(3); ...
     -u(1)*u(4)+u(2)*u(3)];
end


% Purpose - This function allows one to define the initial conditions.
function u0 = pdeic(x)
u0 = [0;0;0;0];
end


% Purpose - This function allows one to define the left and right boundary conditions.
function [pl,ql,pr,qr] = pdebc(xl,ul,xr,ur,t)
pl = [ul(1)-0.7; ul(2)-0.8; ul(3)-0.8; ul(4)-0.2];
ql = [0;0;0;0];
pr = [ur(1)-0.1; ur(2)-0.3; ur(3)-0.3; ur(4)-0.95];
qr = [0;0;0;0];
end
