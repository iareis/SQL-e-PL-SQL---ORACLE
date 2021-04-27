https://docs.oracle.com/cloud/help/pt_BR/reportingcs_use/BILPD/GUID-4CBCE8D4-CF17-43BD-AAEF-C5D614A8040A.htm#BILPD-GUID-A1A6563A-4B60-471A-87DA-C999CFDFA630

========================================================================================================

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
    DBMS_OUTPUT.PUT_LINE('Data Mascimento: '||TO_CHAR(REG.NASCIMENTO, 'DD/MM/YYYY'));
    -- =========================================
    DBMS_OUTPUT.PUT_LINE(ROUND((TO_DATE(sysdate) - TO_DATE(REG.NASCIMENTO))/12));
    DBMS_OUTPUT.PUT_LINE(ROUND(TO_DATE(sysdate) - TO_DATE(REG.NASCIMENTO)));
END;

SELECT COD_ALUNO, NOME, TO_CHAR(NASCIMENTO, 'DD/MM/YYYY')
FROM TALUNO WHERE COD_ALUNO=5;


==============================================================



DECLARE 
    VIDADE TALUNO.NASCIMENTO%TYPE;
    VDT_NASCEU TALUNO.NASCIMENTO%TYPE;
    VDT_HOJE DATE := TRUNC(SYSDATE);
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE;
BEGIN
    VCOD_ALUNO := &CODIGO;
    ---
    SELECT  NASCIMENTO 
    INTO    VDT_NASCEU
    FROM    TALUNO
    WHERE   COD_ALUNO = VCOD_ALUNO;
    ---
    --VIDADE := TO_DATE(VDT_HOJE - VDT_NASCEU);
    --VIDADE := VDT_HOJE - VDT_NASCEU;
    TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE(VIDADE, 'DD/MM/YYYY')))/12)
    AS V_IDADE;
    ---
    DBMS_OUTPUT.PUT_LINE('Codigo: '||REG.COD_ALUNO);
    DBMS_OUTPUT.PUT_LINE('  Nome: '||REG.NOME);
    DBMS_OUTPUT.PUT_LINE('Cidade: '||REG.CIDADE);
    -- =========================================
    DBMS_OUTPUT.PUT_LINE('Data Mascimento: '||REG.NASCIMENTO);
    Dbms_Output.Put_Line('o '||REG.NOME||' tem '||VIDADE||' ANOS');
END;






