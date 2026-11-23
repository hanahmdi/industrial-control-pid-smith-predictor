% Archived coursework algorithm (comments removed for English-only portfolio).
% See docs/VALIDATION.md before running.
clc; clear; close all;
s = tf('s');

G = 1000*exp(-2.5*s) / (s^4 + 126*s^3 + 2725*s^2 + 12600*s + 1000);

tEnd = 60; dt = 0.01;
t = (0:dt:tEnd)';
y = squeeze(step(G,t)); y = y(:);

K   = y(end);
y33 = 0.33 * K;
y67 = 0.67 * K;

idx33 = find(y >= y33, 1, 'first');
idx67 = find(y >= y67, 1, 'first');

t33 = t(idx33);
t67 = t(idx67);

figure;
plot(t, y, 'k', 'LineWidth', 2); grid on; hold on;

yline(y33, '--b', '0.33K');
yline(y67, '--r', '0.67K');

xline(t33, ':b', sprintf('t_{33}=%.2f', t33));
xline(t67, ':r', sprintf('t_{67}=%.2f', t67));

title('Step Response with 33% and 67% Levels');
xlabel('Time (s)');
ylabel('Output');

legend('y(t)','0.33K','0.67K','Location','southeast');

fprintf('K   = %.6f\n', K);
fprintf('t33 = %.6f s\n', t33);
fprintf('t67 = %.6f s\n', t67);
