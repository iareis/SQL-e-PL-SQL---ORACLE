=================================================================================
===   Criar um bloco PL/SQL para atualizar a tabela abaixo, conforme segue:   ===
=================================================================================

Produtos categoria A deverão ser reajustados em 5%
Produtos categoria B deverão ser reajustados em 10%
Produtos categoria C deverão ser reajustados em 15%

/*criar Tabela*/

CREATE TABLE PRODUTO (
    CODIGO NUMBER(4),
    CATEGORIA CHAR(1),
    VALOR NUMBER(4,2)
);
/*
Table PRODUTO criado.
*/

/*inserir dados na tabela*/
INSERT INTO PRODUTO VALUES (1001,'A',7.55);
INSERT INTO PRODUTO VALUES (1002,'B',5.95);
INSERT INTO PRODUTO VALUES (1003,'C',3.45);
/*
1 linha inserido.
Decorrido: 00:00:00.033

1 linha inserido.
Decorrido: 00:00:00.005

1 linha inserido.
Decorrido: 00:00:00.004
*/

SELECT * FROM PRODUTO;

CODIGO   CATEGORIA   VALOR   
     1001 A                7,55 
     1002 B                5,95 
     1003 C                3,45 


Decorrido: 00:00:00.123

=================================================================================

DECLARE 
    CURSOR CPROD IS 
        SELECT * FROM PRODUTO;
        --FOR UPDATE;
    REGISTRO CPROD%ROWTYPE;
BEGIN 
    FOR REGISTRO IN CPROD
    LOOP
        IF      REGISTRO.CATEGORIA = 'A' THEN
                UPDATE PRODUTO SET VALOR = VALOR * 1.05
                WHERE CODIGO = REGISTRO.CODIGO;
        ELSIF   REGISTRO.CATEGORIA = 'B' THEN
                UPDATE PRODUTO SET VALOR = VALOR * 1.10
                WHERE CODIGO = REGISTRO.CODIGO;
        ELSE    REGISTRO.CATEGORIA = 'C' THEN
                UPDATE PRODUTO SET VALOR = VALOR * 1.15
                WHERE CODIGO = REGISTRO.CODIGO;
        END IF;
    END LOOP;
END;

SELECT * FROM PRODUTO;













