==================================
===   DESENVOLVENDO PACKAGES   ===
==================================

/*PRIMEIRO A ESPECIFICACAO OU DECLARACAO*/
CREATE OR REPLACE PACKAGE PKG_ALUNO
IS 
    V_CIDADE    VARCHAR2(30);   --variaveis publicas
    V_MEDIA     NUMBER(8,2);    --variaveis publicas
    V_NOME      VARCHAR2(30);   --variaveis publicas
    PROCEDURE   DELETA_ALUNO(P_COD_ALUNO NUMBER);
    PROCEDURE   MEDIA_CONTRATOS;
    PROCEDURE   CON_ALUNO(P_COD_ALUNO NUMBER);
END;
/*
Package PKG_ALUNO compilado
*/



/*SEGUNDO CRIAR O CORPO DO PACKAGE PKG_ALUNO*/
CREATE OR REPLACE PACKAGE BODY PKG_ALUNO
IS
    V_TESTE VARCHAR(20);    --variaveis locais
    -- ===============================================
    PROCEDURE MEDIA_CONTRATOS
    IS
    BEGIN
        V_TESTE := 'TESTE';
        SELECT AVG(TOTAL) INTO V_MEDIA FROM TCONTRATO;
    END;
    -- ===============================================
    PROCEDURE CON_ALUNO(P_COD_ALUNO NUMBER)
    IS 
    BEGIN 
        V_NOME := '';
        SELECT NOME INTO V_NOME FROM TALUNO
        WHERE COD_ALUNO = P_COD_ALUNO;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ALUNO NAO EXISTE');
    END;
    -- ===============================================
    PROCEDURE DELETA_ALUNO(P_COD_ALUNO NUMBER)
    IS 
    BEGIN
        CON_ALUNO(P_COD_ALUNO);
        IF LENGTH(V_NOME) > 0 THEN     --lembrando que LENGTH conta os caracteres
            DELETE FROM TALUNO WHERE COD_ALUNO = P_COD_ALUNO;
            DBMS_OUTPUT.PUT_LINE(V_NOME||'-> EXCLUIDO');
        END IF;
    END;
END;
/*
Package Body PKG_ALUNO compilado
*/


/*TERCEIRO EXECUTAR (USAR)*/

SELECT * FROM TALUNO;
-- nossa tabela tem 36 linhas

EXEC PCK_ALUNO.DELETA_ALUNO(99);
-- ao executar este PACKAGE com a procedure DELETA_ALUNO
-- se o COD_ALUNO não estiver na tabela como o 99 resultará
-- na msg 'ALUNO NAO EXISTE', mas se inserir um COD_ALUNO
-- que exista na tabela, o ,es,o será deletado.


/*
Erro a partir da linha : 64 no comando -
BEGIN PCK_ALUNO.DELETA_ALUNO(99); END;
Relatório de erros -
ORA-06550: linha 1, coluna 74:
PLS-00201: o identificador 'PCK_ALUNO.DELETA_ALUNO' deve ser declarado
ORA-06550: linha 1, coluna 74:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:
*/

-- =================================================================

/*PODEMOS FAZER UM BLOCO ANONIMO PARA EXECUTAR UMA PROCEDURE*/

DECLARE
    M NUMBER;
BEGIN 
    PCK_ALUNO.MEDIA_CONTRATOS;  --EXECUTA A PROCEDURE
    M := PCK_ALUNO.V_MEDIA;
    DBMS_OUTPUT.PUT_LINE('MEDIA: '||M);
END;



DECLARE
    NOME VARCHAR(30);
BEGIN 
    PCK_ALUNO.CON_ALUNO(89);
    NOME := PCK_ALUNO.V_NOME;
    DBMS_OUTPUT.PUT_LINE('NOME: '||NOME);
END;



BEGIN 
    PKG_ALUNO.CON_ALUNO(1);
    DBMS_OUTPUT.PUT_LINE('NOME: '||PKG_ALUNO.V_NOME);
END;





















