# Verification and limits

- Original plant: `1000 exp(-2.5 s) / (s^4 + 126 s^3 + 2725 s^2 + 12600 s + 1000)`.
- Exact DC gain is **1.0**; the archived report's **0.990211** is an approximation from a finite simulation window, not the exact gain.
- Parameters reported from the original coursework: `K3=0.990211`, `L3=2.698647`, `T3=12.201353`, `T1=12.128868`, `T2=0.063750`. They are *recorded estimates*, not newly fitted estimates.
- Independent SciPy step simulation, sampled from 0 to 60 s with 0.02 s interval: FOPDT RMSE **0.005663**, SOPDT RMSE **0.005250**. These figures depend on the stated sampling window and estimates.
- The submitted Simulink model is retained, but its subsystem configurations and all PID/Smith cases have not been executed in MATLAB in this preparation environment.
- The 25-page submitted report includes time-domain Ziegler–Nichols, frequency-domain Ziegler–Nichols, generalized Ziegler–Nichols, lambda tuning, relay feedback, and Smith prediction. Numerical PID settings are **reported experiments** and are not independently certified as optimal or robust.
- The original report documents oscillatory or unstable behavior for some initial tuning choices. This is a valuable engineering observation, and should not be omitted when comparing controllers.
- No hardware plant or real-time commissioning is represented. This is a simulation and design study.
