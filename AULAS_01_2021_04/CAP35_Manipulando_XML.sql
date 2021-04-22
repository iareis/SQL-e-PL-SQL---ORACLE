===========================
===   Manipulando XML   ===
===========================

A XML (Extensible Markup Language) é uma linguagem de marcação de propósito
geral. Ela permite compartilhar dados estruturados na Internet e pode ser
usada para codificar dados e outros documentos. A XML apresenta as seguintes
vantagens: 

■ Pode ser lida por seres humanos e computadores e é armazenada como texto puro
■ É independente de plataforma
■ Suporta Unicode, o que significa que ela pode armazenar informações escritas
em muitos idiomas
■ Usa um formato autodocumentado que contém a estrutura do documento, nomes de
elemento e valores de elemento Por causa dessas vantagens, a XML é muito usada
para armazenamento e processamento de documentos, sendo aplicada por muitas
organizações para o envio de dados entre seus sistemas de computador. 
Por exemplo, muitos fornecedores permitem que seus clientes enviem pedidos
de compra como arquivos XML pela Internet.

GERANDO CÓDIGO XML A PARTIR DE DADOS RELACIONAIS

O banco de dados Oracle contém várias funções SQL que podem ser usadas para
gerar código XML e, nesta seção, você vai ver como gerar código XML a partir
de dados relacionais utilizando algumas dessas funções.

XMLELEMENT()
A função XMLELEMENT() é usada para gerar elementos XML a partir de dados relacionais.
Você fornece um nome para o elemento e a coluna que deseja recuperar para a função
XMLELEMENT() e ela retorna os elementos como objetos XMLType. XMLType é um tipo interno
do banco de dados Oracle utilizado para representar dados XML.
Por padrão, um objeto XMLType armazena os dados XML como texto em um
CLOB (Character Large Object). O exemplo a seguir se conecta no SQL Developer com usuário
de desenvolvimento e usa objetos XMLType. 

CONNECT store/store_password 

SELECT XMLELEMENT("cod_aluno", cod_aluno)
AS aluno
FROM taluno;
ALUNO
----------------------------
<cod_aluno>1</cod_aluno>
<cod_aluno>2</cod_aluno>
<cod_aluno>3</cod_aluno>
<cod_aluno>4</cod_aluno>
<cod_aluno>5</cod_aluno>
Conforme você pode ver a partir desses resultados, XMLELEMENT ("cod_aluno", cod_aluno)
retorna os valores de cod_aluno dentro de uma tag cod_aluno. Você pode usar o
nome de tag que desejar, como mostrado no exemplo a seguir, que utiliza a
tag "cod_alu":


SELECT XMLELEMENT("cod_alu", cod_aluno)
AS aluno
FROM TAluno;
ALUNO
--------------------
<cod_alu>1</cod_alu>
<cod_alu>2</cod_alu>
<cod_alu>3</cod_alu>
<cod_alu>4</cod_alu>
<cod_alu>5</cod_alu>
O exemplo a seguir obtém os valores de nome e cidade do aluno n° 2: 

SELECT XMLELEMENT("nome", nome) || XMLELEMENT("cidade", cidade)
AS alunos
FROM taluno
WHERE cod_aluno = 2;
ALUNOS
-----------------------------------------------------
<nome>MARCIO</nome><cidade>NOVO HAMBURGO</cidade>

O exemplo a seguir incorpora duas chamadas de XMLELEMENT() dentro de uma chamada externa
de XMLELEMENT(). Observe que os elementos cod_aluno e nome retornados estão contidos
dentro de um elemento customer externo: 

SELECT XMLELEMENT(
"aluno",
XMLELEMENT("cod_aluno", cod_aluno),
XMLELEMENT("nome", nome)
)
AS alunos FROM TAluno
WHERE cod_aluno IN (1, 2);
ALUNOS
------------------------------
<aluno>
<cod_aluno>1</cod_aluno>
<nome>PEDRO</nome>
</aluno>
<aluno>
<cod_aluno>2</cod_aluno>
<nome>MARCIO</nome>
</aluno >
OBS

