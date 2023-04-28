CREATE VIEW total_func_por_depto AS 
SELECT coddepto, count(*) as total_funcionarios FROM funcionario GROUP BY coddepto;

SELECT d.descricao as departamento, 
    COALESCE(f.nome, 'Sem gerente') as gerente, 
    COALESCE(t.total_funcionarios, 0) as total_funcionarios 
FROM departamento d
LEFT JOIN funcionario f ON d.codGerente = f.codigo 
LEFT JOIN total_func_por_depto t ON d.codigo = t.codDepto;
