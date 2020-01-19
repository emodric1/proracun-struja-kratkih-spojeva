% proracun u nastavku se odnosi na shemu 1
% admitansa kola prije kvara
Y1prefault = [1, 0, 0, 0; 
    (-1/Zspu_t1), (1/Zspu_t1 +1/Zxpu_t1 + 1/Zxpu_v1d + 1/Zspu_v1d),
        (-1/Zspu_v1d), 0;
    0, (-1/Zspu_v1d), (1/Zspu_v1d + 1/Zxpu_v1d+ 1/Zspu_t2 + 1/Zxpu_t2),
        (-1/Zspu_t2);
    0, 0, 0, 1];

% struja direktne komponente prije kvara
I1prefault=[1;0;0;1];

% naponi prije kvara
V1prefault=Y1prefault^(-1)*I1prefault; %Thevenenov napon 
V0prefault=zeros(size(V1prefault));
V2prefault=zeros(size(V1prefault));