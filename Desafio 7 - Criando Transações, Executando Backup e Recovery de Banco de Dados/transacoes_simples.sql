-- Desabilita o autocommit
SET autocommit = 0;

-- Inicia a transação
START TRANSACTION;

-- Exemplo: Transferência de saldo entre clientes
UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;

-- Confirma a transação
COMMIT;

-- Em caso de erro, pode ser feito um ROLLBACK manual
-- ROLLBACK;
