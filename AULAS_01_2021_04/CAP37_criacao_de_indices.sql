==============================
===   Criacao de indices   ===
==============================

Porque o indice e importante?

Indices (Index) sao importantes pois diminuem processamento e I/O em disco. 
Quando usamos um comando SQL para retirar informacoes de uma tabela, na qual, 
a coluna da mesma nao possui um indice, o Oracle faz um Acesso Total a Tabela 
para procurar o dado, ou seja, realiza-se um FULL TABLE SCAN degradando a 
performance do Banco de Dados Oracle. Com o indice isso nao ocorre, pois com 
o indice isso apontara para a linha exata da tabela daquela coluna retirando 
o dado muito mais rapido.

        /*
        OBSERVACAO:
        Os sistemas I/O (Input/Output) sao conjuntos de solucoes em automacao industrial. 
        Formados por modulos, eles tem a funcao de organizar e controlar operacoes de 
        entrada e saida de dados variados relacionados as maquinas do chao de fabrica.

        Quaisquer componentes — como os sensores e atuadores, por exemplo — sao conectados 
        ao modulo I/O para que possam ser configurados, testados, diagnosticados e, 
        o mais importante, tenham a chance de se comunicar efetivamente com as maquinas 
        e o CLP, tanto para sinais digitais, quanto para referencias analogicas.
        */

Crie indices quando:

Uma coluna contiver uma grande faixa de valores
Uma coluna contiver muitos valores nulos
Quando uma ou mais colunas forem usadas frequentemente em clausulas WHERE ou emJOINS
Se a tabela for muito grande e as consultas realizadas recuperarem menos de 5% dos registros.

NaO Crie indices quando:

As colunas nao sao usadas frequentemente como condicao nas consultas
A tabela for pequena ou se os resultados das consultas forem maiores que 5-10% dos registros.
A tabela for atualizada com frequencia
As colunas fizerem parte de uma expressao*
        * Expressao e quando usado regra de filtro
        na clausula where, como por exemplo:


SELECT TABLE_NAME
FROM ALL_TABLES
WHERE TABLE_NAME||OWNER = 'DUALSYS';


Observe que na clausula de comparacao as colunas TABLE_NAME e OWNER fazem uma 
expressao de comparacao e por consequencia um indice nao ajudaria em nada.

Outras coisas importantes de lembrar:

    INDICES NAO SAO ALTERAVEIS!
    (Para voce alterar um indice voce deve remove-lo e recria-lo. )

    INDICES ONERAM A PERFORMANCE DE INSERT / UPDATE
    ( Nao da pra fazer milagres, se sua tabela tiver muitos indices as performances 
    de alteracoes podem ser comprometidas )

==============================================================    
==============================================================    
==============================================================    
==============================================================
Monitorando uso dos indices
==============================================================


Existem muitos bancos de dados em que indices estao criados mas nao sao utilizados. 
Por exemplo, ter criado um indice para um determinado procedimento, que e executado 
somente uma vez e apos seu uso nao e removido, ou ate mesmo o Oracle perceber que 
leitura por scans completos pode ser mais vantajoso do que utilizar um determinado 
indice (isso acontece).

Criar indice em uma base, deve ser algo realmente estudado, pois podem ter impacto 
negativo sobre o desempenho das operacoes DML. Alem de modificar o valor do bloco 
da data, tambem e necessario atualizar o bloco do indice.

Por esse motivo que devesse notar muito bem a utilizacao de um indice, caso nao seja 
utilizado prejudica o desempenho do banco de dados.

Abaixo esta um exemplo para descobrir se um indice esta sendo ou nao utilizado

--Criacao de tabela de teste
create table teste_indice_cap37 (codigo number,  nome varchar2(40) );
/*
Table TESTE_INDICE_CAP37 criado.
*/

--Criacao de indice
create index ind_codigo on teste_indice_cap37 (codigo);
/*
Index IND_CODIGO criado.
*/

--Novo registro
insert into teste_indice_cap37 values (1, 'IURI');
/*
1 linha inserido.

Decorrido: 00:00:00.095
*/

commit;
/*
Commit concluído.
Decorrido: 00:00:00.198
*/


--Verificado se o indices ja foi usado
select index_name, table_name, used from v$object_usage;
/*
nenhuma linha selecionada
Decorrido: 00:00:00.455

APARECE COMO NENHUMA LINHA SELECIONADA PQ O INDICE FOU RECEM CRIADO
*/

--Alterado indice
alter index ind_codigo monitoring usage;
/*
Index IND_CODIGO alterado.

Decorrido: 00:00:00.333
*/

 

--Select para usar o indice E APARECER NA VERIFICACAO
select * from teste_indice_cap37 where codigo=1;
/*
CODIGO   NOME   
        1 IURI    


Decorrido: 00:00:00.161
*/


--Verificado se o indices ja foi usado novamente
select index_name, table_name, used from v$object_usage;
/*
INDEX_NAME   TABLE_NAME           USED   
IND_CODIGO    TESTE_INDICE_CAP37    YES     


Decorrido: 00:00:00.049
*/

--Alterado indice para nao ser monitorado  
alter index ind_codigo nomonitoring usage;
/*
Index IND_CODIGO alterado.

Decorrido: 00:00:00.139

*/
-->O MESMO COMANDO HABILITA E DESABILITA

Veja que a view v$OBJECT_USAGE, tera cada indice do seu esquema cujo uso esta 
sendo monitorando, caso o indice nao for usado, pode ser exclui-lo para melhorar 
performance de DML.






