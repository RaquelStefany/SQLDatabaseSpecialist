-- 01 - Quais os nomes e identificações de todos os clientes cadastrados?
SELECT Nome, Identificação
FROM Cliente;

-- 02 - Quais pedidos estão com o status “Em Transporte”?
SELECT idPedido, `Status do Pedido`, Descrição
FROM Pedido
WHERE `Status do Pedido` = 'Em Transporte';

-- 03 - Qual o valor total pago em cada pedido (somando todos os pagamentos)?
SELECT Pedido_idPedido, SUM(Valor) AS TotalPago
FROM Pagamento
GROUP BY Pedido_idPedido;

-- 04 - Liste os produtos cadastrados em ordem decrescente de valor.
SELECT Descrição, CAST(Valor AS DECIMAL(10,2)) AS Valor
FROM Produto
ORDER BY Valor DESC;

-- 05 - Quais pedidos têm mais de uma forma de pagamento?
SELECT Pedido_idPedido, COUNT(*) AS QuantidadePagamentos
FROM Pagamento
GROUP BY Pedido_idPedido
HAVING COUNT(*) > 1;

-- 06 - Relação de nomes dos fornecedores e nomes dos produtos fornecidos
SELECT f.`Razão Social` AS Fornecedor, p.Descrição AS Produto
FROM Fornecedor f
JOIN `Disponibilizando um Produto` dp ON f.idFornecedor = dp.Fornecedor_idFornecedor
JOIN Produto p ON p.idProduto = dp.Produto_idProduto;

-- 07 - Quantos pedidos foram feitos por cada cliente?
SELECT c.Nome, COUNT(p.idPedido) AS QuantidadePedidos
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.Nome;

-- 08 - Quais produtos estão disponíveis em qual local e em que quantidade?
SELECT p.Descrição AS Produto, e.Local, pe.Quantidade
FROM Produto p
JOIN Produto_has_Estoque pe ON p.idProduto = pe.Produto_idProduto
JOIN Estoque e ON e.idEstoque = pe.Estoque_idEstoque;

-- 09 - Vamos supor que CNPJ de fornecedores e vendedores pode coincidir
SELECT v.`Razão Social` AS Vendedor, f.`Razão Social` AS Fornecedor, f.CNPJ
FROM `Terceiro - Vendedor` v
JOIN Fornecedor f ON v.`Razão Social` = f.`Razão Social`;

-- 10 - Qual o status e código de rastreio das entregas realizadas?
SELECT e.idEntrega, e.StatusEntrega, e.CodigoRastreio, p.idPedido
FROM Entrega e
JOIN Pedido p ON e.Pedido_idPedido = p.idPedido;