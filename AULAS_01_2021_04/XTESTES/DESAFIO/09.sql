===================================================================================
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

CREATE OR REPLACE PROCEDURE PRO_MEDIA_ALUNO (
    P_RA NUMBER,
    P_NOME VARCHAR2,
    P_A1 NUMBER,
    P_A2 NUMBER,
    P_A3 NUMBER,
    P_A4 NUMBER)

AS 
    V_MAIOR_VALOR ALUNO.A4%TYPE;
    V_MEDIA ALUNO.MEDIA%TYPE;
    V_RESULTADO ALUNO.RESULTADO%TYPE;
BEGIN 
    IF P_A1 > P_A2 THEN
        V_MAIOR_VALOR := P_A1;
    ELSE
        V_MAIOR_VALOR := P_A2;
    END IF;
    ---
    V_MEDIA := (V_MAIOR_VALOR + P_A3 + P_A4)/3;
    ---
    IF V_MEDIA > 6 THEN
        V_RESULTADO := 'APROVADO';
    ELSE 
        V_RESULTADO := 'REPROVADO';
    END IF;
    ---
    INSERT INTO ALUNO (RA,NOME,A1,A2,A3,A4,MEDIA,RESULTADO)
    VALUES(P_RA,P_NOME,P_A1,P_A2,P_A3,P_A4,V_MEDIA,V_RESULTADO);
    BEGIN
        SELECT MEDIA, RESULTADO
        INTO V_MEDIA, V_RESULTADO
        FROM ALUNO
        WHERE RA = P_RA;

    EXCEPTION
          WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Aluno não encontrado: '||P_RA);
          WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Erro ao buscar aluno: '||sqlerrm);
    END;
    
    IF V_RESULTADO = 'APROVADO' THEN 
        COMMIT;
        
    ELSE  
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE ('DESFAZ');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(V_MEDIA||' - '||V_RESULTADO);
    ---
END PRO_MEDIA_ALUNO;
/*
Procedure PRO_MEDIA_ALUNO compilado

Decorrido: 00:00:00.453
*/

BEGIN
PRO_MEDIA_ALUNO(14,'AHSHSHSuri',4,3,4,10);
END;

SELECT * FROM ALUNO;












