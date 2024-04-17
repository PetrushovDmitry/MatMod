Real x;
Real y;
Real a = 0.12;
Real b = 0.9;
Real c = 0.3;
Real h = 0.1;
Real t = time;

initial equation
x = 100000;
y = 10000;

equation
der(x) = -a*x - b*y + abs(cos(t + 2));
der(y) = -c*x*y - h*y + abs(sin(t + 2));

end model1;


