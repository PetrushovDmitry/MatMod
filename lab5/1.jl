using Plots;
using DifferentialEquations;

a= 0.38
b= 0.043
c=0.36
d=0.052

ss=[c/d,a/b]
x0=[6,23]
function F(du,u,p,t)
x,y=u
du[1]=-a*u[1]+b*u[1]*u[2]
du[2]=c*u[2]-d*u[1]*u[2]
end
t=[0.0,400.0]
x=ODEProblem(F,x0,t)
sol= solve(x,dt=0.1)
plot(sol, label="", legend=false,title= "зависимость изменения хищников и жертв")
savefig("1.png")
plot(sol,idxs=(1,2),xaxis="x",yaxis="y", label="", legend=false,title= "зависимость хищников от жертв")
savefig("2.png")
v=ODEProblem(F,ss,t)
sol=solve(v, dt=0.1)
plot(sol,idxs=(1,2),xaxis="x",yaxis="y", label="", legend=false,title= "стационарное состояние")
savefig("3.png")



