--VARIABLE VDESCONTO2 NUMBER 

DECLARE 
    VDESCONTO NUMBER(6,2)   :=  0.50;
    VCIDADE VARCHAR(30)     :=  'NOVO HAMBURGO';
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE    :=  5;
    VTOTAL NUMBER(8,2)      :=  1345.89;
    VPRECO1 NUMBER(8,2) := 10;
    VPRECO2 NUMBER(8,2) := 20;
    VFLAG   BOOLEAN;            -- TRUE OR FALSE
    VTESTE VARCHAR(10) := 'JOSE';

BEGIN
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
    --:VDESCONTO2 :=  0.90;
    VCIDADE     := InitCap(VCIDADE);
    Dbms_Output.Put_Line('Cidade:       '||VCIDADE);
    Dbms_Output.Put_Line('Desconto:     '||VDESCONTO);
    --Dbms_Output.Put_Line('Desconto2:    '||VDESCONTO2);
    Dbms_Output.Put_Line('Aluno:        '||VCOD_ALUNO);
    Dbms_Output.Put_Line('Bloco Externo: '||VTESTE);
    VFLAG := (VPRECO1 > VPRECO2);
        IF (VFLAG = TRUE)
            THEN    Dbms_Output.Put_Line('VERDADEIRO');
            ELSE    Dbms_Output.Put_Line('FALSO');
        END IF;
END;
--