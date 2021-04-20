SELECT * FROM TALUNO;
/*
COD_ALUNO   NOME              CIDADE           CEP        ESTADO   SALARIO   NASCIMENTO   
          26 RADOMILE           SAO PAULO                     SP               620 21/07/18      
          27 PETRY              SAO JOSE                      SC               620 21/07/18      
          28 DIOGENES           TERESINA                      PI               620 21/07/18      
          29 REINALDO           TERESINA                      PI               620 21/07/18      
          30 DIEGO              PASSO FUNDO                   RS               620 21/07/18      
          64 ALFREDO234                                       RS               620 23/07/18      
           1 Marcio             NOVO HAMBURGO     93320970    RS            633,47 10/10/01      
           2 Paula              CANOAS            89163413    RS              2000 10/08/00      
           3 Maria              SAPIRANGA         93800012    RS               620 13/07/18      
           5 Beta               PORTO ALEGRE      90020180    RS              3200 13/07/18      
          10 Teresa             CANOAS            89163413    RS              1720 23/02/82      
          11 Adon               TUBARÃO           88701970    SC              1420 24/04/72      
          12 Ísis               CANOAS            88034101    SC              1720 25/06/62      
          13 Pimbo              RIO BRANCO        69908440    AC              1220 26/08/52      
          14 Anderson           FLORIANÓPOLIS     88034101    SC              1720 27/10/82      
          16 Ubaldo             VIAMÃO            40015970    BA              1020 29/01/92      
          17 Wolney             PORTO ALEGRE      90020180    RS              1720 30/03/02      
          18 Iury               ARAGUAINA         77818635    AC               320 01/05/83      
          20 Vania              PINHAL            98345000    RS               720 02/07/88      
          25 Mylla              VACARIA                       RS               800 18/07/18      
          60 Marter Training                                  RS               620 18/07/18      
          62 Supra Training                                   RS               620 18/07/18      
           6 Pedro              DOIS IRMAOS       93950000    RS               900 13/07/18      
           7 Aldo               QUATRO IRMAOS     99720000    RS              1500 13/07/18      
           8 Iuri               FLORIANOPOLIS     88034101    SC           2500,75 11/02/70      
           9 Xita               RIO BRANCO                    AC               620 10/08/17      
          21 Null               TORRES            95560000    RS              2350 12/05/79      
          22 Alberto            CURITIBA          81050360    PR              2120 14/07/81      
          23 Beatriz            VITÓRIA           29000000    ES              4350 16/09/84      
          24 Clodoaldo          BELO HORIZONTE    31630900    MG              7350 18/11/86      

COD_ALUNO   NOME       CIDADE           CEP        ESTADO   SALARIO   NASCIMENTO   
          31 Damaris     CAMPO GRANDE      79002190    MS              2820 20/01/88      
          32 Everton     MANAUS            69030418    AM              5280 22/03/90      
          35 Fabíula     RIO BRANCO        69908440    AC              1370 24/04/92      
          36 Jeferson    RIO DE JANEIRO    23548168    RJ             14300 26/06/68      
          37 Karen       ANGRA DOS REIS    23900050    RJ              1370 28/08/94      


35 linhas selecionadas. 
*/

--O comando utilizado para apagar dados é o DELETE.
DELETE TALUNO;
/*
35 linhas excluído.
*/

SELECT * FROM TALUNO;

