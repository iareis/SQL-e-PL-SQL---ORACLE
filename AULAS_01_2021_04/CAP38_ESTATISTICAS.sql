========================
===   Estatisticas   ===
========================

Coletando estatisticas para o otimizador de queries do Oracle

Para que o Oracle monte planos de execucao otimizados, e necessario que as 
estatisticas dos objetos estejam sempre atualizadas. Para atualizar as 
estatisticas dos objetos, podemos usar os metodos abaixo:

 

     Comando ANALYZE:

          - Calcula estatisticas globais de tabelas, indices e clusters;

          - Permite coletar estatisticas exatas ou estimada em um numero ou 
          percentual de linhas;

          - Nao e tao preciso ao calcular, por exemplo, a cardinalidade, ao 
          envolver valores distintos;

           - Exemplo p/ coletar estatisticas exatas de uma tabela: 

ANALYZE TABLE TALUNO COMPUTE STATISTICS;
/*
Table TALUNO analisado.

Decorrido: 00:00:01.321
*/
 

     Package DBMS_UTILITY:

          - As procedures desta package diferem do comando ANALYZE apenas pela 
          possibilidade de permitir coletar estatisticas de um schema ou do 
          banco de dados completo;

          - Exemplo p/ coletar estatisticas de um schema todo:

--Estatistica de SCHEMA --> deve estar conectado cozmo SYSTEM
EXEC DBMS_UTILITY.ANALYZE_SCHEMA('IAREIS','COMPUTE');
/*
Erro a partir da linha : 42 no comando -
BEGIN DBMS_UTILITY.ANALYZE_SCHEMA('MARCIO','COMPUTE'); END;
Relatório de erros -
ORA-20000: user 'MARCIO' does not exist
ORA-06512: em "SYS.DBMS_UTILITY", line 453
ORA-06512: em line 1
20000. 00000 -  "%s"
*Cause:    The stored procedure 'raise_application_error'
           was called which causes this error to be generated.
*Action:   Correct the problem as described in the error message or contact
           the application administrator or DBA for more information.
Decorrido: 00:00:00.053

==========================================================
DEVE ESTAR ATENDO QUE OMDE ESTAVA MARCIO E AGORA ESTA IAREIS DEVE SER O NOME
DO USUARIO EM USO

Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:00:02.183

*/
   

     Package DBMS_STATS:

          - Permite coletar estatisticas exatas ou estimadas de objetos 
          individualmente (tabelas, indices, cluster etc), schemas, 
          banco de dados completo e de sistema;

          - Permite execucao paralela, transferencia de estatisticas entre servidores 
          e e mais preciso que os metodos anteriores;

          - Gera historicos que sao extremamente uteis para otimizar queries que 
          efetuam pesquisas em colunas que possuem valores dispersos;

          - e o metodo de coleta de estatisticas atualmente recomendado pela Oracle 
          e por especialistas no assunto;

          - Exemplos:

              a) Para coletar estatisticas estimadas (5%) de uma tabela:

EXEC DBMS_STATS.GATHER_TABLE_STATS(OWNNAME=>'OWNER', 
TABNAME=>'TALUNO', ESTIMATE_PERCENT=>5);  

 
              b) Para coletar estatisticas estimadas (30%) de um schema:

EXEC DBMS_STATS.GATHER_SCHEMA_STATS('OWNER', estimate_percent=> 30);

 
              c) Para coletar estatisticas de todo o banco de dados: 

--EM TABELAS PEQUENAS LEVA EM TORNO DE 5 MINUTOS, EM PRODUCAO PODE DEMORAR,
--ENTAO EH INTERESSANTE DEIXAR PARA RODAS NUMA MADRUGADA OU FINAL DE SEMANA
EXEC DBMS_STATS.GATHER_DATABASE_STATS;
/*
Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:03:46.702 <<<<<<<<<<<<<<<<<<<<<------------------- 03:46
*/
  
              d) Para coletar estatisticas de sistema (DD): 

EXEC DBMS_STATS.GATHER_DICTIONARY_STATS;

Para coletar estatisticas de objetos:

        A partir do Oracle Database 10G, as estatisticas sao coletadas automaticamente 
        pelo Oracle, diariamente de 2ª a 6ª, em um horario compreendido geralmente 
        entre 22h e 2h, e aos sabados comeca as 6h e termina somente no Domingo, as 2h. 
        
        Eh importante lembrar que ela so ocorre se o banco de dados estiver ocioso e 
        somente nos objetos que tiveram mais que 10% de atualizacoes 
        (inclui INSERT, UPDATE e DELETE). A partir do 11G, este valor de 10% e 
        configuravel.

        Pelo motivo dela ocorrer automaticamente, colete estatisticas somente quando 
        voce identificar alguma necessidade extra, como por exemplo, apos uma carga 
        de dados ou em banco de dados que trabalham 24X7 e que nunca ficam ociosos. 
        Nestes casos, recomendo criar uma stored procedure contendo o codigo para 
        coletar estatisticas de objetos do banco e criar em seguida um job para 
        executar esta procedure periodicamente;

        Se o seu BD usa o CBO, evite coletar estatisticas atraves do comando 
        ANALYZE TABLE e atraves da package DBMS_UTILITY. Se voce fizer isso, 
        suas estatisticas serao menos precisas e voce nao tera historicos;


