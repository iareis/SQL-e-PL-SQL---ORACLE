-----------------------------
-- TRATAMENTO DE EXCECOES  --
-----------------------------

EXCECOES SAO EVENTOS - GERALMENTE ERROS

----------------------------------------------------------

LISTA DE EXCECOES PRE-DEFINIDAS:

ORA-06531 COLLECTION_IS_NULL
Tentativa de aplicar métodos que não o EXITS para uma
Collection table não inicializada.

ORA-06511 CURSOR_ALREADY_OPEN
Tentativa de abrir um cursor que já está aberto. 

ORA-00001 DUP_VAL_ON_INDEX
Tentativa de inserir um valor duplicado. 

ORA-01001 INVALID_CURSOR
Ocorreu uma operação ilegal em um cursor. 

ORA-01722 INVALID_NUMBER
Falha na conversao de uma string caractere para numerica. 

ORA-01017 LOGIN_DENIED
Conexão ao Oracle com um nome de usuario e/ou senha invalida. 

ORA-01403 NO_DATA_FOUND
SELECT do tipo single-row não retornou nenhuma linha. 

ORA-01012 NOT_LOGGED_ON
Programa PL/SQL executou uma chamada de banco de dados
sem estar conectado ao Oracle. 

ORA-00051 TIMEOUT_ON_RESOURCE
Ocorreu um time-out enquanto o Oracle estava aguardando por um recurso. 

ORA-01422 TOO_MANY_ROWS
SELECT do tipo single-row retornou mais que uma linha. 

ORA-06502 VALUE_ERROR
Ocorreu um erro de aritmetica, conversão ou truncamento. 

ORA-01476 ZERO_DIVIDE
Tentativa de divisão por zero. 

--------------------------------------------------

DECLARE 
BEGIN 
    SELECT 
    INTO  
    FROM 
    WHERE;
EXCEPTION
    WHEN THEN;
    WHEN THEN;
    WHEN THEN;
END;

--------------------------------------------------

POR ALGUMA REGRA DE NEGOCIO EU POSSO FORÇAR UM ERRO.
DECLARANDO UM IDENTIFICADOR DO TIPO EXCEPTION. 
COMANDO RAISE, PARA A EXECUÇÃO E DESVIA PARA O TRATAMENTO DE ERRO. 

===================================================
===================================================
===================================================


DECLARE
    vCOD    TALUNO.COD_ALUNO%TYPE := 566; --NUMERO INEXISTENTE P/ ERRO
    vCIDADE TALUNO.CIDADE%TYPE;
    X NUMBER; 
BEGIN 
    SELECT CIDADE INTO vCIDADE
    FROM TALUNO
        --WHERE NOME LIKE '%';
        WHERE COD_ALUNO = vCOD;
        DBMS_OUTPUT.PUT_LINE('CIDADE: '||vCIDADE);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,'ALUNO INEXISTENTE! '||SQLCODE||' '||SQLERRM
        );
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(
            -20002,'REGISTRO DUPLICADO! '||SQLCODE||' '||SQLERRM
        );
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(
            -20003,'EXCEÇÃO DESCONHECIDA! '||SQLCODE||' '||SQLERRM
        );
END; 
/*
Relatório de erros -
ORA-20001: ALUNO INEXISTENTE! 100 ORA-01403: dados não encontrados
ORA-06512: em line 14
*/

DECLARE
    vCOD    TALUNO.COD_ALUNO%TYPE := 1; 
    vCIDADE TALUNO.CIDADE%TYPE;
    X NUMBER; 
BEGIN 
    SELECT CIDADE INTO vCIDADE
    FROM TALUNO
        --WHERE NOME LIKE '%';
        WHERE COD_ALUNO = vCOD;
        X := 0 / 0; --CALCULO P/ ERRO
        DBMS_OUTPUT.PUT_LINE('CIDADE: '||vCIDADE);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,'ALUNO INEXISTENTE! '||SQLCODE||' '||SQLERRM
        );
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(
            -20002,'REGISTRO DUPLICADO! '||SQLCODE||' '||SQLERRM
        );
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(
            -20003,'EXCECAO DESCONHECIDA! '||SQLCODE||' '||SQLERRM
        );
END;
/*
Relatório de erros -
ORA-20003: EXCECAO DESCONHECIDA! -1476 ORA-01476: o divisor é igual a zero
ORA-06512: em line 22
*/ 

