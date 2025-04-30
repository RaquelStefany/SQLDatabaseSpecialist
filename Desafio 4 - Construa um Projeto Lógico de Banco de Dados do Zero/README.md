# 🔧 Projeto de Banco de Dados - Oficina Mecânica

## 📘 Descrição

Este projeto tem como objetivo modelar e implementar um banco de dados para o controle de uma **oficina mecânica**. O modelo contempla o cadastro de clientes, veículos, ordens de serviço, mecânicos, peças utilizadas e serviços prestados.

O banco de dados foi desenvolvido utilizando o modelo relacional com base no esquema conceitual proposto, contendo chaves primárias, estrangeiras e constraints necessárias para manter a integridade referencial. Foram incluídas inserções de teste e consultas SQL complexas para análise dos dados.

---

## 🗂️ Estrutura do Modelo Lógico

### 👤 Cliente
- Dados pessoais (nome, telefone, endereço).
- Pode ter múltiplos veículos.

### 🚗 Veículo
- Cada veículo pertence a um cliente.
- Armazena placa, marca, modelo e ano.

### 📋 Ordem de Serviço
- Associada a um veículo.
- Inclui data de abertura, status e descrição do problema.

### 🧰 Serviço
- Tipos de serviços executados (ex: troca de óleo, revisão).

### 🔩 Peça
- Catálogo de peças utilizadas nos reparos.

### 👨‍🔧 Mecânico
- Responsável pela execução dos serviços.

### 🔧 Execução de Serviço
- Registra o serviço executado em uma OS por um mecânico.
- Pode utilizar várias peças com quantidade e valor unitário.

---

## 🔐 Regras e Constraints

- Cada cliente pode ter vários veículos.
- Cada OS pode envolver múltiplos serviços.
- Cada serviço pode usar diversas peças.
- Cada execução de serviço é feita por um mecânico.

---

## 🧪 Consultas SQL Avançadas

Inclui consultas com:

- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, `JOIN`
- Atributos derivados (ex: valor total do serviço)
- Consultas analíticas (ex: serviços por mecânico, peças mais usadas)

---

## 🧰 Tecnologias Utilizadas

- MySQL 8+
- Workbench ou DBeaver
- Scripts `.sql` para estrutura e testes

---

## 📝 Como Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seuusuario/banco-oficina.git
   ```

2. Execute os scripts:
   - `create_schema.sql`: criação das tabelas
   - `insert_dados.sql`: dados para testes
   - `consultas.sql`: queries solicitadas

---

## 👩‍💻 Autora

**Raquel Stefany**  
📧 seu-email@dominio.com  
🔗 [linkedin.com/in/seu-perfil](https://linkedin.com/in/seu-perfil)

---

## ✅ Status do Projeto

✔️ Modelagem Lógica  
✔️ Script de Criação do Esquema  
✔️ Inserção de Dados  
✔️ Consultas SQL Avançadas  
🚧 Relatórios e Interface Web (futura etapa)