SELECT * FROM USER_TABLES;
/*
TABLE_NAME   TABLESPACE_NAME   CLUSTER_NAME   IOT_NAME   STATUS   PCT_FREE   PCT_USED   INI_TRANS   MAX_TRANS   INITIAL_EXTENT   NEXT_EXTENT   MIN_EXTENTS   MAX_EXTENTS   PCT_INCREASE   FREELISTS   FREELIST_GROUPS   LOGGING   BACKED_UP   NUM_ROWS   BLOCKS   EMPTY_BLOCKS   AVG_SPACE   CHAIN_CNT   AVG_ROW_LEN   AVG_SPACE_FREELIST_BLOCKS   NUM_FREELIST_BLOCKS   DEGREE       INSTANCES    CACHE   TABLE_LOCK   SAMPLE_SIZE   LAST_ANALYZED   PARTITIONED   IOT_TYPE   TEMPORARY   SECONDARY   NESTED   BUFFER_POOL   FLASH_CACHE   CELL_FLASH_CACHE   ROW_MOVEMENT   GLOBAL_STATS   USER_STATS   DURATION   SKIP_CORRUPT   MONITORING   CLUSTER_OWNER   DEPENDENCIES   COMPRESSION   COMPRESS_FOR   DROPPED   READ_ONLY   SEGMENT_CREATED   RESULT_CACHE   
TALUNO        TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      0         5               0            0            0              0                            0                      0          1             1        N    ENABLED                    0 19/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TCURSO        TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                     11         5               0            0            0             24                            0                      0          1             1        N    ENABLED                   11 16/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TCONTRATO     TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                     14         5               0            0            0             20                            0                      0          1             1        N    ENABLED                   14 15/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TITEM         TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      8         5               0            0            0             12                            0                      0          1             1        N    ENABLED                    8 08/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TDESCONTO     TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      6         5               0            0            0              8                            0                      0          1             1        N    ENABLED                    6 12/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TESTE         TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      2         5               0            0            0             11                            0                      0          1             1        N    ENABLED                    2 13/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TABELA        TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      0         0               0            0            0              0                            0                      0          1             1        N    ENABLED                    0 13/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TCIDADE       TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      4         5               0            0            0             13                            0                      0          1             1        N    ENABLED                    4 13/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TBAIRRO       TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      5         5               0            0            0             14                            0                      0          1             1        N    ENABLED                    5 16/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TRUA          TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      4         5               0            0            0             20                            0                      0          1             1        N    ENABLED                    4 13/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TPESSOA       TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      4         5               0            0            0             21                            0                      0          1             1        N    ENABLED                    4 13/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TCONTAS       TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      9         5               0            0            0             19                            0                      0          1             1        N    ENABLED                    9 16/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TAB_04        TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      0         0               0            0            0              0                            0                      0          1             1        N    ENABLED                    0 19/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         
TAB_05        TBS_DADOS                                      VALID              10                        1          255             65536        1048576              1     2147483645                                                 YES        N                      0         0               0            0            0              0                            0                      0          1             1        N    ENABLED                    0 19/04/21         NO                         N            N            NO        DEFAULT        DEFAULT        DEFAULT             DISABLED        YES             NO                        DISABLED        YES                            DISABLED        DISABLED                       NO         NO           YES                DEFAULT         

*/

DROP TALUNO;
/*
Erro a partir da linha : 73 no comando -
DROP TALUNO
Relatório de erros -
ORA-00950: opção DROP inválida
00950. 00000 -  "invalid DROP option"
*Cause:    
*Action:
*/

DROP TABLE não pode ser usado para descartar uma tabela que é referenciada
por uma restrição FOREIGN KEY. A restrição FOREIGN KEY que faz referência
ou a tabela de referência deve ser primeiramente descartada.

Se a tabela de referência e a tabela que contém a chave primária forem descartadas
na mesma instrução DROP TABLE, a tabela de referência deverá ser listada em primeiro lugar.

/*
CREATE TABLE TALUNO(
    COD_ALUNO INTEGER NOT NULL,
    NOME VARCHAR2(40),
    SOBREN VARCHAR2(40), --SOBRENOME
    TIPO VARCHAR(2),
    CIDADE VARCHAR(30),
    CEP NUMBER(8),
    ESTADO VARCHAR(2),
    SALARIO NUMBER(8,2),
    NASCIMENTO DATE,
    CONSTRAINT  PK_TALUNO   PRIMARY KEY(COD_ALUNO),
                UK_CPF      UNIQUE(CPF),
                CK_TIPO     CHECK(TIPO IN ('J', 'F'))
);
*/


COMO NÃO É POSSÍVEL CRIAR UMA NOVA TALUNO DEVIDO A UMA RESTRIÇÃO FOREIGN KEY
O CREATE ABAIXO NÃO SERÁ REALIZADO. 

