

%rj 
Vn = [Vng1 Vnt1_2 Vnt2_2 Vnt3_2 Vnt2_1 Vnt3_1]; % cvorovi
% usvajamo cetiri bazna nivoa
Vb1 = Vnt3_1; Vb2 = Vng1; Vb3 = Vnt2_1; Vb4 = Vnt1_2;
% bazne impedanse za ?etiri naponska nivoa
Zb1 = Vb1^2/Sb; Zb2 = Vb2^2/Sb; Zb3 = Vb3^2/Sb; Zb4 = Vb4^2/Sb;
% snaga svakog potrosaca/generatora u PU - G1
Spu_g1 = Sng1/Sb; Spu_p1 = Snp1/Sb; Spu_p2=Snp2/Sb;

% bazne struje
Ib1 = Sb/(sqrt(3)*Vb1); Ib2 = Sb/(sqrt(3)*Vb2); Ib3 = Sb/(sqrt(3)*Vb3); Ib3 = Sb/(sqrt(3)*Vb3);Ib4 = Sb/(sqrt(3)*Vb4);

% linija 
%vod 1
Zsv1=Rv1*lv1+1i*Xv1*lv1;
Zxv1=-1i * 1/(2*pi*f*Cv1);
Zspu_v1d = Zsv1/Zb4; 
Zxpu_v1d = Zxv1/Zb4; 
Zspu_v1n = 3*Zsv1/Zb4; 
Zxpu_v1n = 3*Zxv1/Zb4;
%vod2
Zsv2=Rv2*lv2+1i*Xv2*lv2;
Zxv2=-1i * 1/(2*pi*f*Cv2);
Zspu_v2d = Zsv2/Zb4; 
Zxpu_v2d = Zxv2/Zb4; 
Zspu_v2n = 3*Zsv2/Zb4; 
Zxpu_v2n = 3*Zxv2/Zb4;

% Z generatora
Zpu_g1d = 1i * (Xdg1 * Vng1 * Vng1)/(Sng1 * Zb2);
Zpu_g1n = 1i * (Xng1 * Vng1 * Vng1)/(Sng1 * Zb2);
Zpu_g1i = 1i * (Xig1 * Vng1 * Vng1)/(Sng1 * Zb2);

%Zpotrošaèa
Zpu_p1=(Vnp1^2/Snp1)/Zb3;
Zpu_p2=(Vnp2^2/Snp2)/Zb1;

% Z transformatora
In_t1 = Snt1/Vnt1_2;
Zxpu_t1 = (Pfe_t1/(Io_t1*Io_t1) + 1i*sqrt(Vnt1_2*Vnt1_2/(Io_t1*Io_t1) - (Pfe_t1/(Io_t1*Io_t1))^2))/Zb4;
Zspu_t1 = (Pcu_t1/(In_t1*In_t1) + 1i*sqrt((Ukt1*Vnt1_2/In_t1)^2 - (Pcu_t1/(In_t1*In_t1))^2))/Zb4;

In_t2 = Snt2/Vnt2_2;
Zxpu_t2 = (Pfe_t2/(Io_t2*Io_t2) + 1i*sqrt(Vnt2_2*Vnt2_2/(Io_t2*Io_t2) - (Pfe_t2/(Io_t2*Io_t2))^2))/Zb4;
Zspu_t2 = (Pcu_t2/(In_t2*In_t2) + 1i*sqrt((Ukt2*Vnt2_2/In_t2)^2 - (Pcu_t2/(In_t2*In_t2))^2))/Zb4;

In_t3 = Snt3/Vnt3_2;
Zxpu_t3 = (Pfe_t3/(Io_t3*Io_t3) + 1i*sqrt(Vnt3_2*Vnt3_2/(Io_t3*Io_t3) - (Pfe_t3/(Io_t3*Io_t3))^2))/Zb4;
Zspu_t3 = (Pcu_t3/(In_t3*In_t3) + 1i*sqrt((Ukt3*Vnt3_2/In_t3)^2 - (Pcu_t3/(In_t3*In_t3))^2))/Zb4;

