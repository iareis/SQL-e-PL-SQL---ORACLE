==================================
===   continuando CAP27        ===
==================================

o arquivo anterior esta com um erro para ser resolvido
Relatório de erros -
ORA-00001: restrição exclusiva (IAREIS.SYS_C007000) violada

>>> RESOLVIDO:
O ERRO JÁ DIZIA TUDO:
ORA-02290: restrição de verificação (IAREIS.CK_CONTRATO_DESCONTO) violada

A constraint CK_CONTRATO_DESCONTO impedia INSERT, embora UPDATE fosse permitido. 

    SELECT * FROM USER_CONSTRAINTS;

    SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS;

    ALTER TABLE TCONTRATO DISABLE CONSTRAINT CK_CONTRATO_DESCONTO;
    /*
    Table TCONTRATO alterado.
    */

================================================
================================================
================================================
================================================

SELECT * FROM USER_SEQUENCES; 
/*
SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE LAST_NUMBER
------------------------------ ---------- ---------- ------------ - - ---------- -----------
SEQ_ALUNEW                              1        200            1 N N         20           6
SEQ_ALUNO                               1 1.0000E+28            1 N N         20          41
SEQ_CONTRATO                            1 1.0000E+28            1 N N         20          35
SEQ_CURSO_INSERT_ALL                    1 1.0000E+28            1 N N         20         121
SEQ_CURSO_INSERT_ALL2                   1 1.0000E+28            1 N N         20         100
SEQ_SAL_ALUNO                           1 1.0000E+28            1 N N         20          21

6 linhas selecionadas. 
*/

CREATE SEQUENCE SEQ_CONTRATO_MERGE START WITH 40;
/*
Sequence SEQ_CONTRATO_MERGE criado.
*/

SELECT * FROM TCONTRATO;
/*
COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   VALOR_COMISSAO   
              1 07/04/21               1      450          10                   
              2 05/01/13               2     2500                               
              3 07/04/21               3     1500                               
              4 02/04/21               2     1600                               
              5 03/04/21               5     5000          10                   
              6 04/04/21               5      445           0                   
              7 05/04/21               5      445          20                   
              8 12/03/21               6      800          22                   
              9 17/03/21               7      445          17                   
             10 18/03/21               7      500          13                   
             11 22/03/21               9     5000          20                   
             12 24/03/21               9      800           5                   
             13 29/03/21              10      800          16                   
             14 12/03/21              11      800          24                   
             39 19/04/21              10     2600                               
             38 20/04/21              10     1500                               


16 linhas selecionadas. 

*/

MERGE INTO TCONTRATO TCN
    USING   (SELECT COD_ALUNO AS ALUNO
            FROM TALUNO
            WHERE ESTADO = 'RS')
    ON  (TCN.COD_ALUNO = ALUNO)
        WHEN MATCHED THEN --ENCONTROU O REGISTRO
            UPDATE SET DESCONTO = 22
        WHEN NOT MATCHED THEN --NAO ENCONTROU O REGISTRO
            INSERT (TCN.COD_CONTRATO, TCN.DATA, TCN.COD_ALUNO, 
                  TCN.DESCONTO, TCN.TOTAL)
            VALUES (SEQ_CONTRATO_MERGE.NEXTVAL, SYSDATE, ALUNO, 666, 15);
/*
12 linhas mesclado.
*/

SELECT * FROM TCONTRATO;
/*
COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   VALOR_COMISSAO   
              1 07/04/21               1      450          10                   
              2 05/01/13               2     2500                               
              3 07/04/21               3     1500                               
              4 02/04/21               2     1600                               
              5 03/04/21               5     5000          22                   
              6 04/04/21               5      445          22                   
              7 05/04/21               5      445          22                   
              8 12/03/21               6      800          22                   
              9 17/03/21               7      445          22                   
             10 18/03/21               7      500          22                   
             11 22/03/21               9     5000          22                   
             12 24/03/21               9      800          22                   
             13 29/03/21              10      800          22                   
             14 12/03/21              11      800          22                   
             39 19/04/21              10     2600          22                   
             38 20/04/21              10     1500          22                   


16 linhas selecionadas.
*/

SELECT * FROM USER_CONSTRAINTS;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS;

ALTER TABLE TCONTRATO DISABLE CONSTRAINT CK_CONTRATO_DESCONTO;
/*
Table TCONTRATO alterado.
*/

COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   VALOR_COMISSAO   
              1 07/04/21               1      450          10                   
              2 05/01/13               2     2500                               
              3 07/04/21               3     1500                               
              4 02/04/21               2     1600                               
              5 03/04/21               5     5000          22                   
              6 04/04/21               5      445          22                   
              7 05/04/21               5      445          22                   
             53 21/04/21               8       15         666                   
             60 21/04/21              17       15         666                   
             61 21/04/21              19       15         666                   
             62 21/04/21              20       15         666                   
             63 21/04/21              21       15         666                   
             64 21/04/21              22       15         666                   
             65 21/04/21              23       15         666                   
             66 21/04/21              24       15         666                   
             67 21/04/21              27       15         666                   
              8 12/03/21               6      800          22                   
              9 17/03/21               7      445          22                   
             10 18/03/21               7      500          22                   
             11 22/03/21               9     5000          22                   
             12 24/03/21               9      800          22                   
             13 29/03/21              10      800          22                   
             14 12/03/21              11      800          22                   
             39 19/04/21              10     2600          22                   
             38 20/04/21              10     1500          22                   


25 linhas selecionadas. 




















