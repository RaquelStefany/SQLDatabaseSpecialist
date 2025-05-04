# Projeto: Otimização de Banco de Dados com Índices e Procedures

Este repositório contém exemplos práticos de como otimizar consultas em banco de dados usando índices e procedimentos armazenados.

## 📌 Parte 1 – Criação de Índices

Foram criados índices baseando-se nas seguintes perguntas:

- Qual o departamento com maior número de pessoas?
- Quais são os departamentos por cidade?
- Relação de empregados por departamento

### Critérios usados para criar os índices:

- Colunas envolvidas em cláusulas WHERE, JOIN e GROUP BY.
- Foco em colunas com alta cardinalidade ou uso frequente.
- Evitamos índices em colunas pouco utilizadas ou com poucos valores distintos.

### Tipos de Índices:

- **B-Tree (padrão)**: utilizado para colunas com valores ordenáveis.
- Nenhum índice HASH foi necessário, pois nenhuma consulta exigia comparação exata com grande volume.

---

## 📌 Parte 2 – Procedure de Manipulação

Criamos procedures que permitem inserir, atualizar ou excluir registros com base em uma variável de controle (`acao`).

Exemplo:
- `acao = 1` → INSERT
- `acao = 2` → UPDATE
- `acao = 3` → DELETE

## 🧪 Banco de Dados Utilizados

- Universidade
- E-commerce

Cada banco contém sua própria procedure com variáveis de entrada e tratamento de ação condicional.