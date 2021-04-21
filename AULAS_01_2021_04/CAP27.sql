==================================
===   COMANDOS DML AVANCADOS   ===
==================================

INSERT ALL      -   INSERT EM VARIAS TABELAS 
MERGE

================================================
================================================
================================================
================================================

SELECT * FROM TCURSO;
/*
COD_CURSO   NOME                    VALOR    CARGA_HORARIA   PRE_REQ   
           1 ORACLE SQL ePL/SQL          564,99               25          7 
           2 ORACLE DBA                   648,6               25          1 
           3 JAVA FUNDAMENTOS E 00         3000              100          7 
           4 JAVASERVER FACES              3000              100          3 
           5 WINDOWS                       1189               50            
           6 OFFICE                        1189               60            
           7 HTML5                         1189               70            
           8 CCS3                          1189               80          7 
           9 JAVASCRIPT                    1124              100          7 
          10 PS/SQL DEVELOPER            1171,5               16            
          52 TESTE-y                       1100                             


11 linhas selecionadas.
*/

SELECT * FROM TALUNO;
/*
COD_ALUNO   NOME         SOBRENOME   TIPO   CIDADE           CEP        ESTADO   SALARIO    NASCIMENTO   
           1 MARCO         RADOMILE     F       SAO PAULO             1333010 SP                620 21/07/72      
           2 MARCELO       PETRY        F       SAO JOSE             88101090 S                1240 21/07/71      
           3 DIOGENES      CARVALHO     F       TERESINA             64039650 PI               1860 21/07/78      
           4 REINALDO      MOURA        F       TERESINA             64039650 PI               2480 21/07/80      
           5 DIEGO         FIDELIS      J       PASSO FUNDO          99001970 RS               3100 21/07/67      
           6 ALFREDO234    NOSTRO       J       ALEGRETE             96200010 RS               3720 23/07/54      
           7 Marcio        gARCIA       F       NOVO HAMBURGO        93320970 RS             633,47 20/10/00      
           8 Paula         ARAUJO       F       CANOAS               89163413 RS               2000 10/08/00      
           9 Maria         ANOTIETA     J       SAPIRANGA            93800012 RS                620 13/07/17      
          10 Beta          BARROS       J       PORTO ALEGRE         90020180 RS               3200 13/07/18      
          11 Teresa        CRISTINA     F       CANOAS                9163413 RS               1720 23/02/82      
          12 Adon          iSTOL        F       TUBARÃƒO             88701970 SC               4260 24/04/72      
          13 Ã?sis         REIS         F       Florianopolis        88034101 SC               5590 25/06/62      
          14 Pimbo         LINDO        J       RIO BRANCO           69908440 AC               1220 26/08/52      
          15 ALEXANDRE     GRANDE       F       FLORIANÃ“POLIS       88034101 SC               6450 27/10/82      
          16 Ubaldo        MEIRELES     F       SALVADOR             40015970 BA               1020 29/01/92      
          17 Wolney        CARVALHO     F       PORTO ALEGRE         90020180 RS               1720 30/03/02      
          18 Iury          SOUZA        F       ARAGUAINA            77818635 AC               1120 01/05/83      
          19 Vania         AMIM         F       PINHAL               98345000 RS               2880 02/07/88      
          20 Mylla         mARGARINA    J        VACARIA             95200000 RS               3600 18/07/18      
          21 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS               4500 13/07/34      
          22 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS               4950 13/07/34      
          23 Aldo          KRISHER      F       QUATRO IRMAOS        99720000 RS               1500 13/07/44      
          24 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS                900 13/07/34      
          25 Iuri          REIS         F       FLORIANOPOLIS        88034101 SC           15629,69 11/02/70      
          26 Xita          MULA         J       RIO BRANCO           69908440 AC                620 10/08/75      
          27 Null          Null         J       TORRES               95560000 RS               2350 12/05/80      
          28 Alberto       Roberty      F       CURITIBA             81050360 PR               2120 14/07/85      
          29 Beatriz       Seis         F       VITÃ“RIA             29000000 ES               4350 16/09/90      
          30 Clodoaldo     Buzz         F       BELO HORIZONTE       31630900 MG               7350 18/11/95      
          31 Damaris     Aiaiai       F       CAMPO GRANDE         79002190 MS              2820 20/01/00      
          32 Everton     Cunha        F       MANAUS               69030418 AM              5280 22/03/05      
          33 FabÃ­ula    grell        F       RIO BRANCO           69908440 AC              1370 24/04/01      
          34 Jeferson    Pelutis      F       RIO DE JANEIRO       23548168 RJ             14300 26/06/68      
          35 Karen       Girrfa       F       ANGRA DOS REIS       23900050 RJ              1370 08/08/02      


35 linhas selecionadas. 
*/

================================================
================================================
================================================
================================================

INSERT ALL 
    INTO TCURSO (COD_CURSO, NOME, VALOR)
    INTO TALUNO (COD_ALUNO, NOME, SALARIO)
        SELECT  COD_CONTRATO+50, 'INSERT_ALL', 1013
        FROM    TCONTRATO
        WHERE   COD_CONTRATO=10;
/*
2 linhas inserido.

COD_CURSO   NOME                    VALOR    CARGA_HORARIA   PRE_REQ   
          60 INSERT_ALL                    1013         
12 linhas selecionadas. 

COD_ALUNO   NOME         SOBRENOME   TIPO   CIDADE           CEP        ESTADO   SALARIO    NASCIMENTO   
          60 INSERT_ALL                         RS                        620                  1013               
36 linhas selecionadas. 
*/                


