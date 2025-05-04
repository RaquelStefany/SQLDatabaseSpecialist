USE universidade;

DELIMITER $$

CREATE PROCEDURE sp_gerenciar_aluno (
    IN acao INT,
    IN p_id INT,
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(100)
)
BEGIN
    CASE 
        WHEN acao = 1 THEN
            INSERT INTO alunos (nome, email) VALUES (p_nome, p_email);
        WHEN acao = 2 THEN
            UPDATE alunos SET nome = p_nome, email = p_email WHERE id = p_id;
        WHEN acao = 3 THEN
            DELETE FROM alunos WHERE id = p_id;
        ELSE
            SELECT 'Ação inválida';
    END CASE;
END $$

DELIMITER ;

-- Exemplo de chamada
CALL sp_gerenciar_aluno(1, NULL, 'João Silva', 'joao@email.com');
