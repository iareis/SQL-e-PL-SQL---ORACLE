====================================================================================================
=                                                                                                  =
=    Criar uma funcao que devera receber um numero inteiro e retornar se o mesmo eh primo ou não    =
=    (Lembrete: Numeros primos sao divisiveis somente por eles mesmos e por um).                   = 
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
===   SITUACAO 02   === ERRO
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
===   SITUACAO 03   ===  OK
=======================

2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 
83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 
173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263,
 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349,

CREATE OR REPLACE FUNCTION CONSULTA_PRIMO (V_NUMERO NUMBER) RETURN VARCHAR2
IS  V_PRIMO VARCHAR2(30) := 'Eh um numero PRIMO!';
    V_NPRIMO VARCHAR2(30) := 'NAO Eh um numero PRIMO!';
BEGIN 
    FOR V_DIVISOR IN 2..V_NUMERO-1
    LOOP 
        IF MOD(V_NUMERO,V_DIVISOR) = 0 THEN
            RETURN (V_NPRIMO);
        END IF;        
    END LOOP;
    RETURN (V_PRIMO);
END;
/*
Function CONSULTA_PRIMO compilado
*/


SELECT CONSULTA_PRIMO(&DIGA_UM_NUMERO) FROM DUAL;














