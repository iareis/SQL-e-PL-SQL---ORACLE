==================================
===   DESENVOLVENDO TRIGGERS   ===
==================================

/*
DECLARE
    HORA    VARCHAR2(2);
    H       NUMBER;
BEGIN
    H := TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));
    DBMS_OUTPUT.PUT_LINE(H||'  '||TO_CHAR(SYSDATE+5,'DAY'));
END;

BEGIN 
    IF (TO_CHAR(SYSDATE, 'DAY') IN ('SÁBADO', 'DOMINGO') OR
        TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18) THEN
        Raise_Application_Error (-20001, 'FORA DO HORARIO COMERCIAL');
    END IF;
END;
*/

-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================

CREATE OR REPLACE TRIGGER VALIDA_HORARIO_CURSO
BEFORE INSERT OR DELETE ON TCONTRATO
BEGIN 
    IF (TO_CHAR(SYSDATE, 'D') IN (1, 7) OR
        TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))
        NOT BETWEEN 8 AND 15) THEN
        Raise_Application_Error (-20001, 'FORA DO HORARIO COMERCIAL');
    END IF;
END;
/*
Trigger VALIDA_HORARIO_CURSO compilado
*/

SELECT * FROM TCONTRATO;

INSERT INTO TCONTRATO VALUES (38, SYSDATE, 10, 1500, NULL, 12);
/*
Erro a partir da linha : 37 no comando -
INSERT INTO TCONTRATO VALUES (38, SYSDATE, 10, 1500, NULL, 12)
Relatório de erros -
ORA-20001: FORA DO HORARIO COMERCIAL
ORA-06512: em "IAREIS.VALIDA_HORARIO_CURSO", line 5
ORA-04088: erro durante a execução do gatilho 'IAREIS.VALIDA_HORARIO_CURSO'
*/

-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================

--TRIGGER DE LOG

CREATE TABLE LOG(
    USUARIO         VARCHAR2(30),
    HORARIO         DATE,
    VALOR_ANTIGO    VARCHAR2(10),
    VALOR_NOVO      VARCHAR2(10)
);
/*
Table LOG criado.
*/



CREATE OR REPLACE TRIGGER GERA_LOG_ALT
AFTER UPDATE OF TOTAL ON TCONTRATO
DECLARE
BEGIN 
    INSERT INTO LOG(USUARIO, HORARIO)
    VALUES(USER, SYSDATE); 
END;
/*
Trigger GERA_LOG_ALT compilado
*/



SELECT * FROM TCONTRATO;

UPDATE TCONTRATO SET
    TOTAL = 5000
WHERE COD_CONTRATO = &CONTRATO;

SELECT * FROM LOG;
/*
USUARIO   HORARIO    VALOR_ANTIGO   VALOR_NOVO   
IAREIS     20/04/21
*/
-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================

CREATE OR REPLACE TRIGGER VALIDA_HORARIO_CURSO2
BEFORE INSERT OR UPDATE OR DELETE ON TCONTRATO
BEGIN 
    IF  (TO_CHAR(SYSDATE, 'D') IN (1, 7) OR
         TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 20) THEN
         IF( INSERTING ) THEN
            RAISE_APPLICATION_ERROR(-20001, 'NAO PODE INSERIR');
         ELSIF( DELETING ) THEN
            RAISE_APPLICATION_ERROR(-20002, 'NAO PODE REMOVER');
         ELSIF( UPDATING('TOTAL') ) THEN
            RAISE_APPLICATION_ERROR(-20003, 'NAO PODE ALTERAR TOTAL');
         ELSE
            RAISE_APPLICATION_ERROR(-20004, 'NAO PODE ALTERAR');
         END IF;
    END IF;
END;
/*
Trigger VALIDA_HORARIO_CURSO2 compilado
*/

--TESTES
ALTER TRIGGER VALIDA_HORARIO_CURSO DISABLE;
/*
Trigger VALIDA_HORARIO_CURSO alterado.
*/

SELECT * FROM TCONTRATO;
/*
COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   TOTAL2   
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
             11 22/03/21               9      800          20           
             12 24/03/21               9      800           5           
             13 29/03/21              10      800          16           
             14 12/03/21              11      800          24           
             38 20/04/21              10     1500                    12 


15 linhas selecionadas. 
*/

UPDATE TCONTRATO SET TOTAL = 5000 WHERE COD_CONTRATO = 11;