Algumas quebras de linhas e espaços foram adicionados no código XML retornado por essa
consulta para torná-lo mais fácil de ler. O mesmo foi feito em alguns dos outros exemplos
deste capítulo. Você pode recuperar dados relacionais normais, assim como código XML,
conforme mostrado no exemplo a seguir, que recupera a coluna cod_aluno como um resultado
relacional normal e as colunas nome e cidade concatenadas como elementos XML:

SELECT cod_aluno, XMLELEMENT("aluno", nome) AS aluno
FROM TAluno;
COD_ALUNO ALUNO
----------- ----------------------------------
1 <aluno>PEDRO</aluno>
2 <aluno>MARCIO</aluno>
XMLFOREST()




Você usa XMLFOREST() para gerar uma “floresta” de elementos XML. XMLFOREST() concatena
elementos XML sem que você precise usar o operador de concatenação || com várias chamadas
de XMLELEMENT(). O exemplo a seguir usa XMLFOREST() para obter cod_aluno, nome e cidade
dos alunos n° 1 e 2:




SELECT XMLELEMENT(
"aluno",
XMLFOREST(
cod_aluno AS "cod",
nome AS "nome",
cidade AS "dob"
) )
AS aluno
FROM aluno
WHERE cod_aluno IN (1, 2);
ALUNO
-----------------------------
<aluno>
<id>1</id>
<nome>PEDRO</nome>
<cidade>PORTO ALEGRE</cidade>
</aluno>
<aluno>
<id>2</id>
<nome>MARCIO</nome>
<cidade>NOVO HAMBURGO</cidade>
</aluno>
A consulta a seguir coloca o nome do cliente dentro da tag de elemento aluno usado



XMLATTRIBUTES():

SELECT XMLELEMENT(
"aluno",
XMLATTRIBUTES(nome AS "nome"),
XMLFOREST(cidade AS "cidade", estado as “estado”)
)
AS xml_aluno
FROM TAluno
WHERE cod_aluno IN (1, 2);
XML_ALUNO
-------------------------------
<aluno nome="PEDRO">
<cidade>PORTO ALEGRE</cidade>
<estado>RS</estado>
</aluno>
<aluno nome="MARCIO">
<cidade>NOVO HAMBURGO</cidade>
<estado>02/05/1968</estado>
</aluno>



===================================================================
===================================================================
===================================================================
===================================================================
Manipulando XML - Scripts
===================================================================
--XML

SELECT XMLELEMENT("cod_aluno", cod_aluno) AS Aluno
FROM taluno;
/*
ALUNO                                                                           
--------------------------------------------------------------------------------
<cod_aluno>1</cod_aluno>
<cod_aluno>2</cod_aluno>
<cod_aluno>3</cod_aluno>
<cod_aluno>4</cod_aluno>
<cod_aluno>5</cod_aluno>
<cod_aluno>6</cod_aluno>
<cod_aluno>7</cod_aluno>
<cod_aluno>8</cod_aluno>
<cod_aluno>9</cod_aluno>
<cod_aluno>10</cod_aluno>
<cod_aluno>11</cod_aluno>
<cod_aluno>12</cod_aluno>
<cod_aluno>13</cod_aluno>
<cod_aluno>14</cod_aluno>
<cod_aluno>15</cod_aluno>
<cod_aluno>16</cod_aluno>
<cod_aluno>17</cod_aluno>
<cod_aluno>18</cod_aluno>
<cod_aluno>19</cod_aluno>
<cod_aluno>20</cod_aluno>
<cod_aluno>21</cod_aluno>
<cod_aluno>22</cod_aluno>
<cod_aluno>23</cod_aluno>
<cod_aluno>24</cod_aluno>
<cod_aluno>25</cod_aluno>
<cod_aluno>26</cod_aluno>
<cod_aluno>27</cod_aluno>
<cod_aluno>28</cod_aluno>
<cod_aluno>29</cod_aluno>
<cod_aluno>30</cod_aluno>
<cod_aluno>31</cod_aluno>
<cod_aluno>32</cod_aluno>
<cod_aluno>33</cod_aluno>
<cod_aluno>34</cod_aluno>
<cod_aluno>35</cod_aluno>
<cod_aluno>60</cod_aluno>
<cod_aluno>61</cod_aluno>
<cod_aluno>62</cod_aluno>
<cod_aluno>63</cod_aluno>

39 linhas selecionadas. 
*/


