function main
m = 0;
x = linspace(0, 10, 101);
t = linspace(0, 10, 101);
sol = pdepe(m,@pdefun,@pdeic,@pdebc,x,t);

u = (sol(:,:,1));
v = (sol(:,:,2));
w = (sol(:,:,3));
z = (sol(:,:,4));

xplot = 101;

figure (1)
hold on
plot(x(1:xplot), u(101,1:xplot), 'LineWidth', 2);
plot(x(1:xplot), v(101,1:xplot), 'LineWidth', 2);
plot(x(1:xplot), w(101,1:xplot), 'LineWidth', 2);
plot(x(1:xplot), z(101,1:xplot), 'LineWidth', 2);
hold off

xlabel('x');
ax = gca;
ax.FontSize = 12;
ylabel('Concentrations');
ay = gca;
ay.FontSize = 12;
legend('[HA]', '[A-]', '[HB]', '[B-]')
title('Concentrations(x,t_f)', 'FontSize', 14);
end

function [c,f,s] = pdefun(x,t,u,dudx)
c = [1;1;1;1];
d = 1;
f = d*dudx;
k1 = 0.8*0.8;
km1 = 0.7*0.2;
s = [-u(1)*u(4)+u(2)*u(3); ... 
      u(1)*u(4)-u(2)*u(3); ...
      u(1)*u(4)-u(2)*u(3); ...
     -u(1)*u(4)+u(2)*u(3)];
end

function u0 = pdeic(x)
u0 = [0;0;0;0];
end

function [pl,ql,pr,qr] = pdebc(xl,ul,xr,ur,t)
pl = [ul(1)-0.7; ul(2)-0.8; ul(3)-0.8; ul(4)-0.2];
ql = [0;0;0;0];
pr = [ur(1)-0.1; ur(2)-0.3; ur(3)-0.3; ur(4)-0.95];
qr = [0;0;0;0];
end
