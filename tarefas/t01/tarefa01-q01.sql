-- Faça uma consulta que selecione o nome dos funcionários que recebem salários superiores aos salários pagos no departamento 2.

SELECT f.nome, f.salario
FROM funcionario f
WHERE f.salario > ANY (
SELECT f1.salario
FROM funcionario f1, departamento d
WHERE f1.codDepto = d.codigo AND d.codigo = 2
)