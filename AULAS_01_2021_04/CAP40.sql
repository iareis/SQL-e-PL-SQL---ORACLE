=============================
===   Hints de Pesquisa   ===
===   CONHECENDO HINTS    ===
=============================

Otimizador do Oracle e incrivelmente preciso na escolha do caminho de otimizacao 
correto e no uso de indices para milhares de registros no seu sistema, porem exise 
casos que e preciso mudar.  O ORACLE possui hints ou sugestoes que você podera usar 
para determinadas consultas, de modo que o otimizador seja desconsiderado, na 
esperanca de conseguir melhor desempenho para determinada consulta. 

Os hints modificam o caminho de execucao quando um otimizador processa uma instrucao 
especifica. O parametro OPTIMIZER_MODE de init.ora pode ser usado para modificar 
todas as instrucoes no banco de dados para que sigam um caminho de execucao 
especifico, mas um hint para um caminho de execucao diferente substitui qualquer 
coisa que esteja especificada no init.ora. Contudo, a otimizacao baseada em custo 
nao sera usada se as tabelas nao tiverem sido analisadas.

Os hints podem ser muito uteis se soubermos quando e qual usar, mas eles podem ser 
maleficos se nao forem utilizados na situacao correta ou sem muito conhecimento de 
suas acoes e consequências! Nas ultimas versoes do SGBD Oracle, um hint obsoleto pode 
gerar um plano de execucao ruim, e consequentemente, impactar negativamente na 
performance da instrucao SQL.

Veremos varios hints, como por exemplo: APPEND,PARALLEL e FIRST_ROWS, que sao muito 
bons quando sao utilizados nas situacoes adequadas! O hint APPEND, por exemplo, 
deve ser utilizado para otimizar cargas de dados via comando INSERT 
(atraves de carga direta) somente quando você tiver certeza de que outros usuarios 
nao estarao atualizando dados concorrentemente na tabela! Ja o hint PARALLEL, so deve 
ser utilizado em consultas longas e quando houver recursos de processamento, 
memoria e I/O disponiveis, ou seja, quando estes recursos, nao estiverem 
sobrecarregados!

=========================================================
=========================================================
=========================================================
=========================================================

--Conectado como system
--Visao dos hints
select * from v$sql_hint;

