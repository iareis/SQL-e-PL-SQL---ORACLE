================================
===   RECORD e COLLECTIONS   ===
================================

ALUNO_RECORD TALUNO%ROWTYPE;

ASSOCIATIVE ARRAYS (PS/SQL TABLES) EXTEND


================================================
================================================
================================================
================================================

DECLARE
    TYPE REC_ALUNO IS RECORD(
        COD_ALUNO NUMBER NOT NULL := 0,
        NOME TALUNO.NOME%TYPE,
        CIDADE TALUNO.CIDADE%TYPE
    );
    ---
    REGISTRO REC_ALUNO;
BEGIN 
    REGISTRO.COD_ALUNO  := 50;
    REGISTRO.NOME       := 'Aldebaram Heiz';
    REGISTRO.CIDADE     := 'Porto Alegre';
    ---
    DBMS_OUTPUT.PUT_LINE('CODIGO: '||REGISTRO.COD_ALUNO);
    DBMS_OUTPUT.PUT_LINE('NOME:   '||REGISTRO.NOME);
    DBMS_OUTPUT.PUT_LINE('CIDADE: '||REGISTRO.CIDADE);
END; 
/*
CODIGO: 50
NOME:   Aldebaram Heiz
CIDADE: Porto Alegre


Procedimento PL/SQL concluído com sucesso.
*/




DECLARE
--
TYPE    Rec_aluno IS RECORD(
            cod_aluno NUMBER NOT NULL := 0,
            nome TALUNO.Nome%TYPE,
            cidade TALUNO.Cidade%TYPE
        );
--
Registro rec_aluno;
BEGIN
registro.cod_aluno := 50;
registro.nome := 'Marcio Konrath';
registro.cidade := 'Novo Hamburgo';
---
Dbms_Output.Put_Line('Codigo: '||registro.cod_aluno);
Dbms_Output.Put_Line(' Nome: '||registro.nome);
Dbms_Output.Put_Line('Cidade: '||registro.cidade);
---
END;
/*
Codigo: 50
 Nome: Marcio Konrath
Cidade: Novo Hamburgo


Procedimento PL/SQL concluído com sucesso.
*/










DECLARE
    reg TAluno%ROWTYPE; --Record
    vcep VARCHAR(10) := '98300000';
BEGIN
    SELECT COD_ALUNO, NOME, CIDADE
    INTO Reg.cod_aluno, Reg.nome, Reg.cidade
    FROM TALUNO
    WHERE COD_ALUNO = 1;
    vCep := '93500000';
    reg.cep := vCep;
    Dbms_Output.Put_Line('Codigo: ' ||reg.cod_aluno);
    Dbms_Output.Put_Line('Nome : ' ||reg.nome);
    Dbms_Output.Put_Line('Cidade: ' ||reg.cidade);
    Dbms_Output.Put_Line('Cep : ' ||reg.cep);
END;
/*
Codigo: 1
Nome : MARCO
Cidade: SAO PAULO
Cep : 93500000


Procedimento PL/SQL concluído com sucesso.
*/







DECLARE
    TYPE T_ALUNO IS TABLE OF TALUNO.NOME%TYPE
    INDEX BY BINARY_INTEGER; --Matriz
    REGISTRO T_ALUNO; --Record
BEGIN
    REGISTRO(1) := 'MARCIO';
    REGISTRO(2) := 'JOSE';
    REGISTRO(3) := 'PEDRO';
    --
    Dbms_Output.Put_Line('Nome 1: '||registro(1));
    Dbms_Output.Put_Line('Nome 2: '||registro(2));
    Dbms_Output.Put_Line('Nome 3: '||registro(3));
END;
/*
Nome 1: MARCIO
Nome 2: JOSE
Nome 3: PEDRO


Procedimento PL/SQL concluído com sucesso.
*/


SELECT cod_aluno, NOME
FROM tALUNO WHERE COD_ALUNO = 1;
--
/*
COD_ALUNO   NOME    
           1 MARCO    


Decorrido: 00:00:00.046
*/








DECLARE
    TYPE nome_type IS TABLE OF taluno.nome%TYPE;
    nome_table nome_type := nome_type(); --Criando Instancia
BEGIN
    nome_table.EXTEND; -- alocando uma nova linha
    nome_table(1) := 'Marcelo';
    nome_table.EXTEND; -- alocando uma nova linha
    nome_table(2) := 'Marcio';
    Dbms_Output.Put_Line('Nome 1: '||nome_table(1));
    Dbms_Output.Put_Line('Nome 2: '||nome_table(2));
END;
/*
Nome 1: Marcelo
Nome 2: Marcio


Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:00:00.041
*/









