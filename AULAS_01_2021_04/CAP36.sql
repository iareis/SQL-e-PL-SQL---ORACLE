==================================
===   Otimizacao de Consulta   ===
===       AJUSTE DE SQL        ===
==================================

Uma das principais vantagens da linguagem SQL e que voce nao precisa dizer ao banco de dados
exatamente como ele deve obter os dados solicitados. Basta executar uma consulta especificando
as informacoes desejadas e o software de banco de dados descobre a melhor maneira de obte-las.
as vezes, voce pode melhorar o desempenho de suas instrucoes SQL “ajustando-as”.

Nas secoes a seguir, voce vera dicas de ajuste que podem fazer suas consultas executarem
mais rapidamente e tecnicas de ajuste mais avancadas.

 
USE UMA CLaUSULA WHERE PARA FILTRAR LINHAS

Muitos iniciantes recuperam todas as linhas de uma tabela quando so querem uma delas
(ou algumas poucas). Isso e muito desperdicio. Uma estrategia melhor e adicionar uma 
clausula WHERE em uma consulta. Desse modo, voce restringe as linhas recuperadas apenas 
aquelas realmente necessarias.

Por exemplo, digamos que voce queira os detalhes dos clientes numero 1 e 2. A consulta a seguir 
recupera todas as linhas da tabela customers no esquema store (desperdicio):



-- RUIM (recupera todas as linhas da tabela customers)
    SELECT * FROM TALUNO;
/*
 COD_ALUNO NOME                                     SOBRENOME                                TI CIDADE                                CEP ES    SALARIO NASCIMEN
---------- ---------------------------------------- ---------------------------------------- -- ------------------------------ ---------- -- ---------- --------
        62 PAULA                                    ABDUL                                    J  IVOTI                            93000000 RS      13000 11/03/57
        63 MARIA                                    BOLENA                                   J  SAPIRANGA                        93000000 RS      13000 11/03/57
        60 INSERT_ALL                                                                           RS                                    620          1013         
        61 MARCIO                                   Konrath                                  F  NOVO HAMBURGO                    93000000 RS      13000 11/03/57
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

39 linhas selecionadas.
*/  

A proxima consulta adiciona uma clausula WHERE ao exemplo anterior para obter apenas os

alunos numero 1 e 2:

-- BOM (usa uma clausula WHERE para limitar as linhas recuperadas)
    SELECT * FROM TALUNO
    WHERE COD_ALUNO IN (1, 2);
/*
COD_ALUNO   NOME      SOBRENOME   TIPO   CIDADE      CEP        ESTADO   SALARIO   NASCIMENTO   
           1 MARCO      RADOMILE     F       SAO PAULO        1333010 SP               620 21/07/72      
           2 MARCELO    PETRY        F       SAO JOSE        88101090 S               1240 21/07/71      


Decorrido: 00:00:00.110
*/

USE JOINS DE TABELA EM VEZ DE VaRIAS CONSULTAS

Se voce precisa de informacoes de varias tabelas relacionadas, deve usar condicoes de join, 
em vez de varias consultas. No exemplo inadequado a seguir, sao usadas duas consultas para 
obter o nome e o tipo do produto numero 1 (usar duas consultas e desperdicio). A primeira 
consulta obtem os valores de coluna nome e cod_aluno da tabela products para o produto numero 1. 

A segunda consulta utiliza esse valor de cod_aluno para obter a coluna name da tabela TALUNO.

-- RUIM (duas consultas separadas, quando uma seria suficiente)
    SELECT nome, cod_aluno
    FROM taluno
    WHERE cod_aluno = 1;
 

Em vez de usar duas consultas, voce deve escrever uma unica consulta que utilize um join
entre as tabelas products e product_types. A consulta correta a seguir mostra isso:

-- BOM (uma unica consulta com um join)
    SELECT CON.DATA, ALU.NOME, CON.TOTAL
    FROM TCONTRATO CON, TALUNO ALU
    WHERE CON.COD_ALUNO = ALU.COD_ALUNO
    AND CON.COD_CONTRATO = 1;
 

