DROP TABLE IF EXISTS atividade CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;

-- Criação das Tabelas
CREATE TABLE funcionario (
codigo SERIAL PRIMARY KEY,
nome varchar(50),
sexo char(1),
dtNasc date,
salario numeric(10,2),
codSupervisor int,
codDepto int,
FOREIGN KEY (codSupervisor) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE departamento (
codigo SERIAL PRIMARY KEY,
sigla varchar(10) UNIQUE,
descricao varchar(50),
codGerente int,
FOREIGN KEY (codGerente) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE projeto (
codigo SERIAL PRIMARY KEY,
nome varchar(50) UNIQUE,
descricao varchar(250),
codResponsavel int,
codDepto int,
dataInicio date,
dataFim date,
FOREIGN KEY (codResponsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (codDepto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade (
codigo SERIAL PRIMARY KEY,
descricao varchar(250),
codProjeto int,
dataInicio date,
dataFim date,
FOREIGN KEY (codProjeto) REFERENCES projeto(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

ALTER TABLE funcionario ADD CONSTRAINT funcDeptoFK FOREIGN KEY (codDepto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE;

