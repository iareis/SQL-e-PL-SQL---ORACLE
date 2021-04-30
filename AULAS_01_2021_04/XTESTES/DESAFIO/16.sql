=========================================================
===   Criar uma funcao de converter Real em Dolar.    ===
=========================================================

CREATE OR REPLACE FUNCTION F_REAL_DOLAR (MOEDA_BRASIL NUMBER) RETURN NUMBER
IS 
CONV_REAL_DOLAR NUMBER(8,2);
BEGIN 
    CONV_REAL_DOLAR := MOEDA_BRASIL / 5.47;
    DBMS_OUTPUT.PUT_LINE('VALOR EM MOEDA NACIONAL: '||TO_CHAR(MOEDA_BRASIL,'L999G999D99'));
    DBMS_OUTPUT.PUT_LINE('COTACAO DO DOLAR:        '||5.47);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('VALOR EM DOLARES:        '||TO_CHAR(CONV_REAL_DOLAR,'L999G999D99MI','NLS_NUMERIC_CHARACTERS = '',.''NLS_CURRENCY = ''US$'' '));
    RETURN CONV_REAL_DOLAR;
END;




SELECT F_REAL_DOLAR(&MOEDA_BRASIL) FROM DUAL;
















