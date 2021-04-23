=========================================================================
===   Criar um bloco PL/SQL para imprimir a tabuada de 0 a 20,        ===
===   sendo que cada um desses numeros devera ter o calculo ate 10.   ===
=========================================================================

DECLARE
    V_CONSTANTE INTEGER;
    V_CONTADOR INTEGER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('TABUADA:');
    DBMS_OUTPUT.PUT_LINE(' ');
    FOR V_CONSTANTE IN 1..20
    LOOP
        FOR V_CONTADOR IN 1..10
        LOOP
            DBMS_OUTPUT.PUT_LINE(V_CONSTANTE||' X '||V_CONTADOR||' = '||V_CONTADOR*V_CONSTANTE);
        END LOOP;
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    END LOOP;
END;





































