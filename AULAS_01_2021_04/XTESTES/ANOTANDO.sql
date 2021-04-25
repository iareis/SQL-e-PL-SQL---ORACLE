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
