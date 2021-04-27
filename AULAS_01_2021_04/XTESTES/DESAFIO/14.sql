Dada a seguinte tabela com os seguintes registros:

CREATE TABLE Fun(
    idFun INTEGER,
    nomeFun VARCHAR2(100),
    salario DECIMAL(8,2),
    CONSTRAINT pk_fun PRIMARY KEY (idFun)
);

INSERT INTO Fun VALUES (1, 'Maria', 2000.50);
INSERT INTO Fun VALUES (2, 'Carolina', 3000.25);
INSERT INTO Fun VALUES (3, 'Sergio', 2500.00);

Desejamos ler registro a registro a tabela FUN e mostrar
os funcionários e seus salários, informando ainda se o 
salário do mesmo é acima ou abaixo da média: 

================================================================================