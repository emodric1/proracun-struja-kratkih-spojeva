% shema 3 - impedanse kvara
% posebno razmotriti slucaj ako je Y0 singularna matrica
if det(Y0fault) == 0
    Y0fault_1 = Y0fault(1,1);
    Y0fault_235 = [Y0fault(2,2), Y0fault(2,3), Y0fault(2,5);
    Y0fault(3,2), Y0fault(3,3), Y0fault(3,5); 
    Y0fault(5,2), Y0fault(5, 3), Y0fault(5,5)];
    Y0fault_4 = Y0fault(4,4);
    Y0fault_6 = Y0fault(6,6);
    Z0fault_1 = (Y0fault_1)^(-1);
    Z0fault_235 = (Y0fault_235)^(-1);
    Z0fault_4 = (Y0fault_4)^(-1);
    Z0fault_6 = (Y0fault_6)^(-1);
    Z0fault = zeros(size(Y0fault));
    Z0fault(1,1) = Z0fault_1; 
    Z0fault(2,2) = Z0fault_235(1,1); 
    Z0fault(3,3) = Z0fault_235(2,2); 
    Z0fault(4,4) = Z0fault_4; 
    Z0fault(5,5) = Z0fault_235(3,3); 
    Z0fault(6,6) = Z0fault_6;
else 
Z0fault = Y0fault^-1;
end

Z1fault = Y1fault^-1;
Z2fault = Y2fault^-1;