%kvar
if mjesto_kvara==1
    Zpu_f = Zf/Zb2;
elseif mjesto_kvara == 2 || mjesto_kvara == 3 || mjesto_kvara == 4
    Zpu_f = Zf/Zb4;
elseif mjesto_kvara == 5
    Zpu_f = Zf/Zb3;
else Zpu_f = Zf/Zb1;
end


% admitansa kola - direktno
Y1prefault = [1, 0, 0, 0, 0, 0;
    -1/Zspu_t1, (1/Zspu_t1 + 1/Zxpu_t1 + 1/Zspu_v1d  + 1/Zxpu_v1d + 1/Zspu_v2d + 1/Zxpu_v2d), -1/Zspu_v1d, -1/Zspu_v2d, 0, 0;  
    0, -1/Zspu_v1d, (1/Zspu_v1d + 1/Zxpu_v1d + 1/Zspu_t2 + 1/Zxpu_t2), 0, -1/Zspu_t2, 0; 
    0, -1/Zspu_v2d, 0, (1/Zspu_v2d + 1/Zxpu_v2d + 1/Zxpu_t3 + 1/Zspu_t3), 0, -1/Zspu_t3; 
    0, 0, -1/Zspu_t2, 0, (1/Zxpu_t2 + 1/Zspu_t2 + 1/Zpu_p1), 0; 
    0, 0, 0, -1/Zspu_t3, 0, 1/Zxpu_t3 + 1/Zspu_t3 + 1/Zpu_p2];


% admitansa nakon kvara - direktna
Y1fault = [(1/Zpu_g1d + 1/Zxpu_t1 + 1/Zspu_t1), -1/Zspu_t1, 0, 0, 0, 0;
    -1/Zspu_t1, (1/Zspu_t1 + 1/Zxpu_t1 + 1/Zspu_v1d  + 1/Zxpu_v1d + 1/Zspu_v2d + 1/Zxpu_v2d), -1/Zspu_v1d, -1/Zspu_v2d, 0, 0;  
    0, -1/Zspu_v1d, (1/Zspu_v1d + 1/Zxpu_v1d + 1/Zspu_t2 + 1/Zxpu_t2), 0, -1/Zspu_t2, 0; 
    0, -1/Zspu_v2d, 0, (1/Zspu_v2d + 1/Zxpu_v2d + 1/Zxpu_t3 + 1/Zspu_t3), 0, -1/Zspu_t3; 
    0, 0, -1/Zspu_t2, 0, (1/Zxpu_t2 + 1/Zspu_t2 + 1/Zpu_p1), 0; 
    0, 0, 0, -1/Zspu_t3, 0, (1/Zxpu_t3 + 1/Zspu_t3 + 1/Zpu_p2)];


% admitansa nakon kvara - inverzna
Y2fault = [(1/Zpu_g1i + 1/Zxpu_t1 + 1/Zspu_t1), -1/Zspu_t1, 0, 0, 0, 0;
    -1/Zspu_t1, (1/Zspu_t1 + 1/Zxpu_t1 + 1/Zspu_v1d  + 1/Zxpu_v1d + 1/Zspu_v2d + 1/Zxpu_v2d), -1/Zspu_v1d, -1/Zspu_v2d, 0, 0;  
    0, -1/Zspu_v1d, (1/Zspu_v1d + 1/Zxpu_v1d + 1/Zspu_t2 + 1/Zxpu_t2), 0, -1/Zspu_t2, 0; 
    0, -1/Zspu_v2d, 0, (1/Zspu_v2d + 1/Zxpu_v2d + 1/Zxpu_t3 + 1/Zspu_t3), 0, -1/Zspu_t3; 
    0, 0, -1/Zspu_t2, 0, (1/Zxpu_t2 + 1/Zspu_t2 + 1/Zpu_p1), 0; 
    0, 0, 0, -1/Zspu_t3, 0, (1/Zxpu_t3 + 1/Zspu_t3 + 1/Zpu_p2)];