CREATE TABLE TALUNO(
    COD_ALUNO INTEGER NOT NULL,
    NOME VARCHAR2(40),
    SOBRENOME VARCHAR2(40), 
    TIPO VARCHAR(2),
    CIDADE VARCHAR(30),
    CEP NUMBER(8),
    ESTADO VARCHAR(2),
    SALARIO NUMBER(8,2),
    NASCIMENTO DATE
    --CONSTRAINT  PK_TALUNOS   PRIMARY KEY(COD_ALUNO)
);

DESCRIBE TALUNO;
/*
Nome         Nulo?      Tipo           
COD_ALUNO     NOT NULL    NUMBER(38)      
NOME                      VARCHAR2(30)    
CIDADE                    VARCHAR2(30)    
CEP                       VARCHAR2(10)    
ESTADO                    CHAR(2)         
SALARIO                   NUMBER(8,2)     
NASCIMENTO                DATE  
*/

VOU ALTERAR ALGUNS PARAMETROS...

ALTER TABLE TALUNO MODIFY COD_ALUNO INTEGER;
ALTER TABLE TALUNO MODIFY NOME VARCHAR2(40);
ALTER TABLE TALUNO ADD SOBRENOME VARCHAR2(40);
ALTER TABLE TALUNO ADD TIPO VARCHAR2(2);
ALTER TABLE TALUNO MODIFY CEP NUMBER(8);

DESCRIBE TALUNO;
/*
COD_ALUNO     NOT NULL    NUMBER(38)      
NOME                      VARCHAR2(40)    
CIDADE                    VARCHAR2(30)    
CEP                       NUMBER(8)       
ESTADO                    CHAR(2)         
SALARIO                   NUMBER(8,2)     
NASCIMENTO                DATE            
SOBRENOME                 VARCHAR2(40)    
TIPO                      VARCHAR2(2) 
*/

A alteração da ordem das colunas de uma tabela pode afetar o código e
os aplicativos que dependam da ordem específica das colunas.
Isso inclui consultas, exibições, procedimentos armazenados,
funções definidas pelo usuário e aplicativos clientes.
Analise cuidadosamente todas as alterações que deseja fazer à ordem das colunas
antes fazê-las. A prática recomendada é especificar a ordem em que as colunas
serão retornadas nos níveis de aplicativo e de consulta. Você não deve confiar
no uso de SELECT * para retornar todas as colunas na ordem esperada com base
na ordem em que são definidas na tabela. Sempre especifique as colunas por nome
em suas consultas e aplicativos na ordem em que você gostaria que elas aparecessem.

--===============================================================

COMO A TABELA ESTA VAZIA, VOU ALTERAR O NOME DAS COLUNAS PARA FICAREM NA ORDEM DESEJADA... 

ALTER TABLE TALUNO RENAME COLUMN CIDADE TO BABABA;
ALTER TABLE TALUNO RENAME COLUMN CEP TO XOXOXO;
ALTER TABLE TALUNO RENAME COLUMN ESTADO TO CIDADE;
ALTER TABLE TALUNO RENAME COLUMN SALARIO TO CEP;
ALTER TABLE TALUNO RENAME COLUMN NASCIMENTO TO ESTADO;
ALTER TABLE TALUNO RENAME COLUMN SOBRENOME TO SALARIO;
ALTER TABLE TALUNO RENAME COLUMN TIPO TO NASCIMENTO;
ALTER TABLE TALUNO RENAME COLUMN BABABA TO SOBRENOME;
ALTER TABLE TALUNO RENAME COLUMN XOXOXO TO TIPO;

DESCRIBE TALUNO;
/*
Nome         Nulo?      Tipo           
COD_ALUNO     NOT NULL    NUMBER(38)      
NOME                      VARCHAR2(40)    
SOBRENOME                 VARCHAR2(30)    
TIPO                      NUMBER(8)       
CIDADE                    CHAR(2)         
CEP                       NUMBER(8,2)     
ESTADO                    DATE            
SALARIO                   VARCHAR2(40)    
NASCIMENTO                VARCHAR2(2)
*/

