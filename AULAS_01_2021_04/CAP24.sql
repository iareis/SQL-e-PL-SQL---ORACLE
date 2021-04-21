==========================
===   OPERADORES SET   ===
==========================

UNION       -> AGRUPA IGUAIS
UNION ALL   -> NÃO AGRUPA IGUAIS
INTERSECT   -> RESGISTROS Q ESTÃO PRESENTES EM TODOS OS CONJUNTOS
MINUS

========================================================
========================================================
========================================================
========================================================

SELECT * FROM TCONTRATO;
/*
COD_CONTRATO   DATA       COD_ALUNO   TOTAL   DESCONTO   VALOR_COMISSAO   
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

SELECT COD_ALUNO, TOTAL, DESCONTO
FROM TCONTRATO
WHERE COD_ALUNO = 1

UNION ALL

SELECT COD_ALUNO, TOTAL, DESCONTO
FROM TCONTRATO
WHERE TOTAL >= 1000;
/*
Decorrido: 00:00:00.006
COD_ALUNO   TOTAL   DESCONTO   
           1      450          10 
           2     2500             
           3     1500             
           2     1600             
           5     5000          10 
           9     5000          20 
          10     2600             
          10     1500             


8 linhas selecionadas. 
*/

SELECT COD_ALUNO, TOTAL, DESCONTO
FROM TCONTRATO
WHERE COD_ALUNO = 1

UNION

SELECT COD_ALUNO, TOTAL, DESCONTO
FROM TCONTRATO
WHERE TOTAL >= 1000;

========================================================
========================================================
========================================================
========================================================

SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 1' AS QUERY --'UNION 1' AS QUERY É COLUNA VIRTUAL
FROM TCONTRATO
WHERE TOTAL >= 1000 AND TOTAL < 2000
/*
COD_CONTRATO   DATA       TOTAL   QUERY     
              3 07/04/21        1500 UNION 1    
              4 02/04/21        1600 UNION 1    
             38 20/04/21        1500 UNION 1  
*/

SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 2' AS QUERY 
FROM TCONTRATO
WHERE DESCONTO IS NOT NULL
/*
COD_CONTRATO   DATA       TOTAL   QUERY     
              1 07/04/21         450 UNION 2    
              5 03/04/21        5000 UNION 2    
              6 04/04/21         445 UNION 2    
              7 05/04/21         445 UNION 2    
              8 12/03/21         800 UNION 2    
              9 17/03/21         445 UNION 2    
             10 18/03/21         500 UNION 2    
             11 22/03/21        5000 UNION 2    
             12 24/03/21         800 UNION 2    
             13 29/03/21         800 UNION 2    
             14 12/03/21         800 UNION 2    


11 linhas selecionadas. 
*/

SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 3' AS QUERY 
FROM TCONTRATO
WHERE TOTAL > 2000
/*
COD_CONTRATO DATA          TOTAL QUERY  
------------ -------- ---------- -------
           2 05/01/13       2500 UNION 3
           5 03/04/21       5000 UNION 3
          11 22/03/21       5000 UNION 3
          39 19/04/21       2600 UNION 3
*/

-------------------------------------------------------------------
AGORA VAMOS VER COMO FICAR OS 3 SELECTS UNIDOS
-------------------------------------------------------------------

SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 1' AS QUERY --'UNION 1' AS QUERY É COLUNA VIRTUAL
FROM TCONTRATO
WHERE TOTAL >= 1000 AND TOTAL < 2000

UNION ALL

SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 2' AS QUERY 
FROM TCONTRATO
WHERE DESCONTO IS NOT NULL

UNION

SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 3' AS QUERY 
FROM TCONTRATO
WHERE TOTAL > 2000

ORDER BY 4; -- 4 INDICA A COLUNA 4 NO SELECT... PODIA TB SER ORDER BY QUERY
/*
COD_CONTRATO   DATA       TOTAL   QUERY     
             38 20/04/21        1500 UNION 1    
              4 02/04/21        1600 UNION 1    
              3 07/04/21        1500 UNION 1    
              5 03/04/21        5000 UNION 2    
              1 07/04/21         450 UNION 2    
              8 12/03/21         800 UNION 2    
             14 12/03/21         800 UNION 2    
             13 29/03/21         800 UNION 2    
             12 24/03/21         800 UNION 2    
              6 04/04/21         445 UNION 2    
              7 05/04/21         445 UNION 2    
              9 17/03/21         445 UNION 2    
             10 18/03/21         500 UNION 2    
             11 22/03/21        5000 UNION 2    
             39 19/04/21        2600 UNION 3    
             11 22/03/21        5000 UNION 3    
              2 05/01/13        2500 UNION 3    
              5 03/04/21        5000 UNION 3    


18 linhas selecionadas. 
*/

========================================================
========================================================
========================================================
========================================================

SELECT COD_CONTRATO, DATA, DESCONTO, TOTAL
FROM TCONTRATO
WHERE DESCONTO IS NOT NULL

INTERSECT
--RESGISTROS Q ESTÃO PRESENTES EM TODOS OS CONJUNTOS

SELECT COD_CONTRATO, DATA, DESCONTO, TOTAL
FROM TCONTRATO
WHERE TOTAL > 1000

ORDER BY 1;
/*
COD_CONTRATO   DATA       DESCONTO   TOTAL   
              5 03/04/21             10     5000 
             11 22/03/21             20     5000 
*/


========================================================
========================================================
========================================================
========================================================

SELECT COD_CONTRATO, DATA, DESCONTO, TOTAL
FROM TCONTRATO
WHERE DESCONTO IS NOT NULL

MINUS

SELECT COD_CONTRATO, DATA, DESCONTO, TOTAL
FROM TCONTRATO
WHERE TOTAL > 1000

ORDER BY 1;
/*
COD_CONTRATO   DATA       DESCONTO   TOTAL   
              1 07/04/21             10      450 
              6 04/04/21              0      445 
              7 05/04/21             20      445 
              8 12/03/21             22      800 
              9 17/03/21             17      445 
             10 18/03/21             13      500 
             12 24/03/21              5      800 
             13 29/03/21             16      800 
             14 12/03/21             24      800 


9 linhas selecionadas. 
*/



































