SELECT p.codigo, p.descricao
FROM projeto p
INNER JOIN departamento d ON d.codigo = p.codDepto
INNER JOIN funcionario f ON f.codigo = d.codGerente
WHERE f.salario > ALL (
    SELECT f2.salario
    FROM funcionario f2
    INNER JOIN departamento d2 ON d2.codGerente = f2.codigo
    WHERE d2.codigo <> d.codigo
);