Essa consulta resulta na recuperacao do mesmo nome e tipo de produto do primeiro exemplo,
mas os resultados sao obtidos com uma unica consulta. Uma so consulta geralmente e mais
eficiente do que duas.

Voce deve escolher a ordem de juncao em sua consulta de modo a juntar menos linhas nas
tabelas posteriormente. 

 

USE REFEReNCIAS DE COLUNA TOTALMENTE QUALIFICADAS AO FAZER JOINS

Sempre inclua apelidos de tabela em suas consultas e utilize o apelido de cada coluna 
(isso e conhecido como "qualificar totalmente" suas referencias de coluna). Desse modo, 
o banco de dados nao precisara procurar nas tabelas cada coluna utilizada em sua consulta.

-- RUIM (as colunas TOTAL nao esta totalmente qualificada)
    SELECT CON.DATA, ALU.NOME, TOTAL
    /*o TOTAL sem apelido (join) neste caso não tem pro
    mas se a coluna TOTAL existir em outra tabela, pode resultar erro*/
    FROM TCONTRATO CON, TALUNO ALU
    WHERE CON.COD_ALUNO = ALU.COD_ALUNO
    AND CON.COD_CONTRATO = 1;
 

USE EXPRESSoES CASE EM VEZ DE VaRIAS CONSULTAS

Use expressoes CASE, em vez de varias consultas, quando precisar efetuar muitos calculos nas
mesmas linhas em uma tabela. O exemplo inadequado a seguir usa varias consultas para contar o
numero de produtos dentro de diversos intervalos de preco:

-- RUIM (tres consultas separadas, quando uma unica instrucao CASE funcionaria)
    SELECT COUNT(*) FROM TCURSO
    WHERE VALOR < 800;
    
    SELECT COUNT(*) FROM TCURSO
    WHERE VALOR BETWEEN 1000 AND 1500;
    
    SELECT COUNT(*) FROM TCURSO
    WHERE VALOR > 1200;
 

Em vez de usar tres consultas, voce deve escrever uma unica que utilize expressoes CASE.
Isso esta mostrado no exemplo correto a seguir:

-- BOM (uma unica consulta com uma expressao CASE)
    SELECT COUNT(CASE
                    WHEN VALOR < 800 THEN 1
                    ELSE null END) "VALOR BAIXO",
            COUNT(CASE
                    WHEN VALOR BETWEEN 800 AND 1200 THEN 1 
                    ELSE null END) "VALOR MEDIO",
            COUNT(CASE 
                    WHEN VALOR > 1500 THEN 1 
                    ELSE null END) "VALOR ALTO"
    FROM TCURSO;
/*
VALOR BAIXO   VALOR MEDIO   VALOR ALTO   
             2              8            10 


Decorrido: 00:00:00.146
*/

ADICIONE iNDICES NAS TABELAS

Ao procurar um topico especifico em um livro, voce pode percorrer o livro inteiro ou utilizar o
indice para encontrar o local. Conceitualmente, um indice de uma tabela de banco de dados e
semelhante ao indice de um livro, exceto que os indices de banco de dados sao usados para encontrar
linhas especificas em uma tabela. 

O inconveniente dos indices e que, quando uma linha e adicionada na tabela, e necessario 
tempo adicional para atualizar o indice da nova linha. Geralmente, voce deve criar um indice 
em uma coluna quando esta recuperando um pequeno numero de linhas de uma tabela que contenha 
muitas linhas. Uma boa regra geral e:

Crie um indice quando uma consulta recuperar <= 10% do total de linhas de uma tabela.
Isso significa que a coluna do indice deve conter uma ampla variedade de valores. Uma boa
candidata a indexacao seria uma coluna contendo um valor exclusivo para cada linha (por exemplo,
um numero de CPF). Uma candidata ruim para indexacao seria uma coluna que contivesse
somente uma pequena variedade de valores (por exemplo, N, S, E, O ou 1, 2, 3, 4, 5, 6). Um banco
de dados Oracle cria um indice automaticamente para a chave primaria de uma tabela e para as
colunas incluidas em uma restricao unica.

