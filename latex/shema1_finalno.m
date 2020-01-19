a = exp(1i * 2 * pi/3);
Icb1_0 = V0fault(1)/Zxpu_t1 + (V0fault(1)-V0fault(2))/Zspu_t1;
Icb1_1 = V1fault(1)/Zxpu_t1 + (V1fault(1)-V1fault(2))/Zspu_t1;
Icb1_2 = V2fault(1)/Zxpu_t1 + (V2fault(1)-V2fault(2))/Zspu_t1;
Icb1_abc = [1 1 1;1 a a^2; 1 a^2 a] * [Icb1_0; Icb1_1; Icb1_2];

Icb2_0 = V0fault(4)/Zxpu_t2 + (V0fault(4)-V0fault(3))/Zspu_t2;
Icb2_1 = V1fault(4)/Zxpu_t2 + (V1fault(4)-V1fault(3))/Zspu_t2;
Icb2_2 = V2fault(4)/Zxpu_t2 + (V2fault(4)-V2fault(3))/Zspu_t2;
Icb2_abc = [1 1 1;1 a a^2; 1 a^2 a] * [Icb2_0; Icb2_1; Icb2_2];

ICB = [Icb1_abc'; Icb2_abc'];
ICB = Ib3.*ICB; % vracanje iz per unit