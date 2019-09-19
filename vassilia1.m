function[a,b]= vassilia1(R,L,C)
V=10/(20*R+j*120*pi*L+(1/(j*120*pi*C)));
Q=sqrt((V^2+5)/(1+j*3*V));
a=abs(Q);
b=angle(Q);

