% Archived coursework algorithm (comments removed for English-only portfolio).
% See docs/VALIDATION.md before running.

 
clc; clear; close all;
s = tf('s');

G = 1000*exp(-2.5*s) / (s^4 + 126*s^3 + 2725*s^2 + 12600*s + 1000);

tEnd = 60;  dt = 0.01;


K = y(end);
dy = gradient(y, dt);

idxStart = find(t >= 1, 1, 'first');       
[~, idxRel] = max(dy(idxStart:end));
idx = idxStart + idxRel - 1;              

t0 = t(idx);   y0 = y(idx);   m = dy(idx);  
L  = t0 - (y0/m);                           

y_tan = m*(t - t0) + y0;
y63 = 0.632*K;
idx63 = find(y >= y63, 1, 'first');
t63 = t(idx63);


fprintf('K   = %.6f\n', K);
fprintf('L   = %.6f s\n', L);
fprintf('t63 = %.6f s\n', t63);
fprintf('T   = t63 - L = %.6f s\n', t63 - L);


figure;
plot(t,y,'LineWidth',2); grid on; hold on;
plot(t,y_tan,'--','LineWidth',1.5);
yline(K,'--','K');
yline(y63,':','0.632K');
xline(L,':','L (tangent)');
xline(t63,':','t_{63}');
title('Step response ');
xlabel('Time (s)'); ylabel('y(t)');
legend('y(t)','tangent','Location','southeast');
