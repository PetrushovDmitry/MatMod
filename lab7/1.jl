using Plots;
using DifferentialEquations;
N=761
N0=6

function F(du,u,p,t)
(n)=u
du[1]=(0.82+0.00003*u[1])*(N-u[1])
end
x0=[N0]
ts=(0.0,100.0)
x=ODEProblem(F,x0,ts)
sol=solve(x, dt=0.1)
n=[u[1] for u in sol.u]
T=[t for t in sol.t]
plot(T,n,legend=false,title="реклама")
savefig("1.png")