ALTER TABLE TALUNO MODIFY SOBRENOME VARCHAR2(40);
ALTER TABLE TALUNO MODIFY TIPO CHAR(2);
ALTER TABLE TALUNO MODIFY CIDADE VARCHAR(30);
ALTER TABLE TALUNO MODIFY CEP NUMBER(8);
ALTER TABLE TALUNO MODIFY SALARIO NUMBER(8,2);
ALTER TABLE TALUNO MODIFY NASCIMENTO DATE;

ALTER TABLE TALUNO MODIFY ESTADO CHAR(2);
/*
Erro a partir da linha : 202 no comando -
ALTER TABLE TALUNO MODIFY ESTADO CHAR(2)
Relatório de erros -
ORA-01401: valor inserido grande demais para a coluna
01401. 00000 -  "inserted value too large for column"
*Cause:    The value inserted was too large for the given column.
*Action:   Do not insert a value greater than what the column can hold.
Decorrido: 00:00:00.022
*/

ALTER TABLE TALUNO DROP COLUMN ESTADO;
ALTER TABLE TALUNO DROP COLUMN SALARIO;
ALTER TABLE TALUNO DROP COLUMN NASCIMENTO;

ALTER TABLE TALUNO ADD ESTADO CHAR(2);
ALTER TABLE TALUNO ADD SALARIO NUMBER(8,2);
ALTER TABLE TALUNO ADD NASCIMENTO DATE;

DESCRIBE TALUNO;
/*
Decorrido: 00:00:00.008
Nome         Nulo?      Tipo           
COD_ALUNO     NOT NULL    NUMBER(38)      
NOME                      VARCHAR2(40)    
SOBRENOME                 VARCHAR2(40)    
TIPO                      CHAR(2)         
CIDADE                    VARCHAR2(30)    
CEP                       NUMBER(8)       
ESTADO                    CHAR(2)         
SALARIO                   NUMBER(8,2)     
NASCIMENTO                DATE  
*/
--===============================================================

