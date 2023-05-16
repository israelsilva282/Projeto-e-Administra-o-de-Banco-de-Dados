CREATE OR REPLACE FUNCTION calcular_atraso_atividade(data_fim DATE)
  RETURNS INTEGER AS
$$
BEGIN
  RETURN EXTRACT(DAY FROM age(CURRENT_DATE, data_fim));
END;
$$
LANGUAGE plpgsql;
