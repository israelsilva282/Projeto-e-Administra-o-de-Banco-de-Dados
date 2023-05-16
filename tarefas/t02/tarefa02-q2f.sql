CREATE OR REPLACE PROCEDURE exibir_equipe_projeto(projeto_id INTEGER)
AS $$
BEGIN
  -- Exibe a equipe do projeto
  FOR membro IN SELECT f.nome AS nome_funcionario, d.sigla AS sigla_departamento
    FROM Membro m
    JOIN Funcionario f ON m.codFuncionario = f.codigo
    JOIN Departamento d ON f.depto = d.codigo
    WHERE m.codEquipe = (
      SELECT equipe FROM Projeto WHERE codigo = projeto_id
    )
  LOOP
    RAISE NOTICE 'Nome do Funcionário: %, Sigla do Departamento: %',
      membro.nome_funcionario, membro.sigla_departamento;
  END LOOP;
END;
$$ LANGUAGE plpgsql;
