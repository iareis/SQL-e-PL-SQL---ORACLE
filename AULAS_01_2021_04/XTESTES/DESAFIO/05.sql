======================================================================================
===   Criar um bloco PL/SQL para apresentar os anos bissextos entre 2000 e 2100.   ===
===   Um ano sera bissexto quando for possivel dividi_lo por 4, mas nao por 100    ===
===   ou quando for possivel dividi_lo por 400.                                    ===
======================================================================================


DECLARE 
    V_ANO NUMBER(4);
BEGIN 
    DBMS_OUTPUT.PUT_LINE('OS ANOS BISSEXTOS ENTRE 2000 E 2100: ');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    FOR V_ANO IN 2000..2100
    LOOP
        IF  MOD(V_ANO,4) = 0 AND
            MOD(V_ANO,100) != 0 OR
            MOD(V_ANO,400) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(V_ANO);
        END IF;
    END LOOP;
END;



















