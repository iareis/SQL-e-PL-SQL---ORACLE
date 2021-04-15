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


-- PRIMEIRO CÓDIGO DE TABUADA COM OQ FOI VISTO ATE O MOMENTO

/*Criar um programa que possua uma variavel constante com um valor
e calcule a tabuada (Ate 10). Tem que retornar da seguinte maneira:
1 x 5 = 5
2 x 5 = 10*/

DECLARE 
    vCONTADOR INTEGER := 0;
    vTAB1 INTEGER := 1;
    vTAB2 INTEGER := 2;
    vTAB3 INTEGER := 3;
    vTAB4 INTEGER := 4;
    vTAB5 INTEGER := 5;
    vTAB6 INTEGER := 6;
    vTAB7 INTEGER := 7;
    vTAB8 INTEGER := 8;
    vTAB9 INTEGER := 9;
    vTAB10 INTEGER := 10;
    vTAB1r INTEGER;
    vTAB2r INTEGER;
    vTAB3r INTEGER;
    vTAB4r INTEGER;
    vTAB5r INTEGER;
    vTAB6r INTEGER;
    vTAB7r INTEGER;
    vTAB8r INTEGER;
    vTAB9r INTEGER;
    vTAB10r INTEGER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('TABUADA:');
    FOR vCONTADOR IN 1..10
    --WHILE vCONTADOR < 10
    LOOP
        --vCONTADOR := vCONTADOR + 1;
        vTAB1r := (vTAB1 * vCONTADOR);
        vTAB2r := (vTAB2 * vCONTADOR);
        vTAB3r := (vTAB3 * vCONTADOR);
        vTAB4r := (vTAB4 * vCONTADOR);
        vTAB5r := (vTAB5 * vCONTADOR);
        vTAB6r := (vTAB6 * vCONTADOR);
        vTAB7r := (vTAB7 * vCONTADOR);
        vTAB8r := (vTAB8 * vCONTADOR);
        vTAB9r := (vTAB9 * vCONTADOR);
        vTAB10r := (vTAB10 * vCONTADOR);
        DBMS_OUTPUT.PUT_LINE(vTAB1||' X '||vCONTADOR||' = '||vTAB1r);
        DBMS_OUTPUT.PUT_LINE(vTAB2||' X '||vCONTADOR||' = '||vTAB2r);
        DBMS_OUTPUT.PUT_LINE(vTAB3||' X '||vCONTADOR||' = '||vTAB3r);
        DBMS_OUTPUT.PUT_LINE(vTAB4||' X '||vCONTADOR||' = '||vTAB4r);
        DBMS_OUTPUT.PUT_LINE(vTAB5||' X '||vCONTADOR||' = '||vTAB5r);
        DBMS_OUTPUT.PUT_LINE(vTAB6||' X '||vCONTADOR||' = '||vTAB6r);
        DBMS_OUTPUT.PUT_LINE(vTAB7||' X '||vCONTADOR||' = '||vTAB7r);
        DBMS_OUTPUT.PUT_LINE(vTAB8||' X '||vCONTADOR||' = '||vTAB8r);
        DBMS_OUTPUT.PUT_LINE(vTAB9||' X '||vCONTADOR||' = '||vTAB9r);
        DBMS_OUTPUT.PUT_LINE(vTAB10||' X '||vCONTADOR||' = '||vTAB10r);
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;