Alem disso, se o seu banco de dados e acessado por muitas consultas hierarquicas (isto e,
uma consulta contendo uma clausula CONNECT BY), voce deve adicionar indices nas colunas 
referenciadas nas clausulas START WITH e CONNECT BY Por fim, para uma coluna que contenha uma 
pequena variedade de valores e seja usada freqüentemente na clausula WHERE de consultas, 
voce deve considerar a adicao de um indice de bitmap nessa coluna. Os indices de bitmap sao 
normalmente usados em ambientes de data warehouse, que sao bancos de dados contendo volumes de 
dados muito grandes. Os dados de um data warehouse normalmente sao lidos por muitas consultas, mas 
nao sao modificados por muitas transacoes concorrentes.

Normalmente, o administrador do banco de dados e responsavel pela criacao de indices.
Entretanto, como desenvolvedor de aplicativos, voce podera fornecer informacoes para ele sobre
quais colunas sao boas candidatas a indexacao, pois talvez saiba mais sobre o aplicativo do que o
DBA.

 

USE WHERE EM VEZ DE HAVING


A clausula WHERE e usada para filtrar linhas; a clausula HAVING, para filtrar grupos de linhas. Como
a clausula HAVING filtra grupos de linhas depois que elas foram agrupadas (o que leva algum tempo
para ser feito), quando possivel, voce deve primeiro filtrar as linhas usando uma clausula WHERE.
Desse modo, voce evita o tempo gasto para agrupar as linhas filtradas.

■ Utiliza a clausula GROUP BY para agrupar as linhas em blocos
■ Utiliza a clausula HAVING para filtrar os resultados retornados em funcoes de grupo

 
-- RUIM (usa HAVING em vez de WHERE)
    SELECT COD_ALUNO, AVG(TOTAL)
    FROM TCONTRATO
    GROUP BY COD_ALUNO
    HAVING COD_ALUNO IN (1, 2);
 
A consulta correta a seguir reescreve o exemplo anterior usando WHERE, em vez de HAVING,
para primeiro filtrar as linhas naquelas cujo valor de cod_aluno e 1 ou 2:


-- BOM (usa WHERE em vez de HAVING)
    SELECT COD_ALUNO, AVG(TOTAL)
    FROM TCONTRATO
    WHERE COD_ALUNO IN (1, 2)
    GROUP BY COD_ALUNO;
 

 
USE UNION ALL EM VEZ DE UNION



Voce usa UNION ALL para obter todas as linhas recuperadas por duas consultas, incluindo as linhas
duplicadas; UNION e usado para obter todas as linhas nao duplicadas recuperadas pelas consultas.
Como UNION remove as linhas duplicadas (o que leva algum tempo para ser feito), quando possivel,
voce deve usar UNION ALL.

A consulta inadequada a seguir usa UNION (ruim, porque UNION ALL funcionaria) para obter
as linhas das tabelas products e more_products. Observe que todas as linhas nao duplicadas de
products e more_products sao recuperadas:


-- RUIM (usa UNION em vez de UNION ALL)
    SELECT COD_ALUNO, NOME, CIDADE
    FROM TALUNO
    WHERE ESTADO = 'RS'
    UNION
    SELECT COD_ALUNO, NOME, CIDADE
    FROM TALUNO
    WHERE COD_ALUNO = 1;
/*
COD_ALUNO   NOME         CIDADE          
           1 MARCO         SAO PAULO        
           5 DIEGO         PASSO FUNDO      
           6 ALFREDO234    ALEGRETE         
           7 Marcio        NOVO HAMBURGO    
           8 Paula         CANOAS           
           9 Maria         SAPIRANGA        
          10 Beta          PORTO ALEGRE     
          11 Teresa        CANOAS           
          17 Wolney        PORTO ALEGRE     
          19 Vania         PINHAL           
          20 Mylla          VACARIA         
          21 Pedro         DOIS IRMAOS      
          22 Pedro         DOIS IRMAOS      
          23 Aldo          QUATRO IRMAOS    
          24 Pedro         DOIS IRMAOS      
          27 Null          TORRES           
          61 MARCIO        NOVO HAMBURGO    
          62 PAULA         IVOTI            
          63 MARIA         SAPIRANGA        


19 linhas selecionadas.
*/


