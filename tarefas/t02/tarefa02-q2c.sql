CREATE OR REPLACE PROCEDURE exibir_funcionarios_acima_media_idade()
AS $$
DECLARE
  media_idade NUMERIC;
BEGIN
  -- Calcula a média de idade por departamento
  SELECT AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, f.dataNasc)))
  INTO media_idade
  FROM Departamento d
  JOIN Funcionario f ON d.codigo = f.depto;

  -- Exibe os funcionários com idade acima da média
  SELECT f.codigo, f.nome, f.dataNasc
  FROM Funcionario f
  JOIN Departamento d ON f.depto = d.codigo
  WHERE EXTRACT(YEAR FROM age(CURRENT_DATE, f.dataNasc)) > media_idade;
END;
$$ LANGUAGE plpgsql;
