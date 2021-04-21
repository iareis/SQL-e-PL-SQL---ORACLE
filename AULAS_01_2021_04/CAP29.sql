===========================================
===   PL/SQL AVANCADO                   ===
===   REVISAO, ABORDAGEM E CONVENCOES   ===
===========================================

-- Caso tenhas estas tabelas criadas de outro curso como o
-- SQL ou PL/SQL não precisa executar novamente

SELECT * FROM TALUNO;

 COD_ALUNO NOME                                     SOBRENOME                                TI CIDADE                                CEP ES    SALARIO NASCIMENTO                 
---------- ---------------------------------------- ---------------------------------------- -- ------------------------------ ---------- -- ---------- ---------------------------
        60 INSERT_ALL                                                                           RS                                    620          1013                            
         1 MARCO                                    RADOMILE                                 F  SAO PAULO                         1333010 SP        620 21/07/72                   
         2 MARCELO                                  PETRY                                    F  SAO JOSE                         88101090 S        1240 21/07/71                   
         3 DIOGENES                                 CARVALHO                                 F  TERESINA                         64039650 PI       1860 21/07/78                   
         4 REINALDO                                 MOURA                                    F  TERESINA                         64039650 PI       2480 21/07/80                   
         5 DIEGO                                    FIDELIS                                  J  PASSO FUNDO                      99001970 RS       3100 21/07/67                   
         6 ALFREDO234                               NOSTRO                                   J  ALEGRETE                         96200010 RS       3720 23/07/54                   
         7 Marcio                                   gARCIA                                   F  NOVO HAMBURGO                    93320970 RS     633,47 20/10/00                   
         8 Paula                                    ARAUJO                                   F  CANOAS                           89163413 RS       2000 10/08/00                   
         9 Maria                                    ANOTIETA                                 J  SAPIRANGA                        93800012 RS        620 13/07/17                   
        10 Beta                                     BARROS                                   J  PORTO ALEGRE                     90020180 RS       3200 13/07/18                   
        11 Teresa                                   CRISTINA                                 F  CANOAS                            9163413 RS       1720 23/02/82                   
        12 Adon                                     iSTOL                                    F  TUBARÃƒO                         88701970 SC       4260 24/04/72                   
        13 Ã?sis                                    REIS                                     F  Florianopolis                    88034101 SC       5590 25/06/62                   
        14 Pimbo                                    LINDO                                    J  RIO BRANCO                       69908440 AC       1220 26/08/52                   
        15 ALEXANDRE                                GRANDE                                   F  FLORIANÃ“POLIS                   88034101 SC       6450 27/10/82                   
        16 Ubaldo                                   MEIRELES                                 F  SALVADOR                         40015970 BA       1020 29/01/92                   
        17 Wolney                                   CARVALHO                                 F  PORTO ALEGRE                     90020180 RS       1720 30/03/02                   
        18 Iury                                     SOUZA                                    F  ARAGUAINA                        77818635 AC       1120 01/05/83                   
        19 Vania                                    AMIM                                     F  PINHAL                           98345000 RS       2880 02/07/88                   
        20 Mylla                                    mARGARINA                                J   VACARIA                         95200000 RS       3600 18/07/18                   
        21 Pedro                                    SOUZA                                    F  DOIS IRMAOS                      93950000 RS       4500 13/07/34                   
        22 Pedro                                    SOUZA                                    F  DOIS IRMAOS                      93950000 RS       4950 13/07/34                   
        23 Aldo                                     KRISHER                                  F  QUATRO IRMAOS                    99720000 RS       1500 13/07/44                   
        24 Pedro                                    SOUZA                                    F  DOIS IRMAOS                      93950000 RS        900 13/07/34                   
        25 Iuri                                     REIS                                     F  FLORIANOPOLIS                    88034101 SC   15629,69 11/02/70                   
        26 Xita                                     MULA                                     J  RIO BRANCO                       69908440 AC        620 10/08/75                   
        27 Null                                     Null                                     J  TORRES                           95560000 RS       2350 12/05/80                   
        28 Alberto                                  Roberty                                  F  CURITIBA                         81050360 PR       2120 14/07/85                   
        29 Beatriz                                  Seis                                     F  VITÃ“RIA                         29000000 ES       4350 16/09/90                   
        30 Clodoaldo                                Buzz                                     F  BELO HORIZONTE                   31630900 MG       7350 18/11/95                   
        31 Damaris                                  Aiaiai                                   F  CAMPO GRANDE                     79002190 MS       2820 20/01/00                   
        32 Everton                                  Cunha                                    F  MANAUS                           69030418 AM       5280 22/03/05                   
        33 FabÃ­ula                                 grell                                    F  RIO BRANCO                       69908440 AC       1370 24/04/01                   
        34 Jeferson                                 Pelutis                                  F  RIO DE JANEIRO                   23548168 RJ      14300 26/06/68                   
        35 Karen                                    Girrfa                                   F  ANGRA DOS REIS                   23900050 RJ       1370 08/08/02                   

36 linhas selecionadas. 



/*CREATE TABLE TALUNO
(
  COD_ALUNO INTEGER NOT NULL,
  NOME VARCHAR(30),
  CIDADE VARCHAR2(30),
  CEP VARCHAR(10),
  PRIMARY KEY (COD_ALUNO)
);
*/

SELECT * FROM TALUNO;

