===============================================================================
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
/*
NOME  : BEATRIZ BERNARDES
E-MAIL: bb@dominio.com.br


Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:00:00.027
*/






/*SET SERVEROUTPUT ON;

DECLARE 
  v_ID SEGMERCADO.ID%type:=2;
  v_DESCRICAO SEGMERCADO.DESCRICAO%type;

BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;
    dbms_output.put_line(v_DESCRICAO);
END*/













