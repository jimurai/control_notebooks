### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 971fc5f0-1c52-11eb-27da-43003bbda193
begin
	using DifferentialEquations
	using Plots
end

# ╔═╡ 79e6b4e0-1c56-11eb-30a7-b78aa49dc552
function msd_sys(du,u,p,t)
  # Manual implementation of state transition matrix
  du[1] = u[2]
  du[2] = -p[1]*u[1] - p[2]*u[2]
  
  # Add acceleration due to gravity
  du[2] += p[3]
    
  # Add disturbance in the force
  du[2] +=  p[4]*sin(p[5]*t)
    
  # Add control input
  du[2] += p[6]
end

# ╔═╡ 943468fe-1c56-11eb-07ed-9d4f3578e7c6
begin
	g = 9.8 # gravity in metres per second per second
	mass = 0.1
	k_s = 2.5 # spring constant
	k_d = 0.1 # damping coefficient

	u0 = [-1., 0.]

	f_smc = 10.0

	p_simple = [k_s/mass, k_d/mass, g, 0, 0, 0]
	p_dist = [k_s/mass, k_d/mass, g, 5., 10., 0]
	p_smc = [k_s/mass, k_d/mass, g, 5., 10., 0.]

	tspan = (0.0,10.0)
end

# ╔═╡ a705ea40-1c56-11eb-1a72-136337ca099f
function smc_affect!(msd_ss_model)
    sigma = 20.0*msd_ss_model.u[1] + 1.0*msd_ss_model.u[2]
    if sigma < 0
        msd_ss_model.p[6] = +f_smc/mass
    else
        msd_ss_model.p[6] = -f_smc/mass
    end
end

# ╔═╡ b9fb9550-1c56-11eb-1080-b7ec4f1598fe
pcb = PeriodicCallback(smc_affect!, 10/10000)

# ╔═╡ b0c2973e-1c56-11eb-063b-cf48350c9806
begin
	prob_simple = ODEProblem(msd_sys,u0,tspan,p_simple)
	prob_dist = ODEProblem(msd_sys,u0,tspan,p_dist)
	prob_smc = ODEProblem(msd_sys,u0,tspan,p_smc)
end

# ╔═╡ dbb46550-1c56-11eb-32c5-3dd9bceda11a
begin
    raw_sol = solve(prob_simple,Tsit5());
    dist_sol = solve(prob_dist,Tsit5());
    smc_sol = solve(prob_smc,Tsit5(),callback=pcb);
end

# ╔═╡ fc2b3f70-1c56-11eb-1322-b9d6b5728032
begin
	plot(raw_sol,vars=(0,1),w=1,label="Raw", layout = (2,1), subplot=1)
	plot!(dist_sol,vars=(0,1),w=1,label="Disturbed")
	plot!(smc_sol,vars=(0,1),w=1,label="SMC")
	plot!(raw_sol,vars=(1,2),w=1,label="Raw",subplot=2)
	plot!(dist_sol,vars=(1,2),w=1,label="Disturbed",subplot=2)
	plot!(smc_sol,vars=(1,2),w=1,label="SMC",subplot=2,xlim=(-1.1,+1.5),ylim=(-5,11))
end

# ╔═╡ Cell order:
# ╠═971fc5f0-1c52-11eb-27da-43003bbda193
# ╠═79e6b4e0-1c56-11eb-30a7-b78aa49dc552
# ╠═943468fe-1c56-11eb-07ed-9d4f3578e7c6
# ╠═a705ea40-1c56-11eb-1a72-136337ca099f
# ╠═b9fb9550-1c56-11eb-1080-b7ec4f1598fe
# ╠═b0c2973e-1c56-11eb-063b-cf48350c9806
# ╠═dbb46550-1c56-11eb-32c5-3dd9bceda11a
# ╠═fc2b3f70-1c56-11eb-1322-b9d6b5728032