DESCRIBE TCONTRATO;
/*
Nome           Nulo?      Tipo          
COD_CONTRATO    NOT NULL    NUMBER(38)     
DATA                        DATE           
COD_ALUNO                   NUMBER(38)     
TOTAL                       NUMBER(8,2)    
DESCONTO                    NUMBER(5,2)    
TOTAL2                      NUMBER(8,2)  
*/

ALTER TABLE TCONTRATO DROP COLUMN TOTAL2;
/*
Table TCONTRATO alterado.
*/

INSERT INTO TCONTRATO VALUES (39, SYSDATE-1, 10, 2600, NULL);
/*
Erro a partir da linha : 156 no comando -
INSERT INTO TCONTRATO VALUES (39, SYSDATE-1, 10, 2600, NULL)
Relatório de erros -
ORA-20001: NAO PODE INSERIR
ORA-06512: em "IAREIS.VALIDA_HORARIO_CURSO2", line 5
ORA-04088: erro durante a execução do gatilho 'IAREIS.VALIDA_HORARIO_CURSO2'

Decorrido: 00:00:00.011
*/

-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================
-- INCLUIR UMA COLUNA OBS NA TABELA LOG 
ALTER TABLE LOG ADD OBS VARCHAR(80);
/*
Table LOG alterado.
*/

ALTER TABLE TALUNO MODIFY SALARIO NUMERIC(12,2);
/*
Table TALUNO alterado.
*/

DESCRIBE TALUNO;
SELECT * FROM TALUNO;


CREATE OR REPLACE TRIGGER AUDITA_ALUNO
AFTER INSERT OR DELETE OR UPDATE ON TALUNO
FOR EACH ROW    --EXECUTA PARA CADA LINHA AFETADA // SEM ELA, EXECUTA APENAS UMA VEZ
BEGIN 
    IF      ( DELETING ) THEN
            INSERT INTO LOG(USUARIO, HORARIO, OBS)
            VALUES(USER, SYSDATE, 'LINHAS DELETADAS.');
    ELSIF   ( INSERTING ) THEN 
            INSERT INTO LOG(USUARIO, HORARIO, OBS)
            VALUES(USER, SYSDATE, 'LINHAS INSERIDAS.');
    ELSIF   ( UPDATING('SALARIO') ) THEN 
            INSERT INTO LOG
            VALUES(:OLD.NOME, SYSDATE, :OLD.SALARIO, :NEW.SALARIO, 'SALARIO ALTERADO.');
    ELSE
            INSERT INTO LOG(USUARIO, HORARIO, OBS)
            VALUES(USER, SYSDATE, 'ATUALIZACAO ALUNO.');
    END IF;
END;
/*
Trigger AUDITA_ALUNO compilado
*/

SELECT * FROM LOG;
/*
USUARIO   HORARIO    VALOR_ANTIGO   VALOR_NOVO   OBS   
IAREIS     20/04/21                                         
IAREIS     20/04/21    
*/

SELECT * FROM TALUNO;
/*
COD_ALUNO   NOME         SOBRENOME   TIPO   CIDADE           CEP        ESTADO   SALARIO   NASCIMENTO   
           1 MARCO         RADOMILE     F       SAO PAULO             1333010 SP               620 21/07/72      
           2 MARCELO       PETRY        F       SAO JOSE             88101090 S               1240 21/07/71      
           3 DIOGENES      CARVALHO     F       TERESINA             64039650 PI              1860 21/07/78      
           4 REINALDO      MOURA        F       TERESINA             64039650 PI              2480 21/07/80      
           5 DIEGO         FIDELIS      J       PASSO FUNDO          99001970 RS              3100 21/07/67      
           6 ALFREDO234    NOSTRO       J       ALEGRETE             96200010 RS              3720 23/07/54      
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
          18 Iury          SOUZA        F       ARAGUAINA            77818635 AC              1120 01/05/83      
          19 Vania         AMIM         F       PINHAL               98345000 RS              2880 02/07/88      
          20 Mylla         mARGARINA    J        VACARIA             95200000 RS              3600 18/07/18      
          21 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS              4500 13/07/34      
          22 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS              4950 13/07/34      
          23 Aldo          KRISHER      F       QUATRO IRMAOS        99720000 RS              1500 13/07/44      
          24 Pedro         SOUZA        F       DOIS IRMAOS          93950000 RS               900 13/07/34      
          25 Iuri          REIS         F       FLORIANOPOLIS        88034101 SC           2500,75 11/02/70      
          26 Xita          MULA         J       RIO BRANCO           69908440 AC               620 10/08/75      
          27 Null          Null         J       TORRES               95560000 RS              2350 12/05/80      
          28 Alberto       Roberty      F       CURITIBA             81050360 PR              2120 14/07/85      
          29 Beatriz       Seis         F       VITÃ“RIA             29000000 ES              4350 16/09/90      
          30 Clodoaldo     Buzz         F       BELO HORIZONTE       31630900 MG              7350 18/11/95      

COD_ALUNO   NOME       SOBRENOME   TIPO   CIDADE           CEP        ESTADO   SALARIO   NASCIMENTO   
          31 Damaris     Aiaiai       F       CAMPO GRANDE         79002190 MS              2820 20/01/00      
          32 Everton     Cunha        F       MANAUS               69030418 AM              5280 22/03/05      
          33 FabÃ­ula    grell        F       RIO BRANCO           69908440 AC              1370 24/04/01      
          34 Jeferson    Pelutis      F       RIO DE JANEIRO       23548168 RJ             14300 26/06/68      
          35 Karen       Girrfa       F       ANGRA DOS REIS       23900050 RJ              1370 08/08/02      


35 linhas selecionadas. 
*/

