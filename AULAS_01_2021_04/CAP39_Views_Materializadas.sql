==============================
===   View Materializada   ===
==============================

Views Materializadas Utilizamos elas para fazermos calculos, armazenamentos de dados 
e dar agilidade na troca de informacoes entre um banco de dados ou entre tabelas. 
Este recurso e muito utilizado em ambientes de Data Warehouse, que trabalha com uma 
enorme quantidade de informacoes. Pois com elas conseguimos melhorar a performance 
do sistema e trazer diversos beneficios ao Oracle.

As Views Materializadas sao utilizadas para fazer atualizacoes, a propria Oracle 
garante que as atualizacoes sao feitas com sucesso numa tabela destinataria apos 
terem sido efetivadas nas tabelas originais. Isso nos da mais tranquilidade na 
administracao e no desenvolvimento.

Exemplo de como se faz uma Views Materializadas:

CREATE MATERIALIZED VIEW VM_ALUNO BUILD IMMEDIATE  REFRESH FAST ENABLE QUERY REWRITE  AS (SELECT * FROM TALUNO WHERE CIDADE=’NOVO HAMBURGO’) BUILD IMMEDIATE

A View Materializada devera utilizar os dados imediatamente na query rewrite 
(Seu SELECT), desde modo os dados serao processados com mais agilidade.

Existe tambem outro metodo, chamado build deferred que significa que a view 
nao tera nenhum tipo de dados a ser utilizada automaticamente, esse modo seria 
um processamento manual das informacoes, que sera depois atualizado pelo Refresh, 
resumindo, que com essa opcao o comando SELECT nao sera executado imediatamente.

REFRESH FAST

Esse metodo e para dizer que as modificacoes serao utilizadas somente pela 
View Materializada, para utilizar este recurso com seguranca, sugiro criar uma 
View Materializada Log, para ter controle sobre as modificacoes que estao sendo feitas.

ENABLE QUERY REWRITE

Essa linha de comando e o que indica que o SELECT presente dentro da 
View Materializada sera reescrita e atualizada para os novos valores passados pela 
VIEW. A query rewrite pode ter três niveis de integridade que vai desde o modo 
ENFORCED ate o STALE_TOLERATED, que indicara ao banco de dados que tipo de confianca 
ele podera ter nos dados. Sobre as integridades, falaremos na proxima coluna tambem, 
pois e um pouco mais delicado.

AS SELECT

Aqui sera colocado seu SELECT, onde podera fazer alguns calculos ou visualizacoes 
de informacoes para outras tabelas, como no exemplo de SELECT a seguir.

SELECT * FROM TALUNO WHERE cidade = 'NOVO HAMBURGO'

SELECTS que devemos utilizar dentro das Views Materializadas devem seguir um 
padrao delas, como, por exemplo, nao utilizar clausulas como 
UNION, UNION ALL, INTERSECT e MINUS. 

==================================================================
==================================================================
==================================================================
==================================================================

--Conectado como system
--Direito para criar view materializada
GRANT CREATE ANY MATERIALIZED VIEW TO iareis;
/*
Grant bem-sucedido.

Decorrido: 00:00:00.083
*/

--Criar log para view (armazenas todas as alteracoes)
CREATE MATERIALIZED VIEW LOG ON taluno TABLESPACE tbs_dados;












--Excluir View
DROP MATERIALIZED VIEW V_MAT;
/*
Erro a partir da linha : 73 no comando -
DROP MATERIALIZED VIEW V_MAT
Relatório de erros -
ORA-12003: a view materializada "IAREIS"."V_MAT" não existe
12003. 00000 -  "materialized view or zonemap \"%s\".\"%s\" does not exist"
*Cause:    The database object with the given owner and name was not found.
*Action:   Verify input and retry.
Decorrido: 00:00:00.232
*/

--Criar View 

CREATE MATERIALIZED VIEW V_MAT
TABLESPACE tbs_dados
BUILD IMMEDIATE
REFRESH FAST ON COMMIT AS
(SELECT COD_ALUNO, NOME, CIDADE FROM TALUNO 
WHERE CIDADE = 'NOVO HABURGO');


INSERT INTO TALUNO (COD_ALUNO,NOME,CIDADE)
VALUES(SEQ_ALUNO.NEXTVAL,'TESTE 2','NOVO HAMBURGO');
SELECT * FROM TALUNO;
SELECT * FROM V_MAT;


