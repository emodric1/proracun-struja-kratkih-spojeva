
% usvajamo tri bazna nivoa
Vb1 = Vng2; Vb2 = Vng1; Vb3 = Vnt1_2;

% bazne impedanse za tri naponska nivoa
Zb1 = Vb1^2/Sb; Zb2 = Vb2^2/Sb; Zb3 = Vb3^2/Sb;
% snaga svakog potrosaca/generatora u PU - G1, G2
Spu_g1 = Sng1/Sb;
Spu_g2 = Sng2/Sb;
% pu napona cvorova

%vod vnv1
Zsv1=Rv1*lv1+1i*Xv1*lv1;
Zxv1=-1i * 1/(2*pi*f*Cv1);

% bazne struje
Ib1 = Sb/(sqrt(3)*Vb1); Ib2 = Sb/(sqrt(3)*Vb2); Ib3 = Sb/(sqrt(3)*Vb3);
% linija
Zspu_v1d = Zsv1/Zb3; 
Zxpu_v1d = Zxv1/Zb3; 
Zspu_v1n = 3*Zsv1/Zb3; 
Zxpu_v1n = 3*Zxv1/Zb3;

% Z generatora
Zpu_g1d = 1i * (Xdg1 * Vng1 * Vng1)/(Sng1 * Zb2);
Zpu_g1n = 1i * (Xng1 * Vng1 * Vng1)/(Sng1 * Zb2);
Zpu_g1i = 1i * (Xig1 * Vng1 * Vng1)/(Sng1 * Zb2);

Zpu_g2d = 1i * (Xdg2 * Vng2 * Vng2)/(Sng2 * Zb1);
Zpu_g2n = 1i * (Xng2 * Vng2 * Vng2)/(Sng2 * Zb1);
Zpu_g2i = 1i * (Xig2 * Vng2 * Vng2)/(Sng2 * Zb2);

% Z transformatora
In_t1 = Snt1/Vnt1_2;
Zxpu_t1 = (Pfe_t1/(Io_t1*Io_t1) + 1i*sqrt(Vnt1_2*Vnt1_2/(Io_t1*Io_t1)
    - (Pfe_t1/(Io_t1*Io_t1))^2))/Zb3;
Zspu_t1 = (Pcu_t1/(In_t1*In_t1) + 1i*sqrt((Ukt1*Vnt1_2/In_t1)^2 
    - (Pcu_t1/(In_t1*In_t1))^2))/Zb3;

In_t2 = Snt2/Vnt2_2;
Zxpu_t2 = (Pfe_t2/(Io_t2*Io_t2) + 1i*sqrt(Vnt2_2*Vnt2_2/(Io_t2*Io_t2)
    - (Pfe_t2/(Io_t2*Io_t2))^2))/Zb3;
Zspu_t2 = (Pcu_t2/(In_t2*In_t2) + 1i*sqrt((Ukt2*Vnt2_2/In_t2)^2
    - (Pcu_t2/(In_t2*In_t2))^2))/Zb3;

%Kvar
if mjesto_kvara==1
    Zpu_f = Zf/Zb2;
elseif mjesto_kvara == 2 || mjesto_kvara == 3
    Zpu_f = Zf/Zb3;
else Zpu_f = Zf/Zb1;
end



% admitansa kola
Y1prefault = [1, 0, 0, 0; 
    (-1/Zspu_t1), (1/Zspu_t1 +1/Zxpu_t1 + 1/Zxpu_v1d + 1/Zspu_v1d)
        , (-1/Zspu_v1d), 0; 
    0, (-1/Zspu_v1d), (1/Zspu_v1d + 1/Zxpu_v1d+ 1/Zspu_t2 + 1/Zxpu_t2),
        (-1/Zspu_t2);     
    0, 0, 0, 1];

% admitansa nakon kvara - direktna
Y1fault = [(1/Zpu_g1d + 1/Zxpu_t1 + 1/Zspu_t1), -1/Zspu_t1, 0, 0;
    -1/Zspu_t1, (1/Zspu_t1 +1/Zxpu_t1 + 1/Zxpu_v1d + 1/Zspu_v1d),
        -1/Zspu_v1d, 0;
    0, -1/Zspu_v1d, (1/Zspu_v1d + 1/Zxpu_v1d+ 1/Zspu_t2 + 1/Zxpu_t2),
        -1/Zspu_t2;
    0, 0,  -1/Zspu_t2, (1/Zpu_g2d + 1/Zxpu_t2 + 1/Zspu_t2)];

% admitansa nakon kvara - inverzna
Y2fault = [(1/Zpu_g1i + 1/Zxpu_t1 + 1/Zspu_t1), -1/Zspu_t1, 0, 0;
    -1/Zspu_t1, (1/Zspu_t1 +1/Zxpu_t1 + 1/Zxpu_v1d + 1/Zspu_v1d),
        -1/Zspu_v1d, 0;
    0, -1/Zspu_v1d, (1/Zspu_v1d + 1/Zxpu_v1d+ 1/Zspu_t2 + 1/Zxpu_t2),
        -1/Zspu_t2;
    0, 0,  -1/Zspu_t2, (1/Zpu_g2i + 1/Zxpu_t2 + 1/Zspu_t2)];

% admitansa nakon kvara - nulta
Y0fault = [1/Zpu_g1n, 0, 0, 0;     
    0, (1/Zxpu_t1 + 1/Zxpu_v1n + 1/Zspu_v1n), -1/Zspu_v1n, 0;
    0, -1/Zspu_v1n, (1/Zspu_v1n + 1/Zxpu_v1n + 1/Zxpu_t2), 0;
    0, 0, 0, 1/Zpu_g2n];

I1prefault=[1;0;0;1];
V1prefault=Y1prefault^(-1)*I1prefault; %Thevenenov napon 
V0prefault=zeros(size(V1prefault));
V2prefault=zeros(size(V1prefault));

% Thevenenov napon na mjestu kvaras
V1th_mjestokvara = V1prefault(mjesto_kvara);

% impedanse kvara
Z0fault = Y0fault^(-1);
Z1fault = Y1fault^(-1);
Z2fault = Y2fault^(-1);

% ekv thevenova impedansa
z0th_mjestokvara = Z0fault(mjesto_kvara, mjesto_kvara);
z1th_mjestokvara = Z1fault(mjesto_kvara, mjesto_kvara);
z2th_mjestokvara = Z2fault(mjesto_kvara, mjesto_kvara);
