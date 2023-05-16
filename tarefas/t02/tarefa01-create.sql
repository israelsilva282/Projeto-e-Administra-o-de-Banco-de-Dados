CREATE TABLE funcionario (
codigo serial,
nome varchar(15) NOT NULL,
sexo char(1) DEFAULT NULL,
dataNasc date DEFAULT NULL,
salario decimal(10,2) DEFAULT NULL,
supervisor int,
depto int,
PRIMARY KEY (codigo),
CONSTRAINT funcSuperFK FOREIGN KEY (supervisor) REFERENCES funcionario(codigo) on
delete set null on update cascade
);

CREATE TABLE departamento (
codigo serial,
sigla varchar(15) NOT NULL UNIQUE,
descricao varchar(25) NOT NULL,
gerente int,
PRIMARY KEY (codigo),
CONSTRAINT depGerenteFK FOREIGN KEY (gerente) REFERENCES funcionario(codigo) on delete
set null on update cascade
);

alter table funcionario ADD CONSTRAINT funcDeptoFK FOREIGN KEY (depto) REFERENCES
departamento(codigo) on delete set null on update cascade;

CREATE TABLE equipe (
codigo serial,
nomeEquipe varchar(45) DEFAULT NULL,
PRIMARY KEY (codigo)
);