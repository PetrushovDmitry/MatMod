                                                   
using Plots;
using DifferentialEquations;

N = 17854
I0 = 199
R0 = 35
S0 = N - I0 - R0
a = 0.1
b = 0.2

function F(du, u, p, t)
    S, I, R = u
    du[1] = -a*u[1]
    du[2] = a*u[1] -b * u[2]
    du[3] = b * u[2]
end

x0 = [S0, I0, R0]
ts = (0.0, 80.0)

x = ODEProblem(F, x0, ts)
sol = solve(x, dt = 0.1)

S = [u[1] for u in sol.u]
I = [u[2] for u in sol.u]
R = [u[3] for u in sol.u]
time = [t for t in sol.t]

plot(time, S, label = "S", color = :blue, legend = :top, title = "эпидемия)")
plot!(time, I, label = "I", color = :green)
plot!(time, R, label = "R", color = :red)
savefig("2.png")


