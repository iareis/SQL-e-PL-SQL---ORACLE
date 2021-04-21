=============================================
===   APERFEICOANDO A CLAUSULA GROUP BY   ===
=============================================


= ROLLUP - CALCULA SUBTOTAIS POR GRUPO

SELECT COD_ALUNO, TRUNC(DATA), SUM(DESCONTO) DESCONTO, SUM(TOTAL) TOTAL
FROM TCONTRATO
GROUP BY ROLLUP(COD_ALUNO, TRUNC(DATA));
/*

 COD_ALUNO TRUNC(DA   DESCONTO      TOTAL
---------- -------- ---------- ----------
         1 07/04/21         10        450
         1                  10        450
         2 05/01/13                  2500
         2 02/04/21                  1600
         2                           4100
         3 07/04/21                  1500
         3                           1500
         5 03/04/21         10       5000
         5 04/04/21          0        445
         5 05/04/21         20        445
         5                  30       5890
         6 12/03/21         22        800
         6                  22        800
         7 17/03/21         17        445
         7 18/03/21         13        500
         7                  30        945
         9 22/03/21         20       5000
         9 24/03/21          5        800
         9                  25       5800
        10 29/03/21         16        800
        10 19/04/21                  2600
        10 20/04/21                  1500
        10                  16       4900
        11 12/03/21         24        800
        11                  24        800
                           157      25185
*/


SELECT COD_ALUNO,
    CASE
        WHEN TRUNC(DATA) IS NULL AND COD_ALUNO IS NOT NULL
            THEN 'SUB-TOTAL'
        WHEN COD_ALUNO IS NULL
            THEN 'TOTAL'
        ELSE TO_CHAR(TRUNC(DATA))
    END DESCRICAO,
    ROUND(AVG(DESCONTO), 2) DESCONTO,
    SUM(TOTAL) TOTAL
FROM TCONTRATO
GROUP BY ROLLUP(COD_ALUNO, TRUNC(DATA));
/*
COD_ALUNO   DESCRICAO   DESCONTO   TOTAL   
           1 07/04/21              10      450 
           1 SUB-TOTAL             10      450 
           2 05/01/13                     2500 
           2 02/04/21                     1600 
           2 SUB-TOTAL                    4100 
           3 07/04/21                     1500 
           3 SUB-TOTAL                    1500 
           5 03/04/21              10     5000 
           5 04/04/21               0      445 
           5 05/04/21              20      445 
           5 SUB-TOTAL             10     5890 
           6 12/03/21              22      800 
           6 SUB-TOTAL             22      800 
           7 17/03/21              17      445 
           7 18/03/21              13      500 
           7 SUB-TOTAL             15      945 
           9 22/03/21              20     5000 
           9 24/03/21               5      800 
           9 SUB-TOTAL           12,5     5800 
          10 29/03/21              16      800 
          10 19/04/21                     2600 
          10 20/04/21                     1500 
          10 SUB-TOTAL             16     4900 
          11 12/03/21              24      800 
          11 SUB-TOTAL             24      800 
             TOTAL              14,27    25185 


26 linhas selecionadas.
*/

=========================================================
=========================================================
=========================================================
=========================================================

= CUBE - SEPARA DIFERENCIADO. OS SUB-TOTAIS ACIMA DE CADA GRUPO
O PRIMERIO GRUPO ELE SEPARA PELAS DATAS E DEPOIS SEGUE IGUAL AO
ROLLUP, POREM COM OS SUB-TOTAIS ANTES DOS REGISTROS INDIVIDUAIS 
POR GRUPO

SELECT COD_ALUNO, TRUNC(DATA), SUM(TOTAL)
FROM TCONTRATO 
GROUP BY CUBE(COD_ALUNO, TRUNC(DATA));
/*

 COD_ALUNO TRUNC(DATA)                 SUM(TOTAL)
---------- --------------------------- ----------
                                            25185
           05/01/13                          2500
           12/03/21                          1600
           17/03/21                           445
           18/03/21                           500
           22/03/21                          5000
           24/03/21                           800
           29/03/21                           800
           02/04/21                          1600
           03/04/21                          5000
           04/04/21                           445
           05/04/21                           445
           07/04/21                          1950
           19/04/21                          2600
           20/04/21                          1500
         1                                    450
         1 07/04/21                           450
         2                                   4100
         2 05/01/13                          2500
         2 02/04/21                          1600
         3                                   1500
         3 07/04/21                          1500
         5                                   5890
         5 03/04/21                          5000
         5 04/04/21                           445
         5 05/04/21                           445
         6                                    800
         6 12/03/21                           800
         7                                    945
         7 17/03/21                           445
         7 18/03/21                           500
         9                                   5800
         9 22/03/21                          5000
         9 24/03/21                           800
        10                                   4900
        10 29/03/21                           800
        10 19/04/21                          2600
        10 20/04/21                          1500
        11                                    800
        11 12/03/21                           800

40 linhas selecionadas. 
*/

