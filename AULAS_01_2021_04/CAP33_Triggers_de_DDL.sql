===========================
===   TRIGGERS DE DDL   ===
===========================

VAMOS CRIAR UMA TRIGGER QUE DISPARA QUANDO CRIAMOS OBJETOS.

VAMOS UTILIZAR UM USUÁRIO sys COM ATRIBUIÇÃO SYSDBA que tem 100% de PODER

--conectado como sys as sysdba
create table log_ddl(
    data date,
    usuario varchar(40),
    schema varchar2(30),
    operacao varchar2(100),
    objeto varchar2(1000)
);
/*
Table LOG_DDL criado.
*/

--vamos criar a trigger
--conectado como sys as sysdba
CREATE OR REPLACE TRIGGER tri_log_ddl BEFORE DDL ON DATABASE
DECLARE
    V_OPER VARCHAR2(30);
    V_SCHEMA VARCHAR2(30);
    V_OBJ VARCHAR2(30);
---
BEGIN 
    SELECT ora_sysevent, ora_dict_obj_owner, ora_dict_obj_name
    INTO v_oper, v_schema, v_obj FROM DUAL;
    INSERT INTO log_ddl
    VALUES (SYSDATE, USER, V_SCHEMA, V_OPER, V_OBJ);
---
END;
/*
Trigger TRI_LOG_DDL compilado
*/

--tESTE
--Conectado como usuario normal
DROP TABLE nome_tabela;

DROP TABLE TESTE;
/*
Table TESTE eliminado.
*/

--conectado como sys as sysdba
SELECT * FROM LOG_DDL;
/*
DATA       USUARIO   SCHEMA   OPERACAO   OBJETO        
22/04/21    IAREIS     IAREIS    DROP        TESTE          
22/04/21    IAREIS     IAREIS    ALTER       TESTE          
22/04/21    IAREIS     IAREIS    ALTER       TESTE          
22/04/21    IAREIS     IAREIS    ALTER       SYS_C007035    
22/04/21    IAREIS     IAREIS    ALTER       TESTE          


Decorrido: 00:00:00.006
*/













































































