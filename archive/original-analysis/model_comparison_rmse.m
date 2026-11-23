% Archived coursework algorithm (comments removed for English-only portfolio).
% See docs/VALIDATION.md before running.

clc; clear; close all;
s = tf('s');

G_raw = 1000*exp(-2.5*s) / (s^4 + 126*s^3 + 2725*s^2 + 12600*s + 1000);

K_sys = dcgain(G_raw);
G = G_raw / K_sys;

K3 = 0.990211;
L3 = 2.698647;
T3 = 12.201353;
G3 = tf(K3, [T3 1], 'InputDelay', L3);

K4 = 0.990211;
L4 = 2.698647;
T1 = 12.128868;
T2 = 0.063750;
G4 = tf(K4, conv([T1 1],[T2 1]), 'InputDelay', L4);

tEnd = 60; dt = 0.01;
t = (0:dt:tEnd)';

y  = squeeze(step(G,  t)); y  = y(:);
y3 = squeeze(step(G3, t)); y3 = y3(:);
y4 = squeeze(step(G4, t)); y4 = y4(:);

figure;
plot(t,y,'k','LineWidth',2); grid on; hold on;
plot(t,y3,'b--','LineWidth',2);
plot(t,y4,'r-.','LineWidth',2);
legend('Original system','3-part model','4-part model','Location','southeast');
title('Step Response Comparison');
xlabel('Time (s)'); ylabel('Output');

figure;
plot(t, y - y3, 'b', 'LineWidth', 1.6); grid on; hold on;
plot(t, y - y4, 'r', 'LineWidth', 1.6);
yline(0,'--');
legend('Error: Original - 3part','Error: Original - 4part','Location','best');
title('Error Comparison');
xlabel('Time (s)'); ylabel('Error');

rmse3 = sqrt(mean((y - y3).^2));
rmse4 = sqrt(mean((y - y4).^2));
fprintf('RMSE(3-part) = %.6f\n', rmse3);
fprintf('RMSE(4-part) = %.6f\n', rmse4);