=========================================================
=========================================================
=========================================================
=========================================================


= GROUPING = IDENTIFICA O TOTAL GERAL QUANTO AOS DEMAIS

SELECT GROUPING(COD_ALUNO), SUM(TOTAL)
FROM TCONTRATO
GROUP BY ROLLUP(COD_ALUNO);
/*
GROUPING(COD_ALUNO)   SUM(TOTAL)   
                     0           450 
                     0          4100 
                     0          1500 
                     0          5890 
                     0           800 
                     0           945 
                     0          5800 
                     0          4900 
                     0           800 
                     1         25185 


10 linhas selecionadas. 
*/


SELECT  GROUPING(COD_ALUNO),
        CASE                                                        --| ESTE CASE TEM QUE 
            WHEN GROUPING(COD_ALUNO) = 0 THEN TO_CHAR(COD_ALUNO)    --| FICAR ENTRE O
            ELSE 'TOTAL GERAL'                                      --| COD_ALUNO E O SUM
        END ALUNO,                                                  --| NO SELECT
        SUM(TOTAL)
FROM TCONTRATO
GROUP BY ROLLUP(COD_ALUNO);
/*
GROUPING(COD_ALUNO)   ALUNO         SUM(TOTAL)   
                     0 1                        450 
                     0 2                       4100 
                     0 3                       1500 
                     0 5                       5890 
                     0 6                        800 
                     0 7                        945 
                     0 9                       5800 
                     0 10                      4900 
                     0 11                       800 
                     1 TOTAL GERAL            25185 


10 linhas selecionadas. 
*/

= GROUPING ID IDENTIFICA SUB-TOTAIS

SELECT  TRUNC(DATA),
        GROUPING_ID(TRUNC(DATA)) GDT,        
        COD_ALUNO,
        GROUPING_ID(COD_ALUNO) GCL,
        SUM(TOTAL)
FROM TCONTRATO
GROUP BY ROLLUP(TRUNC(DATA), COD_ALUNO);
/*
TRUNC(DATA)   GDT   COD_ALUNO   GCL   SUM(TOTAL)   
05/01/13            0            2      0          2500 
05/01/13            0                   1          2500 
12/03/21            0            6      0           800 
12/03/21            0           11      0           800 
12/03/21            0                   1          1600 
17/03/21            0            7      0           445 
17/03/21            0                   1           445 
18/03/21            0            7      0           500 
18/03/21            0                   1           500 
22/03/21            0            9      0          5000 
22/03/21            0                   1          5000 
24/03/21            0            9      0           800 
24/03/21            0                   1           800 
29/03/21            0           10      0           800 
29/03/21            0                   1           800 
02/04/21            0            2      0          1600 
02/04/21            0                   1          1600 
03/04/21            0            5      0          5000 
03/04/21            0                   1          5000 
04/04/21            0            5      0           445 
04/04/21            0                   1           445 
05/04/21            0            5      0           445 
05/04/21            0                   1           445 
07/04/21            0            1      0           450 
07/04/21            0            3      0          1500 
07/04/21            0                   1          1950 
19/04/21            0           10      0          2600 
19/04/21            0                   1          2600 
20/04/21            0           10      0          1500 
20/04/21            0                   1          1500 

TRUNC(DATA)   GDT   COD_ALUNO   GCL   SUM(TOTAL)   
                    1                   1         25185 
*/


SELECT  TRUNC(DATA), COD_ALUNO,
        CASE
            WHEN GROUPING_ID(COD_ALUNO)=1 AND
                 GROUPING_ID(TRUNC(DATA))=0 THEN 'TOTAL DO DIA'
            WHEN GROUPING_ID(COD_ALUNO)=1 AND
                 GROUPING_ID(TRUNC(DATA))=1 THEN 'TOTAL GERAL'
        END AS DESCRICAO,
        SUM(TOTAL) TOTAL
