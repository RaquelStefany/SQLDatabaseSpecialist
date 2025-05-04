USE ecommerce;

DELIMITER $$

CREATE PROCEDURE sp_gerenciar_produto (
    IN acao INT,
    IN p_id INT,
    IN p_nome VARCHAR(100),
    IN p_preco DECIMAL(10,2)
)
BEGIN
    IF acao = 1 THEN
        INSERT INTO produtos (nome, preco) VALUES (p_nome, p_preco);
    ELSEIF acao = 2 THEN
        UPDATE produtos SET nome = p_nome, preco = p_preco WHERE id = p_id;
    ELSEIF acao = 3 THEN
        DELETE FROM produtos WHERE id = p_id;
    ELSE
        SELECT 'Ação inválida';
    END IF;
END $$

DELIMITER ;

-- Exemplo de chamada
CALL sp_gerenciar_produto(2, 10, 'Camiseta Polo', 79.90);
