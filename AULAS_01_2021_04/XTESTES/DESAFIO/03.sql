=================================================================================
==  Criar uma função que deverá receber um valor correspondente à temperatura  ==
==  em graus Fahrenheit e retornar o equivalente em graus Celsius.             ==
==  Fórmula para conversão: C = (F ‐ 32) / 1.8                                 ==
=================================================================================


=======================
===   SITUACAO 01   ===     OK     
=======================

CREATE OR REPLACE FUNCTION CONVERTE_TEMP_FEMC (TEMP_F NUMBER) RETURN NUMBER
IS TEMP_C NUMBER(5,1);
BEGIN 
TEMP_C := (TEMP_F - 32) / 1.8;
RETURN TEMP_C;
END;
/*
Function CONVERTE_TEMP_FEMC compilado
*/

SELECT CONVERTE_TEMP_FEMC(&TEMPERATURA_FAHRENHEIT) FROM DUAL;














