SELECT * FROM USER_CONSTRAINTS;
/*
OWNER    CONSTRAINT_NAME                  CONSTRAINT_TYPE   TABLE_NAME                       SEARCH_CONDITION             R_OWNER   R_CONSTRAINT_NAME   DELETE_RULE   STATUS    DEFERRABLE       DEFERRED    VALIDATED   GENERATED        BAD   RELY   LAST_CHANGE   INDEX_OWNER   INDEX_NAME    INVALID   VIEW_RELATED   
IAREIS    SYS_C006997                       C                  TALUNO                            "COD_ALUNO" IS NOT NULL                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   07/04/21                                                                
IAREIS    SYS_C006998                       P                  TALUNO                                                                                                         ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   07/04/21       IAREIS         SYS_C006998                               
IAREIS    SYS_C006999                       C                  TCURSO                            "COD_CURSO" IS NOT NULL                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   07/04/21                                                                
IAREIS    SYS_C007000                       P                  TCURSO                                                                                                         ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   07/04/21       IAREIS         SYS_C007000                               
IAREIS    SYS_C007001                       C                  TCONTRATO                         "COD_CONTRATO" IS NOT NULL                                                   ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   07/04/21                                                                
IAREIS    SYS_C007002                       P                  TCONTRATO                                                                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   07/04/21       IAREIS         SYS_C007002                               
IAREIS    SYS_C007005                       C                  TITEM                             "COD_ITEM" IS NOT NULL                                                       ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   08/04/21                                                                
IAREIS    SYS_C007006                       P                  TITEM                                                                                                          ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   08/04/21       IAREIS         SYS_C007006                               
IAREIS    SYS_C007031                       P                  TDESCONTO                                                                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   12/04/21       IAREIS         SYS_C007031                               
IAREIS    SYS_C007034                       C                  TESTE                             "CODIGO" IS NOT NULL                                                         ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007035                       P                  TESTE                                                                                                          ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21       IAREIS         SYS_C007035                               
IAREIS    BIN$EhN4X//uQd6tk9DlP/rsNg==$0    C                  BIN$EDi4cnomRmac65CSSm/gKg==$0    "COD_CONTRATO" IS NOT NULL                                                   ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007037                       C                  TABELA                            "COD_TESTE" IS NOT NULL                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007038                       P                  TABELA                                                                                                         ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21       IAREIS         SYS_C007038                               
IAREIS    SYS_C007039                       C                  TCIDADE                           "COD_CIDADE" IS NOT NULL                                                     ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    PK_CIDADE                         P                  TCIDADE                                                                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21       IAREIS         PK_CIDADE                                 
IAREIS    SYS_C007041                       C                  TBAIRRO                           "COD_CIDADE" IS NOT NULL                                                     ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007042                       C                  TBAIRRO                           "COD_BAIRRO" IS NOT NULL                                                     ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    PK_BAIRRO                         P                  TBAIRRO                                                                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21       IAREIS         PK_BAIRRO                                 
IAREIS    FK_COD_CIDADE                     R                  TBAIRRO                                                         IAREIS     PK_CIDADE            NO ACTION      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21                                                                
IAREIS    SYS_C007045                       C                  TRUA                              "COD_RUA" IS NOT NULL                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    PK_RUA                            P                  TRUA                                                                                                           ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21       IAREIS         PK_RUA                                    
IAREIS    FK_CIDADEBAIRRO                   R                  TRUA                                                            IAREIS     PK_BAIRRO            NO ACTION      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21                                                                
IAREIS    SYS_C007048                       C                  TPESSOA                           "COD_PESSOA" IS NOT NULL                                                     ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007049                       C                  TPESSOA                           "TIPO" IS NOT NULL                                                           ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007050                       C                  TPESSOA                           "NOME" IS NOT NULL                                                           ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007051                       C                  TPESSOA                           "PESSOA" IS NOT NULL                                                         ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    SYS_C007052                       C                  TPESSOA                           "COD_RUA" IS NOT NULL                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    GENERATED NAME                   13/04/21                                                                
IAREIS    PK_PESSOA                         P                  TPESSOA                                                                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21       IAREIS         PK_PESSOA                                 
IAREIS    UK_CPF                            U                  TPESSOA                                                                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED    USER NAME                        13/04/21       IAREIS         UK_CPF                                    
IAREIS    FK_PESSOA_RUA           R                  TPESSOA                                       IAREIS     PK_RUA               NO ACTION      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        13/04/21                                                                
IAREIS    CK_PESSOA_TIPO          C                  TPESSOA          TIPO IN ('C', 'F')                                                          ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        13/04/21                                                                
IAREIS    CK_PESSOA_JF            C                  TPESSOA          PESSOA IN('J', 'F')                                                         ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        13/04/21                                                                
IAREIS    CK_CONTRATO_DESCONTO    C                  TCONTRATO        DESCONTO BETWEEN 0 AND 30                                                   ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        13/04/21                                                                
IAREIS    VCURSOS1000__CK         V                  VCURSOS1000CK                                                                                ENABLED    NOT DEFERRABLE    IMMEDIATE    NOT VALIDATED    USER NAME                        13/04/21                                                                
IAREIS    SYS_C007075             C                  TCONTAS          "CODIGO" IS NOT NULL                                                        ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        GENERATED NAME                   16/04/21                                                                
IAREIS    SYS_C007076             P                  TCONTAS                                                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        GENERATED NAME                   16/04/21       IAREIS         SYS_C007076                               
IAREIS    SYS_C007097             C                  TAB_04           "COD_TAB4" IS NOT NULL                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        GENERATED NAME                   18/04/21                                                                
IAREIS    PK_TAB_04               P                  TAB_04                                                                                       ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        18/04/21       IAREIS         PK_TAB_04                                 
IAREIS    SYS_C007099             C                  TAB_05           "COD_TAB4" IS NOT NULL                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        GENERATED NAME                   18/04/21                                                                
IAREIS    SYS_C007100             C                  TAB_05           "COD_TAB5" IS NOT NULL                                                      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        GENERATED NAME                   18/04/21                                                                
IAREIS    PK_TAB_05               P                  TAB_05                                                                                       ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        18/04/21       IAREIS         PK_TAB_05                                 
IAREIS    FK_COD_TAB4             R                  TAB_05                                        IAREIS     PK_TAB_04            NO ACTION      ENABLED    NOT DEFERRABLE    IMMEDIATE    VALIDATED        USER NAME                        18/04/21                                                                
IAREIS    CK_TIPO                 C                  TALUNO           TIPO IN ('J', 'F')     
*/

