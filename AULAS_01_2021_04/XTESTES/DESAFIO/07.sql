===========================================================
===   Criar um bloco PL/SQL para imprimir a sequência   ===
===      de Fibonacci: 1 1 2 3 5 8 13 21 34 55          ===
===========================================================

É uma sucessão de números que, misteriosamente, aparece em muitos fenômenos da natureza.
Descrita no final do século 12 pelo italiano Leonardo Fibonacci, ela é infinita e começa
com 0 e 1.

Os números seguintes são sempre a soma dos dois números anteriores.
Portanto, depois de 0 e 1, vêm 1, 2, 3, 5, 8, 13, 21, 34, 55 ... 

=============================================================================================

DECLARE
    VALOR_1 NUMBER(6) := 0;
    VALOR_2 NUMBER(6) := 1;
BEGIN 
    FOR NUM_CASAS IN 0..10
    LOOP 
    VALOR_1 = VALOR_1 + VALOR_2;
    DBMS_OUTPUT.PUT_LINE(VALOR_1);
    END LOOP;
END;















dECLARE  
V_A NUMBER(2) := 1;  
V_B NUMBER(2) := 1;  
V_C NUMBER(2) := 0; 

BEGIN  
FOR V_I IN 1..11 
LOOP   
    V_A := V_B;   
    V_B := V_C;   
    DBMS_OUTPUT.PUT_LINE(V_C);   
    V_C := V_A + V_B;  
END LOOP;
END;








































