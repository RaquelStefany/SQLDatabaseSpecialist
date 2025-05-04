DELIMITER $$

CREATE PROCEDURE sp_transferir_saldo (
    IN origem_id INT,
    IN destino_id INT,
    IN valor DECIMAL(10,2)
)
BEGIN
    DECLARE erro BOOLEAN DEFAULT FALSE;

    -- Início da transação
    START TRANSACTION;

    -- Savepoint (opcional)
    SAVEPOINT ponto_inicial;

    -- Tenta debitar da conta origem
    UPDATE contas SET saldo = saldo - valor WHERE id = origem_id;
    IF ROW_COUNT() = 0 THEN
        SET erro = TRUE;
    END IF;

    -- Tenta creditar na conta destino
    UPDATE contas SET saldo = saldo + valor WHERE id = destino_id;
    IF ROW_COUNT() = 0 THEN
        SET erro = TRUE;
    END IF;

    -- Verifica erro
    IF erro THEN
        ROLLBACK TO ponto_inicial;
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;

-- Exemplo de chamada:
CALL sp_transferir_saldo(1, 2, 200.00);
