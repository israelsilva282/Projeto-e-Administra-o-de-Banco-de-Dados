-- Faça uma consulta que selecione o nome, o salário e o departamento dos funcionários que não são gerentes, ordenando pelo Código do Departamento.

Select f.nome, f.salario, f.codDepto, d.sigla From funcionario f, departamento d Where f.nome not in (
    Select f.nome
    From funcionario f, departamento d
    Where f.codigo = d.codGerente
)
Group by nome
Order by f.codDepto ASC