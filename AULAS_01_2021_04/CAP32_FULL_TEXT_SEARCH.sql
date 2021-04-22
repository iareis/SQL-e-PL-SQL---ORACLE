============================
===   FULL TEXT SEARCH   ===
============================

TEM QUE ESTAR CONECTADO COMO USUARIO system

GRANT CREATE ANY DIRECTORY TO iareis;
/*
Grant bem-sucedido.

Decorrido: 00:00:00.344
*/

FAZ O USUARIO PODER CRIAR QUALQUER DIRETORIO
DIRECTORY é um OBJETO que aponta para um diretório que pode estar em qualquer local

===================================================================== 

Oracle Text e Contains contéudo
Oracle Text e Contains

Oracle Text

O Oracle Text é uma feature embutida no banco de dados que utiliza a linguagem SQL
para indexar, pesquisar e analisar textos e documentos binários armazenados nas tabelas.
Nas versões Oracle 11g essa feature é conhecida como Oracle Text. Esta tecnologia
oferece uma solução completa para pesquisa de textos na qual a mesma permite filtrar
e extrair textos de conteúdos de diferentes formatos de documentos.

O Oracle Text suporta mais de 150 formatos de documentos, incluindo os mais populares
como os documentos Microsoft Office, além de formatos de arquivo do Adobe PDF,
arquivos HTML e XML.

===================================================================== 

Neste artigo irei demonstrar como gravar um documento binário (.doc)
no banco de dados Oracle 11g e o que fazer para poder realizar pesquisas no seu conteúdo. 

Para exemplo vamos criar um arquivo que possui com algum conteúdo.
Para isto abra 1 arquivo em branco do Microsoft Word e escreva algum texto
e salve na pasta C:\Temp com nome de (teste.doc).

Este arquivo que irei carregar para o banco de dados. 

===================================================================== 

Em seguida abra o CMD como administrador e conecte no SQLPLUS 

C:\set ORACLE_SID=curso

C:\>sqlplus sys/123 as sysdba

===================================================================== 
===================================================================== 
===================================================================== 
===================================================================== 



Agora conectado como usuário normal de desenvolvimento no SQL Developer vamos
criar uma tabela

-- Criação de um diretório que indica a localização do documento
-- Conectado como usuario system grant create any directory to marcio;
-- Conectado como usuario normal create or replace directory arquivos as 'C:\Temp';


CREATE TABLE TESTE_BLOB(
    CODIGO NUMBER,          -- | QDO CRIADO ASSIM APENAS COMO NUMBER, 
    NOME VARCHAR2(40),      -- | EHTB UM INTEIRO DE TAMANHO 38
    DOCUMENTO BLOB
);
/*
Table TESTE_BLOB criado.
*/

CREATE OR REPLACE DIRECTORY ARQUIVOS AS 'C:\Temp';
/*
Directory ARQUIVOS criado.
*/

CREATE SEQUENCE SEQ_TESTE_BLOB START WITH 1;
/*
Sequence SEQ_TESTE_BLOB criado.
*/

-- Criação de uma procedure para carregar o arquivo para o banco de dados

CREATE OR REPLACE PROCEDURE GRAVA_ARQUIVO (P_ARQUIVO in VARCHAR2(40))
AS 
    V_BFILE BFILE;
    V_BLOB BLOB;
---
BEGIN
    INSERT INTO TESTE (CODIGO, NOME, DOCUMENTO)
    VALUES (SEQ_TESTE_BLOB.NEXTVAL, P_ARQUIVO, EMPTY_BLOB())
    RETURN DOCUMENTO INTO V_BLOB;
    -- Informacao de directory tem que ser MAIUSCULO
    V_BFILE := BFILENAME('ARQUIVOS', P_ARQUIVO);
    DBMS_LOB.BFILENAME(V_BFILE, DBMS_LOB.FILE_READONLY);
    DBMS_LOB.LOADFROMFILE(V_BLOB, V_BFILE, DBMS_LOB.GETLENGTH(V_BFILE));
    DBMS_LOB.FILECLOSE(V_BFILE);
    COMMIT;
---
END; 
/*
Procedure GRAVA_ARQUIVO compilado
*/

1/44      PLS-00103: Encontrado o símbolo "(" quando um dos seguintes símbolos era esperado:     := . ) , @ % default caractere O símbolo ":=" foi substituído por "(" para continuar. 
Erros: verifique o log do compilador


































-- Grava o arquivo para a tabela 
EXECUTE GRAVA_ARQUIVO ('teste.doc');
 

--Para testar se gravou o registro faça select na tabela
SELECT * FROM TESTE_BLOB;

e

SELECT dbms_lob.getlength(documento) bytes from TESTE_BLOB;



--Vamos criar índice que vai permitir pesquisar dentro deste arquivo grava na tabela
create index ind_teste_doc on teste (documento) indextype is ctxsys.context parameters ('sync (on commit)');



--Para verificar se houve erro na criação do índice
select * from ctx_user_index_errors;



--Podemos verificar que foram criados alguns índices adicionais usando o selects abaixo
select table_name from user_tables;
select index_name,table_name from user_indexes;



--Fazendo pesquisar no documento gravando na tabela
select codigo, nome from teste where contains(documento, 'Marcio', 1) > 0;
select codigo,nome from teste where contains(documento, 'curso', 1) > 0;





















































































