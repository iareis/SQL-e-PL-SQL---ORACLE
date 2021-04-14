---------------------------------------
--      INTRODUÇÃO AO PL/SQL         --
--  escrevendo comandos Executaveis  --
---------------------------------------

--  DECLARE  --  BEGIN  --  EXCEPTION  --  END  ;

indentifier [CONSTANT] datatype [NOT NULL] [:= | DEFAULT expr];

DECLARE 
vData       DATE;
vPreco      NUMBER(2) NOT NULL := 10;
vCidade     VARCHAR2(13) := 'Novo Hamburgo';
cDesconto   NUMBER := 100;

/* := (dois pontos igual) significa RECEBE*/

vNome       tclientes.nome%TYPE;
/*a variável vNome acompanha o mesmo tipo de nome na tabela clientes*/

vPreco1 := 500;
vPreco2 := 600;

vFlag BOOLEAN   :=  (vPreco1 < vPreco2);
/*é possível comparar variáveis em comandos SQL e procedurais. Expressões Boleanas tb*/

:gPreco_final   :=  vPreco 8 .85;
/*para referenciar variáveis HOST, devemos prefixar a referência com (:) dois pontos*/

<> e != significam diferente
|| concatenação
:= operador de atribuição

Dmbs_Output.Put_Line() -- imprime o valor que está sendo passado

--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

-- BLOCO ANÔNIMO
DECLARE
    X INTEGER;
    Y INTEGER;
    Z INTEGER;
BEGIN
    X   :=  10;
    Y   :=  20;
    Z   :=  X   +   Y;
    Dmbs_Output.Put_Line('Resultado: '||Z); 
END;

-- 

DECLARE 
    VDESCONTO NUMBER(6,2)   :=  0.50;
    VCIDADE VARCHAR(30)     :=  'NOVO HAMBURGO';
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE    :=  5;
    VTOTAL NUMBER(8,2)      :=  1345.89;
BEGIN
    VTOTAL      :=ROUND(VTOTAL * VDESCONTO, 2);
    Dbms_Output.Put_Line('Total: '||VTOTAL);
    VDESCONTO   :=  1.20;
    VCIDADE     := InitCap(VCIDADE);
    Dmbs_Output.Put_Line('Cidade:   '||VCIDADE);
    Dmbs_Output.Put_Line('Desconto:   '||VDESCONTO);
    Dmbs_Output.Put_Line('Aluno:   '||VALUNO);
END;




---
SELECT * FROM TCURSO;
SELECT * FROM TALUNO;

DECLARE 
    VPRECO1 NUMBER(8,2) := 10;
    VPRECO2 NUMBER(8,2) := 20;
    VFLAG   BOOLEAN;            -- TRUE OR FALSE
BEGIN 
    VFLAG := (VPRECO1 > VPRECO2);
        IF (VFLAG = TRUE)
            THEN    Dmbs_Output.Put_Line('VERDADEIRO');
            ELSE    Dmbs_Output.Put_Line('FALSO');
        END IF;
        IF (VPRECO1 > VPRECO2)
            THEN    Dmbs_Output.Put_Line('VPRECO1 é maior!!');
            ELSE    Dmbs_Output.Put_Line('VPRECO2 é maior!!');
        END IF;    
END:




-- BIND VARIABLE --
VARIABLE VDESCONTO2 NUMBER -- FORA E SEM (;) PONTO E VÍRCULA NO FINAL

DECLARE
    VCOD_ALUNO NUMBER   := 1;
BEGIN
    :VDESCONTO2 := 0.90;
    Dmbs_Output.Put_Line('Desconto 2: '||:VDESCONTO2);

    UPDATE TCONTRATO SET
    TOTAL = TOTAL * :VDESCONTO2
    WHERE COD_ALUNO = VCOD_ALUNO;
END;

SELECT * FROM TCONTRATO;




-- ANINHAMENTO --
/*usar um bloco dentro de outro um bloco é o PRINCIPAL*/
DECLARE 
    VTESTE VARCHAR(10)  := 'JOSE';
BEGIN 
    DECLARE 
        VTESTE VARCHAR(10)  :='PEDRO';
    BEGIN 
        Dmbs_Output.Put_Line('Bloco Interno: '||VTESTE);
    END:

    Dmbs_Output.Put_Line('Bloco Externo: '||VTESTE);
END:

--

DECLARE 
    -- VTESTE VARCHAR(10)  := 'JOSE';
BEGIN 
    DECLARE 
        VTESTE VARCHAR(10)  :='PEDRO';
    BEGIN 
        Dmbs_Output.Put_Line('Bloco Interno: '||VTESTE);
    END:

    Dmbs_Output.Put_Line('Bloco Externo: '||VTESTE);
END:
/*o bloco PRINCIPAL não visualiza o bloco SECUNDÁRIO
e desta forma imprime PEDRO e dá ERRO solicitando DECLARAR*/

-- 

DECLARE 
    VTESTE VARCHAR(10)  := 'JOSE';
BEGIN 
    DECLARE 
       --  VTESTE VARCHAR(10)  :='PEDRO';
    BEGIN 
        Dmbs_Output.Put_Line('Bloco Interno: '||VTESTE);
    END:

    Dmbs_Output.Put_Line('Bloco Externo: '||VTESTE);
END:
/*o bloco SECUNDÁRIO visualiza o bloco PRINCIPAL
e desta forma imprime 2x JOSE*/









































































































































































































