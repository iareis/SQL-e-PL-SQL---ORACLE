---------------------------------------------
--  TIPO DE DADOS DE RECORD E COLLECTIONS  --
---------------------------------------------

TYPE type_name IS RECORD (field_declaration[field_declaration]...);

identifier type_name;

field_name  {field_type | variable%TYPE | table.column%TYPE | table%ROETYPE}
            [[NOT NULL] {:= | DEFAULT} expr]


--
  %ROWTYPE    

------------------------------------------------   

DECLARE 
    --
    TYPE rec_ALUNO IS RECORD 
        (
        COD_ALUNO NUMBER NOT NULL := 0,
        NOME   TALUNO.NOME%TYPE,
        CIDADE TALUNO.CIDADE%TYPE
        );
    --
    REGISTRO rec_ALUNO;
BEGIN 
    REGISTRO.COD_ALUNO  := 50;
    REGISTRO.NOME       :=  'Master';
    REGISTRO.CIDADE     :=  'Novo Hamburgo';
    DBMS_OUTPUT.PUT_LINE('Codigo: '||REGISTRO.COD_ALUNO);
    DBMS_OUTPUT.PUT_LINE('  Nome: '||REGISTRO.NOME);
    DBMS_OUTPUT.PUT_LINE('Cidade: '||REGISTRO.CIDADE);
END;



DECLARE 
    REG TALUNO%ROWTYPE; --RECORD
    vCEP VARCHAR(10)    :='98300000';
BEGIN 
    SELECT COD_ALUNO, NOME, CIDADE
    INTO REG.COD_ALUNO, REG.NOME, REG.CIDADE
    FROM TALUNO
    WHERE COD_ALUNO =1;

    REG.CEP     := '93500000';
    REG.SALARIO := 1500;

    DBMS_OUTPUT.PUT_LINE('CODIGO  : '||REG.COD_ALUNO);
    DBMS_OUTPUT.PUT_LINE('NOME    : '||REG.NOME);
    DBMS_OUTPUT.PUT_LINE('SALARIO : '||REG.SALARIO);
    DBMS_OUTPUT.PUT_LINE('CIDADE  : '||REG.CIDADE);
    DBMS_OUTPUT.PUT_LINE('CEP     : '||REG.CEP);
END;



--
SELECT COD_ALUNO, NOME FROM TALUNO WHERE COD_ALUNO =1;

--
DECLARE 
    TYPE NOME_TYPE IS TABLE OF TALUNO.NOME%TYPE;
    NOME_TABLE NOME_TYPE := NOME_TYPE(); --CRIANDO INSTANCIA
BEGIN 
    NOME_TABLE.EXTEND; --ALOCANDO UMA NOVA LINHA
    NOME_TABLE(1) := 'PEDRO';
    NOME_TABLE.EXTEND; --ALOCANDO UMA NOVA LINHA
    NOME_TABLE(2) := 'MARCIO';
    DBMS_OUTPUT.PUT_LINE('NOME 1: '||NOME_TABLE(1));   
    DBMS_OUTPUT.PUT_LINE('NOME 2: '||NOME_TABLE(2));
END;   






DECLARE 
    TYPE T_ALUNO IS TABLE OF TALUNO.NOME%TYPE 
    INDEX BY BINARY_INTEGER; --MATRIZ

    REGISTRO T_ALUNO; --RECORD
BEGIN 
    REGISTRO(1) := 'MARCIO';
    REGISTRO(2) := 'JOSE';
    REGISTRO(3) := 'PEDRO';
    DBMS_OUTPUT.PUT_LINE('NOME 1: '||REGISTRO(1));
    DBMS_OUTPUT.PUT_LINE('NOME 2: '||REGISTRO(2));
    DBMS_OUTPUT.PUT_LINE('NOME 3: '||REGISTRO(3));
END;






--
DECLARE 
    TYPE TIPO IS TABLE OF VARCHAR2(30) --FAZ UMA MATRIZ DE TAMANHO 30
    INDEX BY VARCHAR2(2); --O ACESSO VAI SER UM VARCHAR DE TAMANHO 2, A UF.
    UF_CAPITAL TIPO; --CRIANDO O NOME UF_CAPITAL PARA CADA UF DO TIPO CRIADO NA LINHA 1
BEGIN 
    UF_CAPITAL('RS')    :=  'PORTO ALEGRE';
    UF_CAPITAL('RJ')    :=  'RIO DE JANEIRO';
    UF_CAPITAL('PR')    :=  'CURITIBA';
    UF_CAPITAL('MT')    :=  'CUIABA';
    DBMS_OUTPUT.PUT_LINE(UF_CAPITAL('RS'));
    DBMS_OUTPUT.PUT_LINE(UF_CAPITAL('RJ'));
    DBMS_OUTPUT.PUT_LINE(UF_CAPITAL('PR'));
    DBMS_OUTPUT.PUT_LINE(UF_CAPITAL('MT'));
END;





DECLARE 
    TYPE NOME_VARRAY IS VARRAY(5) OF TALUNO.NOME%TYPE;
    NOME_VETOR NOME_VARRAY := NOME_VARRAY();
BEGIN 
    NOME_VETOR.EXTEND; --PODE IR ALOCANDO NOVAS LINHAS ATÉ O LIMITE DO VARRAY, NESTE EXEMPLO É 5
    NOME_VETOR(1)   := 'MARCIO';
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(1));
END;




--REPETINDO O EXEMPLO ANTERIOR ATÉ O LIMITE DE VARCHAR(5)
DECLARE 
    TYPE NOME_VARRAY IS VARRAY(5) OF TALUNO.NOME%TYPE;
    NOME_VETOR NOME_VARRAY := NOME_VARRAY();
BEGIN 
    NOME_VETOR.EXTEND; 
    NOME_VETOR(1)   := 'MARCIO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(2)   := 'NARCOO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(3)   := 'PARCUO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(4)   := 'RARCAO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(5)   := 'SARCEO';
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(1));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(2));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(3));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(4));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(5));
END;




--REPETINDO O EXEMPLO ANTERIOR EXTRAPLONDO EM +1 O LIMITE DE VARCHAR(5)
DECLARE 
    TYPE NOME_VARRAY IS VARRAY(5) OF TALUNO.NOME%TYPE;
    NOME_VETOR NOME_VARRAY := NOME_VARRAY();
BEGIN 
    NOME_VETOR.EXTEND; 
    NOME_VETOR(1)   := 'MARCIO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(2)   := 'NARCOO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(3)   := 'PARCUO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(4)   := 'RARCAO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(5)   := 'SARCEO';
    NOME_VETOR.EXTEND; 
    NOME_VETOR(6)   := 'LCC';
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(1));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(2));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(3));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(4));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(5));
    DBMS_OUTPUT.PUT_LINE(NOME_VETOR(6));
END;
/*RESULTO EM ERRO COMO ESPERADO
06532. 00000 -  "Subscript outside of limit"
*Cause:    A subscript was greater than the limit of a varray
           or non-positive for a varray or nested table.
*Action:   Check the program logic and increase the varray limit
           if necessary.*/


























































































































