A consulta correta a seguir reescreve o exemplo anterior para usar UNION ALL. Observe que
todas as linhas de products e more_products sao recuperadas, incluindo as duplicadas:

 
-- BOM (usa UNION ALL em vez de UNION)
    SELECT COD_ALUNO, NOME, CIDADE
    FROM TALUNO 
    WHERE ESTADO = 'RS'
    UNION ALL
    SELECT COD_ALUNO, NOME, CIDADE
    FROM TALUNO
    WHERE COD_ALUNO = 1;
/*
COD_ALUNO   NOME         CIDADE          
          62 PAULA         IVOTI            
          63 MARIA         SAPIRANGA        
          61 MARCIO        NOVO HAMBURGO    
           5 DIEGO         PASSO FUNDO      
           6 ALFREDO234    ALEGRETE         
           7 Marcio        NOVO HAMBURGO    
           8 Paula         CANOAS           
           9 Maria         SAPIRANGA        
          10 Beta          PORTO ALEGRE     
          11 Teresa        CANOAS           
          17 Wolney        PORTO ALEGRE     
          19 Vania         PINHAL           
          20 Mylla          VACARIA         
          21 Pedro         DOIS IRMAOS      
          22 Pedro         DOIS IRMAOS      
          23 Aldo          QUATRO IRMAOS    
          24 Pedro         DOIS IRMAOS      
          27 Null          TORRES           
           1 MARCO         SAO PAULO        


19 linhas selecionadas. 
*/


USE EXISTS EM VEZ DE IN

Voce usa IN para verificar se um valor esta contido em uma lista. EXISTS e usado para verificar
a existencia de linhas retornadas por uma subconsulta. EXISTS e diferente de IN: EXISTS apenas
verifica a existencia de linhas, enquanto IN verifica os valores reais. Normalmente, EXISTS oferece
melhor desempenho do que IN com subconsultas. Portanto, quando possivel, use EXISTS em vez
de IN.

Consulte a secao intitulada “Usando EXISTS e NOT EXISTS em uma subconsulta correlacionada”,
(um ponto importante a lembrar e que as subconsultas correlacionadas podem
trabalhar com valores nulos).

A consulta inadequada a seguir usa IN (ruim, porque EXISTS funcionaria) para recuperar os
produtos que foram comprados:

 
-- RUIM (usa IN em vez de EXISTS)
    SELECT COD_CURSO, NOME
    FROM TCURSO
    WHERE COD_CURSO IN (SELECT COD_CURSO FROM TITEM);
/*
COD_CURSO   NOME                    
           1 ORACLE SQL ePL/SQL       
           3 JAVA FUNDAMENTOS E 00    
           4 JAVASERVER FACES         
           2 ORACLE DBA               


Decorrido: 00:00:00.088
*/ 

-- BOM (usa EXISTS em vez de IN)

    SELECT COD_CURSO, NOME
    FROM TCURSO cur
    WHERE EXISTS (SELECT 1
                FROM TITEM ite
                WHERE ite.COD_CURSO = cur.COD_CURSO);
/*
COD_CURSO   NOME                    
           1 ORACLE SQL ePL/SQL       
           3 JAVA FUNDAMENTOS E 00    
           4 JAVASERVER FACES         
           2 ORACLE DBA               


Decorrido: 00:00:00.088
*/


USE EXISTS EM VEZ DE DISTINCT

