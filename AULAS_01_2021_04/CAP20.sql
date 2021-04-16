=============================================
===   PROCEDIMENTOS DE BANCOS DE DADOS    ===
=============================================

SINTAXE BASICA:

CREATE  [OR REPLACE] PROCEDURE nome_procedure
        [(
            nome_parametro [tipo] datatype,
            nome_parametro [tipo] datatype,...
        )]

IS | AS 
    [DECLARACAO DE VARIAVEIS]

BEGIN 
    COMANDOS SQL
    COMANDOS PL/SQL

[EXCEPTION 
    TRATAMENTO DE EXCECOES]

END [nome_procedure];

----------------------------------------------
DECLARANDO PARAMETROS (ARGUMENTOS) PARA COMUNICACAO ENTRE
O SUBPROGRAMA PL/SQL E O AMBIENTE QUE O DISPAROU. 

3 TIPOS DE PARAMETROS:

IN [DEFAULT expr]
OUT [NOCOPY]
IN OUT [NOCOPY]

PARAMETROS DEVEM SER DECLARADOS APENAS O TIPO SEM TAMANHO
OU COM %TYPE OU %ROWTYPE

===============================================

CREATE OR REPLACE PROCEDURE AUMENTA_PRECOCURSO(pCOD_CURSO NUMBER)
IS 
--VARIAVEIS AQUI COLOCADAS, MAS NESTE EXEMPLO NÃO TEM
BEGIN 
    --AUMENTAR O VALOR DE UM CURSO EM 10%
    UPDATE TCURSO SET 
    VALOR = VALOR * 1.1
    WHERE COD_CURSO = pCOD_CURSO;
END;
/*
Procedure AUMENTA_PRECOCURSO compilado
ao executar ele apenas cria a PROCEDURE
*/

SELECT * FROM TCURSO;
/*
COD_CURSO   NOME                    VALOR    CARGA_HORARIA   PRE_REQ   
           1 ORACLE SQL ePL/SQL          564,99               25          7 
           2 ORACLE DBA                     564               25          1 
           3 JAVA FUNDAMENTOS E 00         1624              100          7 
           4 JAVASERVER FACES              1724              100          3 
           5 WINDOWS                       1189               50            
           6 OFFICE                        1189               60            
           7 HTML5                         1189               70            
           8 CCS3                          1189               80          7 
           9 JAVASCRIPT                    1124              100          7 
          10 PS/SQL DEVELOPER              1065               16            
          52 TESTE-y                       1000                             


11 linhas selecionadas. 
*/

--PARA EXECUTAR A PROCEDURE
--PARA NOSSO EXEMPLO VAMOS AUMENTAR O CURSO 52
--QUE PASSARÁ DE 1000 +10% FICANDO 1100

EXEC AUMENTA_PRECOCURSO(52);
/*
Procedimento PL/SQL concluído com sucesso.
*/

SELECT * FROM TCURSO;
/*
COD_CURSO   NOME                    VALOR    CARGA_HORARIA   PRE_REQ   
           1 ORACLE SQL ePL/SQL          564,99               25          7 
           2 ORACLE DBA                     564               25          1 
           3 JAVA FUNDAMENTOS E 00         1624              100          7 
           4 JAVASERVER FACES              1724              100          3 
           5 WINDOWS                       1189               50            
           6 OFFICE                        1189               60            
           7 HTML5                         1189               70            
           8 CCS3                          1189               80          7 
           9 JAVASCRIPT                    1124              100          7 
          10 PS/SQL DEVELOPER              1065               16            
          52 TESTE-y                       1100                             


11 linhas selecionadas. 
*/

--OUTRA MANEIRA PARA EXECUTAR A PROCEDURE
--COM BLOCO ANONIMO
DECLARE 
    vCOD INTEGER := &CODIGO;
BEGIN 
    AUMENTA_PRECOCURSO(vCOD);
END;




--OUTRO EXEMPLO IGUAL O PRIMEIRO, MAS AO INVES DE DECLARAR O
--PARAMETRO COMO NUMBER, COLOQUEI COMO DO MESMO TIPO QUE A COLUNA
--COD_CURSO DA TABELA TCURSO
CREATE OR REPLACE PROCEDURE AUMENTA_PRECOCURSO2(
    pCODIGOCURSO IN TCURSO.COD_CURSO%TYPE)
