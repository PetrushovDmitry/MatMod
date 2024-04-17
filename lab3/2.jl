using Plots;
using DifferentialEquations;
function F(du,u,p,t)
du[1]= -0.25*u[1]-0.96*u[2]+ abs(sin(2*t)+1)
du[2]= -0.25*u[1]*u[2]-0.3*u[2]+ abs(cos(20*t)+1)
end
const N= Float64[100000, 10000]
const time=[0.0, 2.0]
x= ODEProblem(F,N, time)
sol= solve(x, dt=0.0001)
a1= [u[1] for u in sol.u]
a2= [u[2] for u in sol.u]
T= [ t for t in sol.t]
mp= plot(xaxis= "время", yaxis = "число", label = ["x","y"], title= " модель боевых действий")
plot!(mp,T,a1, label= "X", color=:red)
plot!(mp,T,a2, label= "Y", color=:blue)

savefig(mp, "2.png")

