===================================================================================
===   Criar uma procedure que recebera um RA, um NOME e                         ===
===   quatro notas conforme a sequencia: (RA,NOME,A1,A2,A3,A4).                 ===
===                                                                             ===
===   A partir destes valores devera efetuar o calculo da media                 ===
===   somando o maior valor entre A1 e A2 as notas A3 e A4 e                    ===
===   dividindo o valor obtido por tres (achando a media).                      ===
===                                                                             ===
===   Se a media for menor que 6 (seis) o aluno estara REPROVADO                ===
===   e se a media for igual ou superior a 6 (seis) o aluno estara APROVADO.    ===
===                                                                             ===
===   A procedure devera inserir os valores acima numa tabela denominada        === 
===   ALUNO com as seguintes colunas RA,NOME,A1,A2,A3,A4,MEDIA,RESULTADO        ===
===================================================================================


CREATE TABLE ALUNO(
    RA      NUMBER,
    NOME    VARCHAR2(40),
    A1      NUMBER(4,2),
    A2      NUMBER(4,2),
    A3      NUMBER(4,2),
    A4      NUMBER(4,2),
    MEDIA   NUMBER(4,2),
    RESULTADO   VARCHAR2(10),
);

CREATE SEQUENCE RA_ALUNO;

CREATE OR REPLACE PROCEDURE MEDIA_ALUNO (
    RA NUMBER,
    NOME VARCHAR2,
    A1 NUMBER,
    A2 NUMBER,
    A3 NUMBER,
    A4 NUMBER,
    MEDIA NUMBER,
    RESULTADO VARCHAR2,)
IS 
    V_MAIOR_VALOR NUMBER;
    V_MEDIA NUMBER;
    V_RESULTADO VARCHAR2;
BEGIN 
    IF A1 > A2 THEN
        V_MAIOR_VALOR := A1;
    ELSE
        V_MAIOR_VALOR := A2;
    END IF;
    ---
    V_MEDIA := (V_MAIOR_VALOR + A3 + A4)/3;
    ---
    IF V_MEDIA > 6 THEN
        V_RESULTADO := 'APROVADO';
    ELSE 
        V_RESULTADO := 'REPROVADO';
    END IF;
    ---
    INSERT INTO ALUNO VALUES(RA_ALUNO.NEXTVAL,NOME,A1,A2,A3,A4,V_MEDIA,V_RESULTADO);
END;

EXEC MEDIA_ALUNO(
    NOME := &NOME,
    A1 := '&NOTA1',  
    A2 := '&NOTA2',  
    A3 := '&NOTA3',  
    A4 := '&NOTA4',
);

MEDIA_ALUNO(4,'iuri',40,60,80,100); 

SELECT * FROM ALUNO;












