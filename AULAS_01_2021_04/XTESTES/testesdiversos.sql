DECLARE 
    TYPE NOME_TYPE IS TABLE OF TALUNO.NOME%TYPE;
    NOME_TABLE NOME_TYPE := NOME_TYPE(); --CRIANDO INSTANCIA
BEGIN 
    NOME_TABLE.EXTEND; --ALOCANDO UMA NOVA LINHA
    NOME_TABLE(1) := &table1;
    NOME_TABLE.EXTEND; --ALOCANDO UMA NOVA LINHA
    NOME_TABLE(2) := &table2;
    DBMS_OUTPUT.PUT_LINE('NOME 1: '||NOME_TABLE(1));   
    DBMS_OUTPUT.PUT_LINE('NOME 2: '||NOME_TABLE(2));
END;  
/*
Relatório de erros -
ORA-06550: linha 6, coluna 22:
PLS-00201: o identificador 'MARCO' deve ser declarado
ORA-06550: linha 6, coluna 5:
PL/SQL: Statement ignored
ORA-06550: linha 8, coluna 22:
PLS-00201: o identificador 'RADOMILE' deve ser declarado
ORA-06550: linha 8, coluna 5:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:
*/ 

DECLARE 
    TYPE NOME_TYPE IS TABLE OF TALUNO.NOME%TYPE;
    NOME_TABLE NOME_TYPE := NOME_TYPE(); --CRIANDO INSTANCIA
BEGIN 
    NOME_TABLE.EXTEND; --ALOCANDO UMA NOVA LINHA
    NOME_TABLE(1) := 'MARCO';
    NOME_TABLE.EXTEND; --ALOCANDO UMA NOVA LINHA
    NOME_TABLE(2) := 'RADOMILE';
    DBMS_OUTPUT.PUT_LINE('NOME 1: '||NOME_TABLE(1));   
    DBMS_OUTPUT.PUT_LINE('NOME 2: '||NOME_TABLE(2));
END;
/*
NOME 1: MARCO
NOME 2: RADOMILE


Procedimento PL/SQL concluído com sucesso.
*/



DECLARE 
    vCOD_ALUNO  TALUNO.COD_ALUNO%TYPE;
    vNOME       TALUNO.NOME%TYPE;
    CURSOR C1 IS 
        SELECT COD_ALUNO, NOME
        FROM TALUNO;
BEGIN 
    OPEN C1;
    LOOP 

        FETCH C1 INTO vCOD_ALUNO, vNOME;
        DBMS_OUTPUT.PUT_LINE('CODIGO: '||LPAD(vCOD_ALUNO,4,'0')||' - '||'Nome: '||vNOME);
        EXIT    WHEN C1%ROWCOUNT >= 10
                OR C1%NOTFOUND;
    END LOOP;
    CLOSE C1;
END;




CREATE OR REPLACE PROCEDURE AUMENTA_PRECOCURSO(pCOD_CURSO NUMBER)
IS 
--VARIAVEIS AQUI COLOCADAS, MAS NESTE EXEMPLO NÃO TEM
BEGIN 
    --AUMENTAR O VALOR DE UM CURSO EM 10%
    UPDATE TCURSO SET 
    VALOR = VALOR * 1.1
    WHERE COD_CURSO = pCOD_CURSO;
END;

EXEC AUMENTA_PRECOCURSO(&COD);

SELECT * FROM TCURSO;



-- =====================================================================================

CREATE OR REPLACE PROCEDURE PHONE_NUMBER
(P_FONE IN OUT VARCHAR2)
IS 
BEGIN 
    P_FONE := '( '||SUBSTR(P_FONE, 0, 2)||') '||SUBSTR(P_FONE, 2, 5)||'-'||SUBSTR(P_FONE, 7, 4);
END;
/*
Procedure PHONE_NUMBER compilado
*/



DECLARE
    V_FONE VARCHAR2(20);
BEGIN 
    V_FONE := &NUMERO_CELULAR;
    PHONE_NUMBER(V_FONE);
    DBMS_OUTPUT.PUT_LINE(V_FONE);
END;

-- =====================================================================================



































