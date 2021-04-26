==========================================================================================================
===   QUESTAO 01:                                                                                      === 
===   Criar um programa que possua uma variável constante com um valor e calcule a tabuada (Até 10).   ===
===   Tem que retornar da seguinte maneira:                                                            ===
===                                                                                                    ===     
===   1 x 5 = 5                                                                                        ===
===   2 x 5 = 10                                                                                       ===
===   3 x 5 = 15                                                                                       ===
==========================================================================================================

DECLARE
    V_CONSTANTE INTEGER;
    V_CONTADOR INTEGER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('TABUADA:');
    FOR V_CONSTANTE IN 1..10
    LOOP
        FOR V_CONTADOR IN 1..10
        LOOP
            DBMS_OUTPUT.PUT_LINE(V_CONSTANTE||' X '||V_CONTADOR||' = '||V_CONTADOR*V_CONSTANTE);
        END LOOP;
    DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;


=======================================================================================================
===    QUESTAO 02:                                                                                  === 
===    Criar uma funcao que devera receber um numero inteiro e retornar se o mesmo eh primo ou não  ===
===    (Lembrete: Numeros primos sao divisiveis somente por eles mesmos e por um).                  === 
===                                                                                                 ===
=======================================================================================================

CREATE OR REPLACE FUNCTION CONSULTA_PRIMO (V_NUMERO NUMBER) RETURN VARCHAR2
IS  V_PRIMO VARCHAR2(30) := 'Eh um numero PRIMO!';
    V_NPRIMO VARCHAR2(30) := 'NAO Eh um numero PRIMO!';
BEGIN 
    FOR V_DIVISOR IN 2..V_NUMERO-1
    LOOP 
        IF MOD(V_NUMERO,V_DIVISOR) = 0 THEN
            RETURN (V_NPRIMO);
        END IF;        
    END LOOP;
    RETURN (V_PRIMO);
END;
/*
Function CONSULTA_PRIMO compilado
*/


SELECT CONSULTA_PRIMO(&DIGA_UM_NUMERO) FROM DUAL;


=================================================================================
===    QUESTAO 03:                                                            === 
==  Criar uma função que deverá receber um valor correspondente à temperatura  ==
==  em graus Fahrenheit e retornar o equivalente em graus Celsius.             ==
==  Fórmula para conversão: C = (F ‐ 32) / 1.8                                 ==
=================================================================================


CREATE OR REPLACE FUNCTION CONVERTE_TEMP_FEMC (TEMP_F NUMBER) RETURN NUMBER
IS TEMP_C NUMBER(5,1);
BEGIN 
TEMP_C := (TEMP_F - 32) / 1.8;
RETURN TEMP_C;
END;
/*
Function CONVERTE_TEMP_FEMC compilado
*/

SELECT CONVERTE_TEMP_FEMC(&TEMPERATURA_FAHRENHEIT) FROM DUAL;



=========================================================================
===    QUESTAO 04:                                                    === 
===   Criar um bloco PL/SQL para imprimir a tabuada de 0 a 20,        ===
===   sendo que cada um desses numeros devera ter o calculo ate 10.   ===
=========================================================================

DECLARE
    V_CONSTANTE INTEGER;
    V_CONTADOR INTEGER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('TABUADA:');
    DBMS_OUTPUT.PUT_LINE(' ');
    FOR V_CONSTANTE IN 1..20
    LOOP
        FOR V_CONTADOR IN 1..10
        LOOP
            DBMS_OUTPUT.PUT_LINE(V_CONSTANTE||' X '||V_CONTADOR||' = '||V_CONTADOR*V_CONSTANTE);
        END LOOP;
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    END LOOP;
END;



======================================================================================
===    QUESTAO 05:                                                                 === 
===   Criar um bloco PL/SQL para apresentar os anos bissextos entre 2000 e 2100.   ===
===   Um ano sera bissexto quando for possivel dividi_lo por 4, mas nao por 100    ===
===   ou quando for possivel dividi_lo por 400.                                    ===
======================================================================================


DECLARE 
    V_ANO NUMBER(4);
BEGIN 
    DBMS_OUTPUT.PUT_LINE('OS ANOS BISSEXTOS ENTRE 2000 E 2100: ');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    FOR V_ANO IN 2000..2100
    LOOP
        IF  MOD(V_ANO,4) = 0 AND
            MOD(V_ANO,100) != 0 OR
            MOD(V_ANO,400) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(V_ANO);
        END IF;
    END LOOP;
END;



=================================================================================
===    QUESTAO 06:                                                            === 
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
                UPDATE PRODUTO SET VALOR = REGISTRO.VALOR * 1.05
                WHERE CODIGO = REGISTRO.CODIGO;
        ELSIF  REGISTRO.CATEGORIA = 'B' THEN
                 UPDATE PRODUTO SET VALOR = REGISTRO.VALOR * 1.10
                 WHERE CODIGO = REGISTRO.CODIGO;
        ELSIF    REGISTRO.CATEGORIA = 'C' THEN
                  UPDATE PRODUTO SET VALOR = REGISTRO.VALOR * 1.15
                  WHERE CODIGO = REGISTRO.CODIGO;
        END IF;
    END LOOP;
END;

SELECT * FROM PRODUTO;


===========================================================
===    QUESTAO 07:                                      === 
===   Criar um bloco PL/SQL para imprimir a sequencia   ===
===      de Fibonacci: 1 1 2 3 5 8 13 21 34 55          ===
===========================================================

Eh uma sucessao de numeros que, misteriosamente, aparece em muitos fenomenos da natureza.
Descrita no final do século 12 pelo italiano Leonardo Fibonacci, ela eh infinita e começa
com 0 e 1.

