===================================================
===   CALCULO DO IPI                            ===
===   Imposto sobre Produtos Industrializados   ===
===================================================

Exemplo de Calculo do IPI
O IPI e calculado tendo como base a aliquota descrita na TIPI.
Para industrias, o Imposto sobre Produtos Industrializados e calculado 
em relacao ao valor da nota fiscal da mercadoria despachada. 

A NF pode eventualmente incluir valores sobre o frete e despesas como juros, 
taxas, entre outras.

Valor do IPI = Base de calculo * (Aliquota / 100)

Sendo que:

Base de calculo = (Valor do produto + Frete + Seguro + Outras Despesas Acessorias)

Observando a formula, você vera que descontos nao sao considerados na 
base de calculo do IPI. Isso significa que se forem dados descontos 
quando o produto sofre tributacao do IPI a empresa pagara tributos 
sobre a parte que sofreu desconto. Por isso, descontos nesse caso 
nao sao uma boa ideia. O melhor a fazer, nesta situacao, e reduzir 
o preco unitario do item.

Importante tambem destacar que o valor do IPI e somado ao valor total 
do produto na linha da NF-e.

=============================================================================

CREATE TABLE BASE_CALC_IPI(
    COD_BASE_CALC   INTEGER NOT NULL,
    VALOR_PRODUTO   NUMBER(8,2),
    FRETE           NUMBER(8,2),
    SEGURO          NUMBER(8,2), 
    OUTRAS_DESP     NUMBER(8,2),
    ALIQUOTA        NUMBER(3,2) DEFAULT 0.17,
    VALOR_IPI       NUMBER(8,2),
    TOTAL_DA_NOTA   NUMBER(8,2),
    CONSTRAINT      PK_BASE_IPI PRIMARY KEY(COD_BASE_CALC)
);
/*
Table BASE_CALC_IPI criado.
Decorrido: 00:00:02.225
*/





CREATE OR REPLACE PROCEDURE PRO_CALC_IPI(
    P_COD_BASE_CALC   IN BASE_CALC_IPI.COD_BASE_CALC%TYPE,
    P_VALOR_PRODUTO   IN BASE_CALC_IPI.VALOR_PRODUTO%TYPE,
    P_FRETE           IN BASE_CALC_IPI.FRETE%TYPE,
    P_SEGURO          IN BASE_CALC_IPI.SEGURO%TYPE,
    P_ALIQUOTA        IN BASE_CALC_IPI.ALIQUOTA%TYPE,
    P_OUTRAS_DESP     IN BASE_CALC_IPI.OUTRAS_DESP%TYPE)
AS 
    V_ALIQUOTA BASE_CALC_IPI.ALIQUOTA%TYPE;
    V_VALOR_IPI BASE_CALC_IPI.VALOR_IPI%TYPE;
    V_BASE_CALCULO BASE_CALC_IPI.VALOR_IPI%TYPE;
    V_VALOR_TOTAL_DA_NOTA BASE_CALC_IPI.VALOR_IPI%TYPE;
BEGIN
    V_ALIQUOTA := P_ALIQUOTA;
    V_BASE_CALCULO := P_VALOR_PRODUTO + P_FRETE + P_SEGURO + P_OUTRAS_DESP;
    V_VALOR_IPI := V_BASE_CALCULO * (V_ALIQUOTA/100);
    V_VALOR_TOTAL_DA_NOTA := V_BASE_CALCULO + V_VALOR_IPI;
    IF P_COD_BASE_CALC >= 1 THEN
        INSERT INTO BASE_CALC_IPI (COD_BASE_CALC,VALOR_PRODUTO,FRETE,SEGURO,OUTRAS_DESP,ALIQUOTA,VALOR_IPI,TOTAL_DA_NOTA)
        VALUES (P_COD_BASE_CALC,P_VALOR_PRODUTO,P_FRETE,P_SEGURO,P_OUTRAS_DESP,V_ALIQUOTA,V_VALOR_IPI,V_VALOR_TOTAL_DA_NOTA);
        DBMS_OUTPUT.PUT_LINE('VALOR DO PRODUTO: '||P_VALOR_PRODUTO);
        DBMS_OUTPUT.PUT_LINE('VALOR DO FRETE:   '||P_FRETE);
        DBMS_OUTPUT.PUT_LINE('VALOR DO SEGURO:  '||P_SEGURO);
        DBMS_OUTPUT.PUT_LINE('OUTRAS DESPESAS:  '||P_OUTRAS_DESP);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------');
        DBMS_OUTPUT.PUT_LINE('ALICOTA 2021:     '||P_ALIQUOTA*100||'%');
        DBMS_OUTPUT.PUT_LINE('IPI CALCULADO:    '||V_VALOR_IPI);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------');
        DBMS_OUTPUT.PUT_LINE('TOTAL DA NOTA:    '||TO_CHAR(V_VALOR_TOTAL_DA_NOTA,'L999G999D99'));
    END IF;
