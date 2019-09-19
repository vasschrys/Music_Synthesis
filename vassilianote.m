function [note] =vassilianote(keynumber,duration)
h=[1,0.04,0.99,0.12,0.53,0.11,0.26,0.05,0.24,0.07,0.02,0.03,0.02,0.03]
f=27.5*2^((keynumber-1)/12);
N=ceil(duration*44100);
n=1:N;
note=0;
for k=1:14
    note=note+h(k)*cos(2*pi*f*k*n/44100);
end
tv=[0.085,0.075,0.04];
G=[0.007,0.003,0.007];
e(1)= 0;
for  n=2:ceil(N/2)
    e(n)=tv(1)*G(1)+(1-G(1))*e(n-1);
end 
for n=ceil(n/4)+1:ceil(2*N/5)
    e(n)=tv(2)*G(2)+(1-G(2))*e(n-1);
end 
for n=ceil(5*n/5)+1:N
    e(n)=tv(3)*G(3)+(1-G(3))*e(n-1);
end
note=note.*e;
plot(e)
