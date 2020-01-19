% diskretizacija sistema i prikaz u prostoru stanja
Ts = 0.01
K = 0.05;
s = tf('s');
G = K/s;
Gz = c2d (G, Ts);
PS = ss(Gz);
A = PS.a;
B = PS.b;
C = PS.c;
D = PS.d;