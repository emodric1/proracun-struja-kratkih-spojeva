a = exp(1i * 2 * pi/3);
Icb1_0 = V0fault(1)/Zxpu_t1 + (V0fault(1)-V0fault(2))/Zspu_t1;
Icb1_1 = V1fault(1)/Zxpu_t1 + (V1fault(1)-V1fault(2))/Zspu_t1;
Icb1_2 = V2fault(1)/Zxpu_t1 + (V2fault(1)-V2fault(2))/Zspu_t1;
Icb1_abc = [1 1 1;1 a a^2; 1 a^2 a] * [Icb1_0; Icb1_1; Icb1_2];


ICB = [Icb1_abc'];
ICB = Ib4.*ICB;