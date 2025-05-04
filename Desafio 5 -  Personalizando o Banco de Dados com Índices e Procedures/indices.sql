-- Criação de índice para consulta 1: Qual o departamento com maior número de pessoas?
-- Justificativa: como vamos agrupar por ID ou nome do departamento, o índice deve ser na chave estrangeira do funcionário.
CREATE INDEX idx_emp_depto ON employees(department_id);

-- Consulta 1
SELECT department_id, COUNT(*) AS total_empregados
FROM employees
GROUP BY department_id
ORDER BY total_empregados DESC
LIMIT 1;

--------------------------------------------------

-- Criação de índice para consulta 2: Quais são os departamentos por cidade?
-- Justificativa: acesso frequente por cidade → índice sobre 'cidade' da tabela de departamentos.
CREATE INDEX idx_depto_cidade ON departments(city);

-- Consulta 2
SELECT city, department_name
FROM departments
ORDER BY city;

--------------------------------------------------

-- Criação de índice para consulta 3: Relação de empregados por departamento
-- Justificativa: uso frequente da relação funcionário → departamento → nome
CREATE INDEX idx_depto_nome ON departments(department_id);
CREATE INDEX idx_emp_depto2 ON employees(department_id);

-- Consulta 3
SELECT d.department_name, e.employee_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name;