SELECT XMLELEMENT("Nome", Nome) || XMLELEMENT("Cidade", cidade)
AS Aluno
FROM taluno;
/*
ALUNO                                                   
<Nome>PAULA</Nome><Cidade>IVOTI</Cidade>                 
<Nome>MARIA</Nome><Cidade>SAPIRANGA</Cidade>             
<Nome>INSERT_ALL</Nome><Cidade>RS</Cidade>               
<Nome>MARCIO</Nome><Cidade>NOVO HAMBURGO</Cidade>        
<Nome>MARCO</Nome><Cidade>SAO PAULO</Cidade>             
<Nome>MARCELO</Nome><Cidade>SAO JOSE</Cidade>            
<Nome>DIOGENES</Nome><Cidade>TERESINA</Cidade>           
<Nome>REINALDO</Nome><Cidade>TERESINA</Cidade>           
<Nome>DIEGO</Nome><Cidade>PASSO FUNDO</Cidade>           
<Nome>ALFREDO234</Nome><Cidade>ALEGRETE</Cidade>         
<Nome>Marcio</Nome><Cidade>NOVO HAMBURGO</Cidade>        
<Nome>Paula</Nome><Cidade>CANOAS</Cidade>                
<Nome>Maria</Nome><Cidade>SAPIRANGA</Cidade>             
<Nome>Beta</Nome><Cidade>PORTO ALEGRE</Cidade>           
<Nome>Teresa</Nome><Cidade>CANOAS</Cidade>               
<Nome>Adon</Nome><Cidade>TUBARÃƒO</Cidade>               
<Nome>Ã?sis</Nome><Cidade>Florianopolis</Cidade>         
<Nome>Pimbo</Nome><Cidade>RIO BRANCO</Cidade>            
<Nome>ALEXANDRE</Nome><Cidade>FLORIANÃ“POLIS</Cidade>    
<Nome>Ubaldo</Nome><Cidade>SALVADOR</Cidade>             
<Nome>Wolney</Nome><Cidade>PORTO ALEGRE</Cidade>         
<Nome>Iury</Nome><Cidade>ARAGUAINA</Cidade>              
<Nome>Vania</Nome><Cidade>PINHAL</Cidade>                
<Nome>Mylla</Nome><Cidade> VACARIA</Cidade>              
<Nome>Pedro</Nome><Cidade>DOIS IRMAOS</Cidade>           
<Nome>Pedro</Nome><Cidade>DOIS IRMAOS</Cidade>           
<Nome>Aldo</Nome><Cidade>QUATRO IRMAOS</Cidade>          
<Nome>Pedro</Nome><Cidade>DOIS IRMAOS</Cidade>           
<Nome>Iuri</Nome><Cidade>FLORIANOPOLIS</Cidade>          
<Nome>Xita</Nome><Cidade>RIO BRANCO</Cidade>             
<Nome>Null</Nome><Cidade>TORRES</Cidade>                 
<Nome>Alberto</Nome><Cidade>CURITIBA</Cidade>            
<Nome>Beatriz</Nome><Cidade>VITÃ“RIA</Cidade>            
<Nome>Clodoaldo</Nome><Cidade>BELO HORIZONTE</Cidade>    
<Nome>Damaris</Nome><Cidade>CAMPO GRANDE</Cidade>        
<Nome>Everton</Nome><Cidade>MANAUS</Cidade>              
<Nome>FabÃ­ula</Nome><Cidade>RIO BRANCO</Cidade>         
<Nome>Jeferson</Nome><Cidade>RIO DE JANEIRO</Cidade>     
<Nome>Karen</Nome><Cidade>ANGRA DOS REIS</Cidade>        


39 linhas selecionadas.
*/


SELECT XMLELEMENT("DataContrato", TO_CHAR(data, 'MM/DD/YYYY'))||''
AS Data_Contrato
FROM tcontrato
WHERE COD_CONTRATO <=5;
/*
DATA_CONTRATO                             
<DataContrato>04/07/2021</DataContrato>    
<DataContrato>01/05/2013</DataContrato>    
<DataContrato>04/07/2021</DataContrato>    
<DataContrato>04/02/2021</DataContrato>    
<DataContrato>04/03/2021</DataContrato>    


Decorrido: 00:00:00.012
*/