============================================================          
============================================================          
============================================================          
============================================================
Estatisticas - Scripts
============================================================

--Analisa apenas uma tabela - executar como usuario normal
ANALYZE TABLE TALUNO COMPUTE STATISTICS;


--Estatistica de schema
SYSTEM EXEC DBMS_UTILITY.ANALYZE_SCHEMA('CURSO','COMPUTE');


--Estatistica de banco inteiro (Pode ser demorado) - 
SYSTEM EXEC DBMS_STATS.GATHER_DATABASE_STATS;


--Bloco anonimo para ler estatisticas do banco de dados - SYSTEM 

DECLARE
    libcac NUMBER(10, 2);
    rowcac NUMBER(10, 2);
    bufcac NUMBER(10, 2);
    redlog NUMBER(10, 2);
    spsize NUMBER;
    blkbuf NUMBER;
    logbuf NUMBER;
---    
BEGIN
    SELECT VALUE
        INTO redlog
        FROM v$sysstat
        WHERE name = 'redo log space requests';

    SELECT 100 * (SUM(pins) - SUM(reloads)) / SUM(pins)
        INTO libcac
        FROM v$librarycache;
        
    SELECT 100 * (SUM(gets) - SUM(getmisses)) / SUM(gets)
        INTO rowcac
        FROM v$rowcache;

    SELECT 100 * (cur.VALUE + con.VALUE - phys.VALUE) /(cur.VALUE + con.VALUE)
        INTO bufcac
        FROM v$sysstat cur, v$sysstat con, v$sysstat phys, 
        v$statname ncu, v$statname nco, v$statname nph
        WHERE cur.statistic# = ncu.statistic#
        AND ncu.name = 'db block gets'
        AND con.statistic# = nco.statistic#
        AND nco.name = 'consistent gets'
        AND phys.statistic# = nph.statistic#
        AND nph.name = 'physical reads';

     SELECT VALUE INTO spsize
        FROM v$parameter
        WHERE name = 'shared_pool_size';

    SELECT VALUE INTO blkbuf
        FROM v$parameter
        WHERE name = 'db_block_buffers';

     SELECT VALUE INTO logbuf
        FROM v$parameter
        WHERE name = 'log_buffer';


        DBMS_OUTPUT.put_line('> SGA CACHE STATISTICS');
        DBMS_OUTPUT.put_line('> ********************');
        DBMS_OUTPUT.put_line('> SQL Cache Hit rate = ' || libcac);
        DBMS_OUTPUT.put_line('> Dict Cache Hit rate = ' || rowcac);
        DBMS_OUTPUT.put_line('> Buffer Cache Hit rate = ' || bufcac);
        DBMS_OUTPUT.put_line('> Redo Log space requests = ' || redlog);
        DBMS_OUTPUT.put_line('> ');
        DBMS_OUTPUT.put_line('> INIT.ORA SETTING');
        DBMS_OUTPUT.put_line('> ****************');
        DBMS_OUTPUT.put_line('> Shared Pool Size = ' || spsize || ' Bytes');
        DBMS_OUTPUT.put_line('> DB Block Buffer = ' || blkbuf || ' Blocks');
        DBMS_OUTPUT.put_line('> Log Buffer = ' || logbuf || ' Bytes');
        DBMS_OUTPUT.put_line('> ');

        IF libcac < 99 THEN
            DBMS_OUTPUT.put_line('*** HINT: Library Cache muito baixo! Aumente Shared Pool Size.');
        END IF;

        IF rowcac < 85 THEN
            DBMS_OUTPUT.put_line('*** HINT: Row Cache muito baixo! Aumente Shared Pool Size.');
        END IF;

        IF bufcac < 90 THEN
            DBMS_OUTPUT.put_line('*** HINT: Buffer Cache muito baixo! Aumente DB Block Buffer value.');
        END IF;

        IF redlog > 100 THEN
            DBMS_OUTPUT.put_line('*** HINT: Valor de Log Buffer e muito baixo!');
        END IF;
---
END;

/*
> SGA CACHE STATISTICS
> ********************
> SQL Cache Hit rate = 99,43
> Dict Cache Hit rate = 95,78
> Buffer Cache Hit rate = 98,08
> Redo Log space requests = 1
> 
> INIT.ORA SETTING
> ****************
> Shared Pool Size = 0 Bytes
> DB Block Buffer = 0 Blocks
> Log Buffer = 5246976 Bytes
> 


Procedimento PL/SQL concluído com sucesso.

Decorrido: 00:00:00.169
*/


