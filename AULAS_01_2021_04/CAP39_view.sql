 =============================================================================
 All materialized views accessible to the current user
=============================================================================
 
 select owner as schema_name,
       mview_name,
       container_name,
       query as definition,
       refresh_mode,
       refresh_method,
       build_mode,
       last_refresh_date,
       compile_state
from sys.all_mviews
order by owner, mview_name;

/*
nenhuma linha selecionada
*/

=============================================================================
If you have privilege on dba_mviews
=============================================================================

select owner as schema_name,
       mview_name,
       container_name,
       query as definition,
       refresh_mode,
       refresh_method,
       build_mode,
       last_refresh_date,
       compile_state
from sys.dba_mviews
order by owner, mview_name;

/*
Erro a partir da linha : 21 no comando -
select owner as schema_name,
       mview_name,
       container_name,
       query as definition,
       refresh_mode,
       refresh_method,
       build_mode,
       last_refresh_date,
       compile_state
from sys.dba_mviews
order by owner, mview_name
Erro na Linha de Comandos : 30 Coluna : 10
Relatório de erros -
Erro de SQL: ORA-00942: a tabela ou view não existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Decorrido: 00:00:00.049

*/

=============================================================================

Columns

schema_name - view owner, schema name
mview_name - materialized view name
container_name - name of the container with materialized views data
definition - materialized view script - select statement only
refresh_mode - refresh mode of the materialized view (DEMAND/COMMIT/NEVER)
refresh_method - default method userd to refresh materialized view (COMPLETE/FORCE/FAST/NEVER)
build_mode - how the materialized view was populated during creation (IMMEDIATE/DEFERRED/PREBUILT)
last_refresh_date - date of the last refresh of the materialized view
compile_state - indicates validity of the materialized view (VALID/NEEDS_COMPILE/ERROR)

=============================================================================

Rows

One row represents one materialized view in a database
Scope of rows: (A) all materialized views, with their definition, accessible to the current user in Oracle database, (B) all materialized views, with their definition, in Oracle database
Ordered by schema name, materialized view name



=============================================================================

--Criar log para view (armazenas todas as alteracoes)
CREATE MATERIALIZED VIEW LOG ON TALUNO TABLESPACE TBS_DADOS;
/*
Erro a partir da linha : 69 no comando -
CREATE MATERIALIZED VIEW LOG OFF taluno TABLESPACE tbs_dados
Relatório de erros -
ORA-00439: recurso não ativado: Advanced replication
00439. 00000 -  "feature not enabled: %s"
*Cause:    The specified feature is not enabled.
*Action:   Do not attempt to use this feature.
Decorrido: 00:00:00.029

Erro a partir da linha : 71 no comando -
CREATE MATERIALIZED VIEW LOG ON taluno TABLESPACE tbs_dados
Relatório de erros -
ORA-00439: recurso não ativado: Advanced replication
00439. 00000 -  "feature not enabled: %s"
*Cause:    The specified feature is not enabled.
*Action:   Do not attempt to use this feature.
Decorrido: 00:00:00.010
*/

=============================================================================

Para consultar as TABLESPACES e as tabelas contidas em cada uma delas utiliza-se 
o script a seguir: 

SELECT TABLESPACE_NAME, TABLE_NAME
FROM DBA_TABLES
ORDER BY TABLESPACE_NAME; 

Observação:
Na consulta anterior usou-se a tabela DBA_TABLES, porém poderia ter sido usada a 
tabela ALL_TABLES ou USER_TABLES.

SELECT TABLESPACE_NAME, TABLE_NAME
FROM USER_TABLES
ORDER BY TABLESPACE_NAME; 
/*
TABLESPACE_NAME   TABLE_NAME           
TBS_DADOS          TALUNO                
TBS_DADOS          TABELA                
TBS_DADOS          TCONTRATO             
TBS_DADOS          TITEM                 
TBS_DADOS          TDESCONTO             
TBS_DADOS          TCIDADE               
TBS_DADOS          TBAIRRO               
TBS_DADOS          TRUA                  
TBS_DADOS          TPESSOA               
TBS_DADOS          TCONTAS               
TBS_DADOS          TAB_04                
TBS_DADOS          TAB_05                
TBS_DADOS          LOG                   
TBS_DADOS          TESTE_BLOB            
TBS_DADOS          TESTE_INDICE_CAP37    
TBS_DADOS          TCURSO                


16 linhas selecionadas. 

Decorrido: 00:00:00.368
*/

