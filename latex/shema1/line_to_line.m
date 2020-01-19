I0_fault_mk=0;
I1_fault_mk=V1th_mjestokvara/(z1th_mjestokvara+z2th_mjestokvara+Zf);
I2_fault_mk=-1*I1_fault_mk;

I0_fault = zeros(size(Y0fault,1),1);
I1_fault = I0_fault;
I2_fault = I0_fault;
I0_fault(mjesto_kvara) = -1*I0_fault_mk;
I1_fault(mjesto_kvara) = -1*I1_fault_mk;
I2_fault(mjesto_kvara) = -1*I2_fault_mk;

deltaV0=((Y0fault)^(-1))*I0_fault;
deltaV1=((Y1fault)^(-1))*I1_fault;
deltaV2=((Y2fault)^(-1))*I2_fault;

V0fault=V0prefault+deltaV0;
V1fault=V1prefault+deltaV1;
V2fault=V2prefault+deltaV2;
    