Voce pode suprimir a exibicao de linhas duplicadas usando DISTINCT. EXISTS e usado para verificar
a existencia de linhas retornadas por uma subconsulta. Quando possivel, use EXISTS em vez de
DISTINCT, pois DISTINCT classifica as linhas recuperadas antes de suprimir as linhas duplicadas.
A consulta inadequada a seguir usa DISTINCT (ruim, porque EXISTS funcionaria) para recuperar
os produtos que foram comprados:

 
-- RUIM (usa DISTINCT quando EXISTS funcionaria)
    SELECT DISTINCT ITE.COD_CURSO, CUR.NOME
    FROM TCURSO cur, TITEM ite
    WHERE ITE.COD_CURSO = CUR.COD_CURSO;

 
A consulta correta a seguir reescreve o exemplo anterior usando EXISTS em vez de DISTINCT:

=== ???????????????????=====================================================

-- BOM (usar EXISTS em vez de DISTINCT)
    SELECT product_id, name
    FROM products outher
    WHERE EXISTS (  SELECT 1
                    FROM purchases inner
                    WHERE inner.product_id = outer.product_id);
 
============================================================================
============================================================================

OS VIDEO DA AULA FOI ATEH OS ITENS ACIMA, DAQUI EM DIANTE EH PARA ESTUDAR

============================================================================
============================================================================
 
USE GROUPING SETS EM VEZ DE CUBE

Normalmente, a clausula GROUPING SETS oferece melhor desempenho do que CUBE. Portanto,
quando possivel, voce deve usar GROUPING SETS em vez de CUBE. Isso foi abordado detalhadamente
na secao intitulada “Usando a clausula GROUPING SETS”.

 

USE VARIaVEIS DE BIND

O software de banco de dados Oracle coloca as instrucoes SQL em cache; uma instrucao SQL colocada
no cache e reutilizada se uma instrucao identica e enviada para o banco de dados. Quando
uma instrucao SQL e reutilizada, o tempo de execucao e reduzido. Entretanto, a instrucao SQL
deve ser absolutamente identica para ser reutilizada. Isso significa que:

■ Todos os caracteres na instrucao SQL devem ser iguais
■ Todas as letras na instrucao SQL devem ter a mesma caixa
■ Todos os espacos na instrucao SQL devem ser iguais

Se voce precisa fornecer valores de coluna diferentes em uma instrucao, pode usar variaveis
de bind em vez de valores de coluna literais. Exemplos que esclarecem essas ideias sao mostrados
a seguir.
 

Instrucoes SQL nao identicas

Nesta secao, voce vera algumas instrucoes SQL nao identicas. As consultas nao identicas a seguir
recuperam os produtos numero 1 e 2:

    SELECT * FROM products WHERE product_id = 1;

    SELECT * FROM products WHERE product_id = 2;


Essas consultas nao sao identicas, pois o valor 1 e usado na primeira instrucao, mas o valor 2
e usado na segunda. As consultas nao identicas tem espacos em posicoes diferentes:

    SELECT * FROM products WHERE product_id = 1;

    SELECT * FROM products WHERE product_id = 1;


As consultas nao identicas a seguir usam uma caixa diferente para alguns dos caracteres:

    select * from products where product_id = 1;

    SELECT * FROM products WHERE product_id = 1;


Agora que voce ja viu algumas instrucoes nao identicas, vejamos instrucoes SQL identicas
que utilizam variaveis de bind.


Instrucoes SQL identicas que usam variaveis de bind

Voce pode garantir que uma instrucao seja identica utilizando variaveis de bind para representar
valores de coluna. Uma variavel de bind e criada com o comando VARIABLE do SQL*Plus. Por
exemplo, o comando a seguir cria uma variavel chamada v_product_id de tipo NUMBER:

    VARIABLE v_product_id NUMBER


COMPARANDO O CUSTO DA EXECUcaO DE CONSULTAS

O software de banco de dados Oracle usa um subsistema conhecido como otimizador para gerar
o caminho mais eficiente para acessar os dados armazenados nas tabelas. O caminho gerado pelo
otimizador e conhecido como plano de execucao. O Oracle Database 10g e as versoes superiores
reunem estatisticas sobre os dados de suas tabelas e indices automaticamente, para gerar o melhor
plano de execucao (isso e conhecido como otimizacao baseada em custo).