=============================================================================

Required privileges

SELECT on the detail table and

CREATE TABLE or CREATE ANY TABLE (if not owner)

SQL syntax

CREATE MATERIALIZED VIEW LOG ON tableName
  [WITH [PRIMARY KEY][,ROWID]|[ROWID][,PRIMARY KEY] [(columnName[,...])]]

=============================================================================

ALTER SESSION SET QUERY_REWRITE_ENABLED=TRUE;
/*
Session alterado.

Decorrido: 00:00:00.223
*/


ALTER SESSION SET QUERY_REWRITE_INTEGRITY=ENFORCED;
/*
Session alterado.

Decorrido: 00:00:00.026
*/


CREATE MATERIALIZED VIEW LOG ON TALUNO TABLESPACE TBS_DADOS;



=============================================================================

SELECT * FROM USER_VIEWS;

/*
V_ALUNO                         106 SELECT COD_ALUNO AS CODIGO, SALARIO, NOME AS ALUNO, ESTADO, CIDADE
    FROM TALUNO
    WHERE ESTADO = 'RS'                                                                                                                                                                                  N                  N            
V_CONTRATO_TOP                   72 SELECT COD_CONTRATO, DESCONTO
    FROM TCONTRATO
    WHERE DESCONTO > 10                                                                                                                                                                                                                    N                  N            
V_ALUNO2                         47 SELECT COD_ALUNO, NOME, SALARIO
    FROM TALUNO                                                                                                                                                                                                                                             N                  N            
V_CONTRATO                      166 SELECT  TRUNC(DATA) AS DATA,
            MAX(DESCONTO) MAXIMO,
            AVG(DESCONTO) MEDIA,
            COUNT(*) QTDE 
    FROM TCONTRATO
    GROUP BY TRUNC(DATA)                                                                                                                      N                  N            
V_PESSOA_F                       83 SELECT COD_PESSOA, TIPO, NOME, COD_RUA AS RUA
    FROM TPESSOA
    WHERE TIPO = 'F'                                                                                                                                                                                                         N                  N            
VCURSOS1000CK                    91 SELECT COD_CURSO, NOME, VALOR
    FROM TCURSO
    WHERE VALOR = 1000
    WITH CHECK OPTION                                                                                                                                                                                                  N                  N            
V_CONTRATOS_PARES               107 SELECT COD_CONTRATO, DATA, COD_ALUNO, DESCONTO, TOTAL
    FROM TCONTRATO
    WHERE MOD(COD_CONTRATO, 2) = 0                                                                                                                                                                                 N                  N            


7 linhas selecionadas. 
*/

V_ALUNO                         106 SELECT COD_ALUNO AS CODIGO, SALARIO, NOME AS ALUNO, ESTADO, CIDADE
    FROM TALUNO
    WHERE ESTADO = 'RS'                                                                                                                                                                                  N                  N            
V_ALUNO2                         47 SELECT COD_ALUNO, NOME, SALARIO
    FROM TALUNO                                                                                                                                                                                                                                             N                  N            


=============================================================================
https://docs.oracle.com/cd/B10501_01/server.920/a96525/e900.htm
=============================================================================

CREATE MATERIALIZED VIEW ON TALUNO TABLESPACE TBS_DADOS;

CREATE MATERIALIZED VIEW VM_ALUNO BUILD IMMEDIATE  REFRESH FAST ENABLE QUERY REWRITE
AS (SELECT * FROM TALUNO WHERE CIDADE=’NOVO HAMBURGO’) BUILD IMMEDIATE


CREATE MATERIALIZED VIEW VM_ALUNO REFRESH FAST QUERY_REWRITE_ENABLED
AS (SELECT * FROM TALUNO) BUILD IMMEDIATE;

=============================================================================

CREATE MATERIALIZED VIEW ON TALUNO TABLESPACE TBS_DADOS;
/*
Erro a partir da linha : 227 no comando -
CREATE MATERIALIZED VIEW ON TALUNO TABLESPACE TBS_DADOS
Relatório de erros -
ORA-00931: identificador não encontrado
00931. 00000 -  "missing identifier"
*Cause:    
*Action:
Decorrido: 00:00:00.008
*/


CREATE MATERIALIZED VIEW LOG ON VM_ALUNO EMPLOYEES TALUNO TABLESPACE TBS_DADOS;
