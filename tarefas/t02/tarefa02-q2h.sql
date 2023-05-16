CREATE OR REPLACE FUNCTION calcular_porcentagem_atividades_membro(cod_membro INTEGER, cod_projeto INTEGER)
  RETURNS NUMERIC AS
$$
DECLARE
  total_atividades INTEGER;
  atividades_membro INTEGER;
  porcentagem NUMERIC;
BEGIN
  SELECT COUNT(*) INTO total_atividades
  FROM Atividade
  WHERE codProjeto = cod_projeto;

  SELECT COUNT(*) INTO atividades_membro
  FROM AtividadeMembro am
  JOIN Atividade a ON am.codAtividade = a.codigo
  WHERE am.codMembro = cod_membro AND a.codProjeto = cod_projeto;

  IF total_atividades = 0 THEN
    porcentagem := 0;
  ELSE
    porcentagem := (atividades_membro::NUMERIC / total_atividades) * 100;
  END IF;

  RETURN porcentagem;
END;
$$
LANGUAGE plpgsql;
