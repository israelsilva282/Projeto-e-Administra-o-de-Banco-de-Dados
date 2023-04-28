SELECT f.nome, f.salario, d.descricao
FROM funcionario f
JOIN departamento d ON f.coddepto = d.codigo
WHERE f.codigo NOT IN (SELECT codgerente FROM departamento)
ORDER BY d.codigo;