-- View 1: Número de empregados por departamento e localidade
CREATE VIEW vw_emp_por_depto_local AS
SELECT d.department_name, d.location, COUNT(e.employee_id) AS total_empregados
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name, d.location;

-- View 2: Lista de departamentos e seus gerentes
CREATE VIEW vw_departamentos_gerentes AS
SELECT d.department_name, e.employee_name AS gerente
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id;

-- View 3: Projetos com maior número de empregados
CREATE VIEW vw_projetos_maior_emp AS
SELECT p.project_name, COUNT(ep.employee_id) AS total_empregados
FROM project_assignments ep
JOIN projects p ON ep.project_id = p.project_id
GROUP BY p.project_name
ORDER BY total_empregados DESC;

-- View 4: Lista de projetos, departamentos e gerentes
CREATE VIEW vw_projetos_depart_gerentes AS
SELECT p.project_name, d.department_name, e.employee_name AS gerente
FROM projects p
JOIN departments d ON p.department_id = d.department_id
JOIN employees e ON d.manager_id = e.employee_id;

-- View 5: Empregados com dependentes e se são gerentes
CREATE VIEW vw_emp_dependentes_gerentes AS
SELECT e.employee_name, 
       CASE WHEN dep.dependent_id IS NOT NULL THEN 'Sim' ELSE 'Não' END AS possui_dependente,
       CASE WHEN e.employee_id IN (SELECT manager_id FROM departments) THEN 'Sim' ELSE 'Não' END AS e_gerente
FROM employees e
LEFT JOIN dependents dep ON e.employee_id = dep.employee_id;