Os numeros seguintes sao sempre a soma dos dois numeros anteriores.
Portanto, depois de 0 e 1, vem 1, 2, 3, 5, 8, 13, 21, 34, 55 ... 

=============================================================================================

DECLARE
    V_PRIMEIRO NUMBER := 0;
    V_SEGUNDO NUMBER := 1;
    V_PROXIMO NUMBER;
    V_SEQUENCIA NUMBER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE(V_PRIMEIRO);
    DBMS_OUTPUT.PUT_LINE(V_SEGUNDO);
    ---
    FOR V_SEQUENCIA IN 2..10
    ---
    LOOP
        V_PROXIMO := V_PRIMEIRO + V_SEGUNDO;
        V_PRIMEIRO := V_SEGUNDO;
        V_SEGUNDO := V_PROXIMO;
        DBMS_OUTPUT.PUT_LINE(V_PROXIMO);
    END LOOP;
    END;




===============================================================================
===    QUESTAO 08:                                                          === 
===   Criar uma procedure que devera receber o codigo de um cliente         ===
===   e a partir deste dado imprimir o seu nome, e seu e‐mail.              ===
===   Os dados deverão ser obtidos a partir de uma tabela chamada CLIENTE   ===
===   com as seguintes colunas (COD_CLI,NOME_CLI,EMAIL_CLI)                 ===
===============================================================================

/* Criar a tabela cliente */
CREATE TABLE CLIENTE (
    COD_CLI NUMBER(4) PRIMARY KEY,
    NOME_CLI VARCHAR2(30),
    EMAIL_CLI VARCHAR2(30)
);
/*
Table CLIENTE criado.
*/

/* inserir o dado*/
INSERT INTO CLIENTE VALUES (10,'BEATRIZ BERNARDES','bb@dominio.com.br');
/*
1 linha inserido.
*/

===============================================================================

CREATE OR REPLACE PROCEDURE RECEBE_CLIENTE (COD_CLIENTE NUMBER)
IS 
    V_CLIENTE CLIENTE%ROWTYPE;
BEGIN 
    SELECT *
    INTO V_CLIENTE 
    FROM CLIENTE
    WHERE COD_CLI = COD_CLIENTE;
    ---
    DBMS_OUTPUT.PUT_LINE('NOME  : '||V_CLIENTE.NOME_CLI);
    DBMS_OUTPUT.PUT_LINE('E-MAIL: '||V_CLIENTE.EMAIL_CLI);
END;
/*
Procedure RECEBE_CLIENTE compilado
*/


EXEC RECEBE_CLIENTE(10);






===================================================================================
===    QUESTAO 09:                                                              === 
===   Criar uma procedure que recebera um RA, um NOME e                         ===
===   quatro notas conforme a sequencia: (RA,NOME,A1,A2,A3,A4).                 ===
===                                                                             ===
===   A partir destes valores devera efetuar o calculo da media                 ===
===   somando o maior valor entre A1 e A2 as notas A3 e A4 e                    ===
===   dividindo o valor obtido por tres (achando a media).                      ===
===                                                                             ===
===   Se a media for menor que 6 (seis) o aluno estara REPROVADO                ===
===   e se a media for igual ou superior a 6 (seis) o aluno estara APROVADO.    ===
===                                                                             ===
===   A procedure devera inserir os valores acima numa tabela denominada        === 
===   ALUNO com as seguintes colunas RA,NOME,A1,A2,A3,A4,MEDIA,RESULTADO        ===
===================================================================================


CREATE TABLE ALUNO(
    RA      NUMBER,
    NOME    VARCHAR2(40),
    A1      NUMBER(4,2),
    A2      NUMBER(4,2),
    A3      NUMBER(4,2),
    A4      NUMBER(4,2),
    MEDIA   NUMBER(4,2),
    RESULTADO   VARCHAR2(10),
    CONSTRAINT PK_ALUNO PRIMARY KEY (RA)
);
/*
Table ALUNO criado.
*/

CREATE SEQUENCE RA_ALUNO;
/*
Sequence RA_ALUNO criado.
*/

CREATE OR REPLACE PROCEDURE MEDIA_ALUNO (
    RA NUMBER,
    NOME VARCHAR2,
    A1 NUMBER,
    A2 NUMBER,
    A3 NUMBER,
    A4 NUMBER,
    MEDIA NUMBER,
    RESULTADO VARCHAR2,)
IS 
    V_MAIOR_VALOR NUMBER;
    V_MEDIA NUMBER;
    V_RESULTADO VARCHAR2;
BEGIN 
    IF A1 > A2 THEN
        V_MAIOR_VALOR := A1;
    ELSE
        V_MAIOR_VALOR := A2;
    END IF;
    ---
    V_MEDIA := (V_MAIOR_VALOR + A3 + A4)/3;
    ---
    IF V_MEDIA > 6 THEN
        V_RESULTADO := 'APROVADO';
    ELSE 
        V_RESULTADO := 'REPROVADO';
    END IF;
    ---
    INSERT INTO ALUNO VALUES(RA_ALUNO.NEXTVAL,NOME,A1,A2,A3,A4,V_MEDIA,V_RESULTADO);
END;

EXEC MEDIA_ALUNO(
    NOME := &NOME,
    A1 := '&NOTA1',  
    A2 := '&NOTA2',  
    A3 := '&NOTA3',  
    A4 := '&NOTA4',
);

MEDIA_ALUNO(4,'iuri',40,60,80,100); 

SELECT * FROM ALUNO;








