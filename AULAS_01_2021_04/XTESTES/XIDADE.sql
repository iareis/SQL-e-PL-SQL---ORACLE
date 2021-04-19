DECLARE 
    VIDADE TALUNO.NASCIMENTO%TYPE;
    VDT_NASCEU TALUNO.NASCIMENTO%TYPE;
    VDT_HOJE DATE := TRUNC(SYSDATE);
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE    :=  &CODIGO;
BEGIN
    SELECT  NASCIMENTO 
    INTO    VDT_NASCEU
    FROM    TALUNO
    WHERE   COD_ALUNO = VCOD_ALUNO;
    --VIDADE := TO_DATE(VDT_HOJE - VDT_NASCEU);
    VIDADE := VDT_HOJE - VDT_NASCEU;
    Dbms_Output.Put_Line(VIDADE);
END;
/*
Relatório de erros -
ORA-06550: linha 12, coluna 15:
PLS-00382: a expressão é do tipo incorreto
ORA-06550: linha 12, coluna 5:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*/

==============================================================

SELECT NASCIMENTO FROM TALUNO;


DECLARE 
    -- =========================================
    TYPE rec_ALUNO IS RECORD(
        COD_ALUNO   NUMBER NOT NULL := &CODIGO,
        NOME        TALUNO.NOME%TYPE,
        CIDADE      TALUNO.CIDADE%TYPE,
        NASCIMENTO  TALUNO.NASCIMENTO%TYPE);
    -- =========================================
    VDT_HOJE DATE := SYSDATE;
    REG rec_ALUNO;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Codigo: '||REG.COD_ALUNO);
    DBMS_OUTPUT.PUT_LINE('  Nome: '||REG.NOME);
    DBMS_OUTPUT.PUT_LINE('Cidade: '||REG.CIDADE);
    -- =========================================
    DBMS_OUTPUT.PUT_LINE('Data Mascimento: '||REG.NASCIMENTO);
END;
/*
Codigo: 5
  Nome: 
Cidade: 
Data Mascimento: 


Procedimento PL/SQL concluído com sucesso.
*/

==============================================================

DECLARE 
    -- =========================================
    REG TALUNO%ROWTYPE; --RECORD
    -- =========================================
BEGIN
    SELECT COD_ALUNO, NOME, CIDADE, NASCIMENTO
    INTO REG.COD_ALUNO, REG.NOME, REG.CIDADE, REG.NASCIMENTO
    FROM TALUNO
    WHERE COD_ALUNO = &CODIGO;
    -- =========================================
    DBMS_OUTPUT.PUT_LINE('Codigo:          '||REG.COD_ALUNO);
    DBMS_OUTPUT.PUT_LINE('Nome:            '||REG.NOME);
    DBMS_OUTPUT.PUT_LINE('Cidade:          '||REG.CIDADE);
    -- =========================================
    DBMS_OUTPUT.PUT_LINE('Data Mascimento: '||REG.NASCIMENTO);
END;
/*
Codigo:          5
Nome:            Beta
Cidade:          PORTO ALEGRE
Data Mascimento: 13/07/18


Procedimento PL/SQL concluído com sucesso.
*/

SELECT ROUND(MONTHS_BETWEEN(TO_DATE(SYSDATE, 'DD/MM/YY') - TO_DATE(REG.NASCIMENTO, 'DD/MM/YY')))) AS MONTHS_BETWEEN;
-- =========================================

    
    
