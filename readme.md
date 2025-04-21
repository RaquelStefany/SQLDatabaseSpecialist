# Projeto: Sistema de Gerenciamento de Pedidos e Estoque

## Contexto

O projeto consiste no desenvolvimento de um esquema relacional para um sistema de controle de pedidos de clientes, gestão de estoque de produtos, fornecedores, vendedores terceirizados e entregas. Ele contempla a modelagem de clientes, produtos, fornecedores, pedidos, estoque e entrega, com suporte a múltiplas formas de pagamento.

## Entidades principais:

- **Cliente**: Cadastro de clientes, podendo ser Pessoa Física (CPF) ou Pessoa Jurídica (CNPJ).
- **Pedido**: Registro de pedidos feitos por clientes, com descrição, status e frete.
- **Produto**: Catálogo de produtos disponíveis.
- **Fornecedor**: Empresas que disponibilizam produtos.
- **Estoque**: Armazém de produtos e quantidades disponíveis.
- **Entrega**: Status de envio e rastreamento de pedidos.
- **Pagamento**: Controle das formas de pagamento utilizadas nos pedidos.
- **Vendedor Terceiro**: Revendedores de produtos específicos.

## Regras do sistema:

- Um cliente pode ser Pessoa Física ou Pessoa Jurídica, nunca ambos.
- Um pedido pode ter múltiplas formas de pagamento.
- Cada pedido tem uma entrega associada com status e código de rastreio.

## Tecnologias usadas:

- MySQL
- MySQL Workbench

---
