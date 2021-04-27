CREATE TABLE T_ARV_FAMILIA(
    COD_FAM     NUMBER,
    NOH         VARCHAR2(30),
    NOME        VARCHAR2(40),
    SOBRENOME   VARCHAR2(40);
    DATA_NASC   DATE;
    IDADE       NUMBER(4);
    LOCALNASC   VARCHAR(40);
    CASADO      VARCHAR(1);
    COM_QUEM    VARCHAR(40);
    CONSTRAINT  PK_ARV_FAM PRIMARY KEY(COD_FAM)
);





CREATE SEQUENCE S_ARV_FAM;





CREATE OR REPLCACE PROCEDURE INSERE_PESSOA (
    P_COD_FAM     NUMBER,
    P_NOH         VARCHAR2,
    P_NOME        VARCHAR2,
    P_SOBRENOME   VARCHAR2;
    P_DATA_NASC   DATE;
    P_IDADE       NUMBER;  
    P_LOCALNASC   VARCHAR;
    P_CASADO      VARCHAR;
    P_COM_QUEM    VARCHAR;
) AS 
V_IDADE       T_ARV_FAMILIA.IDADE%TYPE;
V_DATA_NASC   T_ARV_FAMILIA.DATA_NASC%TYPE;
---
BEGIN 
    /*CALCULO DA IDADE*/
    TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE(V_DATA_NASC, 'DD/MM/YYYY')))/12)
    AS V_IDADE;
    ---
    INSERT INTO T_ARV_FAMILIA(COD_FAM, NOH, NOME, SOBRENOME, DATA_NASC, IDADE, LOCALNASC, CASADO, COM_QUEM)
    VALUES(P_COD_FAM, P_NOH, P_NOME, P_SOBRENOME, P_DATA_NASC, P_IDADE, P_LOCALNASC, P_CASADO, P_COM_QUEM);
    ---
    BEGIN 
        SELECT DATA_NASC
        INTO V_DATA_NASC
        FROM T_ARV_FAMILIA
        WHERE COD_FAM = P_COD_FAM;
        EXCEPTION
            WHEN no_data_found THEN
                DBMS_OUTPUT.PUT_LINE('PESSOA NÃO ENCONTRADA: '||P_COD_FAM);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ERRO AO BUSCAR PESSOA: '||sqlerrm);
    END;






END INSERE_PESSOA;


BEGIN 
INSERE_PESSOA(S_ARV_FAM.NEXTVAL,)
END;