DECLARE
    TYPE tipo IS TABLE OF VARCHAR2(40) INDEX BY VARCHAR2(2);
    --
    uf_capital tipo;
BEGIN
    uf_capital('RS') := 'PORTO ALEGRE';
    uf_capital('RJ') := 'RIO DE JANEIRO';
    uf_capital('PR') := 'CURITIBA';
    uf_capital('MT') := 'CUIABA';
    dbms_output.put_line(uf_capital('RS'));
    dbms_output.put_line(uf_capital('RJ'));
    dbms_output.put_line(uf_capital('PR'));
    dbms_output.put_line(uf_capital('MT'));
END;
/*
Decorrido: 00:00:00.041
PORTO ALEGRE
RIO DE JANEIRO
CURITIBA
CUIABA


Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:00:00.037
*/


==========================================================
VARRAY
==========================================================


DECLARE
    TYPE nome_varray IS VARRAY(5) OF taluno.nome%TYPE;
    nome_vetor nome_varray := nome_varray();
BEGIN
    nome_vetor.EXTEND;
    nome_vetor(1) := 'MasterTraining';
    Dbms_Output.Put_Line(nome_vetor(1));
END;
/*
MasterTraining


Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:00:00.020
*/


==========================================================
==========================================================
==========================================================
==========================================================

CREATE OR REPLACE FUNCTION CONSULTA_PRECO (P_COD_CURSO NUMBER) RETURN NUMBER
AS 
    V_VALOR NUMBER;
---
BEGIN 
    SELECT VALOR INTO V_VALOR FROM TCURSO
    WHERE COD_CURSO = P_COD_CURSO;
    ---
    RETURN(V_VALOR);
---
END;
/*
Function CONSULTA_PRECO compilado
*/


DECLARE
    V_COD NUMBER := &CODIGO; --no lugar do E COMERCIAL poderiam ser DOIS PONTOS 
    V_VALOR NUMBER;
---
BEGIN 
    V_VALOR := CONSULTA_PRECO(V_COD);
    DBMS_OUTPUT.PUT_LINE('PRECO DO CURSO: '||V_VALOR);
---
END;



==========================================================
FUNCTION PIPELINED - Scripts
==========================================================
--Conectado como System GRANT CREATE ANY TYPE TO MARCIO;

--Registro - Array DROP TYPE TABLE_REG_ALUNO;

CREATE OR REPLACE TYPE REG_ALUNO AS OBJECT(
    CODIGO INTEGER,
    NOME VARCHAR2(30),
    CIDADE VARCHAR(30)
);
/*
Type REG_ALUNO compilado
*/

Array
[0][1][2][3][4]

Matriz
[0][1][2][3][4]
[1][1][2][3][4]
[2][][][][] 




--Matriz
CREATE OR REPLACE TYPE TABLE_REG_ALUNO AS TABLE OF REG_ALUNO;
/*
Type TABLE_REG_ALUNO compilado
*/


--Function que retorna registros
CREATE OR REPLACE FUNCTION GET_ALUNO(pCODIGO NUMBER)
RETURN TABLE_REG_ALUNO PIPELINED
IS
    outLista REG_ALUNO;
    CURSOR CSQL IS
    SELECT ALU.COD_ALUNO, ALU.NOME, ALU.CIDADE
    FROM TALUNO ALU
    WHERE ALU.COD_ALUNO = pCODIGO;
REG CSQL%ROWTYPE;
---
BEGIN
    OPEN CSQL;
    FETCH CSQL INTO REG;
    outLista := REG_ALUNO(REG.COD_ALUNO, REG.NOME, REG.CIDADE);
    PIPE ROW(outLista); --Escreve a linha
    CLOSE CSQL;
    RETURN;
---
END;
/*
Function GET_ALUNO compilado
*/

SELECT * FROM TABLE(GET_ALUNO(1));
/*
CODIGO   NOME    CIDADE      
        1 MARCO    SAO PAULO    


Decorrido: 00:00:00.144
*/

--Usando
SELECT ALU.*, CON.total
FROM TABLE(GET_ALUNO(1)) ALU, TCONTRATO CON
WHERE CON.COD_ALUNO = ALU.CODIGO
/*
CODIGO   NOME    CIDADE      
        1 MARCO    SAO PAULO    


Decorrido: 00:00:00.144
*/


CREATE OR REPLACE FUNCTION GET_ALUNOS RETURN TABLE_REG_ALUNO PIPELINED
IS
    outLista REG_ALUNO;
    CURSOR CSQL IS
        SELECT COD_ALUNO, NOME, CIDADE
        FROM TALUNO; REG CSQL%ROWTYPE;
