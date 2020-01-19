% kompenzacioni naponi za svaki cvor i sve tri komponente
% shema 2
if det(Y0fault)==0    
    deltaV0_1 = (Y0fault_1)^(-1)*I0_fault(1);
    deltaV0_2345 = (Y0fault_2345)^(-1)*I0_fault([2,3,4,5],:); 
    deltaV0_6 = (Y0fault_6)^(-1)*I0_fault(6);
    deltaV0 = zeros(size(Y0fault),1);
    deltaV0(1) = deltaV0_1; deltaV0(2) = deltaV0_2345(1); 
    deltaV0(3) = deltaV0_2345(2); deltaV0(4) = deltaV0_2345(3);
    deltaV0(5) = deltaV0_2345(4); deltaV0(6) = deltaV0_6;

else
    deltaV0=((Y0fault)^(-1))*I0_fault;
end

% shema 3
if det(Y0fault)==0
    deltaV0_1 = (Y0fault_1)^(-1)*I0_fault(1);
    deltaV0_235 = (Y0fault_235)^(-1)*I0_fault([2,3,5],:); 
    deltaV0_4 = (Y0fault_4)^(-1)*I0_fault(4);
    deltaV0_6 = (Y0fault_6)^(-1)*I0_fault(6);
    deltaV0 = zeros(size(Y0fault,1),1);
    deltaV0(1) = deltaV0_1; deltaV0(2) = deltaV0_235(1); 
    deltaV0(3) = deltaV0_235(2); deltaV0(4) = deltaV0_4; 
    deltaV0(5) = deltaV0_235(3); deltaV0(6) = deltaV0_6;

else
    deltaV0=((Y0fault)^(-1))*I0_fault;
end

% nastavak za obje sheme
deltaV1=((Y1fault)^(-1))*I1_fault;
deltaV2=((Y2fault)^(-1))*I2_fault;

% naponi u toku kvara
V0fault=V0prefault+deltaV0;
V1fault=V1prefault+deltaV1;
V2fault=V2prefault+deltaV2;