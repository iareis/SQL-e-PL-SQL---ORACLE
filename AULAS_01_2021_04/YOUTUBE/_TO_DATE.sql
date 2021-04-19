============================
===   TO_DATE / MONTHS_BETWEEN  ===
============================

[https://www.youtube.com/watch?v=NEsEipDsFsI](Aprenda PL/SQL)

/*
A Funcao TO_DATE eh uma funcao que transforma o parametro do tipo CHAR
em um parametro do tipo DATE.

Diferenca entre YY e RR. 
RR vai 1950 A 2049, entao se a mascara eta RR e vc coloca o ano como 49
o ORACLE entende 2049
*/


SELECT to_date('20210419', 'YYYYMMDD') AS "TO_DATE"
  FROM dual;
/*
TO_DATE    
19/04/21    
*/  

SELECT to_date('14/09/2016 02:50:21', 'DD/MM/YYYY HH24:MI:SS') AS "TO_DATE"
  FROM dual;

SELECT to_date('14/09/2016 02', 'DD/MM/YY HH24') AS TO_DATE
  FROM dual;

SELECT to_date('050817', 'MMDDYY') AS "TO_DATE"
  FROM dual;

SELECT NOME, NASCIMENTO
FROM TALUNO
WHERE NASCIMENTO BETWEEN to_date('13/01/2001', 'DD/MM/YY') 
AND to_date('17/08/2002', 'DD/MM/YY');




SELECT SYSDATE FROM DUAL;

==============================================================
/*
A FUNCAO MONTHS_BETWEEN
RETIRNA A DIFERENÇA DE MESES ENTRE DUAS DATAS
*/

SELECT months_between(TO_DATE('28/12/2017', 'DD/MM/YY'),
                      TO_DATE('03/08/2017', 'DD/MM/YY')) AS MONTHS_BETWEEN
 FROM dual;
 
SELECT trunc(months_between(TO_DATE('28/12/2017', 'DD/MM/YY'),
                            TO_DATE('03/08/2017', 'DD/MM/YY'))) AS MONTHS_BETWEEN
 FROM dual;
 
SELECT round(months_between(TO_DATE('28/12/2017', 'DD/MM/YY'),
                            TO_DATE('03/08/2017', 'DD/MM/YY'))) AS MONTHS_BETWEEN
 FROM dual;


==============================================================