DECLARE
    vCOD    TALUNO.COD_ALUNO%TYPE := 1; 
    vCIDADE TALUNO.CIDADE%TYPE;
    X NUMBER; 
BEGIN 
    SELECT CIDADE INTO vCIDADE
    FROM TALUNO
        WHERE NOME LIKE '%';
        --WHERE COD_ALUNO = vCOD;
        DBMS_OUTPUT.PUT_LINE('CIDADE: '||vCIDADE);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,'ALUNO INEXISTENTE! '||SQLCODE||' '||SQLERRM
        );
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(
            -20002,'REGISTRO DUPLICADO! '||SQLCODE||' '||SQLERRM
        );
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(
            -20003,'EXCECAO DESCONHECIDA! '||SQLCODE||' '||SQLERRM
        );
END;
/*
Relatório de erros -
ORA-20002: REGISTRO DUPLICADO! -1422 ORA-01422: a extração exata retorna mais do que o número solicitado de linhas
ORA-06512: em line 17
*/

===========================================================
===   CRIAR UMA NOVA TABELA PARA OS PROXIMOS EXEMPLOS   ===
===========================================================

CREATE TABLE TCONTAS(
    CODIGO      INTEGER NOT NULL PRIMARY KEY, 
    VALOR       NUMBER(10, 2),
    JUROS       NUMBER(10, 2),
    VENCIMENTO  DATE
);

INSERT INTO TCONTAS VALUES(100, 550, 50, SYSDATE-10);
INSERT INTO TCONTAS VALUES(101, 450, 50, SYSDATE-11);
INSERT INTO TCONTAS VALUES(102, 350, 50, SYSDATE-12);
INSERT INTO TCONTAS VALUES(103, 250, 50, SYSDATE-13);
INSERT INTO TCONTAS VALUES(104, 650, 50, SYSDATE-14);
INSERT INTO TCONTAS VALUES(105, 750, 50, SYSDATE-15);
INSERT INTO TCONTAS VALUES(106, 850, 50, SYSDATE-16);
INSERT INTO TCONTAS VALUES(107, 950, 50, SYSDATE-17);
INSERT INTO TCONTAS VALUES(108, 150, 50, SYSDATE-18);

SELECT * FROM TCONTAS;

COMMIT;

===========================================================

DECLARE 
    vDT_VENCIMENTO DATE;
    vCONTA NUMBER := 100;
    eCONTA_VENCIDA EXCEPTION;
BEGIN 
    SELECT VENCIMENTO INTO vDT_VENCIMENTO
    FROM TCONTAS WHERE CODIGO = vCONTA;
    IF vDT_VENCIMENTO < TRUNC(SYSDATE) THEN 
        RAISE eCONTA_VENCIDA;
    END IF;
EXCEPTION 
    WHEN eCONTA_VENCIDA THEN 
    DBMS_OUTPUT.PUT_LINE('CONTA VENCIDA');
    UPDATE TCONTAS SET VALOR = VALOR + JUROS
    WHERE CODIGO = vCONTA;
END;

--NA VERIFICACAO O VALOR PASSOU DE 550 PARA 600 = 550 + 50 
SELECT * FROM TCONTAS;



-- EXEMPLO PARA INTERCEPTAR UM ERRO
SELECT * FROM TBAIRRO;
SELECT * FROM TCIDADE;

DECLARE 
    eFK_INEXISTENTE EXCEPTION;
    PRAGMA EXCEPTION_INIT(eFK_INEXISTENTE, -02291);
BEGIN 
    INSERT INTO TBAIRRO VALUES(100, 100, 'CENTRINHO');
EXCEPTION 
    WHEN eFK_INEXISTENTE THEN 
        RAISE_APPLICATION_ERROR(-20200, 'CIDADE NAO EXISTE!');
END;
/*
Relatório de erros -
ORA-20200: CIDADE NAO EXISTE!
ORA-06512: em line 8
*/

--E SE ALTERARMOS PARA UMACIDADE QUE EXISTE
DECLARE 
    eFK_INEXISTENTE EXCEPTION;
    PRAGMA EXCEPTION_INIT(eFK_INEXISTENTE, -02291);
BEGIN 
    INSERT INTO TBAIRRO VALUES(1, 100, 'CENTRINHO');
EXCEPTION 
    WHEN eFK_INEXISTENTE THEN 
        RAISE_APPLICATION_ERROR(-20200, 'CIDADE NAO EXISTE!');
END;
/*
Procedimento PL/SQL concluído com sucesso.
*/


















