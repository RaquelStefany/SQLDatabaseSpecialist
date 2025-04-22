# Desafio: Sistema de Controle de Ordens de Serviço - Oficina Mecânica

Este repositório contém a criação de um **esquema conceitual** a partir de uma narrativa real, proposto no curso **Formação SQL Database Specialist** da [DIO](https://www.dio.me/).

---

## 📚 Descrição do Projeto

### Contexto:

O projeto visa modelar um sistema de **controle e gerenciamento de ordens de serviço** para uma oficina mecânica, atendendo clientes que levam seus veículos para conserto ou revisão periódica.

### Narrativa:

- Clientes levam veículos para a oficina.
- Cada veículo é designado a uma **equipe de mecânicos**, que identifica os serviços necessários e gera uma **Ordem de Serviço (OS)**.
- A OS possui:
  - Número de OS
  - Data de emissão
  - Data prevista de conclusão
  - Valor total (mão de obra + peças)
  - Status (Aberta, Em Andamento, Finalizada, Cancelada)
- Os serviços a serem executados são calculados a partir de uma **tabela de referência de mão-de-obra**.
- O valor das peças utilizadas também compõe o valor final da OS.
- A execução dos serviços só ocorre após a autorização do cliente.
- A equipe de mecânicos é responsável tanto pela avaliação quanto pela execução dos serviços.
- Cada mecânico possui:
  - Código de identificação
  - Nome
  - Endereço
  - Especialidade

---

## 🗂 Entidades e Principais Atributos

- **Cliente**: idCliente (PK), nome, telefone, endereço.
- **Veículo**: idVeiculo (PK), placa, modelo, ano, idCliente (FK).
- **Mecânico**: idMecanico (PK), nome, endereço, especialidade.
- **Equipe**: idEquipe (PK).
- **Equipe_Mecanico**: idEquipe (FK), idMecanico (FK) — relacionamento de composição da equipe.
- **OrdemServico (OS)**: idOS (PK), dataEmissao, dataConclusaoPrevista, valorTotal, status, idVeiculo (FK), idEquipe (FK).
- **Servico**: idServico (PK), descricao, valorReferencia.
- **Peca**: idPeca (PK), descricao, valorUnitario.
- **Servico_OS**: idOS (FK), idServico (FK), quantidade, valorCalculado.
- **Peca_OS**: idOS (FK), idPeca (FK), quantidade, valorCalculado.

---

## 🔗 Relacionamentos

- Um **cliente** pode possuir vários **veículos**.
- Um **veículo** pertence a apenas um **cliente**.
- Uma **ordem de serviço** está associada a apenas um **veículo** e uma **equipe**.
- Uma **equipe** é composta por vários **mecânicos**.
- Uma **ordem de serviço** pode incluir vários **serviços** e várias **peças**.

---

## ⚙️ Assunções e Decisões de Modelagem

- Uma **equipe** é um agrupamento dinâmico de mecânicos para atender uma OS, podendo mudar a composição a cada serviço.
- O **valor total** da OS é a soma dos valores de serviços e peças.
- Os serviços e peças usados em uma OS são armazenados em tabelas associativas para suportar múltiplos itens por OS.
- O **status** da OS segue os estados típicos: _Aberta_, _Em andamento_, _Finalizada_ ou _Cancelada_.
- As especialidades dos mecânicos servem para futuros filtros de equipe especializada (não usado diretamente na OS no momento).

---

## 🛠 Tecnologias

- Modelagem Conceitual (DER) usando MySQL Workbench
- Modelagem Relacional
- SQL ANSI padrão

---

> Projeto desenvolvido para reforçar conceitos de modelagem de dados em bancos relacionais.
