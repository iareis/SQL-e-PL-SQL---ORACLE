SELECT * FROM USER_TRIGGERS;

================================================
================================================
================================================
================================================

TRIGGER_NAME            TRIGGER_TYPE       TRIGGERING_EVENT             TABLE_OWNER   BASE_OBJECT_TYPE   TABLE_NAME          COLUMN_NAME   REFERENCING_NAMES                   WHEN_CLAUSE         STATUS     DESCRIPTION                                                                                                                                     ACTION_TYPE   TRIGGER_BODY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CROSSEDITION   BEFORE_STATEMENT   BEFORE_ROW   AFTER_ROW   AFTER_STATEMENT   INSTEAD_OF_ROW   FIRE_ONCE   APPLY_SERVER_ONLY   


TRI_CONTRATOS_PARES      INSTEAD OF          INSERT OR UPDATE OR DELETE    IAREIS         VIEW                V_CONTRATOS_PARES                   REFERENCING NEW AS NEW OLD AS OLD                         ENABLED     TRI_CONTRATOS_PARES
INSTEAD OF INSERT OR DELETE OR UPDATE ON V_CONTRATOS_PARES
                                                                  PL/SQL         DECLARE
BEGIN 
    INSERT INTO LOG(USUARIO, HORARIO, OBS)
    VALUES(USER, SYSDATE, 'DML DA VIEW V_CONTRATOS_PARES');
END;                                                                                                                                                                                                                                                                                                                                                                                                                                                                         NO              NO                  NO            NO           NO                 NO                NO           NO                   
VALIDA_HORARIO_CURSO2    BEFORE STATEMENT    INSERT OR UPDATE OR DELETE    IAREIS         TABLE               TCONTRATO                           REFERENCING NEW AS NEW OLD AS OLD                         ENABLED     VALIDA_HORARIO_CURSO2
BEFORE INSERT OR UPDATE OR DELETE ON TCONTRATO
                                                                            PL/SQL         BEGIN 
    IF  (TO_CHAR(SYSDATE, 'D') IN (1, 7) OR
         TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 23) THEN
         IF( INSERTING ) THEN
            RAISE_APPLICATION_ERROR(-20001, 'NAO PODE INSERIR');
         ELSIF( DELETING ) THEN
            RAISE_APPLICATION_ERROR(-20002, 'NAO PODE REMOVER');
         ELSIF( UPDATING('TOTAL') ) THEN
            RAISE_APPLICATION_ERROR(-20003, 'NAO PODE ALTERAR TOTAL');
         ELSE
            RAISE_APPLICATION_ERROR(-20004, 'NAO PODE ALTERAR');
         END IF;
    END IF;
END;   
                                     NO              NO                  NO            NO           NO                 NO                YES          NO                   
AUDITA_ALUNO             AFTER EACH ROW      INSERT OR UPDATE OR DELETE    IAREIS         TABLE               TALUNO                              REFERENCING NEW AS NEW OLD AS OLD                         ENABLED     AUDITA_ALUNO
AFTER INSERT OR DELETE OR UPDATE ON TALUNO
FOR EACH ROW    --EXECUTA PARA CADA LINHA AFETADA // SEM ELA, EXECUTA APENAS UMA VEZ
    PL/SQL         BEGIN 
    IF      ( DELETING ) THEN
            INSERT INTO LOG(USUARIO, HORARIO, OBS)
            VALUES(USER, SYSDATE, 'LINHAS DELETADAS.');
    ELSIF   ( INSERTING ) THEN 
            INSERT INTO LOG(USUARIO, HORARIO, OBS)
            VALUES(USER, SYSDATE, 'LINHAS INSERIDAS.');
    ELSIF   ( UPDATING('SALARIO') ) THEN 
            INSERT INTO LOG
            VALUES(:OLD.NOME, SYSDATE, :OLD.SALARIO, :NEW.SALARIO, 'SALARIO ALTERADO.');
    ELSE
            INSERT INTO LOG(USUARIO, HORARIO, OBS)
            VALUES(USER, SYSDATE, 'ATUALIZACAO ALUNO.');
    END IF;
END; 

   NO              NO                  NO            NO           NO                 NO                YES          NO                   
GERA_LOG_CURSO           BEFORE EACH ROW     UPDATE                        IAREIS         TABLE               TCURSO                              REFERENCING NEW AS NEW OLD AS OLD                         ENABLED     GERA_LOG_CURSO
BEFORE UPDATE OF VALOR ON TCURSO
FOR EACH ROW
                                                                                    PL/SQL         BEGIN 
    INSERT INTO LOG (USUARIO, HORARIO, OBS, VALOR_ANTIGO, VALOR_NOVO)
    VALUES(USER, SYSDATE, 'CURSO ALTERADO: '||:OLD.NOME, :OLD.VALOR, :NEW.VALOR);
END; 

                                                                                                                                                                                                                                                                                                                                                                                                                               NO              NO                  NO            NO           NO                 NO                YES          NO                   
CAL_COMISSAO             BEFORE EACH ROW     INSERT OR UPDATE              IAREIS         TABLE               TCONTRATO                           REFERENCING NEW AS NEW OLD AS OLD    NEW.TOTAL >= 5000    ENABLED     CAL_COMISSAO
BEFORE INSERT OR UPDATE OF TOTAL ON TCONTRATO
--REFERENCING OLD AS ANTIGO 
--            NEW AS NOVO
FOR EACH ROW
                  PL/SQL         DECLARE
    V_COMISSAO NUMERIC(6,2) := 0.15;
BEGIN 
    IF (:NEW.TOTAL <= 10000) THEN
        :NEW.VALOR_COMISSAO := :NEW.TOTAL * (V_COMISSAO);
    ELSE
        :NEW.VALOR_COMISSAO := :NEW.TOTAL * (V_COMISSAO+0.01);
    END IF;
END; 

                                                                                                                                                                                                                                                                                                                                                          NO              NO                  NO            NO           NO                 NO                YES          NO                   
GERA_LOG_ALT             AFTER STATEMENT     UPDATE                        IAREIS         TABLE               TCONTRATO                           REFERENCING NEW AS NEW OLD AS OLD                         ENABLED     GERA_LOG_ALT
AFTER UPDATE OF TOTAL ON TCONTRATO
                                                                                                 PL/SQL         DECLARE
BEGIN 
    INSERT INTO LOG(USUARIO, HORARIO)
    VALUES(USER, SYSDATE); 
END;      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        NO              NO                  NO            NO           NO                 NO                YES          NO                   
VALIDA_HORARIO_CURSO     BEFORE STATEMENT    INSERT OR DELETE              IAREIS         TABLE               TCONTRATO                           REFERENCING NEW AS NEW OLD AS OLD                         DISABLED    VALIDA_HORARIO_CURSO
BEFORE INSERT OR DELETE ON TCONTRATO
                                                                                       PL/SQL         BEGIN 
    IF (TO_CHAR(SYSDATE, 'D') IN (1, 7) OR
        TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))
        NOT BETWEEN 8 AND 15) THEN
        Raise_Application_Error (-20001, 'FORA DO HORARIO COMERCIAL');
    END IF;
END;                                                                                                                                                                                                                                                                                                                                                                           NO              NO                  NO            NO           NO                 NO                YES          NO                   


7 linhas selecionadas. 

Decorrido: 00:00:00.037






