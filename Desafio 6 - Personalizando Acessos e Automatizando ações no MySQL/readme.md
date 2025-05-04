# Projeto: Views e Triggers no MySQL

## 📌 Parte 1 – Criação de Views com Controle de Acesso

Criadas 5 views para cenários de consulta comuns em empresas. Foram configuradas permissões para dois usuários fictícios:
- `gerente_user`: acesso completo às views.
- `employee_user`: acesso restrito.

### Views criadas:
1. Empregados por departamento e localidade
2. Departamentos e seus gerentes
3. Projetos com maior número de empregados
4. Projetos com departamentos e gerentes
5. Empregados com dependentes e se são gerentes

---

## 📌 Parte 2 – Triggers para E-commerce

### Triggers criadas:
- `trg_before_delete_user`: armazena dados de usuários antes da exclusão.
- `trg_before_update_salario`: registra alterações de salário em colaboradores.

Essas triggers aumentam a rastreabilidade e a confiabilidade dos dados mesmo após operações críticas.