/*
NAME                        SQL_FEATURE            CLASS                       INVERSE                   TARGET_LEVEL   PROPERTY   VERSION    VERSION_OUTLINE   
APPEND                       QKSFM_CBO               APPEND                       NOAPPEND                                 1           0 8.1.0                          
NOAPPEND                     QKSFM_CBO               APPEND                       APPEND                                   1           0 8.1.0                          
NO_MONITORING                QKSFM_ALL               NO_MONITORING                                                         1           0 8.0.0                          
NO_SQL_TUNE                  QKSFM_ALL               NO_SQL_TUNE                                                           1           0 10.2.0.1                       
DEREF_NO_REWRITE             QKSFM_ALL               DEREF_NO_REWRITE                                                      1           0 8.1.0                          
NESTED_TABLE_GET_REFS        QKSFM_ALL               NESTED_TABLE_GET_REFS                                                 1           0 8.1.0                          
PRESERVE_OID                 QKSFM_ALL               PRESERVE_OID                                                          1           0 10.2.0.1                       
NESTED_TABLE_SET_SETID       QKSFM_ALL               NESTED_TABLE_SET_SETID                                                1           0 8.1.5                          
NESTED_TABLE_FAST_INSERT     QKSFM_ALL               NESTED_TABLE_FAST_INSERT                                              1           0 10.1.0.3                       
INLINE_XMLTYPE_NT            QKSFM_ALL               INLINE_XMLTYPE_NT                                                     1           0 10.2.0.1                       
REF_CASCADE_CURSOR           QKSFM_CBO               REF_CASCADE_CURSOR           NO_REF_CASCADE                           1           0 9.2.0                          
NO_REF_CASCADE               QKSFM_CBO               REF_CASCADE_CURSOR           REF_CASCADE_CURSOR                       1           0 9.2.0                          
FORCE_XML_QUERY_REWRITE      QKSFM_XML_REWRITE       FORCE_XML_QUERY_REWRITE      NO_XML_QUERY_REWRITE                     1           0 9.2.0       11.1.0.6           
NO_XML_QUERY_REWRITE         QKSFM_XML_REWRITE       FORCE_XML_QUERY_REWRITE      FORCE_XML_QUERY_REWRITE                  1           0 9.2.0       11.1.0.6           
IGNORE_WHERE_CLAUSE          QKSFM_ALL               IGNORE_WHERE_CLAUSE                                                   1           0 9.2.0                          
OPAQUE_TRANSFORM             QKSFM_TRANSFORMATION    OPAQUE_TRANSFORM                                                      1           0 10.1.0.3                       
OPAQUE_XCANONICAL            QKSFM_TRANSFORMATION    OPAQUE_XCANONICAL                                                     1           0 10.1.0.3                       
SYS_DL_CURSOR                QKSFM_CBO               SYS_DL_CURSOR                                                         1           0 9.2.0                          
SQLLDR                       QKSFM_CBO               SQLLDR                                                                1           0 9.0.0                          
DML_UPDATE                   QKSFM_CBO               DML_UPDATE                                                            1           0 9.0.0                          
VECTOR_READ                  QKSFM_CBO               VECTOR_READ                                                           1           0 10.1.0.3                       
VECTOR_READ_TRACE            QKSFM_CBO               VECTOR_READ_TRACE                                                     1           0 10.1.0.3                       
EXPR_CORR_CHECK              QKSFM_CBO               EXPR_CORR_CHECK                                                       1           0 8.0.0                          
STREAMS                      QKSFM_CBO               STREAMS                                                               1           0 10.1.0.3                       
MERGE_CONST_ON               QKSFM_CBO               MERGE_CONST_ON                                                        1           0 8.0.0                          
USE_WEAK_NAME_RESL           QKSFM_ALL               USE_WEAK_NAME_RESL                                                    1           0 10.1.0.3                       
NO_QUERY_TRANSFORMATION      QKSFM_TRANSFORMATION    NO_QUERY_TRANSFORMATION                                               1          16 10.1.0.3                       
OPTIMIZER_FEATURES_ENABLE    QKSFM_ALL               OPTIMIZER_FEATURES_ENABLE                                             1         272 10.1.0.3    10.2.0.1           
DB_VERSION                   QKSFM_ALL               DB_VERSION                                                            1         272 11.1.0.6    11.1.0.6           
FBTSCAN                      QKSFM_CBO               FBTSCAN                                                               1           0 10.1.0.3                       
GATHER_PLAN_STATISTICS         QKSFM_GATHER_PLAN_STATISTICS    GATHER_PLAN_STATISTICS                                                 1           0 10.1.0.3                       
IGNORE_OPTIM_EMBEDDED_HINTS    QKSFM_ALL                       IGNORE_OPTIM_EMBEDDED_HINTS                                            1           0 10.1.0.3    10.2.0.1           
TABLE_STATS                    QKSFM_STATS                     TABLE_STATS                                                            1         272 10.1.0.3                       
INDEX_STATS                    QKSFM_STATS                     TABLE_STATS                                                            1         272 10.1.0.3                       
COLUMN_STATS                   QKSFM_STATS                     TABLE_STATS                                                            1         272 10.1.0.3                       
RULE                           QKSFM_RBO                       MODE                                                                   1          16 8.1.0       8.1.5              
CHOOSE                         QKSFM_CHOOSE                    MODE                                                                   1          16 8.1.0                          
FIRST_ROWS                     QKSFM_FIRST_ROWS                MODE                                                                   1          16 8.1.0       10.2.0.1           
ALL_ROWS                       QKSFM_ALL_ROWS                  MODE                                                                   1          16 8.1.0       10.2.0.1           
ORDERED                        QKSFM_CBO                       ORDERED                                                                2          16 8.1.0       8.1.7              
ORDERED_PREDICATES             QKSFM_CBO                       ORDERED_PREDICATES                                                     2          16 8.0.0                          
DOMAIN_INDEX_SORT              QKSFM_CBO                       DOMAIN_INDEX_SORT              DOMAIN_INDEX_NO_SORT                    2           0 8.1.5       10.2.0.1           
DOMAIN_INDEX_NO_SORT           QKSFM_CBO                       DOMAIN_INDEX_SORT              DOMAIN_INDEX_SORT                       2           0 8.1.5       10.2.0.1           
SKIP_EXT_OPTIMIZER             QKSFM_CBO                       SKIP_EXT_OPTIMIZER                                                     2          16 9.0.0                          
CPU_COSTING                    QKSFM_CPU_COSTING               CPU_COSTING                    NO_CPU_COSTING                          2          16 9.0.0                          
NO_CPU_COSTING                 QKSFM_CPU_COSTING               CPU_COSTING                    CPU_COSTING                             2          16 9.0.0                          
OLD_PUSH_PRED                  QKSFM_OLD_PUSH_PRED             OLD_PUSH_PRED                                                          6          16 10.2.0.1    10.2.0.1           
PUSH_PRED                      QKSFM_FILTER_PUSH_PRED          PUSH_PRED                      NO_PUSH_PRED                            6          16 8.1.0       8.1.5              
NO_PUSH_PRED                   QKSFM_FILTER_PUSH_PRED          PUSH_PRED                      PUSH_PRED                               6          16 8.1.0       8.1.5              
PULL_PRED                      QKSFM_PULL_PRED                 PULL_PRED                      NO_PULL_PRED                            4          16 10.2.0.1    10.2.0.1           
NO_PULL_PRED                   QKSFM_PULL_PRED                 PULL_PRED                      PULL_PRED                               4          16 10.2.0.1    10.2.0.1           
ELIMINATE_OBY                  QKSFM_OBYE                      ELIMINATE_OBY                  NO_ELIMINATE_OBY                        2          16 10.2.0.1    10.2.0.1           
NO_ELIMINATE_OBY               QKSFM_OBYE                      ELIMINATE_OBY                  ELIMINATE_OBY                           2          16 10.2.0.1    10.2.0.1           
ELIMINATE_JOIN                 QKSFM_TABLE_ELIM                ELIMINATE_JOIN                 NO_ELIMINATE_JOIN                       4          16 10.2.0.1    10.2.0.1           
NO_ELIMINATE_JOIN              QKSFM_TABLE_ELIM                ELIMINATE_JOIN                 ELIMINATE_JOIN                          4          16 10.2.0.1    10.2.0.1           
OUTER_JOIN_TO_INNER            QKSFM_OUTER_JOIN_TO_INNER       OUTER_JOIN_TO_INNER            NO_OUTER_JOIN_TO_INNER                  2          16 11.1.0.6    11.1.0.6           
NO_OUTER_JOIN_TO_INNER         QKSFM_OUTER_JOIN_TO_INNER       OUTER_JOIN_TO_INNER            OUTER_JOIN_TO_INNER                     2          16 11.1.0.6    11.1.0.6           
PUSH_SUBQ                      QKSFM_TRANSFORMATION            PUSH_SUBQ                      NO_PUSH_SUBQ                            2          16 8.1.0       10.2.0.5           
NO_PUSH_SUBQ                   QKSFM_TRANSFORMATION            PUSH_SUBQ                      PUSH_SUBQ                               2          16 9.2.0       10.2.0.5           
GBY_PUSHDOWN                   QKSFM_ALL                       GBY_PUSHDOWN                   NO_GBY_PUSHDOWN                         2          16 10.2.0.5    10.2.0.5           
NO_GBY_PUSHDOWN                 QKSFM_ALL               GBY_PUSHDOWN           GBY_PUSHDOWN                            2          16 10.2.0.5    10.2.0.5           
USE_CONCAT                      QKSFM_USE_CONCAT        USE_CONCAT             NO_EXPAND                               2          16 8.1.0       8.1.7              
NO_EXPAND                       QKSFM_USE_CONCAT        USE_CONCAT             USE_CONCAT                              2          16 8.1.0       8.1.7              
SEMIJOIN_DRIVER                 QKSFM_CBO               SEMIJOIN_DRIVER                                                2          16 8.1.0       8.1.7              
ANTIJOIN                        QKSFM_TRANSFORMATION    ANTIJOIN                                                       2          16 9.0.0                          
MERGE_AJ                        QKSFM_CBO               ANTIJOIN                                                       2          16 8.1.0       8.1.7              
HASH_AJ                         QKSFM_CBO               ANTIJOIN                                                       2          16 8.1.0       8.1.7              
NL_AJ                           QKSFM_CBO               ANTIJOIN                                                       2          16 8.0.0                          
SEMIJOIN                        QKSFM_TRANSFORMATION    SEMIJOIN               NO_SEMIJOIN                             2          16 9.0.0                          
NO_SEMIJOIN                     QKSFM_TRANSFORMATION    SEMIJOIN               SEMIJOIN                                2          16 9.0.0                          
MERGE_SJ                        QKSFM_CBO               SEMIJOIN                                                       2          16 8.1.0       8.1.7              
HASH_SJ                         QKSFM_CBO               SEMIJOIN                                                       2          16 8.1.0       8.1.7              
NL_SJ                           QKSFM_CBO               SEMIJOIN                                                       2          16 8.0.0                          
STAR                            QKSFM_STAR_TRANS        STAR                                                           2          16 8.1.0                          
REMOTE_MAPPED                   QKSFM_ALL               REMOTE_MAPPED                                                  2         272 8.1.0                          
STAR_TRANSFORMATION             QKSFM_STAR_TRANS        STAR_TRANSFORMATION    NO_STAR_TRANSFORMATION                  6          16 8.1.0       8.1.7              
NO_STAR_TRANSFORMATION          QKSFM_STAR_TRANS        STAR_TRANSFORMATION    STAR_TRANSFORMATION                     6          16 10.1.0.3    10.1.0.3           
REWRITE                         QKSFM_TRANSFORMATION    REWRITE                NO_REWRITE                              2          16 8.1.5       8.1.7              
NO_REWRITE                      QKSFM_TRANSFORMATION    REWRITE                REWRITE                                 2          16 8.1.5       8.1.7              
NO_MULTIMV_REWRITE              QKSFM_ALL               REWRITE                REWRITE                                 2          16 10.1.0.3    10.1.0.3           
NO_BASETABLE_MULTIMV_REWRITE    QKSFM_ALL               REWRITE                REWRITE                                 2          16 10.1.0.3    10.1.0.3           
REWRITE_OR_ERROR                QKSFM_TRANSFORMATION    REWRITE                                                        2           0 10.1.0.3                       
BYPASS_UJVC                     QKSFM_CBO               BYPASS_UJVC                                                    2           0 8.1.5                          
UNNEST                          QKSFM_UNNEST            UNNEST                 NO_UNNEST                               2          16 8.1.6       10.1.0             
NO_UNNEST                       QKSFM_UNNEST            UNNEST                 UNNEST                                  2          16 8.1.6       10.1.0             
LOCAL_INDEXES                   QKSFM_CBO               LOCAL_INDEXES                                                  2           0 9.0.0                          
HWM_BROKERED                    QKSFM_CBO               HWM_BROKERED                                                   2           0 9.0.0                          
OVERFLOW_NOMOVE                 QKSFM_CBO               OVERFLOW_NOMOVE                                                2           0 9.0.0                          
SYS_PARALLEL_TXN                QKSFM_CBO               SYS_PARALLEL_TXN                                               2           0 8.1.6                          
SYS_RID_ORDER                   QKSFM_ALL               SYS_RID_ORDER                                                  2           0 9.2.0                          
BYPASS_RECURSIVE_CHECK      QKSFM_ALL               BYPASS_RECURSIVE_CHECK                                              2           0 9.0.0                          
MATERIALIZE                 QKSFM_TRANSFORMATION    INLINE                    INLINE                                    2           0 9.0.0                          
INLINE                      QKSFM_TRANSFORMATION    INLINE                    MATERIALIZE                               2           0 9.0.0                          
CONNECT_BY_COST_BASED       QKSFM_TRANSFORMATION    CONNECT_BY_COST_BASED     NO_CONNECT_BY_COST_BASED                  2          16 10.2.0.2    10.2.0.2           
NO_CONNECT_BY_COST_BASED    QKSFM_TRANSFORMATION    CONNECT_BY_COST_BASED     CONNECT_BY_COST_BASED                     2          16 10.2.0.2    10.2.0.2           
CONNECT_BY_FILTERING        QKSFM_ALL               CONNECT_BY_FILTERING      NO_CONNECT_BY_FILTERING                   2          16 10.2.0.2    10.2.0.2           
NO_CONNECT_BY_FILTERING     QKSFM_ALL               CONNECT_BY_FILTERING      CONNECT_BY_FILTERING                      2          16 10.2.0.2    10.2.0.2           
SET_TO_JOIN                 QKSFM_SET_TO_JOIN       SET_TO_JOIN               NO_SET_TO_JOIN                            2          16 10.1.0.3    10.1.0.3           
NO_SET_TO_JOIN              QKSFM_SET_TO_JOIN       SET_TO_JOIN               SET_TO_JOIN                               2          16 10.1.0.3    10.1.0.3           
PIV_SSF                     QKSFM_ALL               PIV_SSF                                                             2           0 8.1.0                          
TIV_SSF                     QKSFM_ALL               PIV_SSF                                                             2           0 8.1.0                          
PIV_GB                      QKSFM_ALL               PIV_GB                                                              2           0 8.1.0                          
TIV_GB                      QKSFM_ALL               PIV_GB                                                              2           0 8.1.0                          
CUBE_GB                     QKSFM_CBO               CUBE_GB                                                             2           0 8.1.5                          
SAVE_AS_INTERVALS           QKSFM_CBO               SAVE_AS_INTERVALS                                                   2           0 8.1.5                          
RESTORE_AS_INTERVALS        QKSFM_CBO               RESTORE_AS_INTERVALS                                                2           0 8.1.5                          
BITMAP                      QKSFM_CBO               BITMAP                                                              2         256 8.1.0       8.1.5              
SCN_ASCENDING               QKSFM_ALL               SCN_ASCENDING                                                       1           0 8.1.5                          
NO_QKN_BUFF                 QKSFM_CBO               NO_QKN_BUFF                                                         2           0 9.2.0                          
BUFFER                      QKSFM_CBO               BUFFER                    NO_BUFFER                                 2           0 8.1.5                          
NO_BUFFER                   QKSFM_CBO               BUFFER                    BUFFER                                    2           0 8.1.5                          
CURSOR_SHARING_EXACT        QKSFM_CBO               CURSOR_SHARING_EXACT                                                2           0 9.0.0                          
MV_MERGE                    QKSFM_TRANSFORMATION    MV_MERGE                                                            2           0 9.0.0                          
EXPAND_GSET_TO_UNION        QKSFM_TRANSFORMATION    EXPAND_GSET_TO_UNION      NO_EXPAND_GSET_TO_UNION                   2           0 9.2.0       10.1.0             
NO_EXPAND_GSET_TO_UNION     QKSFM_TRANSFORMATION    EXPAND_GSET_TO_UNION      EXPAND_GSET_TO_UNION                      2           0 9.2.0       10.1.0             
MODEL_MIN_ANALYSIS          QKSFM_TRANSFORMATION    MODEL_MIN_ANALYSIS                                                  2           0 10.1.0.3                       
MODEL_NO_ANALYSIS           QKSFM_ALL               MODEL_MIN_ANALYSIS                                                  2           0 10.1.0.3                       
MODEL_DYNAMIC_SUBQUERY      QKSFM_TRANSFORMATION    MODEL_DYNAMIC_SUBQUERY                                              2           0 10.2.0.1                       
MODEL_COMPILE_SUBQUERY      QKSFM_TRANSFORMATION    MODEL_COMPILE_SUBQUERY                                              2           0 10.2.0.1                       
MODEL_PUSH_REF              QKSFM_TRANSFORMATION    MODEL_PUSH_REF            NO_MODEL_PUSH_REF                         2           0 10.1.0.3                       
NO_MODEL_PUSH_REF              QKSFM_ALL                    MODEL_PUSH_REF                 MODEL_PUSH_REF                           2           0 10.1.0.3                       
MODEL_DONTVERIFY_UNIQUENESS    QKSFM_TRANSFORMATION         MODEL_DONTVERIFY_UNIQUENESS                                             2           0 10.1.0.3                       
NO_PRUNE_GSETS                 QKSFM_TRANSFORMATION         NO_PRUNE_GSETS                                                          2           0 9.0.0                          
USE_TTT_FOR_GSETS              QKSFM_TRANSFORMATION         USE_TTT_FOR_GSETS                                                       2           0 9.0.0                          
USE_HASH_AGGREGATION           QKSFM_ALL                    USE_HASH_AGGREGATION           NO_USE_HASH_AGGREGATION                  2           0 10.2.0.1    10.2.0.5           
NO_USE_HASH_AGGREGATION        QKSFM_ALL                    USE_HASH_AGGREGATION           USE_HASH_AGGREGATION                     2           0 10.2.0.1    10.2.0.5           
GBY_CONC_ROLLUP                QKSFM_TRANSFORMATION         GBY_CONC_ROLLUP                                                         2           0 9.0.0                          
NO_STATS_GSETS                 QKSFM_ALL                    NO_STATS_GSETS                                                          2           0 8.0.0                          
NO_ORDER_ROLLUPS               QKSFM_TRANSFORMATION         NO_ORDER_ROLLUPS                                                        2           0 8.0.0                          
QB_NAME                        QKSFM_ALL                    QB_NAME                                                                 2         256 10.1.0.3                       
DYNAMIC_SAMPLING               QKSFM_DYNAMIC_SAMPLING       DYNAMIC_SAMPLING                                                        6         272 9.2.0                          
CARDINALITY                    QKSFM_STATS                  CARDINALITY                                                            14         272 9.0.0                          
LEADING                        QKSFM_JOIN_ORDER             LEADING                                                                 8         272 8.1.6       10.1.0.3           
MERGE                          QKSFM_CVM                    MERGE                          NO_MERGE                                 6          16 8.1.0       10.1.0             
NO_MERGE                       QKSFM_CVM                    MERGE                          MERGE                                    6          16 8.0.0       10.1.0             
FULL                           QKSFM_FULL                   ACCESS                                                                  4         272 8.1.0       8.1.7              
SHARED                         QKSFM_PARALLEL               SHARED                         NO_PARALLEL                              5         256 8.1.0                          
NOPARALLEL                     QKSFM_PARALLEL               SHARED                         SHARED                                   5         256 8.1.0                          
NO_PARALLEL                    QKSFM_CBO                    SHARED                         SHARED                                   5         256 10.1.0.3                       
CACHE_CB                       QKSFM_CBO                    CACHE_CB                       NOCACHE                                  4         256 8.1.5                          
CACHE                          QKSFM_EXECUTION              CACHE                          NOCACHE                                  4         256 8.1.0                          
NOCACHE                        QKSFM_EXECUTION              CACHE                          CACHE                                    4         256 8.1.0                          
CACHE_TEMP_TABLE               QKSFM_ALL                    CACHE                          NOCACHE                                  4         256 8.1.5                          
DRIVING_SITE                   QKSFM_ALL                    DRIVING_SITE                                                            4         256 8.1.0       8.1.7              
QUEUE_CURR                     QKSFM_CBO                    ACCESS                                                                  4         256 8.0.0                          
QUEUE_ROWP                     QKSFM_CBO                    ACCESS                                                                  4         256 8.0.0                          
USE_MERGE_CARTESIAN            QKSFM_USE_MERGE_CARTESIAN    JOIN                                                                    4         336 11.1.0.6    11.1.0.6           
USE_MERGE                      QKSFM_USE_MERGE              JOIN                           NO_USE_MERGE                             4         336 8.1.0       8.1.7              
NO_USE_MERGE                   QKSFM_USE_MERGE              NO_USE_MERGE                   USE_MERGE                                4         336 10.1.0.3    10.1.0.3           
USE_HASH                       QKSFM_USE_HASH               JOIN                           NO_USE_HASH                              4         464 8.1.0       8.1.7              
NO_USE_HASH            QKSFM_USE_HASH             NO_USE_HASH          USE_HASH                             4         336 10.1.0.3    10.1.0.3           
USE_NL                 QKSFM_USE_NL               JOIN                 NO_USE_NL                            4         336 8.1.0       8.1.7              
USE_NL_WITH_INDEX      QKSFM_USE_NL_WITH_INDEX    USE_NL_WITH_INDEX    NO_USE_NL                            4         304 10.1.0.3                       
NO_USE_NL              QKSFM_USE_NL               NO_USE_NL            USE_NL                               4         336 10.1.0.3    10.1.0.3           
USE_ANTI               QKSFM_CBO                  USE_ANTI                                                  4         272 8.1.0                          
USE_SEMI               QKSFM_CBO                  USE_SEMI                                                  4         272 8.1.0                          
PQ_DISTRIBUTE          QKSFM_PQ_DISTRIBUTE        PQ_DISTRIBUTE                                             4         272 8.1.5       8.1.7              
SUBQUERY_PRUNING       QKSFM_CBO                  SUBQUERY_PRUNING     NO_SUBQUERY_PRUNING                  4         272 11.1.0.6    11.1.0.6           
NO_SUBQUERY_PRUNING    QKSFM_CBO                  SUBQUERY_PRUNING     SUBQUERY_PRUNING                     4         272 11.1.0.6    11.1.0.6           
LIKE_EXPAND            QKSFM_TRANSFORMATION       LIKE_EXPAND                                               4         272 8.1.7                          
OR_EXPAND              QKSFM_OR_EXPAND            OR_EXPAND                                                 4         272 8.1.7                          
PQ_MAP                 QKSFM_PQ_MAP               PQ_MAP               PQ_NOMAP                             4         272 9.0.0       10.2.0.1           
PQ_NOMAP               QKSFM_PQ_MAP               PQ_MAP               PQ_MAP                               4         272 9.0.0       10.2.0.1           
AND_EQUAL              QKSFM_AND_EQUAL            ACCESS                                                    4         304 8.1.0       8.1.7              
INDEX_ASC              QKSFM_INDEX_ASC            ACCESS               NO_INDEX                             4         304 8.1.0                          
INDEX                  QKSFM_INDEX                ACCESS               NO_INDEX                             4         304 8.0.0       8.1.7              
INDEX_DESC             QKSFM_INDEX_DESC           ACCESS               NO_INDEX                             4         304 8.1.0       8.1.7              
NO_INDEX               QKSFM_INDEX                NO_INDEX             INDEX                                4         304 8.1.5       8.1.7              
INDEX_FFS              QKSFM_INDEX_FFS            ACCESS                                                    4         304 8.1.0       8.1.7              
NO_INDEX_FFS           QKSFM_INDEX_FFS            NO_INDEX_FFS         INDEX_FFS                            4         304 10.1.0.3    10.1.0.3           
INDEX_SS               QKSFM_INDEX_SS             ACCESS               NO_INDEX_SS                          4         304 9.0.0       10.2.0.1           
INDEX_SS_ASC           QKSFM_INDEX_SS_ASC         ACCESS               NO_INDEX_SS                          4         304 9.0.0                          
INDEX_SS_DESC          QKSFM_INDEX_SS_DESC        ACCESS               NO_INDEX_SS                          4         304 9.0.0       10.2.0.1           
NO_INDEX_SS            QKSFM_INDEX_SS             NO_INDEX_SS          INDEX_SS                             4         304 10.1.0.3    10.1.0.3           
INDEX_COMBINE          QKSFM_INDEX_COMBINE        ACCESS                                                    4         432 8.1.0       8.1.7              
BITMAP_TREE            QKSFM_BITMAP_TREE          ACCESS                                                    4         304 10.2.0.1    10.2.0.1           
INDEX_JOIN             QKSFM_INDEX_JOIN           ACCESS                                                    4         304 8.1.5       10.1.0.3           
INDEX_RRS              QKSFM_CBO                  ACCESS                                                    4         304 9.0.0                          
HASH                   QKSFM_ALL                  ACCESS                                                    4         272 8.1.0       8.1.7              
PARALLEL_INDEX         QKSFM_PQ                   PARALLEL_INDEX       NO_PARALLEL_INDEX                    4         288 8.1.0                          
NO_PARALLEL_INDEX           QKSFM_PQ                          PARALLEL_INDEX              PARALLEL_INDEX                          4         288 8.1.0                          
SWAP_JOIN_INPUTS            QKSFM_CBO                         SWAP_JOIN_INPUTS            NO_SWAP_JOIN_INPUTS                     4         272 8.1.0       8.1.7              
NO_SWAP_JOIN_INPUTS         QKSFM_CBO                         SWAP_JOIN_INPUTS            SWAP_JOIN_INPUTS                        4         272 10.1.0.3    10.1.0.3           
FACT                        QKSFM_STAR_TRANS                  FACT                        NO_FACT                                 4         272 8.1.0       8.1.7              
NO_FACT                     QKSFM_STAR_TRANS                  FACT                        FACT                                    4         272 8.1.0       8.1.7              
NO_ACCESS                   QKSFM_ALL                         NO_ACCESS                                                           4         256 8.1.5       8.1.7              
DYNAMIC_SAMPLING_EST_CDN    QKSFM_DYNAMIC_SAMPLING_EST_CDN    DYNAMIC_SAMPLING_EST_CDN                                            4         272 9.2.0                          
CLUSTER                     QKSFM_CBO                         ACCESS                                                              4         272 8.0.0       8.1.7              
ROWID                       QKSFM_CBO                         ACCESS                                                              4         272 8.0.0       8.1.7              
OPT_ESTIMATE                QKSFM_OPT_ESTIMATE                OPT_ESTIMATE                                                       14         272 10.1.0.3                       
X_DYN_PRUNE                 QKSFM_CBO                         X_DYN_PRUNE                                                         2           0 10.1.0.3                       
RESTRICT_ALL_REF_CONS       QKSFM_ALL                         RESTRICT_ALL_REF_CONS                                               1           0 10.1.0.3                       
SKIP_UNQ_UNUSABLE_IDX       QKSFM_CBO                         SKIP_UNQ_UNUSABLE_IDX                                               1           0 10.1.0.3                       
TRACING                     QKSFM_EXECUTION                   TRACING                                                             1           0 10.1.0.3                       
NO_PARTIAL_COMMIT           QKSFM_CBO                         NO_PARTIAL_COMMIT                                                   1           0 10.1.0.3                       
INCLUDE_VERSION             QKSFM_ALL                         INCLUDE_VERSION                                                     1           0 10.1.0.3                       
NO_CARTESIAN                QKSFM_ALL                         NO_CARTESIAN                                                        4         336 10.2.0.1                       
PX_JOIN_FILTER              QKSFM_PX_JOIN_FILTER              PX_JOIN_FILTER              NO_PX_JOIN_FILTER                       4         336 10.2.0.1    11.1.0.6           
NO_PX_JOIN_FILTER           QKSFM_PX_JOIN_FILTER              PX_JOIN_FILTER              PX_JOIN_FILTER                          4         336 10.2.0.1    11.1.0.6           
PRECOMPUTE_SUBQUERY         QKSFM_TRANSFORMATION              PRECOMPUTE_SUBQUERY                                                 2           0 10.2.0.1                       
RBO_OUTLINE                 QKSFM_RBO                         RBO_OUTLINE                                                         1           0 10.2.0.1    10.2.0.1           
OUTLINE                     QKSFM_ALL                         OUTLINE                                                             2           0 10.2.0.1    10.2.0.1           
OUTLINE_LEAF                QKSFM_ALL                         OUTLINE_LEAF                                                        2           0 10.2.0.1    10.2.0.1           
OPT_PARAM                   QKSFM_ALL                         OPT_PARAM                                                           1         272 10.2.0.1    10.2.0.1           
DBMS_STATS                  QKSFM_DBMS_STATS                  DBMS_STATS                                                          1           0 10.2.0.1                       
DOMAIN_INDEX_FILTER         QKSFM_CBO                         DOMAIN_INDEX_FILTER         NO_DOMAIN_INDEX_FILTER                  4         304 11.1.0.6    11.1.0.6           
NO_DOMAIN_INDEX_FILTER      QKSFM_CBO                         NO_DOMAIN_INDEX_FILTER      DOMAIN_INDEX_FILTER                     4         304 11.1.0.6    11.1.0.6           
RESULT_CACHE                QKSFM_EXECUTION                   RESULT_CACHE                NO_RESULT_CACHE                         2           0 11.1.0.6                       
NO_RESULT_CACHE             QKSFM_EXECUTION                   RESULT_CACHE                RESULT_CACHE                            2           0 11.1.0.6                       
NO_XML_DML_REWRITE          QKSFM_XML_REWRITE                 NO_XML_DML_REWRITE                                                  1           0 10.2.0.1    11.1.0.6           
XML_DML_RWT_STMT                 QKSFM_XML_REWRITE               XML_DML_RWT_STMT                                                             1           0 11.1.0.6    11.1.0.6           
PLACE_GROUP_BY                   QKSFM_PLACE_GROUP_BY            PLACE_GROUP_BY                NO_PLACE_GROUP_BY                              2          16 11.1.0.6    11.1.0.6           
NO_PLACE_GROUP_BY                QKSFM_PLACE_GROUP_BY            PLACE_GROUP_BY                PLACE_GROUP_BY                                 2          16 11.1.0.6    11.1.0.6           
INDEX_RS_ASC                     QKSFM_INDEX_RS_ASC              ACCESS                                                                       4         304 11.1.0.6    11.1.0.6           
INDEX_RS_DESC                    QKSFM_INDEX_RS_DESC             ACCESS                                                                       4         304 11.1.0.6    11.1.0.6           
NO_LOAD                          QKSFM_EXECUTION                 NO_LOAD                                                                      1           0 11.1.0.6                       
NUM_INDEX_KEYS                   QKSFM_CBO                       ACCESS                                                                       4         304 10.2.0.3    10.2.0.3           
CHECK_ACL_REWRITE                QKSFM_CHECK_ACL_REWRITE         CHECK_ACL_REWRITE             NO_CHECK_ACL_REWRITE                           1           0 11.1.0.6                       
NO_CHECK_ACL_REWRITE             QKSFM_CHECK_ACL_REWRITE         NO_CHECK_ACL_REWRITE          CHECK_ACL_REWRITE                              1           0 11.1.0.6                       
CONNECT_BY_COMBINE_SW            QKSFM_ALL                       CONNECT_BY_COMBINE_SW         NO_CONNECT_BY_COMBINE_SW                       2          16 10.2.0.4    10.2.0.4           
NO_CONNECT_BY_COMBINE_SW         QKSFM_ALL                       CONNECT_BY_COMBINE_SW         CONNECT_BY_COMBINE_SW                          2          16 10.2.0.4    10.2.0.4           
XMLINDEX_REWRITE                 QKSFM_XMLINDEX_REWRITE          XMLINDEX_REWRITE              NO_XMLINDEX_REWRITE                            1           0 11.1.0.6    11.1.0.6           
NO_XMLINDEX_REWRITE              QKSFM_XMLINDEX_REWRITE          XMLINDEX_REWRITE              XMLINDEX_REWRITE                               1           0 11.1.0.6    11.1.0.6           
XMLINDEX_REWRITE_IN_SELECT       QKSFM_XMLINDEX_REWRITE          XMLINDEX_REWRITE              NO_XMLINDEX_REWRITE_IN_SELECT                  1           0 11.1.0.6    11.1.0.6           
NO_XMLINDEX_REWRITE_IN_SELECT    QKSFM_XMLINDEX_REWRITE          XMLINDEX_REWRITE              XMLINDEX_REWRITE_IN_SELECT                     1           0 11.1.0.6    11.1.0.6           
NATIVE_FULL_OUTER_JOIN           QKSFM_ALL                       NATIVE_FULL_OUTER_JOIN        NO_NATIVE_FULL_OUTER_JOIN                      2          16 10.2.0.3    10.2.0.3           
NO_NATIVE_FULL_OUTER_JOIN        QKSFM_ALL                       NATIVE_FULL_OUTER_JOIN        NATIVE_FULL_OUTER_JOIN                         2          16 10.2.0.3    10.2.0.3           
COST_XML_QUERY_REWRITE           QKSFM_COST_XML_QUERY_REWRITE    COST_XML_QUERY_REWRITE        NO_COST_XML_QUERY_REWRITE                      1           0 11.1.0.6    11.1.0.6           
NO_COST_XML_QUERY_REWRITE        QKSFM_COST_XML_QUERY_REWRITE    NO_COST_XML_QUERY_REWRITE     COST_XML_QUERY_REWRITE                         1           0 11.1.0.6    11.1.0.6           
NLJ_PREFETCH                     QKSFM_EXECUTION                 ACCESS                        NO_NLJ_PREFETCH                                4         272 11.1.0.6    11.1.0.6           
NO_NLJ_PREFETCH                  QKSFM_EXECUTION                 ACCESS                        NLJ_PREFETCH                                   4         272 11.1.0.6    11.1.0.6           
NLJ_BATCHING                     QKSFM_EXECUTION                 ACCESS                        NO_NLJ_BATCHING                                4         272 11.1.0.6    11.1.0.6           
NO_NLJ_BATCHING                  QKSFM_EXECUTION                 ACCESS                        NLJ_BATCHING                                   4         272 11.1.0.6    11.1.0.6           
MONITOR                          QKSFM_ALL                       MONITOR                       NO_MONITOR                                     1           0 11.1.0.6                       
NO_MONITOR                       QKSFM_ALL                       MONITOR                       MONITOR                                        1           0 11.1.0.6                       
USE_INVISIBLE_INDEXES            QKSFM_INDEX                     USE_INVISIBLE_INDEXES         NO_USE_INVISIBLE_INDEXES                       1           0 11.1.0.6    11.1.0.6           
NO_USE_INVISIBLE_INDEXES         QKSFM_INDEX                     USE_INVISIBLE_INDEXES         USE_INVISIBLE_INDEXES                          1           0 11.1.0.6    11.1.0.6           
BIND_AWARE                       QKSFM_CURSOR_SHARING            BIND_AWARE                    NO_BIND_AWARE                                  1           0 11.1.0.7                       
NO_BIND_AWARE                    QKSFM_CURSOR_SHARING            BIND_AWARE                    BIND_AWARE                                     1           0 11.1.0.7                       
IGNORE_ROW_ON_DUPKEY_INDEX       QKSFM_DML                       IGNORE_ROW_ON_DUPKEY_INDEX                                                   4         288 11.1.0.7                       
CHANGE_DUPKEY_ERROR_INDEX       QKSFM_DML                   CHANGE_DUPKEY_ERROR_INDEX                                                  4         288 11.1.0.7                       
RETRY_ON_ROW_CHANGE             QKSFM_DML                   RETRY_ON_ROW_CHANGE                                                        1           0 11.1.0.7                       
COALESCE_SQ                     QKSFM_COALESCE_SQ           COALESCE_SQ                  NO_COALESCE_SQ                                2          16 11.2.0.1    11.2.0.1           
NO_COALESCE_SQ                  QKSFM_COALESCE_SQ           COALESCE_SQ                  COALESCE_SQ                                   2          16 11.2.0.1    11.2.0.1           
TRANSFORM_DISTINCT_AGG          QKSFM_TRANSFORMATION        TRANSFORM_DISTINCT_AGG       NO_TRANSFORM_DISTINCT_AGG                     2           0 11.2.0.1    11.2.0.1           
NO_TRANSFORM_DISTINCT_AGG       QKSFM_TRANSFORMATION        TRANSFORM_DISTINCT_AGG       TRANSFORM_DISTINCT_AGG                        2           0 11.2.0.1    11.2.0.1           
CONNECT_BY_ELIM_DUPS            QKSFM_ALL                   CONNECT_BY_ELIM_DUPS         NO_CONNECT_BY_ELIM_DUPS                       2          16 11.2.0.1    11.2.0.1           
NO_CONNECT_BY_ELIM_DUPS         QKSFM_ALL                   CONNECT_BY_ELIM_DUPS         CONNECT_BY_ELIM_DUPS                          2          16 11.2.0.1    11.2.0.1           
DST_UPGRADE_INSERT_CONV         QKSFM_ALL                   DST_UPGRADE_INSERT_CONV      NO_DST_UPGRADE_INSERT_CONV                    1           0 11.2.0.1                       
NO_DST_UPGRADE_INSERT_CONV      QKSFM_ALL                   DST_UPGRADE_INSERT_CONV      DST_UPGRADE_INSERT_CONV                       1           0 11.2.0.1    11.2.0.3           
STATEMENT_QUEUING               QKSFM_PARALLEL              STATEMENT_QUEUING            NO_STATEMENT_QUEUING                          1           0 11.2.0.1                       
NO_STATEMENT_QUEUING            QKSFM_PARALLEL              STATEMENT_QUEUING            STATEMENT_QUEUING                             1           0 11.2.0.1                       
CONNECT_BY_CB_WHR_ONLY          QKSFM_TRANSFORMATION        CONNECT_BY_CB_WHR_ONLY       NO_CONNECT_BY_CB_WHR_ONLY                     2          16 10.2.0.5    10.2.0.5           
NO_CONNECT_BY_CB_WHR_ONLY       QKSFM_TRANSFORMATION        CONNECT_BY_CB_WHR_ONLY       CONNECT_BY_CB_WHR_ONLY                        2          16 10.2.0.5    10.2.0.5           
EXPAND_TABLE                    QKSFM_TABLE_EXPANSION       EXPAND_TABLE                 NO_EXPAND_TABLE                               4          16 11.2.0.1    11.2.0.1           
NO_EXPAND_TABLE                 QKSFM_TABLE_EXPANSION       EXPAND_TABLE                 EXPAND_TABLE                                  4          16 11.2.0.1    11.2.0.1           
XMLINDEX_SEL_IDX_TBL            QKSFM_ALL                   XMLINDEX_SEL_IDX_TBL                                                       1           0 11.2.0.1                       
FACTORIZE_JOIN                  QKSFM_JOINFAC               FACTORIZE_JOIN               NO_FACTORIZE_JOIN                             2          16 11.2.0.1    11.2.0.1           
NO_FACTORIZE_JOIN               QKSFM_JOINFAC               FACTORIZE_JOIN               FACTORIZE_JOIN                                2          16 11.2.0.1    11.2.0.1           
APPEND_VALUES                   QKSFM_CBO                   APPEND_VALUES                NOAPPEND                                      1           0 11.2.0.1                       
PLACE_DISTINCT                  QKSFM_DIST_PLCMT            PLACE_DISTINCT               NO_PLACE_DISTINCT                             2          16 11.2.0.1    11.2.0.1           
NO_PLACE_DISTINCT               QKSFM_DIST_PLCMT            PLACE_DISTINCT               PLACE_DISTINCT                                2          16 11.2.0.1    11.2.0.1           
NO_SUBSTRB_PAD                  QKSFM_EXECUTION             NO_SUBSTRB_PAD                                                             1           0 11.2.0.1                       
USE_HASH_GBY_FOR_PUSHDOWN       QKSFM_ALL                   USE_HASH_GBY_FOR_PUSHDOWN    NO_USE_HASH_GBY_FOR_PUSHDOWN                  2           0 11.2.0.2    11.2.0.2           
NO_USE_HASH_GBY_FOR_PUSHDOWN    QKSFM_ALL                   USE_HASH_GBY_FOR_PUSHDOWN    USE_HASH_GBY_FOR_PUSHDOWN                     2           0 11.2.0.2    11.2.0.2           
XDB_FASTPATH_INSERT             QKSFM_ALL                   XDB_FASTPATH_INSERT          NO_XDB_FASTPATH_INSERT                        1           0 11.2.0.2                       
NO_XDB_FASTPATH_INSERT          QKSFM_ALL                   XDB_FASTPATH_INSERT          XDB_FASTPATH_INSERT                           1           0 11.2.0.2                       
TABLE_LOOKUP_BY_NL              QKSFM_TABLE_LOOKUP_BY_NL    TABLE_LOOKUP_BY_NL           NO_TABLE_LOOKUP_BY_NL                         4          16 11.2.0.2    11.2.0.2           
NO_TABLE_LOOKUP_BY_NL           QKSFM_TABLE_LOOKUP_BY_NL    TABLE_LOOKUP_BY_NL           TABLE_LOOKUP_BY_NL                            4          16 11.2.0.2    11.2.0.2           


269 linhas selecionadas. 
*/