% admitansa nakon kvara - nulta
%Y0fault = [1/Zpu_g1n, 0, 0, 0, 0, 0; 0, 1/Zxpu_t1 + 1/Zpu_v1n + 1/Zpu_v2n, -1/Zpu_v1n, -1/Zpu_v2n, 0, 0;  0, -1/Zpu_v1n, 1/Zpu_v1n + 1/Zspu_t2, 0, -1/Zspu_t2, 0; 0, -1/Zpu_v2n, 0, 1/Zpu_v2n + 1/Zxpu_t3, 0, 0; 0, 0, -1/Zspu_t2, 0, 1/Zspu_t2, 0; 0, 0, 0, 0, 0, 0]
Y0fault = [1/Zpu_g1n, 0, 0, 0, 0, 0;
    0, (1/Zxpu_t1 + 1/Zspu_v1n  + 1/Zxpu_v1n + 1/Zspu_v2n + 1/Zxpu_v2n), -1/Zspu_v1n, -1/Zspu_v2n, 0, 0;  
    0, -1/Zspu_v1n, (1/Zspu_v1n + 1/Zxpu_v1n + 1/Zspu_t2), 0, -1/Zspu_t2, 0; 
    0, -1/Zspu_v2n, 0, (1/Zspu_v2n + 1/Zxpu_v2n + 1/Zxpu_t3), 0, 0; 
    0, 0, -1/Zspu_t2, 0, (1/Zspu_t2 + 1/Zpu_p1), 0; 
    0, 0, 0, 0, 0, 1/Zpu_p2];

Iprefault=[1;0;0;0;0;0];
V1prefault=Y1prefault^(-1)*Iprefault;%Thevenenov napon 
V0prefault=zeros(size(V1prefault));
V2prefault=zeros(size(V1prefault));

% Thevenenov napon na mjestu kvara
V1th_mjestokvara = V1prefault(mjesto_kvara);
% impedanse kvara
% posebno razmotriti slucaj ako je Y0 singularna matrica
if det(Y0fault) == 0
    Y0fault_1 = Y0fault(1,1);
    Y0fault_2345 = [Y0fault(2,2), Y0fault(2,3), Y0fault(2,4), Y0fault(2,5); Y0fault(3,2), Y0fault(3,3), Y0fault(3,4), Y0fault(3,5); Y0fault(4,2), Y0fault(4,3), Y0fault(4,4), Y0fault(4,5); Y0fault(5,2), Y0fault(5, 3), Y0fault(5, 4), Y0fault(5,5)];
    Y0fault_6 = Y0fault(6,6);
    Z0fault_1 = (Y0fault_1)^(-1);
    Z0fault_2345 = (Y0fault_2345)^(-1);
    Z0fault_6 = (Y0fault_6)^(-1);
    Z0fault = zeros(size(Y0fault));
    Z0fault(1,1) = Z0fault_1; Z0fault(2,2) = Z0fault_2345(1,1); Z0fault(3,3) = Z0fault_2345(2,2); Z0fault(4,4) = Z0fault_2345(3,3); Z0fault(5,5) = Z0fault_2345(4,4); Z0fault(6,6) = Z0fault_6;
else 
Z0fault = Y0fault^-1;
end

Z1fault = Y1fault^-1;
Z2fault = Y2fault^-1;

% ekv thevenova impedansa
z0th_mjestokvara = Z0fault(mjesto_kvara, mjesto_kvara);
z1th_mjestokvara = Z1fault(mjesto_kvara, mjesto_kvara);
z2th_mjestokvara = Z2fault(mjesto_kvara, mjesto_kvara);