FROM TCONTRATO
GROUP BY ROLLUP(TRUNC(DATA), COD_ALUNO);
/*
TRUNC(DATA)   COD_ALUNO   DESCRICAO      TOTAL   
05/01/13                  2                     2500 
05/01/13                    TOTAL DO DIA        2500 
12/03/21                  6                      800 
12/03/21                 11                      800 
12/03/21                    TOTAL DO DIA        1600 
17/03/21                  7                      445 
17/03/21                    TOTAL DO DIA         445 
18/03/21                  7                      500 
18/03/21                    TOTAL DO DIA         500 
22/03/21                  9                     5000 
22/03/21                    TOTAL DO DIA        5000 
24/03/21                  9                      800 
24/03/21                    TOTAL DO DIA         800 
29/03/21                 10                      800 
29/03/21                    TOTAL DO DIA         800 
02/04/21                  2                     1600 
02/04/21                    TOTAL DO DIA        1600 
03/04/21                  5                     5000 
03/04/21                    TOTAL DO DIA        5000 
04/04/21                  5                      445 
04/04/21                    TOTAL DO DIA         445 
05/04/21                  5                      445 
05/04/21                    TOTAL DO DIA         445 
07/04/21                  1                      450 
07/04/21                  3                     1500 
07/04/21                    TOTAL DO DIA        1950 
19/04/21                 10                     2600 
19/04/21                    TOTAL DO DIA        2600 
20/04/21                 10                     1500 
20/04/21                    TOTAL DO DIA        1500 
                            TOTAL GERAL       25185 
*/             

=========================================================
=========================================================
=========================================================
=========================================================

Grouping Sets           - RETORNA APENAS OS SUB-TOTAIS
Rank() Over             - FAZ UM RANK
Dense_Rank()
Ratio_To_Report()
Partition_By            - POSICAO POR GRUPO

=========================================================

= GOUPING SET - RETORNA APENAS OS SUB-TOTAIS

SELECT  COD_ALUNO,
        TRUNC(DATA),
        SUM(TOTAL)
FROM    TCONTRATO
GROUP BY GROUPING SETS(COD_ALUNO, TRUNC(DATA));
/*
COD_ALUNO   TRUNC(DATA)   SUM(TOTAL)   
           1                          450 
           6                          800 
          11                          800 
           2                         4100 
           5                         5890 
           3                         1500 
           7                          945 
           9                         5800 
          10                         4900 
             18/03/21                 500 
             19/04/21                2600 
             03/04/21                5000 
             12/03/21                1600 
             07/04/21                1950 
             05/04/21                 445 
             24/03/21                 800 
             04/04/21                 445 
             29/03/21                 800 
             05/01/13                2500 
             22/03/21                5000 
             20/04/21                1500 
             02/04/21                1600 
             17/03/21                 445 


23 linhas selecionadas. 
*/

SELECT  TRUNC(DATA), COD_ALUNO, SUM(TOTAL),
        RANK() OVER(ORDER BY SUM(TOTAL) DESC) POSICAO
FROM TCONTRATO
GROUP BY (TRUNC(DATA), COD_ALUNO)
/*
TRUNC(DATA)   COD_ALUNO   SUM(TOTAL)   POSICAO   
03/04/21                  5          5000          1 
22/03/21                  9          5000          1 
19/04/21                 10          2600          3 
05/01/13                  2          2500          4 
02/04/21                  2          1600          5 
20/04/21                 10          1500          6 
07/04/21                  3          1500          6 
29/03/21                 10           800          8 
12/03/21                 11           800          8 
24/03/21                  9           800          8 
12/03/21                  6           800          8 
18/03/21                  7           500         12 
07/04/21                  1           450         13 
17/03/21                  7           445         14 
04/04/21                  5           445         14 
05/04/21                  5           445         14 


16 linhas selecionadas. 
*/


SELECT  TRUNC(DATA), COD_ALUNO, SUM(TOTAL),
        RANK() OVER(PARTITION BY TRUNC(DATA) ORDER BY SUM(TOTAL) DESC) POSICAO 
