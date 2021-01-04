# Control Notebooks
Collection of notebooks to help me get better at control.

As it stands clearly I'm messing around with tools more than control methods. Something really attractive about the Julia+DifferentialEquations approach.

Please forgive my abuse of programming languages, control theory, numerical methods and markdown.

## Sliding Mode Control
Ever since I came across the concept of [sliding mode control](https://en.wikipedia.org/wiki/Sliding_mode_control) I have really wanted to try it out (rather than spiral endlessly down into the theory). Like a lot of control, the theory is pretty involved but the implementation can be beautifully simple ([Prandtl-Ishlinksii](https://ieeexplore.ieee.org/document/4739202) model is another example). The problem is that I want to use discrete time control ('cause anything I make in the real world will use an MCU or an FPGA). Mixed signal (hetergeneous) system modelling and simulation generally comes with a big price tag, but I thought if I stuck to state-space representation then surely numerical integrators should give me a decent prototype. Judge for yourself, but I like the results. I've even used the Scipy approach for testing non-linear control solutions at my day job.

* **SlidingModePython.ipynb**<br>
Sliding Mode Control illustrated with a mass-spring-damper. Discrete-time controller with distrubances. ODE solved with **Python** and [**scipy.integrate.ode**](https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.ode.html#scipy.integrate.ode). _Uses the somewhat old API. Really should update this._

* **SlidingModeJulia.ipynb**<br>
Sliding Mode Control illustrated with a mass-spring-damper. Discrete-time controller with distrubances. ODE solved with **Julia** using [**DifferentialEquations.jl**](https://diffeq.sciml.ai/v2.0/).

* **SlideModePluto.jl**<br>
Sliding Mode Control illustrated with a mass-spring-damper. Discrete-time controller with distrubances. ODE solved with **Julia** using **DifferentialEquations.jl**, but using [**Pluto.jl**](https://github.com/fonsp/Pluto.jl) instead of Jupyter (for fun).