INSERT INTO TALUNO(COD_ALUNO,NOME,SOBRENOME,TIPO,CIDADE,CEP,ESTADO,SALARIO,NASCIMENTO)
VALUES (61,'MARCIO','Konrath','F','NOVO HAMBURGO','93000000','RS','13000','11/03/1957');

INSERT INTO TALUNO(COD_ALUNO,NOME,SOBRENOME,TIPO,CIDADE,CEP,ESTADO,SALARIO,NASCIMENTO)
VALUES  (62,'PAULA','ABDUL','J','IVOTI','93000000','RS','13000','11/03/1957');

INSERT INTO TALUNO(COD_ALUNO,NOME,SOBRENOME,TIPO,CIDADE,CEP,ESTADO,SALARIO,NASCIMENTO)
VALUES  (63,'MARIA','BOLENA','J','SAPIRANGA','93000000','RS','13000','11/03/1957');

/*
CREATE TABLE TCURSO
(  COD_CURSO INTEGER NOT NULL PRIMARY KEY,
   NOME VARCHAR2(30),
   VALOR NUMBER(8,2),
   CARGA_HORARIA INTEGER
);

SELECT * FROM TCURSO;
*/

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



INSERT INTO TCURSO VALUES(61,'ORACLE SQL e PL/SQL AVANCADO',2500,125,110);
INSERT INTO TCURSO VALUES(62,'ORACLE DBA AVANCADO',2499,125,110);
INSERT INTO TCURSO VALUES(63,'JAVA FUNDAMENTOS E OO AVANCADO',3500,200,52);
INSERT INTO TCURSO VALUES(64,'JAVASERVER FACES AVANCADO',3600,300,52);

/*
CREATE TABLE TCONTRATO
(  COD_CONTRATO INTEGER NOT NULL PRIMARY KEY,
   DATA DATE,
   COD_ALUNO INTEGER,
   TOTAL NUMBER(8,2),
   DESCONTO NUMBER(5,2)
);
*/

SELECT * FROM TCONTRATO;

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


INSERT INTO TCONTRATO VALUES(71, SYSDATE   ,6 ,500,10,100);
INSERT INTO TCONTRATO VALUES(72, SYSDATE   ,7 ,500,10,100);
INSERT INTO TCONTRATO VALUES(73, SYSDATE   ,8 ,1500,05,50);
INSERT INTO TCONTRATO VALUES(74, SYSDATE-5 ,7 ,1600,10,50);
INSERT INTO TCONTRATO VALUES(75, SYSDATE-4 ,9 ,800,10,25);
INSERT INTO TCONTRATO VALUES(76, SYSDATE-3 ,9 ,445,0,25);
INSERT INTO TCONTRATO VALUES(77, SYSDATE-2 ,9 ,445,20,12.5);


/*
--Sequence
CREATE SEQUENCE SEQ_ALUNO START WITH 4;

INSERT INTO TALUNO(COD_ALUNO,NOME,CIDADE,CEP)
VALUES (SEQ_ALUNO.NEXTVAL,'VALDO','CANOAS','11000000');

INSERT INTO TALUNO(COD_ALUNO,NOME,CIDADE,CEP)
VALUES (SEQ_ALUNO.NEXTVAL,'ANDRE','IVOTI','12000000');

SELECT * FROM TALUNO;

CREATE TABLE TITEM
 ( COD_ITEM INTEGER NOT NULL PRIMARY KEY,
   COD_CURSO INTEGER,
   COD_CONTRATO INTEGER,
   VALOR NUMBER(8,2) );


SELECT * FROM TITEM;

 INSERT INTO TITEM VALUES (1, 1, 1, 500);
 INSERT INTO TITEM VALUES (2, 1, 2, 500);
 INSERT INTO TITEM VALUES (3, 3, 3, 1500);
 INSERT INTO TITEM VALUES (4, 4, 4, 1600);
 INSERT INTO TITEM VALUES (5, 1, 5, 500);
 INSERT INTO TITEM VALUES (6, 1, 6, 500);
 INSERT INTO TITEM VALUES (7, 2, 6, 500);
 INSERT INTO TITEM VALUES (8, 3, 7, 500);

*/

======================================================================
======================================================================
======================================================================
======================================================================

SCHENA


Script criação de tablespace

-- Deleta TableSpace
 
-- DROP TABLESPACE tbs_dados INCLUDING contents;
-- Cria tablespace p/ dados
 
CREATE TABLESPACE tbs_dados
 
datafile 'c:\oracle\oradata\tbs_dados.dbf' SIZE 2500M reuse
 
AUTOEXTEND ON NEXT 200M MAXSIZE 3000M
 
DEFAULT STORAGE (INITIAL 512K NEXT 256K
MINEXTENTS 1
MAXEXTENTS unlimited
PCTINCREASE 0)
ONLINE;
-- Cria usuário (dono das tabelas) 

create user curso --
Usuario
identified by "curso" --Senha
 
default tablespace tbs_dados
 
temporary tablespace temp;
-- Cria e define a "role" de privilégios create role ROLE_master;

grant
create cluster,
create database link,
create procedure,
create session,
create sequence,
create synonym,
create table,
create any type,
create trigger,
create any index,
create view
to role_master;
Grant alter session to role_master;
Grant role_master to curso;
Grant unlimited tablespace to curso;


































































