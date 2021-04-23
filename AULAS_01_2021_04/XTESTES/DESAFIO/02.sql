====================================================================================================
=                                                                                                  =
=    Criar uma função que deverá receber um número inteiro e retornar se o mesmo é primo ou não    =
=    (Lembrete: Números primos são divisíveis somente por eles mesmos e por um).                   = 
=                                                                                                  =
====================================================================================================


=======================
===   SITUACAO 01   === ERRADA POIS NELA TODOS OS NÚMEROS SÃO PRIMOS
=======================

CREATE OR REPLACE FUNCTION CONSULTA_PRIMO (V_NUMBER INTEGER) RETURN VARCHAR2
IS 
    V_PERGUNTA NUMBER(10);
---
BEGIN
    V_NUMBER := &NUMBER;
    IF MOD(V_NUMBER, V_NUMBER) = 0 AND MOD(V_NUMBER, 1) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(V_NUMBER||' EH UM NUMERO PRIMO!');
    ELSE
        DBMS_OUTPUT.PUT_LINE(V_NUMBER||' NAO EH UM NUMERO PRIMO!');
    END IF;
---
END;

DECLARE
    V_NUMBER INTEGER := &NUMBER;
---
BEGIN 
    IF MOD(V_NUMBER, V_NUMBER) = 0 AND
       MOD(V_NUMBER, 1) = 0 AND
       MOD(V_NUMBER, V_NUMBER-1) != 0 THEN
        DBMS_OUTPUT.PUT_LINE(V_NUMBER||' EH UM NUMERO PRIMO!');
    ELSE
        DBMS_OUTPUT.PUT_LINE(V_NUMBER||' NAO EH UM NUMERO PRIMO!');
    END IF;
---
END;


=======================
===   SITUACAO 02   === 
=======================

CREATE OR REPLACE FUNCTION CONSULTA_PRIMO (V_RESPOSTA NUMBER) RETURN VARCHAR2
IS  V_DIVIDENDO NUMBER(6);
    V_DIVISOR NUMBER(6);
    V_RESPOSTA VARCHAR2(20);
BEGIN 
    FOR V_DIVISOR IN 2..V_DIVIDENDO*2
    LOOP 
        CASE 
            WHEN MOD(V_DIVIDENDO,V_DIVISOR) = 0 AND V_DIVIDENDO != V_DIVISOR THEN
                DBMS_OUTPUT.PUT_LINE(V_DIVIDENDO||' NÃO é um número PRIMO!');
            WHEN MOD(V_DIVIDENDO,V_DIVISOR) = 0 AND V_DIVIDENDO = V_DIVISOR THEN
                DBMS_OUTPUT.PUT_LINE(V_DIVIDENDO||' É um número PRIMO!');
        END CASE;        
    END LOOP;
    RETURN V_RESPOSTA;
END;


DECLARE
    V_NUMBER NUMBER := &NUMERO;
BEGIN 
    V_RESPOSTA := CONSULTA_PRIMO(V_NUMBER);
    DBMS_OUTPUT.PUT_LINE(V_RESPOSTA);
END;


=======================
===   SITUACAO 03   === 
=======================

CREATE OR REPLACE FUNCTION CONSULTA_PRIMO (V_RESPOSTA NUMBER) RETURN VARCHAR2
IS  V_DIVIDENDO NUMBER(6);
    V_DIVISOR NUMBER(6);
    V_RESPOSTA VARCHAR2(20);
BEGIN 
    FOR V_DIVISOR IN 2..V_DIVIDENDO*2
    LOOP 
        IF MOD(V_DIVIDENDO,V_DIVISOR) = 0 AND V_DIVIDENDO != V_DIVISOR THEN
            DBMS_OUTPUT.PUT_LINE(V_DIVIDENDO||' NÃO é um número PRIMO!');
        ELSE MOD(V_DIVIDENDO,V_DIVISOR) = 0 AND V_DIVIDENDO = V_DIVISOR THEN
            DBMS_OUTPUT.PUT_LINE(V_DIVIDENDO||' É um número PRIMO!');
        END IF;        
    END LOOP;
    RETURN V_RESPOSTA;
END;


DECLARE
    V_NUMBER NUMBER := &NUMERO;
BEGIN 
    V_RESPOSTA := CONSULTA_PRIMO(V_NUMBER);
    DBMS_OUTPUT.PUT_LINE(V_RESPOSTA);
END;














