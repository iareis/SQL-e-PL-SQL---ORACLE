=========================
===   COMANDO MERGE   ===
=========================

SELECT * FROM TALUNO ORDER BY COD_ALUNO;

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
          31 Damaris       Aiaiai       F       CAMPO GRANDE         79002190 MS              2820 20/01/00      
          32 Everton       Cunha        F       MANAUS               69030418 AM              5280 22/03/05      
          33 FabÃ­ula      grell        F       RIO BRANCO           69908440 AC              1370 24/04/01      
          34 Jeferson      Pelutis      F       RIO DE JANEIRO       23548168 RJ             14300 26/06/68      
          35 Karen         Girrfa       F       ANGRA DOS REIS       23900050 RJ              1370 08/08/02      
          60 INSERT_ALL                         RS                        620                 1013               
          61 MARCIO        Konrath      F       NOVO HAMBURGO        93000000 RS             13000 11/03/57      
          62 PAULA         ABDUL        J       IVOTI                93000000 RS             13000 11/03/57      
          63 MARIA         BOLENA       J       SAPIRANGA            93000000 RS             13000 11/03/57      


39 linhas selecionadas.
===============================================================================================

SELECT * FROM TCONTRATO ORDER BY COD_CONTRATO;

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
             38 20/04/21              10     1500          22                   
             39 19/04/21              10     2600          22                   
             53 21/04/21               8       15         666                   
             60 21/04/21              17       15         666                   
             61 21/04/21              19       15         666                   
             62 21/04/21              20       15         666                   
             63 21/04/21              21       15         666                   
             64 21/04/21              22       15         666                   
             65 21/04/21              23       15         666                   
             66 21/04/21              24       15         666                   
             67 21/04/21              27       15         666                   
             71 21/04/21               6      500          10               100 
             72 21/04/21               7      500          10               100 
             73 21/04/21               8     1500           5                50 
             74 16/04/21               7     1600          10                50 
             75 17/04/21               9      800          10                25 
             76 18/04/21               9      445           0                25 
             77 19/04/21               9      445          20              12,5 


32 linhas selecionadas.
===============================================================================================



CREATE SEQUENCE SEQ_NEW_CON START WITH 80;
/*
Sequence SEQ_NEW_CON criado.
*/


MERGE INTO TCONTRATO tcn
    USING   (SELECT COD_ALUNO AS ALUNO
            FROM TALUNO)
    ON (tcn.COD_ALUNO = ALUNO )
        WHEN MATCHED THEN --Encontrou o registro
            UPDATE SET desconto = 15
        WHEN NOT MATCHED THEN --nao encontrou o registro
            INSERT  (tcn.COD_CONTRATO,
                    tcn.DATA,
                    tcn.COD_ALUNO,
                    tcn.desconto,
                    tcn.total,
                    tcn.VALOR_COMISSAO)
            VALUES  (SEQ_NEW_CON.NextVal,SYSDATE, ALUNO, 0, 1250, 17);
/*
53 linhas mesclado.
*/

SELECT * FROM TCONTRATO ORDER BY COD_CONTRATO;
/*
COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   VALOR_COMISSAO   
              1 07/04/21               1      450          15                   
              2 05/01/13               2     2500          15                   
              3 07/04/21               3     1500          15                   
              4 02/04/21               2     1600          15                   
              5 03/04/21               5     5000          15                   
              6 04/04/21               5      445          15                   
              7 05/04/21               5      445          15                   
              8 12/03/21               6      800          15                   
              9 17/03/21               7      445          15                   
             10 18/03/21               7      500          15                   
             11 22/03/21               9     5000          15                   
             12 24/03/21               9      800          15                   
             13 29/03/21              10      800          15                   
             14 12/03/21              11      800          15                   
             38 20/04/21              10     1500          15                   
             39 19/04/21              10     2600          15                   
             53 21/04/21               8       15          15                   
             60 21/04/21              17       15          15                   
             61 21/04/21              19       15          15                   
             62 21/04/21              20       15          15                   
             63 21/04/21              21       15          15                   
             64 21/04/21              22       15          15                   
             65 21/04/21              23       15          15                   
             66 21/04/21              24       15          15                   
             67 21/04/21              27       15          15                   
             71 21/04/21               6      500          15               100 
             72 21/04/21               7      500          15               100 
             73 21/04/21               8     1500          15                50 
             74 16/04/21               7     1600          15                50 
             75 17/04/21               9      800          15                25 
             76 18/04/21               9      445          15                25 
             77 19/04/21               9      445          15              12,5 
            112 21/04/21              61     1250           0                17 
            113 21/04/21              60     1250           0                17 
            114 21/04/21              26     1250           0                17 
            115 21/04/21              15     1250           0                17 
            116 21/04/21              18     1250           0                17 
            117 21/04/21              30     1250           0                17 
            118 21/04/21               4     1250           0                17 
            119 21/04/21              28     1250           0                17 
            120 21/04/21              25     1250           0                17 
            121 21/04/21              62     1250           0                17 
            122 21/04/21              31     1250           0                17 
            123 21/04/21              12     1250           0                17 
            124 21/04/21              32     1250           0                17 
            125 21/04/21              63     1250           0                17 
            126 21/04/21              14     1250           0                17 
            127 21/04/21              16     1250           0                17 
            128 21/04/21              13     1250           0                17 
            129 21/04/21              33     1250           0                17 
            130 21/04/21              29     1250           0                17 
            131 21/04/21              34     1250           0                17 
            132 21/04/21              35     1250           0                17 


53 linhas selecionadas.
*/






















