FROM TCONTRATO
GROUP BY (TRUNC(DATA), COD_ALUNO)
ORDER BY TRUNC(DATA);
/*
TRUNC(DATA)   COD_ALUNO   SUM(TOTAL)   POSICAO   
05/01/13                  2          2500          1 
12/03/21                  6           800          1--- NO DIA 12/03/21 TEMOS 2 ALUNOS  
12/03/21                 11           800          1    PORÉM VALORES IGUAIS POR ISSO 
17/03/21                  7           445          1    AMBOS ESTÃO NA MESMA POSICAO
18/03/21                  7           500          1 
22/03/21                  9          5000          1 
24/03/21                  9           800          1 
29/03/21                 10           800          1 
02/04/21                  2          1600          1 
03/04/21                  5          5000          1 
04/04/21                  5           445          1 
05/04/21                  5           445          1 
07/04/21                  3          1500          1--- NO DIA 07/04/21 TEMOS 2 ALUNOS 
07/04/21                  1           450          2    COM VALORES DIFERENTES POR ISSO
19/04/21                 10          2600          1    POSICOES 1 E 2 
20/04/21                 10          1500          1 


16 linhas selecionadas. 
*/


SELECT  COD_CONTRATO, TOTAL,
        RANK() OVER(ORDER BY TOTAL DESC) "RANK",
        DENSE_RANK() OVER(ORDER BY TOTAL DESC) "DENSE_RANK"
FROM TCONTRATO
GROUP BY COD_CONTRATO, TOTAL;
/*
COD_CONTRATO   TOTAL   RANK   DENSE_RANK   
              5     5000       1             1 
             11     5000       1             1 
             39     2600       3             2 
              2     2500       4             3 
              4     1600       5             4 
              3     1500       6             5 
             38     1500       6             5 
              8      800       8             6 
             12      800       8             6 
             13      800       8             6 
             14      800       8             6 
             10      500      12             7 
              1      450      13             8 
              6      445      14             9 
              7      445      14             9 
              9      445      14             9 


16 linhas selecionadas.
*/


SELECT  COD_ALUNO, SUM(TOTAL) "TOTAL CLIENTE",
        ROUND(RATIO_TO_REPORT(SUM(TOTAL)) OVER()*100, 2) "% DO TOTAL"
FROM TCONTRATO
GROUP BY COD_ALUNO; 
/*
COD_ALUNO   TOTAL CLIENTE   % DO TOTAL   
           1              450          1,79 
           6              800          3,18 
          11              800          3,18 
           2             4100         16,28 
           5             5890         23,39 
           3             1500          5,96 
           7              945          3,75 
           9             5800         23,03 
          10             4900         19,46 


9 linhas selecionadas. 
*/

SELECT  COD_ALUNO,
        TRUNC(DATA),
        SUM(TOTAL) "TOTAL DO DIA",
        ROUND(RATIO_TO_REPORT(SUM(TOTAL)) OVER(PARTITION BY TRUNC(DATA))*100, 2) "% DIA"
FROM TCONTRATO
GROUP BY COD_ALUNO, TRUNC(DATA)
ORDER BY 2 ASC, COD_ALUNO;
/*
COD_ALUNO   TRUNC(DATA)   TOTAL DO DIA   % DIA   
           2 05/01/13                  2500      100 
           6 12/03/21                   800       50 
          11 12/03/21                   800       50 
           7 17/03/21                   445      100 
           7 18/03/21                   500      100 
           9 22/03/21                  5000      100 
           9 24/03/21                   800      100 
          10 29/03/21                   800      100 
           2 02/04/21                  1600      100 
           5 03/04/21                  5000      100 
           5 04/04/21                   445      100 
           5 05/04/21                   445      100 
           1 07/04/21                   450    23,08 
           3 07/04/21                  1500    76,92 
          10 19/04/21                  2600      100 
          10 20/04/21                  1500      100 


16 linhas selecionadas.
*/


SELECT  TRUNC(DATA), SUM(TOTAL) "TOTAL DIA",
        LAG  (SUM(TOTAL), 1) OVER (ORDER BY TRUNC(DATA)) "ANTERIOR",     
        LEAD (SUM(TOTAL), 1) OVER (ORDER BY TRUNC(DATA)) "POSTERIOR"
FROM TCONTRATO
GROUP BY TRUNC(DATA)
ORDER BY TRUNC(DATA);     
/*
TRUNC(DATA)   TOTAL DIA   ANTERIOR   POSTERIOR   
05/01/13               2500                     1600 
12/03/21               1600        2500          445 
17/03/21                445        1600          500 
18/03/21                500         445         5000 
22/03/21               5000         500          800 
24/03/21                800        5000          800 
29/03/21                800         800         1600 
02/04/21               1600         800         5000 
03/04/21               5000        1600          445 
04/04/21                445        5000          445 
05/04/21                445         445         1950 
07/04/21               1950         445         2600 
19/04/21               2600        1950         1500 
20/04/21               1500        2600              


14 linhas selecionadas. 
*/


