UPDATE TALUNO SET
    SALARIO = SALARIO * (COD_ALUNO/4)
WHERE ESTADO = 'SC';
/*
4 linhas atualizado.
*/

SELECT * FROM LOG;
/*
USUARIO     HORARIO    VALOR_ANTIGO   VALOR_NOVO   OBS                 
IAREIS       20/04/21                                                       
IAREIS       20/04/21                                                       
Adon         20/04/21    1420            4260          SALARIO ALTERADO.    
Ã?sis        20/04/21    1720            5590          SALARIO ALTERADO.    
ALEXANDRE    20/04/21    1720            6450          SALARIO ALTERADO.    
Iuri         20/04/21    2500,75         15629,69      SALARIO ALTERADO.    


6 linhas selecionadas.
*/


-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================

SELECT * FROM TCURSO;
/*
COD_CURSO   NOME                    VALOR    CARGA_HORARIA   PRE_REQ   
           1 ORACLE SQL ePL/SQL          564,99               25          7 
           2 ORACLE DBA                   648,6               25          1 
           3 JAVA FUNDAMENTOS E 00         1624              100          7 
           4 JAVASERVER FACES            1896,4              100          3 
           5 WINDOWS                       1189               50            
           6 OFFICE                        1189               60            
           7 HTML5                         1189               70            
           8 CCS3                          1189               80          7 
           9 JAVASCRIPT                    1124              100          7 
          10 PS/SQL DEVELOPER            1171,5               16            
          52 TESTE-y                       1100                             


11 linhas selecionadas.
*/

CREATE OR REPLACE TRIGGER GERA_LOG_CURSO
BEFORE UPDATE OF VALOR ON TCURSO
FOR EACH ROW
BEGIN 
    INSERT INTO LOG (USUARIO, HORARIO, OBS, VALOR_ANTIGO, VALOR_NOVO)
    VALUES(USER, SYSDATE, 'CURSO ALTERADO: '||:OLD.NOME, :OLD.VALOR, :NEW.VALOR);
END;
/*
Trigger GERA_LOG_CURSO compilado
*/


UPDATE TCURSO SET
VALOR = 3000
WHERE VALOR > 1500;

SELECT * FROM LOG;
/*
USUARIO     HORARIO    VALOR_ANTIGO   VALOR_NOVO   OBS                                     
IAREIS       20/04/21                                                                           
IAREIS       20/04/21                                                                           
Adon         20/04/21    1420            4260          SALARIO ALTERADO.                        
Ã?sis        20/04/21    1720            5590          SALARIO ALTERADO.                        
ALEXANDRE    20/04/21    1720            6450          SALARIO ALTERADO.                        
Iuri         20/04/21    2500,75         15629,69      SALARIO ALTERADO.                        
IAREIS       20/04/21    1624            3000          CURSO ALTERADO: JAVA FUNDAMENTOS E 00    
IAREIS       20/04/21    1896,4          3000          CURSO ALTERADO: JAVASERVER FACES         


8 linhas selecionadas.
*/

-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================

SELECT * FROM TCONTRATO;
/*
COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   
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

ALTER TABLE TCONTRATO ADD VALOR_COMISSAO NUMERIC(8,2);

DESCRIBE TCONTRATO;
/*
Nome             Nulo?      Tipo          
COD_CONTRATO      NOT NULL    NUMBER(38)     
DATA                          DATE           
COD_ALUNO                     NUMBER(38)     
TOTAL                         NUMBER(8,2)    
DESCONTO                      NUMBER(5,2)    
VALOR_COMISSAO                NUMBER(8,2) 
*/

