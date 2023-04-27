-- Desabilitar Foreign Keys
SET session_replication_role = replica;

DROP TABLE IF EXISTS atividade CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;

-- Habilitando Foreign Keys
SET session_replication_role = DEFAULT;

-- Criação das Tabelas
CREATE TABLE funcionario (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  sexo CHAR(1),
  dtNasc DATE,
  salario DECIMAL(10, 2),
  codSupervisor INT,
  codDepto INT,
  CONSTRAINT funcSupFK FOREIGN KEY (codSupervisor) REFERENCES funcionario (codigo) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT funcDeptoFK FOREIGN KEY (codDepto) REFERENCES departamento (codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE departamento (
  codigo SERIAL PRIMARY KEY,
  sigla VARCHAR(10) UNIQUE,
  descricao VARCHAR(50),
  codGerente INT,
  CONSTRAINT depGerFK FOREIGN KEY (codGerente) REFERENCES funcionario (codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE projeto (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(50) UNIQUE,
  descricao VARCHAR(250),
  codResponsavel INT,
  codDepto INT,
  dataInicio DATE,
  dataFim DATE,
  CONSTRAINT projRespFK FOREIGN KEY (codResponsavel) REFERENCES funcionario (codigo) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT projDeptoFK FOREIGN KEY (codDepto) REFERENCES departamento (codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade (
  codigo SERIAL PRIMARY KEY,
  descricao VARCHAR(250),
  codProjeto INT,
  dataInicio DATE,
  dataFim DATE,
  CONSTRAINT atvProjFK FOREIGN KEY (codProjeto) REFERENCES projeto (codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Povoamento Inicial
INSERT INTO departamento (sigla, descricao, codGerente) VALUES ('DHC', 'Dep História', NULL);
INSERT INTO departamento (sigla, descricao, codGerente) VALUES ('DCT', 'Dep Computação', NULL);
INSERT INTO departamento (sigla, descricao, codGerente) VALUES ('DGC', 'Dep Geografia', NULL);
INSERT INTO departamento (sigla, descricao, codGerente) VALUES ('DXT', NULL, NULL);

INSERT INTO funcionario (nome, sexo, dtNasc, salario, codSupervisor, codDepto) VALUES ('Ana', 'F', '1988-05-07', 2500.00, NULL, 1);
INSERT INTO funcionario (nome, sexo, dtNasc, salario, codSupervisor, codDepto) VALUES ('Taciano', 'M', '1980-01-25', 2500.00, NULL, 2);

UPDATE departamento SET codGerente = 1 WHERE sigla = 'DHC';
UPDATE departamento SET codGerente = 2 WHERE sigla = 'DCT';

INSERT INTO funcionario (nome, sexo, dtNasc, salario, codSupervisor, codDepto) VALUES ('Maria', 'F', '1981-07-01', 2500.00, 1, 1);
INSERT INTO funcionario (nome, sexo, dtNasc, salario, codSupervisor, codDepto) VALUES ('Josefa', 'F', '1986-09-17', 2500.00, 1, 1);
INSERT INTO funcionario (nome, sexo, dtNasc, salario, codSupervisor, codDe