A comparacao dos planos de execucao gerados pelo otimizador permite a voce julgar o custo
relativo de uma instrucao SQL em relacao a outra. e possivel usar os resultados para aprimorar
suas instrucoes SQL. Nesta secao, voce vai aprender a ver e interpretar dois exemplos de planos de
execucao.


Examinando planos de execucao

O otimizador gera um plano de execucao para uma instrucao SQL. Voce pode examinar o plano de
execucao usando o comando EXPLAIN PLAN do SQL*Plus. O comando EXPLAIN PLAN preenche
uma tabela chamada plan_table com o plano de execucao da instrucao SQL (plan_table e freqüentemente
referida como “tabela de plano”). Voce pode entao examinar esse plano de execucao
consultando a tabela de plano. A primeira coisa que voce deve fazer e verificar se a tabela de plano
ja existe no banco de dados.


Gerando um plano de execucao

Uma vez que voce tenha uma tabela de plano, pode usar o comando EXPLAIN PLAN para gerar um
plano de execucao para uma instrucao SQL. A sintaxe do comando EXPLAIN PLAN e:

    EXPLAIN PLAN SET STATEMENT_ID = id_instrucao FOR instrucao_sql;

onde

■ id_instrucao e o nome que voce deseja dar ao plano de execucao. Pode ser qualquer
texto alfanumerico.
■ instrucao_sql e a instrucao SQL para a qual voce deseja gerar um plano de execucao.

O exemplo a seguir gera o plano de execucao para uma consulta que recupera todas as linhas
da tabela customers (observe que o valor de id_instrucao e configurado como 'CUSTOMERS'):

    EXPLAIN PLAN SET STATEMENT_ID = 'CUSTOMERS' FOR
    SELECT customer_id, first_name, last_name
    FROM customers;

Explained

Depois que o comando terminar, voce pode examinar o plano de execucao armazenado na
tabela de plano. Voce vai aprender a fazer isso a seguir.

NOTA
A consulta na instrucao EXPLAIN PLAN nao retorna linhas da tabela customers. A instrucao
EXPLAIN PLAN simplesmente gera o plano de execucao que seria usado se a consulta fosse
executada.

Consultando a tabela de plano

Para consultar a tabela de plano, fornecemos um script SQL*Plus chamado explain_plan.sql no
diretorio SQL. O script solicita o valor de statement_id (id_instrucao) e depois exibe o plano de
execucao para essa instrucao.

O script explain_plan.sql contem as seguintes instrucoes:

-- Exibe o plano de execucao da statement_id especificada
    UNDEFINE v_statement_id;
    SELECT
    id ||
    DECODE(id, 0, '', LPAD(' ', 2*(level – 1))) || ' ' ||
    operation || ' ' ||
    options || ' ' ||
    object_name || ' ' ||
    object_type || ' ' ||
    DECODE(cost, NULL, '', 'Cost = ' || position)
    AS execution_plan
    FROM plan_table
    CONNECT BY PRIOR id = parent_id
    AND statement_id = '&&v_statement_id'
    START WITH id = 0
    AND statement_id = '&v_statement_id';
 

Um plano de execucao e organizado em uma hierarquia de operacoes de banco de dados
semelhante a uma arvore; os detalhes dessas operacoes sao armazenados na tabela de plano. A
operacao com o valor de id igual a 0 e a raiz da hierarquia e todas as outras operacoes do plano
procedem dessa raiz. A consulta do script recupera os detalhes das operacoes, comecando com a
operacao raiz e, entao, percorre a arvore a partir da raiz.

O exemplo a seguir mostra como executar o script explain_plan.sql para recuperar o plano
'CUSTOMERS' criado anteriormente:

    SQL> @ c:\sql_book\sql\explain_plan.sql

Enter value for v_statement_id: CUSTOMERS

old 12: statement_id = '&&v_statement_id'
new 12: statement_id = 'CUSTOMERS'
old 14: statement_id = '&v_statement_id'
new 14: statement_id = 'CUSTOMERS'

