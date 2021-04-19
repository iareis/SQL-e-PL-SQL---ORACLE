===================
===   TO_DATE   ===
===================

/*
A Funcao TO_DATE eh uma funcao que transforma o parametro do tipo CHAR
em um parâmetro do tipo DATE.
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