---
BEGIN
    FOR REG IN CSQL
    LOOP
        outLista := REG_ALUNO(REG.COD_ALUNO,REG.NOME,REG.CIDADE);
        PIPE ROW(outLista);
    END LOOP;
    RETURN;
END;
/*
Function GET_ALUNOS compilado
*/


SELECT * FROM TABLE(GET_ALUNOS);
/*
CODIGO   NOME         CIDADE           
       62 PAULA         IVOTI             
       63 MARIA         SAPIRANGA         
       60 INSERT_ALL    RS                
       61 MARCIO        NOVO HAMBURGO     
        1 MARCO         SAO PAULO         
        2 MARCELO       SAO JOSE          
        3 DIOGENES      TERESINA          
        4 REINALDO      TERESINA          
        5 DIEGO         PASSO FUNDO       
        6 ALFREDO234    ALEGRETE          
        7 Marcio        NOVO HAMBURGO     
        8 Paula         CANOAS            
        9 Maria         SAPIRANGA         
       10 Beta          PORTO ALEGRE      
       11 Teresa        CANOAS            
       12 Adon          TUBARÃƒO          
       13 Ã?sis         Florianopolis     
       14 Pimbo         RIO BRANCO        
       15 ALEXANDRE     FLORIANÃ“POLIS    
       16 Ubaldo        SALVADOR          
       17 Wolney        PORTO ALEGRE      
       18 Iury          ARAGUAINA         
       19 Vania         PINHAL            
       20 Mylla          VACARIA          
       21 Pedro         DOIS IRMAOS       
       22 Pedro         DOIS IRMAOS       
       23 Aldo          QUATRO IRMAOS     
       24 Pedro         DOIS IRMAOS       
       25 Iuri          FLORIANOPOLIS     
       26 Xita          RIO BRANCO        
       27 Null         TORRES            
       28 Alberto      CURITIBA          
       29 Beatriz      VITÃ“RIA          
       30 Clodoaldo    BELO HORIZONTE    
       31 Damaris      CAMPO GRANDE      
       32 Everton      MANAUS            
       33 FabÃ­ula     RIO BRANCO        
       34 Jeferson     RIO DE JANEIRO    
       35 Karen        ANGRA DOS REIS    


39 linhas selecionadas. 
*/


========================================================
========================================================
========================================================
========================================================



CREATE OR REPLACE TYPE REG_TOTALALUNO
AS  OBJECT(COD_ALUNO INTEGER,
          NOME VARCHAR2(30),
          TOTAL NUMERIC(8,2)
    );
/*
Type REG_TOTALALUNO compilado
*/    


--Matriz
CREATE OR REPLACE TYPE TABLE_REG_TOTALALUNO AS TABLE OF REG_TOTALALUNO;
/*
Type TABLE_REG_TOTALALUNO compilado
*/


--Function que retorna registros
CREATE OR REPLACE FUNCTION GET_TOTALALUNO(PCODIGO NUMBER)
RETURN TABLE_REG_TOTALALUNO PIPELINED
IS
    outLista REG_TOTALALUNO;
    CURSOR CSQL IS
        SELECT ALU.COD_ALUNO, ALU.NOME, Sum(CON.TOTAL) TOTAL
        FROM TCONTRATO CON, TALUNO ALU
        WHERE CON.COD_ALUNO = ALU.COD_ALUNO
              AND ALU.COD_ALUNO=PCODIGO
        GROUP BY ALU.COD_ALUNO, ALU.NOME;
    REG CSQL%ROWTYPE;
---
BEGIN
    OPEN CSQL;
    FETCH CSQL INTO REG;
    outLista:=REG_TOTALALUNO(REG.COD_ALUNO, REG.NOME, REG.TOTAL);
    PIPE ROW(outLista);
    CLOSE CSQL;
    RETURN;
---
END;
/*
Function GET_TOTALALUNO compilado
*/


SELECT * FROM TABLE(GET_TOTALALUNO(1));
/*
COD_ALUNO   NOME    TOTAL   
           1 MARCO         450 


Decorrido: 00:00:00.037
*/


========================================================
========================================================
========================================================
========================================================
Criar uma FUNCTION que retorne Cod_Contrato, Data, NomeAluno, Total ( Usar FOR LOOP )
--------------------------------------------------------------------------------------

--Matriz
CREATE OR REPLACE TYPE TABLE_REG_LISTAALUNO AS TABLE OF REG_LISTAALUNO;
/*
Type TABLE_REG_LISTAALUNO compilado
*/


