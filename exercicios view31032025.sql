
-- Criar uma view vw_livros_categorias (listar nome da categoria, nome do livro, id da categoria e id do livro)
-- Criar uma view vw_livros_editoras (listar nome da editora, nome do livro, ordenados por nome de editora)
-- Criar uma view vw_livros_editoras_autores 
-- 					 (listar nome do livro, autor, editora onde a quantidade de páginas for maior que 1000)

-- Criar uma view vw_livros_fantasia (listar nome do livro, quantidade de paginas, descricao) da categoria 'Fantasia'
-- Criar uma view vw_livros_autor_tolkien (listar nome do livro, nome do autor) filtrar autor 'J.R.R. Tolkien'
-- Criar uma view vw_livros_por_categoria (listar nome da categoria, quantidade livros) group by necessário
-- Criar uma view vw_paginas_por_autor (listar nome do autor, soma da quantidade de páginas) group by necessário


use SuperBiblioteca;
-- Criar uma view vw_livros_autores (listar nome do livro, quantidade de paginas, nome autor e id do autor)
-- create view vw_livros_autores as 
	select 	
		livros.nome as 'livro',
        livros.quantidade_paginas as 'paginas',
        autores.nome as 'Autor',
        autores.id as 'id'
        from livros
        inner join autores on (livros.id_autor = autores.id)
        
        