--Conectado como system
-- Estes 2 comandos são para permitir o rastreamento automático F6
grant select_catalog_role to iareis;
grant select any dictionary to iareis;
/*
Grant bem-sucedido.

Decorrido: 00:00:00.143

Grant bem-sucedido.

Decorrido: 00:00:00.089
*/

-- first_rows: Para forcar o uso de indice de modo geral.
-- Faz com que o otimizador escolha um caminho que recupera N linhas primeiramente  -- e ja mostra enquanto processa o resto

select * from taluno;


create index ind_aluno_nome on taluno(nome);
/*
Index IND_ALUNO_CIDADE criado.

Decorrido: 00:00:00.181
*/


select /*+ first_rows(2) */ cod_aluno, nome from taluno
-- all_rows: Para forcar varredura completa na tabela.



select /*+ all_rows (10) */ cod_aluno, nome
from taluno;
-- full: Para forcar um scan completo na tabela. 
-- A hint full tambem pode causar resultados inesperados como varredura 
-- na tabela em ordem diferente da ordem padrao.
 
select /*+ full_rows (taluno) */ cod_aluno, nome
from taluno
where nome = 'Maria' ;
-- index: Forca o uso de um indice. -- Nenhum indice e especificado.  -- O Oracle pesa todos os indices possiveis e escolhe um ou mais a serem usados.  -- Otimizador nao fara um scan completo na tabela.

