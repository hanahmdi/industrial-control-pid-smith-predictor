# Mathematical model and study methods

## Plant

```math
G(s)=\frac{1000e^{-2.5s}}{s^4+126s^3+2725s^2+12600s+1000}
```

The fourth-order dynamics and 2.5-second pure delay make simple PID tuning nontrivial. The exact steady-state unit-step gain is 1.

## Identified models

The three-parameter FOPDT model is

```math
G_3(s)=\frac{K_3 e^{-L_3s}}{T_3s+1}.
```

The four-parameter SOPDT model is

```math
G_4(s)=\frac{K_4e^{-L_4s}}{(T_1s+1)(T_2s+1)}.
```

The parameter values in this repository are transcribed from the original analysis, with independent numerical response comparisons.

## Relay experiment, controller tuning and Smith prediction

The archived simulation and report explore relay feedback for oscillation-point characterization, two classical Ziegler–Nichols approaches, a generalized Ziegler–Nichols setting, a lambda-based PID design, and a Smith predictor using process models. Because actuator saturation, derivative filtering, and model mismatch affect practical behavior, comparative claims require measured metrics under standardized simulations.

## Reproducibility

Run `matlab/run_identification.m` in MATLAB with Control System Toolbox. For numerical checks in Python run `python -m unittest discover -s tests -v`. The images supplied here are independent SciPy calculations, not screenshots of new MATLAB runs.