SELECT XMLELEMENT("Aluno",
XMLELEMENT("cod_aluno", cod_aluno),
XMLELEMENT("nome", nome)) AS aluno
FROM taluno
WHERE COD_ALUNO <=10;
/*
ALUNO                                                            
<Aluno><cod_aluno>1</cod_aluno><nome>MARCO</nome></Aluno>         
<Aluno><cod_aluno>2</cod_aluno><nome>MARCELO</nome></Aluno>       
<Aluno><cod_aluno>3</cod_aluno><nome>DIOGENES</nome></Aluno>      
<Aluno><cod_aluno>4</cod_aluno><nome>REINALDO</nome></Aluno>      
<Aluno><cod_aluno>5</cod_aluno><nome>DIEGO</nome></Aluno>         
<Aluno><cod_aluno>6</cod_aluno><nome>ALFREDO234</nome></Aluno>    
<Aluno><cod_aluno>7</cod_aluno><nome>Marcio</nome></Aluno>        
<Aluno><cod_aluno>8</cod_aluno><nome>Paula</nome></Aluno>         
<Aluno><cod_aluno>9</cod_aluno><nome>Maria</nome></Aluno>         
<Aluno><cod_aluno>10</cod_aluno><nome>Beta</nome></Aluno>         


10 linhas selecionadas. 

Decorrido: 00:00:00.043
*/


-------------------------------

SELECT XMLELEMENT("Aluno",
XMLATTRIBUTES(cod_aluno AS "cod_aluno",nome as "nome",cidade AS "cidade" ) ) AS Aluno
FROM taluno
WHERE COD_ALUNO <=10;
/*
ALUNO                                                                
<Aluno cod_aluno="1" nome="MARCO" cidade="SAO PAULO"></Aluno>         
<Aluno cod_aluno="2" nome="MARCELO" cidade="SAO JOSE"></Aluno>        
<Aluno cod_aluno="3" nome="DIOGENES" cidade="TERESINA"></Aluno>       
<Aluno cod_aluno="4" nome="REINALDO" cidade="TERESINA"></Aluno>       
<Aluno cod_aluno="5" nome="DIEGO" cidade="PASSO FUNDO"></Aluno>       
<Aluno cod_aluno="6" nome="ALFREDO234" cidade="ALEGRETE"></Aluno>     
<Aluno cod_aluno="7" nome="Marcio" cidade="NOVO HAMBURGO"></Aluno>    
<Aluno cod_aluno="8" nome="Paula" cidade="CANOAS"></Aluno>            
<Aluno cod_aluno="9" nome="Maria" cidade="SAPIRANGA"></Aluno>         
<Aluno cod_aluno="10" nome="Beta" cidade="PORTO ALEGRE"></Aluno>      


10 linhas selecionadas. 

Decorrido: 00:00:00.015
*/


-------------------------------

SELECT XMLELEMENT("Aluno",
XMLFOREST( cod_aluno AS "codigo",nome AS "nome", cidade as "cidade")) AS Aluno
FROM TAluno
WHERE COD_ALUNO <=10;
/*
ALUNO                                                                                
<Aluno><codigo>1</codigo><nome>MARCO</nome><cidade>SAO PAULO</cidade></Aluno>         
<Aluno><codigo>2</codigo><nome>MARCELO</nome><cidade>SAO JOSE</cidade></Aluno>        
<Aluno><codigo>3</codigo><nome>DIOGENES</nome><cidade>TERESINA</cidade></Aluno>       
<Aluno><codigo>4</codigo><nome>REINALDO</nome><cidade>TERESINA</cidade></Aluno>       
<Aluno><codigo>5</codigo><nome>DIEGO</nome><cidade>PASSO FUNDO</cidade></Aluno>       
<Aluno><codigo>6</codigo><nome>ALFREDO234</nome><cidade>ALEGRETE</cidade></Aluno>     
<Aluno><codigo>7</codigo><nome>Marcio</nome><cidade>NOVO HAMBURGO</cidade></Aluno>    
<Aluno><codigo>8</codigo><nome>Paula</nome><cidade>CANOAS</cidade></Aluno>            
<Aluno><codigo>9</codigo><nome>Maria</nome><cidade>SAPIRANGA</cidade></Aluno>         
<Aluno><codigo>10</codigo><nome>Beta</nome><cidade>PORTO ALEGRE</cidade></Aluno>      


10 linhas selecionadas. 

Decorrido: 00:00:00.149
*/


