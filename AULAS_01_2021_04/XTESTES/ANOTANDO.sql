FIBONACCI 
=====================================================================================================

dECLARE  
V_A NUMBER(2) := 1;  
V_B NUMBER(2) := 1;  
V_C NUMBER(2) := 0; 

BEGIN  
FOR V_I IN 1..11 
LOOP   
    V_A := V_B;   
    V_B := V_C;   
    DBMS_OUTPUT.PUT_LINE(V_C);   
    V_C := V_A + V_B;  
END LOOP;
END;




Lancei um desafio semana passada em um forum onde participo.
A idéia era escrever uma query em SQL puro (sem o uso de PL/SQL) que resultasse na sequência de Fibonacci.
Também havia dado uma dica: que eu consegui em 10g. Portanto usando uma nova feature da versão.
A feature usada foi o MODEL. Vale a pena parar e estudar um pouco essa nova cláusula do SELECT a partir da versão 10g.

SQL> select s seq
  2    from dual
  3  model return all rows
  4     dimension by ( 0 d ) measures ( 0 s )
  5     rules iterate (12) (
  6       s[iteration_number ] = decode(
  7                                iteration_number, 0, 0, 1, 1, s[iteration_number-2]
  8                              ) + nvl(s[iteration_number-1],0)
  9     )
 10  /

          SEQ
-------------
            0
            1
            1
            2
            3
            5
            8
           13
           21
           34
           55
           89

12 rows selected.

---------------------------------------------------------------------------
select s seq
from dual
model return all rows
dimension by ( 0 d ) measures ( 0 s )
rules iterate (12) (s[iteration_number ] = decode(iteration_number, 0, 0, 1, 1, s[iteration_number-2]) + nvl(s[iteration_number-1],0))

=====================================================================================================



declare
	first number:=0;
	second number:=1;
	third number;
	n number:=&n;
	i number;
 
begin
	dbms_output.put_line('Fibonacci series is:');
	dbms_output.put_line(first);
	dbms_output.put_line(second);	
 
	for i in 2..n
	loop
		third:=first+second;
		first:=second;
		second:=third;
		dbms_output.put_line(third);
	end loop;
end;


==================================================
Lisiane Reis Ferreira16:58
SET SERVEROUTPUT ON;

DECLARE 
  v_ID SEGMERCADO.ID%type:=2;
  v_DESCRICAO SEGMERCADO.DESCRICAO%type;

BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;
    dbms_output.put_line(v_DESCRICAO);
END;
Lisiane Reis Ferreira17:04
https://cursos.alura.com.br/forum/topico-impressao-de-resultado-119502
Lisiane Reis Ferreira17:36
Basicamente a diferença no uso das duas é essa. A view realiza a consulta no momento que o usuário faz uma consulta nela e a materialized view realiza a consulta no momento em que uma das tabelas consultadas é atualizada.
Lisiane Reis Ferreira17:41
https://pt.stackoverflow.com/questions/138033/qual-a-diferen%C3%A7a-entre-view-e-materialized-view
Lisiane Reis Ferreira17:53
oracle_home
Lisiane Reis Ferreira17:58
GRANT READ, WRITE ON DIRECTORY DIRETORIO TO USUARIO;
Lisiane Reis Ferreira18:05
https://pt.stackoverflow.com/questions/166911/backup-de-tabelas-oracle-11g
Lisiane Reis Ferreira18:19
https://www.devmedia.com.br/pacote-utl_file-do-oracle/13129
Lisiane Reis Ferreira18:34
grant execute on UTL_FILE to public;
Lisiane Reis Ferreira18:45
ERWin na tua maquina
engenharia reversa
Lisiane Reis Ferreira19:07
You use the IF-THEN-ELSIF-ELSE syntax, when you want to execute one set of statements when condition1 is TRUE, a different set of statements when condition2 is TRUE, or a different set of statements when all previous conditions (ie: condition1 and condition2) are FALSE.
