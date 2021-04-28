=========================================================== 
===   Criar uma funcao que dado o numero de minutos     ===
===   retorne o numero de horas correspondente.         ===
=========================================================== 



CREATE OR REPLACE FUNCTION MIN_HOR(
    MIN NUMBER
)RETURN NUMBER
IS
BEGIN 
    RETURN MIN/60;
END MIN_HOR;



SELECT MIN_HOR(&TEMPO_EM_MINUTOS) AS HORAS FROM DUAL;