ESTAS DUAS ALTERAÇÕES NÃO SERÃ REALIZADAS
A PRIMEIRA POIS POSSUI O NOME PADRÃO SYS_C006998
A SEGUNDA POR ESTAR OK COMO EU QUERIA

        ALTER TABLE TALUNO ADD CONSTRAINT PK_COD_ALUNO PRIMARY KEY (COD_ALUNO); --SYS_C006998
        ALTER TABLE TALUNO ADD CONSTRAINT CK_TIPO CHECK(TIPO IN ('J', 'F'));

A TERCEIRA ALTEREI O NOME DA CONSTRAINT POIS O UK_CPF EM USO NA TABELA TPESSOA, 
CONFORME VISTO NO RELATORIO ACIMA.

        ALTER TABLE TALUNO ADD CONSTRAINT UK_CPF_ALUNO UNIQUE(CPF);

MAS... 
/*
Erro a partir da linha : 300 no comando -
ALTER TABLE TALUNO ADD CONSTRAINT UK_CPF_ALUNO UNIQUE(CPF)
Relatório de erros -
ORA-00904: "CPF": identificador inválido
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
*/

--===============================================================

SELECT * FROM USER_SEQUENCES; 

SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
/*
SEQUENCE_NAME   
SEQ_ALUNEW       
SEQ_ALUNO        
SEQ_ALUNO1       
SEQ_CONTRATO     
*/ 

DROP SEQUENCE SEQ_ALUNO;
/*
Sequence SEQ_ALUNO eliminado.
*/

DROP SEQUENCE SEQ_ALUNO1;
/*
Sequence SEQ_ALUNO1 eliminado.
*/

CREATE SEQUENCE SEQ_ALUNO START WITH 1;
/*
Sequence SEQ_ALUNO criado.
*/

--===============================================================

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'MARCO', 'RADOMILE', 'F', 'SAO PAULO', '01333010', 'SP', '620', '21/07/1972');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'MARCELO', 'PETRY', 'F', 'SAO JOSE', '88101090', 'S', '620', '21/07/1971');   

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'DIOGENES', 'CARVALHO', 'F', 'TERESINA', '64039650', 'PI', '620', '21/07/1978');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'REINALDO', 'MOURA', 'F', 'TERESINA', '64039650', 'PI', '620', '21/07/1980');   

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'DIEGO', 'FIDELIS', 'J', 'PASSO FUNDO', '99001970', 'RS', '620', '21/07/1967');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'ALFREDO234', 'NOSTRO', 'J', 'ALEGRETE', '96200010', 'RS', '620', '23/07/1954'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Marcio', 'gARCIA', 'F', 'NOVO HAMBURGO', '93320970', 'RS', '633,47', '20/10/2000'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Paula', 'ARAUJO', 'F', 'CANOAS', '89163413', 'RS', '2000', '10/08/2000');   

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Maria', 'ANOTIETA', 'J', 'SAPIRANGA', '93800012', 'RS', '620', '13/07/1917');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Beta', 'BARROS', 'J', 'PORTO ALEGRE', '90020180', 'RS', '3200', '13/07/1918');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Teresa', 'CRISTINA', 'F', 'CANOAS', '9163413', 'RS', '1720', '23/02/1982'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Adon', 'iSTOL', 'F', 'TUBARÃO', ' 88701970', 'SC', '1420', '24/04/1972');   

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Ísis', 'REIS', 'F', 'Florianopolis', '88034101', 'SC', '1720', '25/06/1962');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Pimbo', 'LINDO', 'J', 'RIO BRANCO', '69908440', 'AC', '1220', '26/08/1952'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'ALEXANDRE', 'GRANDE', 'F', 'FLORIANÓPOLIS', '88034101', 'SC', '1720', '27/10/1982');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Ubaldo', 'MEIRELES', 'F', 'SALVADOR', '40015970', 'BA', '1020', '29/01/1992'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Wolney', 'CARVALHO', 'F', 'PORTO ALEGRE', '90020180', 'RS', '1720', '30/03/2002'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Iury', 'SOUZA', 'F', 'ARAGUAINA', '77818635', 'AC', '320', '01/05/1983'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Vania', 'AMIM', 'F', 'PINHAL', '98345000', 'RS', '720', '02/07/1988');   

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Mylla', 'mARGARINA', 'J', ' VACARIA', '95200000', 'RS', '800', '18/07/1918'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Pedro', 'SOUZA', 'F', 'DOIS IRMAOS', '93950000', 'RS', '900', '13/07/1934');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Pedro', 'SOUZA', 'F', 'DOIS IRMAOS', '93950000', 'RS', '900', '13/07/1934'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Aldo', 'KRISHER', 'F', 'QUATRO IRMAOS', '99720000', 'RS', '1500', '13/07/1944'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Pedro', 'SOUZA', 'F', 'DOIS IRMAOS', '93950000', 'RS', '900', '13/07/1934'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Iuri', 'REIS', 'F', 'FLORIANOPOLIS', '88034101', 'SC', '2500,75', '11/02/1970');

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Xita', 'MULA', 'J', 'RIO BRANCO', '69908440', 'AC', '620', '10/08/1975'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Null', 'Null', 'J', 'TORRES', '95560000', 'RS', '2350', '12/05/1980');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Alberto', 'Roberty', 'F', 'CURITIBA', '81050360', 'PR', '2120', '14/07/1985');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Beatriz', 'Seis', 'F', 'VITÓRIA', '29000000', 'ES', '4350', '16/09/1990');     

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Clodoaldo', 'Buzz', 'F', 'BELO HORIZONTE', '31630900', 'MG', '7350', '18/11/1995'); 

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Damaris', 'Aiaiai', 'F', 'CAMPO GRANDE', '79002190', 'MS', '2820', '20/01/2000');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Everton', 'Cunha', 'F', 'MANAUS', '69030418', 'AM', '5280', '22/03/2005');   

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Fabíula', 'grell', 'F', 'RIO BRANCO', '69908440', 'AC', '1370', '24/04/2001');  

INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Jeferson', 'Pelutis', 'F', 'RIO DE JANEIRO', '23548168', 'RJ', '14300', '26/06/1968'); 
         
INSERT INTO TALUNO (COD_ALUNO, NOME, SOBRENOME, TIPO, CIDADE, CEP, ESTADO, SALARIO, NASCIMENTO)
VALUES(SEQ_ALUNO.NEXTVAL, 'Karen', 'Girrfa', 'F', 'ANGRA DOS REIS', '23900050', 'RJ', '1370 ', '8/08/2002');          

--===============================================================

SELECT * FROM TALUNO;
/*
OD_ALUNO   NOME         SOBRENOME   TIPO   CIDADE           CEP        ESTADO   SALARIO   NASCIMENTO   
           1 MARCO         RADOMILE     F       SAO PAULO             1333010 SP               620 21/07/72      
           2 MARCELO       PETRY        F       SAO JOSE             88101090 S                620 21/07/71      
           3 DIOGENES      CARVALHO     F       TERESINA             64039650 PI               620 21/07/78      
           4 REINALDO      MOURA        F       TERESINA             64039650 PI               620 21/07/80      
           5 DIEGO         FIDELIS      J       PASSO FUNDO          99001970 RS               620 21/07/67      
           6 ALFREDO234    NOSTRO       J       ALEGRETE             96200010 RS               620 23/07/54      
           7 Marcio        gARCIA       F       NOVO HAMBURGO        93320970 RS            633,47 20/10/00      
           8 Paula         ARAUJO       F       CANOAS               89163413 RS              2000 10/08/00      
           9 Maria         ANOTIETA     J       SAPIRANGA            93800012 RS               620 13/07/17      
          10 Beta          BARROS       J       PORTO ALEGRE         90020180 RS              3200 13/07/18      
          11 Teresa        CRISTINA     F       CANOAS                9163413 RS              1720 23/02/82      
          12 Adon          iSTOL        F       TUBARÃƒO             88701970 SC              1420 24/04/72      
          13 Ã?sis         REIS         F       Florianopolis        88034101 SC              1720 25/06/62      
          14 Pimbo         LINDO        J       RIO BRANCO           69908440 AC              1220 26/08/52      
          15 ALEXANDRE     GRANDE       F       FLORIANÃ“POLIS       88034101 SC              1720 27/10/82      
          16 Ubaldo        MEIRELES     F       SALVADOR             40015970 BA              1020 29/01/92      
          17 Wolney        CARVALHO     F       PORTO ALEGRE         90020180 RS              1720 30/03/02      
          18 Iury          SOUZA        F       ARAGUAINA            77818635 AC               320 01/05/83      
          19 Vania         AMIM         F       PINHAL               98345000 RS               720 02/07/88      
          20 Mylla         mARGARINA    J        VACARIA             95200000 RS               800 18/07/18      
          21 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS               900 13/07/34      
          22 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS               900 13/07/34      
          23 Aldo          KRISHER      F       QUATRO IRMAOS        99720000 RS              1500 13/07/44      
          24 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS               900 13/07/34      
          25 Iuri          REIS         F       FLORIANOPOLIS        88034101 SC           2500,75 11/02/70      
          26 Xita          MULA         J       RIO BRANCO           69908440 AC               620 10/08/75      
          27 Null          Null         J       TORRES               95560000 RS              2350 12/05/80      
          28 Alberto       Roberty      F       CURITIBA             81050360 PR              2120 14/07/85      
          29 Beatriz       Seis         F       VITÃ“RIA             29000000 ES              4350 16/09/90      
          30 Clodoaldo     Buzz         F       BELO HORIZONTE       31630900 MG              7350 18/11/95      
          31 Damaris     Aiaiai       F       CAMPO GRANDE         79002190 MS              2820 20/01/00      
          32 Everton     Cunha        F       MANAUS               69030418 AM              5280 22/03/05      
          33 FabÃ­ula    grell        F       RIO BRANCO           69908440 AC              1370 24/04/01      
          34 Jeferson    Pelutis      F       RIO DE JANEIRO       23548168 RJ             14300 26/06/68      
          35 Karen       Girrfa       F       ANGRA DOS REIS       23900050 RJ              1370 08/08/02 
*/

