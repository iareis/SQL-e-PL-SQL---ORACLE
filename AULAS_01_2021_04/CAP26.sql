=========================
===   DATACASE LINK   ===
=========================

LOGADO COMO SYSTEM PARA TESTAR ACESSO
DATABASE LINK COM iareis

==================================================
==================================================
==================================================
==================================================

CREATE DATABASE LINK CURSO_LINK
CONNECT TO IAREIS IDENTIFIED BY "&SENHA"      --em vez de "&SENHA" poderia usar "xxxx"
USING 'xe';                                   --onde xxxx corresponde a senha  
/*
Database link CURSO_LINK criado.
*/

-- TNS

SELECT * FROM TALUNO@CURSO_LINK;

































































































