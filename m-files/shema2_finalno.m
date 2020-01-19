if det(Y0fault)==0    
    deltaV0_1 = (Y0fault_1)^(-1)*I0_fault(1);
    deltaV0_2345 = (Y0fault_2345)^(-1)*I0_fault([2,3,4,5],:); 
    deltaV0_6 = (Y0fault_6)^(-1)*I0_fault(6);
    deltaV0 = zeros(size(Y0fault),1);
    deltaV0(1) = deltaV0_1; deltaV0(2) = deltaV0_2345(1); deltaV0(3) = deltaV0_2345(2); deltaV0(4) = deltaV0_2345(3); deltaV0(5) = deltaV0_2345(4); deltaV0(6) = deltaV0_6;

else
    deltaV0=((Y0fault)^(-1))*I0_fault;
end
deltaV1=((Y1fault)^(-1))*I1_fault;
deltaV2=((Y2fault)^(-1))*I2_fault;

V0fault=V0prefault+deltaV0;
V1fault=V1prefault+deltaV1;
V2fault=V2prefault+deltaV2;


a = exp(1i * 2 * pi/3);
Icb1_0 = V0fault(1)/Zxpu_t1 + (V0fault(1)-V0fault(2))/Zspu_t1;
Icb1_1 = V1fault(1)/Zxpu_t1 + (V1fault(1)-V1fault(2))/Zspu_t1;
Icb1_2 = V2fault(1)/Zxpu_t1 + (V2fault(1)-V2fault(2))/Zspu_t1;
Icb1_abc = [1 1 1;1 a a^2; 1 a^2 a] * [Icb1_0; Icb1_1; Icb1_2];


ICB = [Icb1_abc'];
ICB = Ib4.*ICB;
Icb1a=ICB(1,1);
Icb1b=ICB(1,2);
Icb1c=ICB(1,3);