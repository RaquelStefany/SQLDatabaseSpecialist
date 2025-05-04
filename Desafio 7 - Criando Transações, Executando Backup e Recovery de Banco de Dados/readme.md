# Projeto: Transações e Backup com MySQL

## ✅ Parte 1 – Transações Manuais

Transação realizada com `START TRANSACTION`, `COMMIT` e `ROLLBACK` controlando modificações no banco. Exemplo usado: transferência de saldo entre contas.

## ✅ Parte 2 – Transações com Procedures

Uma `procedure` foi criada para transferir saldo entre contas com validação e uso de `SAVEPOINT` + rollback condicional.

## ✅ Parte 3 – Backup e Recovery

Backup completo utilizando `mysqldump`, incluindo:
- Estrutura e dados
- Procedures
- Eventos

### Comandos usados:

```bash
# Backup
mysqldump -u root -p --routines --events --databases ecommerce universidade > backup_geral.sql

# Restore
mysql -u root -p < backup_geral.sql
