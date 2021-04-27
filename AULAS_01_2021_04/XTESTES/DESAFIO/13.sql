=============================================================
===   Dado um salario X calcule o salario liquido,        ===
===   sendo que os descontos de IRPF ocorrem conforme a   ===
===   tabela IRPF.                                        ===
=============================================================

CREATE TABLE IPRF_2021(
    COD_IPRF INTEGER NOT NULL,
    FAIXA_BASE_CAL NUMBER(8,2),
    ALIQUOTA NUMBER(3,1),
    CONSTRAINT PK_IRPF PRIMARY KEY (COD_IPRF)
);

INSERT INTO IRPF_2021 VALUES (1,1903.98,0);         --Até R$ 1.903,98: isento.
INSERT INTO IRPF_2021 VALUES (1,2826.65,7.5);       --De R$ 1.903,99 até R$ 2.826,65: 7,5%
INSERT INTO IRPF_2021 VALUES (1,3751.05,15);        --De R$ 2.826,66 até R$ 3.751,05: 15%
INSERT INTO IRPF_2021 VALUES (1,4664.68,22.5);      --De R$ 3.751,06 até R$ 4.664,68: 22,5%
INSERT INTO IRPF_2021 VALUES (1,4664.69,27.5);      --Acima de R$ 4.664,68: 27,5%

===
