CREATE DATABASE exercicio01;

USE exercicio01;
drop database if exists exercicio01;
CREATE TABLE professores(
	id INTEGER,
    nome VARCHAR(60)
);

SHOW schemas;
SELECT id, nome from Professores;

insert into professores (id, nome) values (1, 'Ana Beatriz Santos');