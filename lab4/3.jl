using Plots;
using DifferentialEquations;

function F(du,u,p,t)
a,b=p
du[1]=u[2]
du[2]= -a*du[1]-b*u[1]+ 0.9*sin(0.9*t)
end
u0=[0.1,1.1]
p=[3,11]
t=(0.0, 63.0)
x= ODEProblem(F,u0,t,p)
sol= solve(x, dt=0.05)
gr()
plot(sol, xaxis= "t", lable= "", legend= false, title=" решение уравнения")
savefig("3,1.png")
plot(sol, vars=(2,1), xaxis= "x", yaxis="y", lable= "", legend= false, title=" фазовый портрет")
savefig("3,2.png")