SELECT XMLELEMENT("Aluno",
XMLFOREST(cod_aluno,nome,cidade)) AS Aluno
FROM taluno
WHERE COD_ALUNO <=10;
/*
ALUNO                                                                                      
<Aluno><COD_ALUNO>1</COD_ALUNO><NOME>MARCO</NOME><CIDADE>SAO PAULO</CIDADE></Aluno>         
<Aluno><COD_ALUNO>2</COD_ALUNO><NOME>MARCELO</NOME><CIDADE>SAO JOSE</CIDADE></Aluno>        
<Aluno><COD_ALUNO>3</COD_ALUNO><NOME>DIOGENES</NOME><CIDADE>TERESINA</CIDADE></Aluno>       
<Aluno><COD_ALUNO>4</COD_ALUNO><NOME>REINALDO</NOME><CIDADE>TERESINA</CIDADE></Aluno>       
<Aluno><COD_ALUNO>5</COD_ALUNO><NOME>DIEGO</NOME><CIDADE>PASSO FUNDO</CIDADE></Aluno>       
<Aluno><COD_ALUNO>6</COD_ALUNO><NOME>ALFREDO234</NOME><CIDADE>ALEGRETE</CIDADE></Aluno>     
<Aluno><COD_ALUNO>7</COD_ALUNO><NOME>Marcio</NOME><CIDADE>NOVO HAMBURGO</CIDADE></Aluno>    
<Aluno><COD_ALUNO>8</COD_ALUNO><NOME>Paula</NOME><CIDADE>CANOAS</CIDADE></Aluno>            
<Aluno><COD_ALUNO>9</COD_ALUNO><NOME>Maria</NOME><CIDADE>SAPIRANGA</CIDADE></Aluno>         
<Aluno><COD_ALUNO>10</COD_ALUNO><NOME>Beta</NOME><CIDADE>PORTO ALEGRE</CIDADE></Aluno>      


10 linhas selecionadas. 

Decorrido: 00:00:00.041
*/


SELECT  XMLELEMENT("Aluno",XMLATTRIBUTES(cod_aluno as "cod_aluno"),
        XMLFOREST(nome AS "nome", cidade AS "cidade", cep AS "cep")) AS aluno
FROM TALUNO
WHERE COD_ALUNO <=10;
/*
ALUNO                                                                                               
<Aluno cod_aluno="1"><nome>MARCO</nome><cidade>SAO PAULO</cidade><cep>1333010</cep></Aluno>          
<Aluno cod_aluno="2"><nome>MARCELO</nome><cidade>SAO JOSE</cidade><cep>88101090</cep></Aluno>        
<Aluno cod_aluno="3"><nome>DIOGENES</nome><cidade>TERESINA</cidade><cep>64039650</cep></Aluno>       
<Aluno cod_aluno="4"><nome>REINALDO</nome><cidade>TERESINA</cidade><cep>64039650</cep></Aluno>       
<Aluno cod_aluno="5"><nome>DIEGO</nome><cidade>PASSO FUNDO</cidade><cep>99001970</cep></Aluno>       
<Aluno cod_aluno="6"><nome>ALFREDO234</nome><cidade>ALEGRETE</cidade><cep>96200010</cep></Aluno>     
<Aluno cod_aluno="7"><nome>Marcio</nome><cidade>NOVO HAMBURGO</cidade><cep>93320970</cep></Aluno>    
<Aluno cod_aluno="8"><nome>Paula</nome><cidade>CANOAS</cidade><cep>89163413</cep></Aluno>            
<Aluno cod_aluno="9"><nome>Maria</nome><cidade>SAPIRANGA</cidade><cep>93800012</cep></Aluno>         
<Aluno cod_aluno="10"><nome>Beta</nome><cidade>PORTO ALEGRE</cidade><cep>90020180</cep></Aluno>      


10 linhas selecionadas. 

Decorrido: 00:00:00.146
*/