/*
DROP TYPE TABLE_REG_LISTAALUNO;
Type TABLE_REG_LISTAALUNO eliminado.




CREATE OR REPLACE TYPE REG_LISTAALUNO
AS
    OBJECT ( DATA DATE, NOME VARCHAR(20), TOTAL NUMERIC(8,2) );




CREATE OR REPLACE FUNCTION GET_LISTAALUNO
RETURN TABLE_REG_LISTAALUNO PIPELINED
IS
    outLista REG_LISTAALUNO;
    CURSOR CSQL IS
        SELECT Trunc(CON.DATA) DATA, ALU.NOME, Sum(CON.TOTAL) TOTAL
        FROM TALUNO ALU, TCONTRATO CON
        WHERE CON.COD_ALUNO = ALU.COD_ALUNO
        GROUP BY Trunc(CON.DATA), ALU.NOME;
        REG CSQL%ROWTYPE;
---
BEGIN
    FOR REG IN CSQL
    LOOP
        outLista := REG_LISTAALUNO(REG.DATA,REG.NOME, REG.TOTAL);
        PIPE ROW(outLista);
    END LOOP;
    RETURN;
---
END;
*/




SELECT * FROM TABLE(GET_LISTAALUNO);
/*
DATA       NOME         TOTAL   
07/04/21    MARCO              450 
21/04/21    Paula             1515 
24/03/21    Maria              800 
18/04/21    Maria              445 
17/04/21    Maria              800 
19/04/21    Beta              2600 
29/03/21    Beta               800 
05/04/21    DIEGO              445 
17/03/21    Marcio             445 
22/03/21    Maria             5000 
12/03/21    Teresa             800 
21/04/21    Wolney              15 
21/04/21    Vania               15 
02/04/21    MARCELO           1600 
07/04/21    DIOGENES          1500 
03/04/21    DIEGO             5000 
12/03/21    ALFREDO234         800 
16/04/21    Marcio            1600 
04/04/21    DIEGO              445 
21/04/21    Pedro               45 
19/04/21    Maria              445 
20/04/21    Beta              1500 
21/04/21    Aldo                15 
21/04/21    Marcio             500 
21/04/21    Mylla               15 
05/01/13    MARCELO           2500 
21/04/21    ALFREDO234         500 
18/03/21    Marcio             500 
21/04/21    Null                15 


29 linhas selecionadas. 
*/




========================================================
========================================================
========================================================
========================================================


Bulk Collect
O uso do Bulk Collect é aplicado para a manipulação de grande massa de dados.
Com seu uso correto, podemos ter vários tipos de ganhos.

Podemos ter:
Aplicações mais rápidas,
alocação dos dados na memória,
sem a necessidade de refazer a busca no banco.

Porem temos um risco também, pois se não aplicarmos corretamente
as diretrizes na PGA(Program Global Area), podemos ter problemas
na quantidade de dados carregados na memória.

Para estes problemas temos a claúsula LIMIT,
que limita os dados que foram para a memória.

Exemplo:

CREATE TABLE TPRODUTO (
  COD_PRODUTO NUMBER(5),
  DESCRICAO VARCHAR2(40),
  CONSTRAINT PRODUTO_PK PRIMARY KEY (COD_PRODUTO));
Inserindo os dados na tabela:

BEGIN
  INSERT INTO TPRODUTO
  SELECT LEVEL, DBMS_RANDOM.STRING('A', 40) FROM DUAL CONNECT BY LEVEL <= 100;
  COMMIT;
END;
--Vamos agora usar o Bulk Collect com limite de 50 registros. 
--Vamos colocar a cada loop apenas 50 registros na memória.

DECLARE
  CURSOR CUR_PRODUTO IS
  SELECT COD_PRODUTO, DESCRICAO FROM TPRODUTO;
  TYPE TROW_PRODUTO IS TABLE OF CUR_PRODUTO%ROWTYPE INDEX BY PLS_INTEGER;
  ROW_PRODUTO TROW_PRODUTO;
BEGIN
  OPEN CUR_PRODUTO;
  LOOP
    FETCH CUR_PRODUTO BULK COLLECT INTO ROW_PRODUTO LIMIT 50;
    EXIT WHEN ROW_PRODUTO.COUNT = 0;
    FOR I IN 1 .. ROW_PRODUTO.Count LOOP
      DBMS_OUTPUT.PUT_LINE('Código: ' || ROW_PRODUTO(I).COD_PRODUTO || ' Descrição: ' || ROW_PRODUTO(I).DESCRICAO);
    END LOOP;
  END LOOP;
  CLOSE CUR_PRODUTO;
END;


















































