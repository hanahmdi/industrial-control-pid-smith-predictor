%% Industrial Process Identification and Model Comparison
% Reproducible baseline analysis. MATLAB Control System Toolbox required.
clear; close all; clc;
s = tf('s');
P = tf(1000, [1 126 2725 12600 1000], 'InputDelay', 2.5);
K = dcgain(P); % Exact DC gain = 1; finite-time response is not the true DC gain.
% Parameter estimates recorded in the original project (not re-estimated here):
K3 = 0.990211; L3 = 2.698647; T3 = 12.201353;
K4 = 0.990211; L4 = 2.698647; T1 = 12.128868; T2 = 0.063750;
P3 = tf(K3,[T3 1],'InputDelay',L3);
P4 = tf(K4,conv([T1 1],[T2 1]),'InputDelay',L4);
t = (0:0.02:60)';
y = step(P,t); y3 = step(P3,t); y4 = step(P4,t);
rmse3 = sqrt(mean((y-y3).^2));
rmse4 = sqrt(mean((y-y4).^2));
fprintf('Original system DC gain: %.6f\n',K);
fprintf('3-param RMSE: %.6f\n4-param RMSE: %.6f\n',rmse3,rmse4);
figure('Name','Identified model comparison');
plot(t,y,'k','LineWidth',2);hold on;plot(t,y3,'b--','LineWidth',1.5);
plot(t,y4,'r-.','LineWidth',1.5);grid on;
xlabel('Time (s)');ylabel('Output');title('Original and Identified Models');
legend('Original plant','FOPDT (3 parameters)','SOPDT (4 parameters)','Location','southeast');
figure('Name','Model error');
plot(t,y-y3,'b',t,y-y4,'r','LineWidth',1.5);grid on;
xlabel('Time (s)');ylabel('Response error');
legend('Original minus FOPDT','Original minus SOPDT');