END PRO_CALC_IPI;
/*
Procedure PRO_CALC_IPI compilado
Decorrido: 00:00:00.427
*/





BEGIN 
PRO_CALC_IPI(1,1000,200,250,.17,220);
END;
/*
VALOR DO PRODUTO: 1000
VALOR DO FRETE:   200
VALOR DO SEGURO:  250
OUTRAS DESPESAS:  220
-------------------------------------
ALICOTA 2021:     17%
IPI CALCULADO:    2,84
-------------------------------------
TOTAL DA NOTA:    1672,84

Procedimento PL/SQL concluído com sucesso.
Decorrido: 00:00:00.030
*/




SELECT * FROM BASE_CALC_IPI;
/*
COD_BASE_CALC   VALOR_PRODUTO   FRETE   SEGURO   OUTRAS_DESP   ALIQUOTA   VALOR_IPI   
               1             1000      200       250            220        0,17         2,84 
Decorrido: 00:00:00.036
*/

===================================================================================
--TABULANDO VALOR TOTAL DA NOTA COM TO_CHAR(V_VALOR_TOTAL_DA_NOTA,'L999G999D99')
===================================================================================
/*
Procedure PRO_CALC_IPI compilado
Decorrido: 00:00:00.081
*/

BEGIN 
PRO_CALC_IPI(2,1500,278,350,.17,222);
END;
/*
Decorrido: 00:00:00.081
VALOR DO PRODUTO: 1500
VALOR DO FRETE:   278
VALOR DO SEGURO:  350
OUTRAS DESPESAS:  222
-------------------------------------
ALICOTA 2021:     17%
IPI CALCULADO:    4
-------------------------------------
TOTAL DA NOTA:               R$2.354,00

Procedimento PL/SQL concluído com sucesso.
Decorrido: 00:00:00.032
*/


===================================================================================
--INSERINDO O TOTAL DA NOTA
===================================================================================

BEGIN 
PRO_CALC_IPI(1,1000,200,250,.17,220);
END;

BEGIN 
PRO_CALC_IPI(2,1500,278,350,.17,222);
END;

BEGIN 
PRO_CALC_IPI(3,500,178,350,.17,222);
END;

BEGIN 
PRO_CALC_IPI(4,2500,578,300,.17,111);
END;

BEGIN 
PRO_CALC_IPI(5,400,78,125,.17,333);
END;

BEGIN 
PRO_CALC_IPI(6,3700,1278,750,.17,444);
END;

BEGIN 
PRO_CALC_IPI(7,1135,207,50,.17,555);
END;



SELECT * FROM BASE_CALC_IPI;
/*
COD_BASE_CALC   VALOR_PRODUTO   FRETE   SEGURO   OUTRAS_DESP   ALIQUOTA   VALOR_IPI   TOTAL_DA_NOTA   
               1             1000      200       250            220        0,17         2,84          1672,84 
               2             1500      278       350            222        0,17            4             2354 
               3              500      178       350            222        0,17         2,13          1252,13 
               4             2500      578       300            111        0,17         5,93          3494,93 
               5              400       78       125            333        0,17         1,59           937,59 
               6             3700     1278       750            444        0,17        10,49          6182,49 
               7             1135      207        50            555        0,17         3,31          1950,31 

7 linhas selecionadas. 
Decorrido: 00:00:00.014
*/












































































