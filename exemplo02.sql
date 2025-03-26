drop database if exists SuperlojaDb;
create database SuperLojaDb;
use SuperLojaDb;

-- default é o valor padrão que será utilizado no insert, caso não seja informado valor para coluna
create table marcas(
	id INT primary key auto_increment,
    nome varchar(45) not null,
    cnpj varchar(18) default '00.000.000/0000-00',
    data_criacao DATETIME default now()
    );
    
    insert into marcas (nome, cnpj) values ('Hyundai', '10.394.422/0001-20'); #id 1
    insert into marcas (nome) values ('Volksagen'); #id 2
    insert into marcas (nome, cnpj) values ('Chevrolet', NULL); # id 3
    
    -- AS é um apelido
    select 
		ma.id as 'Código',
        ma.name as 'Marca',
        ma.cnpj as 'CNPJ',
        ma.data_criacao as 'Data de criação'
        from marcas as ma;
        
	create table carros(
		id int primary key auto_increment,
        modelo varchar(45) not null,
        cor varchar(30) not null,
        descricao varchar(1000),
        
        id_marca int not null,
        
        data_criacao DATETIME default now(),
        
        -- foreign key(<coluna-da-tabela-atual>) references <tabela-pai>(<coluna-pk-da-tabela-pai>)
        foreign key (id_marca) references marcas(id)
        );
        
        -- PK -> Primary Kay => Chave primária
        -- FK -> Foreign Key => Chave estrangeira
        
        -- Uma chave estrangeira server para relacionar um registro de uma tabela a outra tabela.
        -- obrigatoriamente um FX tem que estar atrelado a um PK.
			