EXECUTION_PLAN

----------------------------------------------

0 SELECT STATEMENT Cost = 3

1 TABLE ACCESS FULL CUSTOMERS TABLE Cost = 1

As operacoes mostradas na coluna EXECUTION_PLAN sao executadas na seguinte ordem:

■ A operacao recuada mais a direita e executada primeiro, seguida de todas as operacoes
pai que estao acima dela.
■ Para operacoes com o mesmo recuo, a operacao mais acima e executada primeiro, seguida
de todas as operacoes pai que estao acima dela.

Cada operacao envia seus resultados de volta no encadeamento ate sua operacao pai imediata
e, entao, a operacao pai e executada. Na coluna EXECUTION_PLAN, a ID da operacao e mostrada
na extremidade esquerda. No exemplo de plano de execucao, a operacao 1 e executada primeiro,
com seus resultados sendo passados para a operacao 0. O exemplo a seguir ilustra a ordem para
um exemplo mais complexo:



0 SELECT STATEMENT Cost = 6
1 MERGE JOIN Cost = 1
2 TABLE ACCESS BY INDEX ROWID PRODUCT_TYPES TABLE Cost = 1
3 INDEX FULL SCAN PRODUCT_TYPES_PK INDEX (UNIQUE) Cost = 1
4 SORT JOIN Cost = 2
5 TABLE ACCESS FULL PRODUCTS TABLE Cost = 1


A ordem em que as operacoes sao executadas nesse exemplo e 3, 2, 5, 4, 1 e 0.

Agora que voce ja conhece a ordem na qual as operacoes sao executadas, e hora de aprender
para o que elas fazem realmente.  O plano de execucao da consulta 'CUSTOMERS' era:

0 SELECT STATEMENT Cost = 3
1 TABLE ACCESS FULL CUSTOMERS TABLE Cost = 1


A operacao 1 e executada primeiro, com seus resultados sendo passados para a operacao 0.
A operacao 1 envolve uma varredura integral — indicada pela string TABLE ACCESS FULL — da
tabela customers. Este e o comando original usado para gerar a consulta 'CUSTOMERS':

    EXPLAIN PLAN SET STATEMENT_ID = 'CUSTOMERS' FOR
    SELECT customer_id, first_name, last_name FROM customers;
 

Uma varredura integral da tabela e realizada porque a instrucao SELECT especifica que todas
as linhas da tabela customers devem ser recuperadas.

O custo total da consulta e de tres unidades de trabalho, conforme indicado na parte referente
ao custo mostrada a direita da operacao 0 no plano de execucao (0 SELECT STATEMENT Cost =
3). Uma unidade de trabalho e a quantidade de processamento que o software precisa para realizar
determinada operacao. Quanto mais alto o custo, mais trabalho o software do banco de dados precisa
realizar para concluir a instrucao SQL.

NOTA
Se voce estiver usando uma versao do banco de dados anterior ao Oracle Database 10g, a saida
do custo da instrucao global podera estar em branco. Isso ocorre porque as versoes de banco de
dados anteriores nao reunem estatisticas de tabela automaticamente. Para reunir estatisticas, voce
precisa usar o comando ANALYZE. Voce vai aprender a fazer isso na secao “Reunindo estatisticas
de tabela”.

Planos de execucao envolvendo joins de tabela

Os planos de execucao para consultas com joins de tabelas sao mais complexos. O exemplo a seguir
gera o plano de execucao de uma consulta que junta as tabelas products e product_types:

    EXPLAIN PLAN SET STATEMENT_ID = 'PRODUCTS' FOR
    SELECT p.name, pt.name
    FROM products p, product_types pt
    WHERE p.product_type_id = pt.product_type_id;

O plano de execucao dessa consulta esta mostrado no exemplo a seguir:

    @ c:\sql_book\sql\explain_plan.sql

    Enter value for v_statement_id: PRODUCTS

EXECUTION_PLAN

----------------------------------------------------------------