IS 
--VARIAVEIS AQUI COLOCADAS, MAS NESTE EXEMPLO NÃO TEM
BEGIN 
    --AUMENTAR O VALOR DE UM CURSO EM 15%
    UPDATE TCURSO SET 
    VALOR = VALOR * 1.15
    WHERE COD_CURSO = pCODIGOCURSO;
END;

DECLARE 
    vCOD INTEGER := &CODIGO;
BEGIN 
    AUMENTA_PRECOCURSO2(vCOD);
END;

SELECT * FROM TCURSO;

COMMIT;


--------------------------------
SELECT * FROM TALUNO;

-- IN DE ENTRADA / OUT DE SAÍDA
CREATE OR REPLACE PROCEDURE CONSULTA_ALUNO(
    pCODIGO     IN      TALUNO.COD_ALUNO%TYPE,
    pNOME       OUT     TALUNO.NOME%TYPE,
    pCEP        OUT     TALUNO.CEP%TYPE,
    pCIDADE     OUT     TALUNO.CIDADE%TYPE
)
IS 
BEGIN 
    SELECT  NOME, CEP, CIDADE
    INTO    pNOME, pCEP, pCIDADE
    FROM    TALUNO
    WHERE   COD_ALUNO = pCODIGO;
END;
/*
Procedure CONSULTA_ALUNO compilado
*/

DECLARE 
    vNOME VARCHAR2(30);
    vCIDADE VARCHAR(30);
    vCEP VARCHAR(10);
    vCOD INTEGER := &CODIGO;
BEGIN 
    --executa a procedure
    CONSULTA_ALUNO(vCOD, vNOME, vCEP, vCIDADE);
    /*
    PROCEDURE naum tem retorno, mas aqui usamos este artifício
    para retornar os valores
    */
    DBMS_OUTPUT.PUT_LINE('NOME  : '||vNOME);
    DBMS_OUTPUT.PUT_LINE('CIDADE: '||vCIDADE);
    DBMS_OUTPUT.PUT_LINE('CEP   : '||vCEP);
END;


--O MESMO ACIMA ESCRITO DIFERENTE
DECLARE 
    vNOME VARCHAR2(30);
    vCIDADE VARCHAR(30);
    vCEP VARCHAR(10);
    vCOD INTEGER := &CODIGO;
BEGIN 
    --executa a procedure
    CONSULTA_ALUNO( pNOME => vNOME,
                    pCODIGO => vCOD,
                    pCIDADE => vCIDADE,
                    pCEP => vCEP);
    /*
    Neste exemplo não importa a ordem, pois informamos exatamente
    qual parametro(p) recebe sua variavel(v)
    */
    DBMS_OUTPUT.PUT_LINE('NOME  : '||vNOME);
    DBMS_OUTPUT.PUT_LINE('CIDADE: '||vCIDADE);
    DBMS_OUTPUT.PUT_LINE('CEP   : '||vCEP);
END;
/*
NOME  : Paula
CIDADE: CANOAS
CEP   : 89163413


Procedimento PL/SQL concluído com sucesso.
*/


--uma outra maneira de pesquisar um ALUNO
CREATE OR REPLACE PROCEDURE CONSULTA_ALUNO2
(pREGISTRO IN OUT TALUNO%ROWTYPE)
IS 
    CURSOR CSQL IS
        SELECT * FROM TALUNO
        WHERE COD_ALUNO = pREGISTRO.COD_ALUNO;
BEGIN
    OPEN CSQL;
    FETCH CSQL INTO pREGISTRO;
    CLOSE CSQL;
END;


DECLARE 
    REGISTRO TALUNO%ROWTYPE;
BEGIN 
    REGISTRO.COD_ALUNO := 1;
    CONSULTA_ALUNO2(REGISTRO);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.NOME);
    DBMS_OUTPUT.PUT_LINE(REGISTRO.CIDADE||' - CEP: '||REGISTRO.CEP);
END;


========================================================

CREATE OR REPLACE PROCEDURE FORMATA_NUMERO
(pTELEFONE IN OUT VARCHAR2)
IS 
BEGIN 
    pTELEFONE := SUBSTR(pTELEFONE, 1, 4)||'-'||SUBSTR(pTELEFONE, 5, 4);
END;


--TESTE
DECLARE 
    vTELEFONE VARCHAR2(20);
BEGIN 
    vTELEFONE :='12345678';
    FORMATA_NUMERO(vTELEFONE);
    DBMS_OUTPUT.PUT_LINE(vTELEFONE);
END;


























