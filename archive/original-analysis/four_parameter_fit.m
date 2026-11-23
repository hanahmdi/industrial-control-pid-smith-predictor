% Archived coursework algorithm (comments removed for English-only portfolio).
% See docs/VALIDATION.md before running.

clc; clear;

s = tf('s');

K   = 0.990211;
L   = 2.698647;


x0 = [12 0.1];   
opts = optimoptions('fsolve','Display','off');
x = fsolve(@(x)multi2D(x,a,b), x0, opts);

T1 = x(1);
T2 = x(2);

if T2 > T1
    tmp = T1; T1 = T2; T2 = tmp;
end

G4 = tf(K, conv([T1 1],[T2 1]), 'InputDelay', L);

fprintf('T1 = %.6f s\n', T1);
fprintf('T2 = %.6f s\n', T2);
disp('G4(s) ='); disp(G4);

function F = multi2D(x,a,b)
    F(1) = ( x(2)*exp(-a/x(2)) - x(1)*exp(-a/x(1)) )/(x(1)-x(2)) + 0.33;
    F(2) = ( x(2)*exp(-b/x(2)) - x(1)*exp(-b/x(1)) )/(x(1)-x(2)) + 0.67;
end
