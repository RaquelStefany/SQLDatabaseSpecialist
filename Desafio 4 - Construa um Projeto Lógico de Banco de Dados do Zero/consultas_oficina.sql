-- 1. Lista de todos os clientes e seus veículos
SELECT c.Nome, v.Placa, v.Marca, v.Modelo
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente;

-- 2. Ordens de serviço abertas com descrição do problema
SELECT os.idOS, v.Placa, os.Descricao
FROM OrdemServico os
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
WHERE os.Status = 'Aberta';

-- 3. Valor total estimado dos serviços por ordem
SELECT es.OrdemServico_idOS, SUM(s.PrecoBase) AS TotalEstimado
FROM ExecucaoServico es
JOIN Servico s ON es.Servico_idServico = s.idServico
GROUP BY es.OrdemServico_idOS;

-- 4. Peças mais utilizadas em execuções
SELECT p.Nome, SUM(pu.Quantidade) AS TotalUsado
FROM PecasUsadas pu
JOIN Peca p ON pu.Peca_idPeca = p.idPeca
GROUP BY p.Nome
HAVING SUM(pu.Quantidade) > 5
ORDER BY TotalUsado DESC;

-- 5. Serviços executados por mecânico
SELECT m.Nome AS Mecanico, COUNT(*) AS TotalServicos
FROM ExecucaoServico es
JOIN Mecanico m ON es.Mecanico_idMecanico = m.idMecanico
GROUP BY m.Nome
ORDER BY TotalServicos DESC;