-- =======================================================================

--CREATE SEQUENCE SEQ_SAL_ALUNO START WITH .1 INCREMENT BY .0145;
CREATE SEQUENCE SEQ_SAL_ALUNO START WITH 1;
/*
Sequence SEQ_SAL_ALUNO criado.
*/

-- =======================================================================

CREATE OR REPLACE PROCEDURE NOVO_SALARIO (
    P_COD_ALUNO NUMBER)
IS 
BEGIN
    UPDATE TALUNO SET 
    SALARIO = SALARIO * SEQ_SAL_ALUNO.NEXTVAL
    WHERE COD_ALUNO = P_COD_ALUNO;
END;




DECLARE
    V_COD INTEGER :=&COD;
BEGIN 
    NOVO_SALARIO(V_COD);
END;




SELECT NOME, SALARIO FROM TALUNO
WHERE COD_ALUNO IN (1, 2, 3, 4, 5, 6);
/*
NOME         SALARIO   
MARCO                620 
MARCELO             1240 
DIOGENES            1860 
REINALDO            2480 
DIEGO               3100 
ALFREDO234          3720 
*/

-- =======================================================================


CREATE OR REPLACE PROCEDURE NOVO_SALARIO_VIP (
    P_COD_ALUNO NUMBER)
IS 
BEGIN
    UPDATE TALUNO SET 
    SALARIO = SALARIO * (SEQ_SAL_ALUNO.NEXTVAL / 2)
    WHERE COD_ALUNO = P_COD_ALUNO;
END;



DECLARE
    V_COD INTEGER :=&COD;
BEGIN 
    NOVO_SALARIO_VIP(V_COD);
END;




SELECT NOME, SALARIO FROM TALUNO
WHERE COD_ALUNO IN (18, 19, 20, 21, 22);
/*
NOME    SALARIO   
Iury            320 
Vania           720 
Mylla           800 
Pedro           900 
Pedro           900 

--------------------------

NOME    SALARIO   
Iury           1120 
Vania          2880 
Mylla          3600 
Pedro          4500 
Pedro          4950 
*/
-- =======================================================================

