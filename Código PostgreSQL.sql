--Primeiro, vamos criar um banco de dados vaquinha:
CREATE database Vaquinha_online
--CREATE DATABASE vaquinha: Este comando cria um novo banco de dados.

--depois, vamos criar a tabela vaquinha:
CREATE TABLE vaquinha (
    id SERIAL PRIMARY KEY,
    valor_total DECIMAL(10, 2)
);
/*CREATE TABLE vaquinha: Este comando cria uma nova tabela chamada vaquinha.
id SERIAL PRIMARY KEY: Cria uma coluna chamada id que é do tipo SERIAL e é a chave primária da tabela. O tipo SERIAL é um número inteiro que é automaticamente incrementado sempre que uma nova linha é inserida na tabela.
valor_total DECIMAL(10, 2): Cria uma coluna chamada valor_total que é do tipo DECIMAL. O tipo DECIMAL(10, 2) significa que a coluna pode armazenar números com até 10 dígitos, sendo 2 dígitos após a vírgula.*/

--Mas após isso temos que colocar um nome na vaquinha, como adicionar uma coluna nova numa tabela já criada? Simples
alter table vaquinha 
add column nome varchar(100);
-- VARCHAR(100): Cria uma coluna chamada descricao que é do tipo VARCHAR(100). Esta coluna armazena uma descrição para cada gasto com no máximo 100 carácter.

-- Agora vamos adicionar o valor e o nome da tabela 
insert into vaquinha (nome, valor_total) valus ('vaquinha Rio Grande do Sul',300000.00);

--Vamos ver nossa tabela
select * from vaquinha;

--Agora, vamos criar a tabela gastos:

CREATE TABLE gastos (
    id SERIAL PR
	
	Y,
    id_vaquinha INTEGER REFERENCES vaquinha(id),
    valor DECIMAL(10, 2),
    descricao VARCHAR(100),
    caminho_imagem VARCHAR(255)
);
/*
id_vaquinha INTEGER REFERENCES vaquinha(id): Cria uma coluna chamada id_vaquinha que é do tipo INTEGER e faz referência à coluna id da tabela vaquinha. Isso significa que cada gasto está associado a uma vaquinha.
caminho_imagem VARCHAR(255): Cria uma coluna chamada caminho_imagem que é do tipo VARCHAR(255). Esta coluna armazena o caminho para a imagem do comprovante de cada gasto.*/

-- Para inserir valor na tabela vamos usar esse comando
insert into gastos(id_vaquinha,valor,descriçao,caminho_imagem) values (1,7732.00,'Material PCD','C:\Users\USER\Área de Trabalho\-\Imagens trabalho\Teste2.jpg');

-- Agora o comando para fazer um relatório onde vai trazer o valor da vaquinha, todos os gastos é o restante de dinheiro depois de pagar os gastos:
select 
	'A VAQUINHA' as tipo,
	v.id as id,
	v.nome as DESCICAO,
	v.valor_total as VALOR
from vaquinha v
group by 1,2,3,4

union 

select 
	'OS GASTOS' as TABELA,
	g.id as id_gasto,
	g.descriçao,
	g.valor
from vaquinha v
join gastos g on g.id_vaquinha = v.id
group by 1,2,3,4

union

select 
	'RESTANTE' as TABELA,
	id_vaquinha,
	nome_vaquinha,
	restante
from(
	Select 
		id_vaquinha,
		nome_vaquinha,
		total_vaquinha,
		total_gasto,
		sum(total_vaquinha - total_gasto) as restante
	from (
		Select 
			v.id as id_vaquinha,
			v.nome as nome_vaquinha,
			v.valor_total as total_vaquinha,
			sum(g.valor) as total_gasto
		from vaquinha v
		join gastos g on g.id_vaquinha = v.id
		group by 1,2,3)a
	group by 1,2,3,4)b
group by 1,2,3,4
order by 1,2; 
	

