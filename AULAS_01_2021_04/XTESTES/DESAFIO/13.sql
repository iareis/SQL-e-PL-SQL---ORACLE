/*
Dado um SALARIO_BRUTO X calcule o SALARIO_BRUTO liquido, sendo que os descontos de IPRF ocorrem conforme a tabela IPRF_2021.
Deve debitar também a alíquita do INSS. Os resultados devem ser inseridos em uma tabela de FUNCIONARIOS.

--DELETE IPRF_2021;

DROP TABLE IPRF_2021;

Table IPRF_2021 eliminado.
Decorrido: 00:00:00.414
*/

=========================================================================
===   Dado um SALARIO_BRUTO X calcule o SALARIO_liquido,        ===
===   sendo que os descontos de IPRF ocorrem conforme a               ===
===   tabela IPRF_2021. Os resultados devem ser inseridos em uma      ===
===   tabela de FUNCIONARIOS.                                         ===
=========================================================================

CREATE TABLE IPRF_2021(
    COD_IPRF INTEGER NOT NULL,
    FAIXA_BASE_CAL NUMBER(8,2),
    ALIQUOTA NUMBER(3,1),
    CONSTRAINT PK_IPRF PRIMARY KEY (COD_IPRF)
);
/*
Table IPRF_2021 criado.
Decorrido: 00:00:00.093
*/

/* Faixas do Imposto de Renda 2021. As faixas continuam as mesmas desde 2015 */
INSERT INTO IPRF_2021 VALUES (1,1903.98,0);         --Até R$ 1.903,98: isento.
INSERT INTO IPRF_2021 VALUES (2,2826.65,7.5);       --De R$ 1.903,99 até R$ 2.826,65: 7,5%
INSERT INTO IPRF_2021 VALUES (3,3751.05,15);        --De R$ 2.826,66 até R$ 3.751,05: 15%
INSERT INTO IPRF_2021 VALUES (4,4664.68,22.5);      --De R$ 3.751,06 até R$ 4.664,68: 22,5%
INSERT INTO IPRF_2021 VALUES (5,4664.69,27.5);      --Acima de R$ 4.664,68: 27,5%

SELECT * FROM IPRF_2021;
/*
COD_IPRF   FAIXA_BASE_CAL   ALIQUOTA   
          1           1903,98           0 
          2           2826,65         7,5 
          3           3751,05          15 
          4           4664,68        22,5 
          5           4664,69        27,5 
Decorrido: 00:00:00.068
*/


===

CREATE TABLE FUNCIONARIOS(
    COD_FUNC        INTEGER NOT NULL,
    NOME_FUN        VARCHAR2(40),
    SALARIO_BRUTO   NUMBER(8,2),
    CALC_IPRF       NUMBER(4,3),
    VALOR_PAGAR     NUMBER(8,2),
    SAL_LIQUIDO     NUMBER(8,2),
    CONSTRAINT      PK_FUNCIONARIOS PRIMARY KEY (COD_FUNC)           
);
/*
Table FUNCIONARIOS criado.
Decorrido: 00:00:00.112
*/


===

CREATE OR REPLACE FUNCTION F_IPRF_2021 (
    SAL_BRUTO NUMBER
) RETURN NUMBER
IS 
CALC_IPRF NUMBER(8,2);
EXCEDENTE NUMBER;
TX_INSS NUMBER;
VALOR_PAGAR NUMBER(8,2);
SAL_BRUTO NUMBER(8,2);
SAL_LIQUIDO NUMBER(8,2);
---
BEGIN
    TX_INSS := 0.11;
    IF SAL_BRUTO <= 1903.98 THEN
        CALC_IPRF := 0;
    ELSE
        IF SAL_BRUTO > 1903.98 AND SAL_BRUTO <= 2826.65 THEN
            CALC_IPRF := 0.075;
        ELSE
            IF SAL_BRUTO > 2826.65 AND SAL_BRUTO <= 3751.05 THEN 
                CALC_IPRF := 0.15;
            ELSE
                IF SAL_BRUTO > 3751.05 AND SAL_BRUTO <= 4664.68 THEN 
                    CALC_IPRF := 0.225;
                ELSE
                    IF SAL_BRUTO > 4664.68 THEN 
                        EXCEDENTE := (SAL_BRUTO - (SAL_BRUTO * TX_INSS)) - 4664.68;
                        VALOR_PAGAR := (EXCEDENTE * 0.275) + ((4664.68 - 3751.05) * 0.15);
                        SAL_LIQUIDO := SAL_BRUTO - VALOR_PAGAR;
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
    VALOR_PAGAR := (SAL_BRUTO - (SAL_BRUTO * TX_INSS)) * CALC_IPRF;
    SAL_LIQUIDO := SALARI0_BRUTO - VALOR_PAGAR;
    RETURN SAL_LIQUIDO;
END;

/*
TESTE DA FFUNCTION F_IPRF_2021
*/
begin
  select F_IPRF_2021(&SAL);
end;



CREATE OR REPLACE PROCEDURE INSERE_DADOS_FUNCIONARIOS (
    P_COD_FUNC        NUMBER,
    P_NOME_FUN        VARCHAR2,
    P_SAL_BRUTO       NUMBER,
    P_CALC_IPRF       NUMBER,
    P_VALOR_PAGAR     NUMBER,
    P_SAL_LIQUIDO     NUMBER
)
AS 
    V_MAIOR_VALOR ALUNO.A4%TYPE;


BEGIN 

   

    ---
    INSERT INTO FUNCIONARIOS (COD_FUNC, NOME_FUN, SALARIO_BRUTO, CALC_IPRF, VALOR_PAGAR, SAL_LIQUIDO)
    VALUES(P_COD_FUNC, P_NOME_FUN, P_SALARIO_BRUTO, P_CALC_IPRF, P_VALOR_PAGAR, P_SAL_LIQUIDO);
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
    ---
END INSERE_DADOS_FUNCIONARIOS;