------------------------

SELECT XMLPARSE(CONTENT
'<TAluno><nome>Marcio Konrath</nome></TAluno>'
WELLFORMED
) AS ALUNO
FROM dual;
/*
ALUNO                                          
<TAluno><nome>Marcio Konrath</nome></TAluno>    


Decorrido: 00:00:00.010
*/

===========================================================================
===========================================================================
===========================================================================
===========================================================================
Criando arquivo XML a partir de tabela

--Primeiramente temos que configurar o Oracle para aceitar criar arquivos
--Abra o CMD como Administrador

set ORACLE_SID=curso -- curso -- xe -- ou como estiver criado


SQLPLUS CONNECT SYS/123 AS SYSDBA -- ou CONNECT SYS/123 AS SYSDBA
SQLPLUS SYS/123 AS SYSDBA

--Fechar o banco de dados
SHUTDOWN IMMEDIATE;


--Iniciar o banco de dos sem abrir
STARTUP MOUNT;



--Alterar o parâmetro UTL_FILE_DIR:
ALTER SYSTEM SET UTL_FILE_DIR = '*' SCOPE = SPFILE;


--Fechar novamente o banco
SHUTDOWN IMMEDIATE;


--Abrir o banco
STARTUP


--Verificar se o parâmetro foi alterado
SHOW PARAMETER UTL_FILE_DIR


--Dar privilegio para qualquer usuário para trabalhar com UTL_FILE
GRANT EXECUTE ON UTL_FILE TO PUBLIC;


--Conectar novamente ao usuário no SQL Developer

--Gerando arquivo xml

Declare
  p_directory VARCHAR2(100) := 'C:\Temp';
  p_file_name VARCHAR2(50) := 'arquivo.xml';
  v_file UTL_FILE.FILE_TYPE;
  v_amount INTEGER:= 32767;
  v_xml_data XMLType;
  v_xml clob;
  v_char_buffer VARCHAR2(32767);
BEGIN
  -- abre o arquivo para gravar o texto (até v_amount
  -- caracteres por vez)
  v_file:= UTL_FILE.FOPEN(P_DIRECTORY,p_file_name,'w', v_amount);
  -- grava a linha inicial em v_file
  UTL_FILE.PUT_LINE(v_file, '<?xml version="1.0"?>');
  -- recupera os alunos e os armazena em v_xml_data
  SELECT XMLELEMENT(
  "Aluno",
  XMLFOREST(
  cod_aluno AS "codigo",
  nome AS "nome"
  ))AS Aluno
  INTO v_xml_data
  from taluno where cod_aluno = 1; 
 
  -- obtém o valor da string de v_xml_data e o armazena em v_char_buffer
  v_char_buffer:= v_xml_data.GETSTRINGVAL();
  -- copia os caracteres de v_char_buffer no arquivo
  UTL_FILE.PUT(v_file, v_char_buffer);
  -- descarrega os dados restantes no arquivo
  UTL_FILE.FFLUSH(v_file);
  -- fecha o arquivo
  UTL_FILE.FCLOSE(v_file);
end;






--Lendo arquivo
DECLARE
  arq_leitura UTL_File.File_Type;
  Linha Varchar2(250);
BEGIN
  arq_leitura := UTL_File.Fopen('C:\Temp\','arquivo.xml', 'r');
  Dbms_Output.Put_Line('Processamento');
  Loop
    UTL_File.Get_Line(arq_leitura, Linha);
    DBMS_OUTPUT.PUT('Linha XML: '||Linha);
    exit;
  End Loop;
  UTL_File.Fclose(arq_leitura);
  Dbms_Output.Put_Line('Arquivo processado com sucesso.');
EXCEPTION
  WHEN No_data_found THEN
    UTL_File.Fclose(arq_leitura);
    Commit;
  WHEN UTL_FILE.INVALID_PATH THEN
    Dbms_Output.Put_Line('Diretório inválido.');
    UTL_File.Fclose(arq_leitura);
  WHEN Others THEN
  Dbms_Output.Put_Line ('Problemas na leitura do arquivo.');
  UTL_File.Fclose(arq_leitura);
END;


