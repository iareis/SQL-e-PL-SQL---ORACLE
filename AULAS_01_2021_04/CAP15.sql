-----------------------------------------
--  INTERAGINDO COM O SERVIDOR ORACLE  --
-----------------------------------------

SELECT * FROM TCURSO;

DECLARE 
    vVALOR  NUMBER(8,2);
    vNOME   VARCHAR2(30);
BEGIN 
    SELECT  VALOR, NOME 
    INTO    vVALOR, vNOME
    FROM    TCURSO
    WHERE   COD_CURSO = &COD_CURSO;
    DBMS_OUTPUT.PUT_LINE('Valor: '||TO_CHAR(vVALOR, 'FM9999.99'));
    DBMS_OUTPUT.PUT_LINE('Curso: '||INITCAP(vNOME));
END;
/*o & (e comercial) faz abrir uma caixa solicitando informar a solicitação*/





SELECT * FROM TCONTRATO;

DECLARE 
    vDT_COMPRA  TCONTRATO.DATA%TYPE;
    vDT_CURSO   TCONTRATO.DATA%TYPE;
BEGIN
    SELECT  DATA, DATA + 10
    INTO    vDT_COMPRA, vDT_CURSO
    FROM    TCONTRATO
    WHERE   COD_CONTRATO = &CONTRATO;
    DBMS_OUTPUT.PUT_LINE('Data Compra: '||vDT_COMPRA);
    DBMS_OUTPUT.PUT_LINE('Data Curso: '||vDT_CURSO);
END;






SELECT * FROM TCONTRATO;

SELECT MAX(COD_CONTRATO) FROM TCONTRATO;
CREATE SEQUENCE SEQ_CONTRATO START WITH 15;

DECLARE 
    vCOD    TCONTRATO.COD_CONTRATO%TYPE;
BEGIN 
    SELECT  SEQ_CONTRATO.NEXTVAL
    INTO    vCOD FROM DUAL;

    INSERT INTO TCONTRATO(COD_CONTRATO, DATA, COD_ALUNO, DESCONTO)
    VALUES(vCOD, SYSDATE, 2, NULL);
    DBMS_OUTPUT.PUT_LINE('Criado Contrato: '||vCOD);
END;

-- PEGAR O VALOR ATUAL
SELECT SEQ_CONTRATO.CURRVAL FROM DUAL;

SELECT * FROM TCONTRATO;






-- UPDATE
DECLARE 
    vVALOR  TCURSO.VALOR%TYPE := &VALOR;
    /*o valor terá o mesmo tipo da coluna VALOR na tabela TCURSO*/
BEGIN 
    UPDATE TCURSO SET 
    VALOR = VALOR + vVALOR
    WHERE CARGA_HORARIA >= 30;
END;

-- 

DECLARE 
    vVALOR  TCURSO.VALOR%TYPE := &VALOR;
    /*o valor terá o mesmo tipo da coluna VALOR na tabela TCURSO*/
BEGIN 
    UPDATE TCURSO SET 
    VALOR = VALOR + vVALOR
    WHERE CARGA_HORARIA BETWEEN 1 AND 80;
END;

SELECT * FROM TCURSO;







-- DELETE
SELECT * FROM TCONTRATO;

DECLARE 
    vCONTRATO   TCONTRATO.COD_CONTRATO%TYPE := &CONTRATO;
BEGIN 
    DELETE FROM TCONTRATO
    WHERE COD_CONTRATO = vCONTRATO;
END;

SELECT * FROM TCONTRATO;








-- EXEMPLO DE COMO NÃO SE DEVE FAZER, POIS RETORNA UM
-- ERRO NO_DATA_FOUND
-- SELECT INTO que não encontra registros
DECLARE 
    vDT_COMPRA  TCONTRATO.DATA%TYPE;
    vTOTAL      TCONTRATO.TOTAL%TYPE;
    vDT_ATUAL   DATE := SYSDATE;
BEGIN 
    SELECT  DATA, TOTAL
    INTO    vDT_COMPRA, vTOTAL
    FROM    TCONTRATO
    WHERE   DATA = vDT_ATUAL;
END;
/*01403. 00000 -  "no data found"
*Cause:    No data was found from the objects.
*Action:   There was no data from the objects which may be due to end of fetch.*/







--
DECLARE 
    vCONTRATO   NUMBER := &COD_CONTRATO;
    vTEXTO      VARCHAR(50);
BEGIN 
    UPDATE TCONTRATO SET 
    DESCONTO = DESCONTO - 2
    WHERE COD_CONTRATO >= vCONTRATO;

    vTEXTO := SQL%ROWCOUNT;
    /* Retorna a quantidade de registros afetados pelo comando SQL */

    DBMS_OUTPUT.PUT_LINE(vTEXTO||' linhas atualizadas.');
END;

SELECT * FROM TCONTRATO;







































































































































































































































































































































































































































































































































