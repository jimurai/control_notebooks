## Python environment set up
Open an Anaconda  prompt and execute the following commands while saying yes to
every prompt.

```
conda create -n control python=3.6
conda install -n control scipy
conda install -n control matplotlib
conda install -n control jupyter
```

## Julia environment set up
Julia is probably unlike any other tool you've used before. Because it is JIT it
takes a while to compile anything the first time you run it. It also needs to
download things as you install them. This means you will probably be waiting 
longer than you expect. Please be patient and don't get too frustrated at slow
initial progress - it'll get better!

Download Julia from here [here](https://julialang.org/downloads/).
The latest tested version is 0.6.2 x64.

First tell Julia to using the "control" Python environment.
```
ENV["PYTHON"] = string(ENV["HOME"],"AppData\\Local\\Continuum\\Anaconda3\\envs\\control\\python")
Pkg.build("PyCall")
```

Next set up the Julia Jupyter notebook to use the same environment as before
```
ENV["JUPYTER"] = string(ENV["HOME"],"AppData\\Local\\Continuum\\Anaconda3\\envs\\control\\Scripts\\jupyter")
Pkg.add("IJulia")
```

And now differential equations.
```
Pkg.add("DifferentialEquations")
```

If this repository is checked out to your home directory then you can start the
notebook from the Julia REPL as follows.
```
using IJulia
notebook()
```
