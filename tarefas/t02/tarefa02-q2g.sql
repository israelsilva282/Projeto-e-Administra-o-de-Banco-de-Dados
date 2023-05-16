CREATE OR REPLACE FUNCTION calcular_quantidade_atividades_membro(cod_membro INTEGER, cod_projeto INTEGER)
  RETURNS INTEGER AS
$$
DECLARE
  quantidade_atividades INTEGER;
BEGIN
  SELECT COUNT(*) INTO quantidade_atividades
  FROM AtividadeMembro am
  JOIN Atividade a ON am.codAtividade = a.codigo
  WHERE am.codMembro = cod_membro AND a.codProjeto = cod_projeto;

  RETURN quantidade_atividades;
END;
$$
LANGUAGE plpgsql;
