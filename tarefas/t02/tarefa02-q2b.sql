CREATE OR REPLACE FUNCTION calcular_media_idade_por_departamento()
  RETURNS TABLE (departamento_id INTEGER, media_idade NUMERIC) AS
$$
BEGIN
  RETURN QUERY
  SELECT d.codigo AS departamento_id, AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, f.dataNasc))) AS media_idade
  FROM Departamento d
  JOIN Funcionario f ON d.codigo = f.depto
  GROUP BY d.codigo;
END;
$$
LANGUAGE plpgsql;
