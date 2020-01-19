% proracun se odnosi na shemu 1
% admitansa nakon kvara - direktna
Y1fault = [(1/Zpu_g1d + 1/Zxpu_t1 + 1/Zspu_t1), -1/Zspu_t1, 0, 0;
    -1/Zspu_t1, (1/Zspu_t1 +1/Zxpu_t1 + 1/Zxpu_v1d + 1/Zspu_v1d),
        -1/Zspu_v1d, 0;
    0, -1/Zspu_v1d, (1/Zspu_v1d + 1/Zxpu_v1d+ 1/Zspu_t2 + 1/Zxpu_t2)
        , -1/Zspu_t2;
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