CREATE SEQUENCE SEQ_CURSO_INSERT_ALL START WITH 61;
/*
Sequence SEQ_CURSO_INSERT_ALL criado.
*/

INSERT ALL
    WHEN TOTAL >= 1000 THEN
        INTO TCURSO (COD_CURSO, NOME, VALOR)
        VALUES (SEQ_CURSO_INSERT_ALL.NEXTVAL, 'CURSO>1000', TOTAL)
    WHEN DESCONTO IS NULL THEN
        INTO TCURSO (COD_CURSO, NOME, VALOR)
        VALUES (SEQ_CURSO_INSERT_ALL.NEXTVAL, 'DESCONTO IS NULL', TOTAL)
    SELECT COD_CONTRATO, TOTAL, DESCONTO
    FROM TCONTRATO WHERE COD_CONTRATO <=4;

--DEU ERRO ORA-00001: restrição exclusiva (IAREIS.SYS_C007000) violada
--PARA RESOLVER ISSO VOU DESABILITAR A RESTRIÇÃO DE HORÁRIOS CRIADO NA TRIGGER

SELECT * FROM LOG;
/*
USUARIO     HORARIO    VALOR_ANTIGO   VALOR_NOVO   OBS                                     
IAREIS       21/04/21                                  LINHAS INSERIDAS.                        
IAREIS       20/04/21                                                                           
IAREIS       20/04/21                                                                           
Adon         20/04/21    1420            4260          SALARIO ALTERADO.                        
Ã?sis        20/04/21    1720            5590          SALARIO ALTERADO.                        
ALEXANDRE    20/04/21    1720            6450          SALARIO ALTERADO.                        
Iuri         20/04/21    2500,75         15629,69      SALARIO ALTERADO.                        
IAREIS       20/04/21    1624            3000          CURSO ALTERADO: JAVA FUNDAMENTOS E 00    
IAREIS       20/04/21    1896,4          3000          CURSO ALTERADO: JAVASERVER FACES         
IAREIS       20/04/21                                  DML DA VIEW V_CONTRATOS_PARES            


10 linhas selecionadas. 
*/


ALTER TRIGGER VALIDA_HORARIO_CURSO2 DISABLE; 
ALTER TRIGGER TRI_CONTRATOS_PARES DISABLE; 
ALTER TRIGGER AUDITA_ALUNO DISABLE; 
ALTER TRIGGER GERA_LOG_CURSO DISABLE; 
ALTER TRIGGER CAL_COMISSAO  DISABLE; 
ALTER TRIGGER VALIDA_HORARIO_CURSO  DISABLE; 
ALTER TRIGGER GERA_LOG_ALT DISABLE; 

/*

Trigger VALIDA_HORARIO_CURSO2 alterado.


Trigger TRI_CONTRATOS_PARES alterado.


Trigger AUDITA_ALUNO alterado.


Trigger GERA_LOG_CURSO alterado.


Trigger CAL_COMISSAO alterado.


Trigger VALIDA_HORARIO_CURSO alterado.


Trigger GERA_LOG_ALT alterado.
*/


==============================================================


CREATE SEQUENCE SEQ_CURSO_INSERT_ALL2 START WITH 100;
/*
Sequence SEQ_CURSO_INSERT_ALL2 criado.
*/

INSERT ALL
    WHEN TOTAL >= 1000 THEN
        INTO TCURSO (COD_CURSO, NOME, VALOR)
        VALUES (SEQ_CURSO_INSERT_ALL.NEXTVAL, 'CURSO>1000', TOTAL)
    WHEN DESCONTO IS NULL THEN
        INTO TCURSO (COD_CURSO, NOME, VALOR)
        VALUES (SEQ_CURSO_INSERT_ALL.NEXTVAL, 'DESCONTO IS NULL', TOTAL)
    SELECT COD_CONTRATO, TOTAL, DESCONTO
    FROM TCONTRATO WHERE COD_CONTRATO <=4;
/*
Relatório de erros -
ORA-00001: restrição exclusiva (IAREIS.SYS_C007000) violada
*/

ALTER TABLE TCURSO DISABLE CONSTRAINT SYS_C007000;
/*
Table TCURSO alterado.
*/



6 linhas inserido.
==================================================================
SELECT * FROM TCURSO;

COD_CURSO   NOME                    VALOR    CARGA_HORARIA   PRE_REQ   
           1 ORACLE SQL ePL/SQL          564,99               25          7 
           2 ORACLE DBA                   648,6               25          1 
           3 JAVA FUNDAMENTOS E 00         3000              100          7 
           4 JAVASERVER FACES              3000              100          3 
           5 WINDOWS                       1189               50            
           6 OFFICE                        1189               60            
           7 HTML5                         1189               70            
           8 CCS3                          1189               80          7 
           9 JAVASCRIPT                    1124              100          7 
          10 PS/SQL DEVELOPER            1171,5               16            
          52 TESTE-y                       1100                             
          60 INSERT_ALL                    1013                             
         110 CURSO>1000                    2500                             
         111 CURSO>1000                    1500                             
         112 CURSO>1000                    1600                             
         110 DESCONTO IS NULL              2500                             
         111 DESCONTO IS NULL              1500                             
         112 DESCONTO IS NULL              1600                             


18 linhas selecionadas. 

























































































