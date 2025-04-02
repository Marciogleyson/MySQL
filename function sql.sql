create database MinhaLoja;
use MinhaLoja;

create table produtos(
	id int primary key auto_increment,
    nome varchar(100) not null,
    estoque int not null
);

insert into produtos (nome, estoque) value
("Uva", 10),
("Maça", 100);

-- Métodos com e sem retorno
-- procedure é método sem retorno
-- funcition é método com retorno
-- dentro de functions/procedures vc pode colocar regras de negócio, fazer ações como insert, update, delete, create...alter-- ao invés de colocar isso no python, java....

drop procedure if exists somar_numeros;
delimiter $;

create procedure somar_numeros()
begin
	select 40 + 12;
end $;
delimiter ;

-- Aqui é a chamada para executar a procedure
call somar_numeros();
call somar_numeros();    


-- in: entrada
-- out: saída

drop procedure if exists somar_numeros;
delimiter $;
create procedure somar_numeros(
	in p_numero1 int,
    in p_numero2 int
)
begin
-- Criar uma variável para armazenar a soma dos números do tipo inteiro
declare soma int;
-- Calcular a soma e armazenar na variável soma
	select p_numero1 + p_numero2 into soma;
    
    -- mesmo código em python
    -- soma = numero1 + numero2
    -- let soma = numero1 + numero2;
    
    -- Apresentar a soma
    select soma;
end $;
delimiter ;

-- Aqui é a chamada para executar a procedure
call somar_numeros(40, 12);
call somar_numeros(18, 28); 



drop procedure if exists calcular_media;
delimiter $;
create procedure calcular_media(
 in p_media1 int,
 in p_media2 int,
 in p_media3 int
 )
 begin 
	select (p_media1 + p_media2 + p_media3) / 3;
end $;
delimiter ;

call calcular_media(9, 6, 7);
call calcular_media(5, 9, 3);    

drop procedure if exists atualizar_estoque;

delimiter /;
create procedure atualizar_estoque(
	in p_id_produto int,
    in p_quantidade_nova int
)
begin
	update produtos set estoque = estoque + p_quantidade_nova where id = p_id_produto;
	select * from produtos where id = p_id_produto;
end /;
delimiter ;

call atualizar_estoque(1, 10);

-- decimal é semelhante floar e double, porém o decimal tem amis precisão de ponto flutuante
-- porém decimal(m, d)
-- m seria a precisão total (quantidade total de digito)
-- d seria a escala (quantidade de digitos após a írgula)
-- decimal(4, 2) => 10.99 ou 99.99

delimiter $fim
create function calcular_imc(p_peso decimal(5, 2), p_altura decimal(3, 2)) 
returns decimal(5, 2)
deterministic
begin

	declare imc decimal(5, 2);
    set imc := p_peso / (p_altura * p_altura);
    return imc;
end $fim
delimiter ;

select calcular_imc(80, 2.00);

-- deterministic: retornam sempre o mesmo erro para os mesmo parâmetros, independentemente de qualquer outro fator,
--	Ex: uma função que soma dois números
-- not deterministic: podem retornar valores diferentes mesmo com os mesmo parâmetros, geralmente porque
--					dependem de variáveis do ambiente ( como/hora atual, dados em outras tabelas que podem mudar, etc..).
--					Exemplo: um função que usa NOW() ou consulta alguma tabela para compor o resultado.