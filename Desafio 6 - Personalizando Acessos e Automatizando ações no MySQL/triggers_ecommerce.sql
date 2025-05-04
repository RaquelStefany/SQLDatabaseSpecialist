-- Trigger BEFORE DELETE: salvar informações de usuários removidos
CREATE TABLE deleted_users_backup (
    id INT,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_remocao DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_before_delete_user
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO deleted_users_backup (id, nome, email, data_remocao)
    VALUES (OLD.id, OLD.nome, OLD.email, NOW());
END $$
DELIMITER ;

-- Trigger BEFORE UPDATE: logar mudanças no salário de colaboradores
CREATE TABLE colaboradores_log (
    colaborador_id INT,
    antigo_salario DECIMAL(10,2),
    novo_salario DECIMAL(10,2),
    data_alteracao DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_before_update_salario
BEFORE UPDATE ON colaboradores
FOR EACH ROW
BEGIN
    IF OLD.salario <> NEW.salario THEN
        INSERT INTO colaboradores_log (colaborador_id, antigo_salario, novo_salario, data_alteracao)
        VALUES (OLD.id, OLD.salario, NEW.salario, NOW());
    END IF;
END $$
DELIMITER ;
