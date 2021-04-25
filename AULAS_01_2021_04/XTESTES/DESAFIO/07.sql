===========================================================
===   Criar um bloco PL/SQL para imprimir a sequencia   ===
===      de Fibonacci: 1 1 2 3 5 8 13 21 34 55          ===
===========================================================

Eh uma sucessao de numeros que, misteriosamente, aparece em muitos fenomenos da natureza.
Descrita no final do século 12 pelo italiano Leonardo Fibonacci, ela eh infinita e começa
com 0 e 1.

Os numeros seguintes sao sempre a soma dos dois numeros anteriores.
Portanto, depois de 0 e 1, vem 1, 2, 3, 5, 8, 13, 21, 34, 55 ... 

=============================================================================================

DECLARE
    V_PRIMEIRO NUMBER := 0;
    V_SEGUNDO NUMBER := 1;
    V_PROXIMO NUMBER;
    V_SEQUENCIA NUMBER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE(V_PRIMEIRO);
    DBMS_OUTPUT.PUT_LINE(V_SEGUNDO);
    ---
    FOR V_SEQUENCIA IN 2..10
    ---
    LOOP
        V_PROXIMO := V_PRIMEIRO + V_SEGUNDO;
        V_PRIMEIRO := V_SEGUNDO;
        V_SEGUNDO := V_PROXIMO;
        DBMS_OUTPUT.PUT_LINE(V_PROXIMO);
    END LOOP;
    END;