CREATE OR REPLACE TRIGGER CAL_COMISSAO
BEFORE INSERT OR UPDATE OF TOTAL ON TCONTRATO
--REFERENCING OLD AS ANTIGO 
--            NEW AS NOVO
FOR EACH ROW
WHEN(NEW.TOTAL >= 5000) -- REGRA OU CONDICAO
DECLARE
    V_COMISSAO NUMERIC(6,2) := 0.15;
BEGIN 
    IF (:NEW.TOTAL <= 10000) THEN
        :NEW.VALOR_COMISSAO := :NEW.TOTAL * (V_COMISSAO);
    ELSE
        :NEW.VALOR_COMISSAO := :NEW.TOTAL * (V_COMISSAO+0.01);
    END IF;
END;
/*
Trigger CAL_COMISSAO compilado
*/


INSERT INTO TCONTRATO(COD_CONTRATO, TOTAL) VALUES(40, 6000);
INSERT INTO TCONTRATO(COD_CONTRATO, TOTAL) VALUES(41, 12000);
/*
Erro a partir da linha : 413 no comando -
INSERT INTO TCONTRATO(COD_CONTRATO, TOTAL) VALUES(41, 12000)
Relatório de erros -
ORA-20001: NAO PODE INSERIR
ORA-06512: em "IAREIS.VALIDA_HORARIO_CURSO2", line 5
ORA-04088: erro durante a execução do gatilho 'IAREIS.VALIDA_HORARIO_CURSO2'
*/

SELECT * FROM TCONTRATO;

-- =======================================================================
-- =======================================================================
-- =======================================================================
-- =======================================================================
== EXEMPLO DE VIEW COM TRIGGER E DML



CREATE OR REPLACE VIEW V_CONTRATOS_PARES
AS
    SELECT COD_CONTRATO, DATA, COD_ALUNO, DESCONTO, TOTAL
    FROM TCONTRATO
    WHERE MOD(COD_CONTRATO, 2) = 0; --MOD MOSTRA O RESTO DA DIVISÃO. NESTE CASO POR 2 E RESTO ZERO, É PAR.
/*
View V_CONTRATOS_PARES criado.
*/

SELECT * FROM V_CONTRATOS_PARES;
/*
COD_CONTRATO   DATA       COD_ALUNO   DESCONTO   TOTAL   
              2 05/01/13               2                 2500 
              4 02/04/21               2                 1600 
              6 04/04/21               5           0      445 
              8 12/03/21               6          22      800 
             10 18/03/21               7          13      500 
             12 24/03/21               9           5      800 
             14 12/03/21              11          24      800 
             38 20/04/21              10                 1500 


8 linhas selecionadas.
*/


CREATE OR REPLACE TRIGGER TRI_CONTRATOS_PARES
INSTEAD OF INSERT OR DELETE OR UPDATE ON V_CONTRATOS_PARES
DECLARE
BEGIN 
    INSERT INTO LOG(USUARIO, HORARIO, OBS)
    VALUES(USER, SYSDATE, 'DML DA VIEW V_CONTRATOS_PARES');
END;
/*
Trigger TRI_CONTRATOS_PARES compilado
*/

INSERT INTO V_CONTRATOS_PARES
VALUES(90, SYSDATE, 10, NULL, 5000);


SELECT * FROM LOG;
/*
USUARIO     HORARIO    VALOR_ANTIGO   VALOR_NOVO   OBS                                     
IAREIS       20/04/21                                                                           
IAREIS       20/04/21                                                                           
Adon         20/04/21    1420            4260          SALARIO ALTERADO.                        
Ã?sis        20/04/21    1720            5590          SALARIO ALTERADO.                        
ALEXANDRE    20/04/21    1720            6450          SALARIO ALTERADO.                        
Iuri         20/04/21    2500,75         15629,69      SALARIO ALTERADO.                        
IAREIS       20/04/21    1624            3000          CURSO ALTERADO: JAVA FUNDAMENTOS E 00    
IAREIS       20/04/21    1896,4          3000          CURSO ALTERADO: JAVASERVER FACES         
IAREIS       20/04/21                                  DML DA VIEW V_CONTRATOS_PARES            


9 linhas selecionadas. 
*/





































































































