-----------------------------------------
--  ESCREVENDO ESTRUTURAS DE CONTROLE  --
-----------------------------------------

IF e CASE 
/*construções CONDICIONAIS para CONTROLE do Fluxo de Execução PL/SQL*/

IF  condition THEN
    statements;
[ELSIF condition THEN 
    statements;]
[ELSE   
    statements;]
END IF;

-----------------------------------------

DECLARE 
    vNOME   VARCHAR(30) :=  'Carioca';
    vCIDADE VARCHAR(30);
    vESTADO VARCHAR(2);
BEGIN 
    IF      (vNOME = 'Gaucho')  THEN
            vCIDADE :=  'Porto Alegre';
            vESTADO :=  'RS';
    ELSIF   (vNOME = 'Carioca') THEN 
            vCIDADE :=  'Rio de Janeiro';
            vESTADO :=  'RJ';
    ELSE   
            IF  (vNOME = 'Sao Paulo')    THEN 
                vCIDADE :=  'São Paulo';
                vESTADO :=  'SP';
            ELSE 
                vCIDADE :=  'Outros';
                vESTADO :=  'XX';
            END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE(vCIDADE||' - '||vESTADO);
END;


-- CASE WHEN

DECLARE 
    vESTADO VARCHAR(2) := 'RR';
    vNOME VARCHAR(30);
BEGIN 
    CASE 
        WHEN vESTADO = 'RS' THEN vNOME := 'Gaucho';
        WHEN vESTADO = 'RJ' OR vESTADO = 'ES' THEN vNOME := 'Carioca';
    ELSE 
        vNOME := 'Outros';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Apelido: '||vNOME);
END;
       

-- LAÇO DE REPETIÇÃO

DECLARE 
    vCONTADOR INTEGER := 0;
BEGIN 
    LOOP 
        vCONTADOR := VcONTADOR + 1;
        DBMS_OUTPUT.PUT_LINE(vCONTADOR);
        EXIT WHEN vCONTADOR = 10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Fim do LOOP');
END;



-- FOR LOOP --> mais indicado para laços em tabelas

DECLARE 
    vCONTADOR INTEGER;
BEGIN 
    FOR vCONTADOR IN 1..10
    LOOP 
        --vCONTADOR := vCONTADOR + 1;
        DBMS_OUTPUT.PUT_LINE('For LOOP: '||vCONTADOR);
        --EXIT WHEN vCONTADOR = 5;
    END LOOP;
END;


-- WHILE LOOP

DECLARE 
    vCONTADOR INTEGER := 0;
    vTEXTO VARCHAR(10);
BEGIN 
    WHILE vCONTADOR < 10
    LOOP 
        vCONTADOR := vCONTADOR + 1;
        IF (vCONTADOR MOD 2) = 0 THEN 
        /*MOD resulta no restto. Neste caso divide vCONTADOR por 2 e resulta num RESTO*/
            vTEXTO := 'PAR';
        ELSE
            vTEXTO := 'IMPAR';
        END IF;
        DBMS_OUTPUT.PUT_LINE('O número '||vCONTADOR||' é '||vTEXTO);
    END LOOP;
END;







