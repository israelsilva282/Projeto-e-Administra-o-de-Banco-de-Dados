SELECT projeto.nome, projeto.dataInicio, projeto.dataFim, atividade.descricao, atividade.dataInicio, atividade.dataFim
FROM projeto
JOIN atividade ON atividade.codProjeto = projeto.codigo
WHERE atividade.dataInicio < projeto.dataInicio OR atividade.dataFim > projeto.dataFim;