select /*+ index */ cod_aluno, nome
from taluno
where nome = 'MARCIO' ;
---Exemplo do uso da hint index informando os indices que devem ser utilizados:

select /*+ index (taluno ind_aluno_nome) */ cod_aluno, nome, cidade
from taluno
where nome = 'MARCIO' ;
-- no_index: Evitar que um indice especificado seja usado pelo Oracle.

select /*+ no_index (taluno ind_aluno_nome) */ cod_aluno, nome, cidade
from taluno
where nome = 'MARCIO' ;
-- index_join : Permite mesclar indice em uma unica tabela.  -- Permite acessar somente os indices da tabela, e nao apenas um scan  -- com menos bloco no total, e mais rapido do que usar um indice que faz scan na tabela por rowid.

create index ind_aluno_cidade on taluno(cidade)

select /*+ index_join (taluno ind_aluno_nome, ind_aluno_cidade) */ cod_aluno, nome, cidade
from taluno
where nome = 'MARCIO' AND cidade = 'NOVO HAMBURGO';
-- and_equal : Para acessar todos os indices que você especificar.  -- A hint and_equal faz com que o otimizador misture varios indices  -- para uma unica tabela em vez de escolher qual e ao melhor.

select /*+ and_equal (taluno ind_aluno_nome, ind_aluno_cidade) */ cod_aluno, nome, cidade
from taluno
where nome = 'MARCIO' AND cidade = 'NOVO HAMBURGO';
-- index_ffs: Forca um scan completo do indice.  -- Este hint pode oferecer grandes ganhos de desempenho quando a tabela  -- tambem possuir muitas colunas.

select /*+ index_ffs (taluno ind_aluno_nome) */ cod_aluno, nome
from taluno
where nome = 'MARCIO'


























