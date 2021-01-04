# Control Notebooks
Collection of notebooks to help me get better at control. 

The problem is that I want to use discrete time control ('cause anything I make in the real world will use an MCU or an FPGA) on continuous time systems. Mixed signal (hybrid, variable structure) system modelling and simulation generally comes with either a hefty price tag (e.g. Simulink), a lot of abstraction from the model itself (e.g. Simulink) or too mathematical for an electronic engineer (me) to maintain interest in. I figured that if I stuck to state-space representation then numerical integrators should give me decent enough results for educational purposes. Even better would be a tool that wouldn't be too hard to link directly to either C code or VHDL for direct testing of low-level controller implementations. Judge for yourself, but I like the results. I've even used the Scipy approach for testing control solutions with feedback linearisation at my day job.

As it stands I'm clearly messing around with tools more than control methods. Something really attractive about the Julia+DifferentialEquations approach. Please forgive my abuse of programming languages, control theory, numerical methods and markdown.

## Sliding Mode Control
Ever since I came across the concept of [sliding mode control](https://en.wikipedia.org/wiki/Sliding_mode_control) I have really wanted to try it out (rather than spiral endlessly down into the theory). Like a lot of control, the theory is pretty involved but the implementation can be beautifully simple ([Prandtl-Ishlinksii](https://ieeexplore.ieee.org/document/4739202) model is another example). 

* **SlidingModePython.ipynb**<br>
Sliding Mode Control illustrated with a mass-spring-damper. Discrete-time controller with distrubances. ODE solved with **Python** and [**scipy.integrate.ode**](https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.ode.html#scipy.integrate.ode). _Uses the somewhat old API. Really should update this._

* **SlidingModeJulia.ipynb**<br>
Sliding Mode Control illustrated with a mass-spring-damper. Discrete-time controller with distrubances. ODE solved with **Julia** using [**DifferentialEquations.jl**](https://diffeq.sciml.ai/v2.0/).

* **SlideModePluto.jl**<br>
Sliding Mode Control illustrated with a mass-spring-damper. Discrete-time controller with distrubances. ODE solved with **Julia** using **DifferentialEquations.jl**, but using [**Pluto.jl**](https://github.com/fonsp/Pluto.jl) instead of Jupyter (for fun).


