===============================================
===   Criar uma funcao que dado um salario  ===
===   retorne o numero de salarios minimos  === 
===   que a pessoa ganha.                   ===
===============================================

/*
Em 1º de janeiro de 2021, o salário mínimo subiu de R$ 1.045 para 1.100.
*/


CREATE OR REPLACE FUNCTION SALARIO_MINIMO(
    SALARIO NUMBER
) RETURN NUMBER
IS 
NUM_SAL_MINIMOS NUMBER(8,2);
BEGIN 
    NUM_SAL_MINIMOS := SALARIO/1100;
    RETURN NUM_SAL_MINIMOS;
END;




SELECT SALARIO_MINIMO(&QUAL_SALARIO) AS QTDE_SAL_MIN FROM DUAL;
