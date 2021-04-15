--------------------------------------
--  ESCREVENDO CURSORES EXPLICITOS  --
--------------------------------------


DECLARE 
    vCOD_ALUNO  TALUNO.COD_ALUNO%TYPE;
    vNOME       TALUNO.NOME%TYPE;
    CURSOR C1 IS 
        SELECT COD_ALUNO, NOME
        FROM TALUNO;
BEGIN 
    OPEN C1;
    LOOP 

        FETCH C1 INTO vCOD_ALUNO, vNOME;
        DBMS_OUTPUT.PUT_LINE('CODIGO: '||LPAD(vCOD_ALUNO,4,'0')||' - '||'Nome: '||vNOME);
        EXIT    WHEN C1%ROWCOUNT >= 10
                OR C1%NOTFOUND;
    END LOOP;
    CLOSE C1;
END;

 /*
relembrando, LPAD completa nete caso ateh 4 casas com zeros alinhado para esquerda
 se o numero for 4 será impresso 0004, se for 222 aparece 0222

 percentualROWCOUNT conta a posicao em que estah no momento
 percentualNOTFOUND eh quando naum encontra mais dados
*/



--TESTE COM EXIT ANTES DO DBMS E PARAMETRO ACIMA DO ROWCOUNT
DECLARE 
    vCOD_ALUNO  TALUNO.COD_ALUNO%TYPE;
    vNOME       TALUNO.NOME%TYPE;
    CURSOR C1 IS 
        SELECT COD_ALUNO, NOME
        FROM TALUNO;
BEGIN 
    OPEN C1;
    LOOP 

        FETCH C1 INTO vCOD_ALUNO, vNOME;
        EXIT    WHEN C1%ROWCOUNT >= 
                OR C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('CODIGO: '||LPAD(vCOD_ALUNO,4,'0')||' - '||'Nome: '||vNOME);
    END LOOP;
    CLOSE C1;
END;
/*
Com ROWCOUNT maior ele impreme todos os 29 alunos de TALUNo devido ao NOTFOUND
*/



--
DECLARE 
    CURSOR C1 IS 
        SELECT * FROM TALUNO;
    REG C1%ROWTYPE;
    /*
    REG é um RECORD
    percentualROWTYPE indica que o REG acompanha o mesmo tipo de C1
    */
BEGIN 
    OPEN C1;
    LOOP 
        FETCH C1 INTO REG;
        DBMS_OUTPUT.PUT_LINE(
            'CODIGO: '||LPAD(REG.COD_ALUNO,5,'0')||' - '||'NOME: '||REG.NOME
            );
        EXIT WHEN C1%ROWCOUNT >=10 OR C1%NOTFOUND;
    END LOOP;
    CLOSE C1;   
END;



--
DECLARE
    CURSOR C1 IS 
        SELECT * FROM TALUNO;
    REG TALUNO%ROWTYPE; 
BEGIN 
    FOR REG IN C1
    LOOP 
        DBMS_OUTPUT.PUT_LINE(
            'CODIGO: '||LPAD(REG.COD_ALUNO,5,'0')||' - '||'NOME: '||REG.NOME
        );
    END LOOP;
END;




--
DECLARE 
    REG TALUNO%ROWTYPE;
BEGIN 
    FOR REG IN (SELECT * FROM TALUNO)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'CODIGO: '|| LPAD(REG.COD_ALUNO,5,'0')||' - NOME: '||REG.NOME
        );
    END LOOP;
END;



--EXEMPLO DE CURSOR COM PARAMETRO
DECLARE 
    CURSOR C1 (pCOD_ALUNO NUMBER) IS 
        SELECT * FROM TALUNO
        WHERE COD_ALUNO = pCOD_ALUNO
    FOR UPDATE OF NOME NOWAIT;
    /*bloqueia a coluna nome para ALTERACAO*/
    REG C1%ROWTYPE;
BEGIN 
    OPEN C1(&CODIGO);
    /*Sem LOOP (laco de repeticao) pois o resultado é UNO*/
    FETCH C1 INTO REG;
    DBMS_OUTPUT.PUT_LINE(
        'CODIGO: '||LPAD(REG.COD_ALUNO,5,'0')||' - NOME: '||REG.NOME
        );
    CLOSE C1;
    /*libera o registro para alteracao*/
END;



--outro exemplo de for update
DECLARE 
    CURSOR C1 IS 
        SELECT NOME FROM TALUNO
        FOR UPDATE;
    REG_ALUNO C1%ROWTYPE;
BEGIN 
    FOR REG_ALUNO IN C1
    LOOP
        UPDATE TALUNO
        SET NOME = INITCAP(REG_ALUNO.NOME) 
        WHERE CURRENT OF C1;
        DBMS_OUTPUT.PUT_LINE('NOME: '||INITCAP(REG_ALUNO.NOME));
    END LOOP;
    COMMIT;
END;






















