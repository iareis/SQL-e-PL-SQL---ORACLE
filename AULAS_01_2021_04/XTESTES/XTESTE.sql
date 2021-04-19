DECLARE 
    REGISTRO TALUNO%ROWTYPE;
    X DATE;
BEGIN 
    REGISTRO.COD_ALUNO := '&COD';
    TUDO_DO_ALUNO(REGISTRO);
    X = TO_DATE(SYSDATE - REGISTRO.NASCIMENTO, YY);
    DBMS_OUTPUT.PUT_LINE('NOME: '||REGISTRO.NOME);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.CIDADE||' - '||REGISTRO.ESTADO);
    DBMS_OUTPUT.PUT_LINE('DATA DE NASCIMENTO: '||REGISTRO.NASCIMENTO||' ('||X||' ANOS)');
    -- =================================================================================
    /*
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(' ');

    -- =================================================================================
    DBMS_OUTPUT.PUT_LINE(REGISTRO.NOME);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.CIDADE);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.CEP);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.ESTADO);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.SALARIO);
    DBMS_OUTPUT.PUT_LINE(SYSDATE - REGISTRO.NASCIMENTO);
    */
END;




==============================================================
-- 1 VARIABLE VDESCONTO2 NUMBER 

CREATE OR REPLACE VIEW V_IDADE AS
SELECT NASCIMENTO AS COD_ALUNO, NOME, CIDADE, ESTADO, NASCIMENTO
FROM TALUNO
WHERE COD_ALUNO = '&CODIGO';

DECLARE 
    -- 2 REGISTRO TALUNO%ROWTYPE;
    VDESCONTO NUMBER(6,2)   :=  0.50;
    VCIDADE VARCHAR(30)     :=  'NOVO HAMBURGO';
    -- 3 VCOD_ALUNO TALUNO.COD_ALUNO%TYPE    :=  '&CODIGO';
    VTOTAL NUMBER(8,2)      :=  1345.89;
    VPRECO1 NUMBER(8,2) := 10;
    VPRECO2 NUMBER(8,2) := 20;
    VFLAG   BOOLEAN;            -- TRUE OR FALSE
    VTESTE VARCHAR(10) := 'JOSE';
    VNASCIMENTO TRUNC(DATE);

BEGIN
    -- 2 TUDO_DO_ALUNO(REGISTRO);
    DECLARE 
        VTESTE VARCHAR(10)  :='PEDRO';
    BEGIN
        DECLARE 
            VTESTE VARCHAR(10)  :='PEDRO';
        BEGIN 
            Dbms_Output.Put_Line('Bloco Interno NIVEL 2: '||VTESTE);
        END;
    Dbms_Output.Put_Line('Bloco Interno NIVEL 1: '||VTESTE);
    END;
    VTOTAL      :=ROUND(VTOTAL * VDESCONTO, 2);
    Dbms_Output.Put_Line('Total: '||VTOTAL);
    VDESCONTO   :=  1.20;
    -- 1 :VDESCONTO2 :=  0.90;
    VCIDADE     := InitCap(VCIDADE);
    Dbms_Output.Put_Line('Cidade:       '||VCIDADE);
    Dbms_Output.Put_Line('Desconto:     '||VDESCONTO);
    -- 1 Dbms_Output.Put_Line('Desconto2:    '||VDESCONTO2);
    Dbms_Output.Put_Line('Aluno:        '||VCOD_ALUNO);
    Dbms_Output.Put_Line('Bloco Externo: '||VTESTE);
    VFLAG := (VPRECO1 > VPRECO2);
        IF (VFLAG = TRUE)
            THEN    Dbms_Output.Put_Line('VERDADEIRO');
            ELSE    Dbms_Output.Put_Line('FALSO');
        END IF;
    /*CALCULO DA IDADE*/
        SELECT NOME, CIDADE, ESTADO, NASCIMENTO
        FROM V_IDADE
        WHERE COD_ALUNO = &CODIGO;     
        DBMS_OUTPUT.PUT_LINE(' ');    
        DBMS_OUTPUT.PUT_LINE('=============================================================');    
        DBMS_OUTPUT.PUT_LINE('NOME: '||NOME);
        DBMS_OUTPUT.PUT_LINE(CIDADE||' - '||ESTADO);
        DBMS_OUTPUT.PUT_LINE('DATA DE NASCIMENTO: '||NASCIMENTO||' ('||X||' ANOS)');
    
END;
--