0 SELECT STATEMENT Cost = 6
1 MERGE JOIN Cost = 1
2 TABLE ACCESS BY INDEX ROWID PRODUCT_TYPES TABLE Cost = 1
3 INDEX FULL SCAN PRODUCT_TYPES_PK INDEX (UNIQUE) Cost = 1
4 SORT JOIN Cost = 2
5 TABLE ACCESS FULL PRODUCTS TABLE Cost = 1
 

ID da operacao Descricao

3 Varredura integral do indice product_types_pk (que e um indice exclusivo)
para obter os enderecos das linhas na tabela product_types. Os
enderecos estao na forma de valores de ROWID, os quais sao passados para
a operacao 2.

2 Acesso as linhas da tabela product_types usando a lista de valores de
ROWID passada da operacao 3. As linhas sao passadas para a operacao 1.

5 Acesso as linhas da tabela products. As linhas sao passadas para a operacao

4.

4 Classificacao das linhas passadas da operacao 5. As linhas classificadas sao
passadas para a operacao 1.

1 Mesclagem das linhas passadas das operacoes 2 e 5. As linhas mescladas
sao passadas para a operacao 0.

0 Retorno das linhas da operacao 1 para o usuario. O custo total da consulta
e de 6 unidades de trabalho.

Reunindo estatisticas de tabela

Se estiver usando uma versao do banco de dados anterior ao Oracle Database 10g (como a 9i),
voce mesmo tera de reunir estatisticas de tabela usando o comando ANALYZE. Por padrao, se
nenhuma estatistica estiver disponivel, a otimizacao baseada em regra sera utilizada. Normalmente,
a otimizacao baseada em regra nao e tao boa quanto a otimizacao baseada em custo. Os
exemplos a seguir usam o comando ANALYZE para reunir estatisticas para as tabelas products e
product_types:

    ANALYZE TABLE products COMPUTE STATISTICS;

    ANALYZE TABLE product_types COMPUTE STATISTICS;

Uma vez reunidas as estatisticas, a otimizacao baseada em custo sera usada em vez da otimizacao
baseada em regra.

Comparando planos de execucao

Comparando o custo total mostrado no plano de execucao para diferentes instrucoes SQL, voce
pode determinar o valor do ajuste de seu codigo SQL. Nesta secao, voce vera como comparar dois
planos de execucao e a vantagem de usar EXISTS em vez de DISTINCT (uma dica dada anteriormente).

O exemplo a seguir gera um plano de execucao para uma consulta que usa EXISTS:

    EXPLAIN PLAN SET STATEMENT_ID = 'EXISTS_QUERY' FOR
    SELECT product_id, name
    FROM products outer
    WHERE EXISTS
    (SELECT 1
    FROM purchases inner
    WHERE inner.product_id = outer.product_id);
    EXPLAIN PLAN SET STATEMENT_ID = 'DISTINCT_QUERY' FOR
    SELECT DISTINCT pr.product_id, pr.name
    FROM products pr, purchases pu
    WHERE pr.product_id = pu.product_id;


O plano de execucao dessa consulta esta mostrado no exemplo a seguir:

    @ c:\sql_book\sql\explain_plan.sql

    Enter value for v_statement_id: DISTINCT_QUERY

EXECUTION_PLAN

--------------------------------------------------------------

0 SELECT STATEMENT Cost = 5
1 HASH UNIQUE Cost = 1
2 MERGE JOIN Cost = 1
3 TABLE ACCESS BY INDEX ROWID PRODUCTS TABLE Cost = 1
4 INDEX FULL SCAN PRODUCTS_PK INDEX (UNIQUE) Cost = 1
5 SORT JOIN Cost = 2
6 INDEX FULL SCAN PURCHASES_PK INDEX (UNIQUE) Cost = 1


O custo da consulta e de 5 unidades de trabalho. Essa consulta e mais dispendiosa do que a
anterior, que usou EXISTS (essa consulta tinha um custo de apenas 4 unidades de trabalho). Esses
resultados provam que e melhor usar EXISTS do que DISTINCT.
Referencia Oracle DataBase 11G SQL