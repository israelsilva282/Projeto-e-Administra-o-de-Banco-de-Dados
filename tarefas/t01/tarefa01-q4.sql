SELECT funcionario.nome, funcionario.salario, departamento.descricao 
FROM funcionario 
JOIN departamento ON funcionario.coddepto = departamento.codigo 
WHERE funcionario.codigo NOT IN (SELECT codgerente FROM departamento) 
ORDER BY departamento.codigo;
