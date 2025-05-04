-- Criação de usuários
CREATE USER 'gerente_user'@'%' IDENTIFIED BY 'senha123';
CREATE USER 'employee_user'@'%' IDENTIFIED BY 'senha123';

-- Permissões para gerente
GRANT SELECT ON empresa.vw_emp_por_depto_local TO 'gerente_user'@'%';
GRANT SELECT ON empresa.vw_departamentos_gerentes TO 'gerente_user'@'%';
GRANT SELECT ON empresa.vw_projetos_maior_emp TO 'gerente_user'@'%';
GRANT SELECT ON empresa.vw_projetos_depart_gerentes TO 'gerente_user'@'%';
GRANT SELECT ON empresa.vw_emp_dependentes_gerentes TO 'gerente_user'@'%';

-- Permissões para employee (limitado)
GRANT SELECT ON empresa.vw_emp_dependentes_gerentes TO 'employee_user'@'%';
GRANT SELECT ON empresa.vw_projetos_maior_emp TO 'employee_user'@'%';

-- Revogar acesso indevido (caso tenha sido concedido)
REVOKE ALL PRIVILEGES ON empresa.* FROM 'employee_user'@'%';
-- Concede apenas acesso a views específicas novamente (como acima)
