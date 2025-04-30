# 📦 Desafio: Construindo seu Primeiro Projeto Lógico de Banco de Dados - E-commerce

## 🔍 Descrição

Este projeto visa a modelagem e implementação de um banco de dados relacional para um sistema de **e-commerce**, com base em práticas de modelagem lógica e refinamentos conceituais, utilizando o modelo EER (Entidade-Relacionamento Estendido).

O banco de dados contempla clientes (PJ e PF), pedidos, pagamentos, entregas, fornecedores, vendedores terceiros e produtos com controle de estoque. O projeto foi implementado em MySQL e contém criação de esquema, inserção de dados para testes e consultas SQL complexas.

---

## 🗂️ Estrutura do Modelo Lógico

### 👤 Cliente
- Contém dados genéricos de clientes.
- Pode ser **Pessoa Física (ClientePF)** ou **Pessoa Jurídica (ClientePJ)**, mas não ambos.

### 📦 Pedido
- Associado a um cliente.
- Possui múltiplos produtos, status e valor de frete.

### 💳 Pagamento
- Permite múltiplas formas de pagamento por pedido.
- Armazena valor e método utilizado.

### 🚚 Entrega
- Vinculada a um pedido.
- Contém status da entrega e código de rastreio.

### 📦 Produto
- Cada produto possui descrição, valor e categoria.

### 🏢 Fornecedor
- Cadastra fornecedores que disponibilizam produtos.

### 🛒 Vendedor Terceiro
- Vende produtos em nome da plataforma, com controle de quantidade.

### 🏪 Estoque
- Produtos podem estar disponíveis em múltiplos locais de estoque, com controle de quantidade.

---

## 🔐 Regras e Constraints

- `ClientePF` e `ClientePJ` compartilham a chave primária de `Cliente`.
- `Produto` pode estar relacionado a múltiplos estoques e fornecedores.
- `Pedido` pode conter múltiplos produtos.
- Cada `Entrega` e `Pagamento` pertence a um único `Pedido`.

---

## 🧪 Testes e Consultas SQL

O projeto inclui **consultas complexas** utilizando:

- `SELECT`, `WHERE`, `ORDER BY`, `HAVING`, `GROUP BY`, `JOIN`
- Expressões derivadas (ex: soma de pagamentos por pedido)
- Consultas analíticas (ex: produtos por estoque, fornecedores por produto)

### Exemplos:

- Quantos pedidos foram feitos por cliente
- Produtos vendidos por cada vendedor
- Produtos fornecidos por fornecedores
- Status das entregas com rastreamento
- Pedidos com múltiplos meios de pagamento

---

## 🧰 Tecnologias Utilizadas

- MySQL 8+
- Workbench para modelagem
- Script SQL para geração do esquema
