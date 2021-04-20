======================================
===   FUNÇÕES DE BANCOS DE DADOS   ===
======================================

o retorno de uma FUNCTION é definido pela clausula RETURN  

======================================

CREATE OR REPLACE FUNCTION CONSULTA_PRECO
(pCOD_CURSO NUMBER) RETURN NUMBER
AS 
    vVALOR NUMBER;
BEGIN 
    SELECT VALOR INTO vVALOR FROM TCURSO
    WHERE COD_CURSO = pCOD_CURSO;

    RETURN(vVALOR);
END;



--TESTE | USANDO FUNCTION
DECLARE 
    vCOD NUMBER := &CODIGO;
    vVALOR NUMBER;
BEGIN 
    vVALOR := CONSULTA_PRECO(vCOD);
    DBMS_OUTPUT.PUT_LINE('PRECO DO CURSO: '||vVALOR);
END;
 
=========================================================

CREATE OR REPLACE FUNCTION EXISTE_ALUNO
(pCOD_ALUNO IN TALUNO.COD_ALUNO%TYPE)
RETURN BOOLEAN
IS 
    vALUNO NUMBER(10);
BEGIN 
    SELECT COD_ALUNO
    INTO vALUNO
    FROM TALUNO
    WHERE COD_ALUNO = pCOD_ALUNO;
    RETURN (TRUE);
EXCEPTION 
    WHEN OTHERS THEN
        RETURN(FALSE);
END;


DECLARE 
    vCODIGO INTEGER := &CODIGO;
BEGIN 
    IF EXISTE_ALUNO(vCODIGO) THEN
        DBMS_OUTPUT.PUT_LINE('CODIGO ENCONTRADO');
    ELSE
        DBMS_OUTPUT.PUT_LINE('CODIGO NAO ENCONTRADO');
    END IF;
END;


CREATE OR REPLACE PROCEDURE CADASTRA_ALUNO(
    pCOD_ALUNO  IN TALUNO.COD_ALUNO%TYPE,
    pNOME       IN TALUNO.NOME%TYPE,
    pCIDADE     IN TALUNO.CIDADE%TYPE,
    pESTADO     IN TALUNO.ESTADO%TYPE)
IS 
BEGIN 
    IF (NOT EXISTE_ALUNO(pCOD_ALUNO)) THEN
        INSERT INTO TALUNO(COD_ALUNO, NOME, CIDADE, ESTADO)
        VALUES(pCOD_ALUNO, pNOME, pCIDADE, pESTADO);
    END IF;
END;



DECLARE
BEGIN 
    CADASTRA_ALUNO(SEQ_ALUNO.NEXTVAL, 'ROBERTO', 'CUIABA', 'MT');
    DBMS_OUTPUT.PUT_LINE('ALUNO CADASTRADO COM SUCESSO');
END;

/*
ABAIXO APENAS MAIS ALGUNS DADOS PARA INSERIR

DECLARE
BEGIN 
    CADASTRA_ALUNO(SEQ_ALUNO.NEXTVAL, 'RADOMILE', 'SAO PAULO', 'SP');
    DBMS_OUTPUT.PUT_LINE('ALUNO CADASTRADO COM SUCESSO');
END;

DECLARE
BEGIN 
    CADASTRA_ALUNO(SEQ_ALUNO.NEXTVAL, 'PETRY', 'SAO JOSE', 'SC');
    DBMS_OUTPUT.PUT_LINE('ALUNO CADASTRADO COM SUCESSO');
END;

DECLARE
BEGIN 
    CADASTRA_ALUNO(SEQ_ALUNO.NEXTVAL, 'DIOGENES', 'TERESINA', 'PI');
    DBMS_OUTPUT.PUT_LINE('ALUNO CADASTRADO COM SUCESSO');
END;

DECLARE
BEGIN 
    CADASTRA_ALUNO(SEQ_ALUNO.NEXTVAL, 'REINALDO', 'TERESINA', 'PI');
    DBMS_OUTPUT.PUT_LINE('ALUNO CADASTRADO COM SUCESSO');
END;

DECLARE
BEGIN 
    CADASTRA_ALUNO(SEQ_ALUNO.NEXTVAL, 'DIEGO', 'PASSO FUNDO', 'RS');
    DBMS_OUTPUT.PUT_LINE('ALUNO CADASTRADO COM SUCESSO');
END;
*/

SELECT * FROM TALUNO ORDER BY COD_ALUNO;


























































































































