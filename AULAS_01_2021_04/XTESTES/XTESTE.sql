

/*
CREATE OR REPLACE VIEW V_IDADE AS
SELECT NASCIMENTO AS COD_ALUNO, NOME, CIDADE, ESTADO, NASCIMENTO
FROM TALUNO
WHERE COD_ALUNO = '&CODIGO';

DROP VIEW V_IDADE;
*/


SELECT * FROM TALUNO;

DECLARE 
    VDESCONTO NUMBER(6,2)   :=  0.50;
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE    :=  &CODIGO;
    VNOME   VARCHAR2(30);
    VCIDADE VARCHAR(30);
    VTOTAL NUMBER(8,2)      :=  1345.89;
    VPRECO1 NUMBER(8,2) := 10;
    VPRECO2 NUMBER(8,2) := 20;
    VFLAG   BOOLEAN;            -- TRUE OR FALSE
    VTESTE VARCHAR(10) := 'BRUXA';
    -- ===============================================
    VIDADE TALUNO.NASCIMENTO%TYPE;
    VDT_NASCEU TALUNO.NASCIMENTO%TYPE;
    VDT_HOJE DATE := TRUNC(SYSDATE);

BEGIN
    -- ===============================================
    DECLARE 
    VTESTE VARCHAR(10)  :='JOAO';
        BEGIN
            DECLARE 
                VTESTE VARCHAR(10)  :='MARIA';
            BEGIN
                Dbms_Output.Put_Line(' ');
                Dbms_Output.Put_Line('IMPRESSAO DO TESTE DE BLOCO');
                Dbms_Output.Put_Line('Bloco Interno NIVEL 2: '||VTESTE);
            END;
        Dbms_Output.Put_Line(' ');
        Dbms_Output.Put_Line('IMPRESSAO DO TESTE DE BLOCO');
        Dbms_Output.Put_Line('Bloco Interno NIVEL 1: '||VTESTE);
        END;
    -- ===============================================
    VTOTAL      :=ROUND(VTOTAL * VDESCONTO, 2);
    VDESCONTO   :=  1.20;
    VCIDADE     := InitCap(VCIDADE);
    -- ===============================================
    SELECT  NOME, CIDADE, NASCIMENTO 
    INTO    VNOME, VCIDADE, VDT_NASCEU
    FROM    TALUNO
    WHERE   COD_ALUNO = VCOD_ALUNO;
    -- ===============================================
    VIDADE = TO_DATE(VDT_HOJE - VDT_NASCEU);
    Dbms_Output.Put_Line(VIDADE);
    -- ===============================================
    Dbms_Output.Put_Line(' ');
    Dbms_Output.Put_Line('IMPRESSAO DO TESTE BOLEANO');
    Dbms_Output.Put_Line('Cidade:         '||VCIDADE);
    Dbms_Output.Put_Line('Aluno:          '||VCOD_ALUNO||' - '||VNOME);
    Dbms_Output.Put_Line('Data Nascimento:'||VDT_NASCEU);
    Dbms_Output.Put_Line('Desconto:       '||VDESCONTO);
    Dbms_Output.Put_Line('Total:          '||VTOTAL);
    -- ===============================================
    Dbms_Output.Put_Line(' ');
    Dbms_Output.Put_Line('IMPRESSAO DO TESTE BOLEANO');
    Dbms_Output.Put_Line('(Comparando se VPRECO1[10] > VPRECO2[20])');
    VFLAG := (VPRECO1 > VPRECO2);
        IF (VFLAG = TRUE)
            THEN    Dbms_Output.Put_Line('VERDADEIRO');
            ELSE    Dbms_Output.Put_Line('FALSO');
        END IF;
    -- ===============================================
    Dbms_Output.Put_Line(' ');
    Dbms_Output.Put_Line('IMPRESSAO DO TESTE DE BLOCO');
    Dbms_Output.Put_Line('Bloco Externo NIVEL 1: '||VTESTE);
END;







==========================================================
==========================================================
==========================================================
==========================================================
==========================================================

SELECT to_date(hire_date, 'YYYYMMDD') AS "TO_DATE"
  FROM dual;

SELECT to_date('14/09/2016 02:50:21', 'DD/MM/YYYY HH24:MI:SS') AS "TO_DATE"
  FROM dual;

SELECT to_date('14/09/2016 02', 'DD/MM/YY HH24') AS TO_DATE
  FROM dual;

SELECT to_date('050817', 'MMDDYY') AS "TO_DATE"
  FROM dual;

/*
SELECT NAME, SOBRENOME
FROM TALUNO
WHERE hire_date BETWEEN to_date('13/01/2001', 'DD/MM/YY') 
AND to_date('17/08/2002', 'DD/MM/YY');
*/




































