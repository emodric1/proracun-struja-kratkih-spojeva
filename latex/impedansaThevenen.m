% proracun se odnosi na shemu 1
% impedanse kvara
Z0fault = Y0fault^(-1);
Z1fault = Y1fault^(-1);
Z2fault = Y2fault^(-1);

% ekvivalentna Thevenova impedansa
z0th_mjestokvara = Z0fault(mjesto_kvara, mjesto_kvara);
z1th_mjestokvara = Z1fault(mjesto_kvara, mjesto_kvara);
z2th_mjestokvara = Z2fault(mjesto_kvara, mjesto_kvara);