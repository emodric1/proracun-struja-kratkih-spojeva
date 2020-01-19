I0_fault_mk=0;
I1_fault_mk=V1th_mjestokvara/(z1th_mjestokvara+Zf);
I2_fault_mk=0;

I0_fault = zeros(size(Y0fault,1),1);
I1_fault = I0_fault;
I2_fault = I0_fault;
I0_fault(mjesto_kvara) = -1*I0_fault_mk;
I1_fault(mjesto_kvara) = -1*I1_fault_mk;
I2_fault(mjesto_kvara) = -1*I2_fault_mk;
