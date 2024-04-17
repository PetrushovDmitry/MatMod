using Plots;
using DifferentialEquations;

function F(du,u,p,t)
a=p
du[1]=u[2]
du[2]= -a*u[1]
end
u0=[0.1,1.1]
p=3.7
t=(0.0, 63.0)
x= ODEProblem(F,u0,t,p)
sol= solve(x, dt=0.05)
gr()
plot(sol, xaxis= "t", lable= "", legend= false, title=" решение уравнения")
savefig("1,1.png")
plot(sol, vars=(2,1), xaxis= "x", yaxis="y", lable= "", legend= false, title=" фазовый портрет")
savefig("1,2.png")

