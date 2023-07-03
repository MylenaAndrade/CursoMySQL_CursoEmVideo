/* Criação de um Banco de Dados de forma que aceite acentuação*/
create database cadastro
default character set utf8mb4
default collate utf8mb4_general_ci;

/* Comando para utilizar um determinado BD */
use <NOME_DO_BD>;

/* Comando para criar uma determinada tabela e de forma que aceite acentuação*/
create table <NOME_DA_TBL>(
	int not null auto_increment primary key,
	varchar(30) not null,
    date,
    enum('M','F') ,
    decimal(5,2), #(tamanho, numeroDeCasas),
    text,
    varchar(20) default 'Brasil'
)default charset = utf8;

/* Comando para inserir informações dentro da tabela*/
insert into <NOME_DA_TBL> values
('    ','  ',' ',' ', ' ', '  ', ' ');

/* Comando para visualizar a estrutura de uma determinada tabela */
desc <NOME_DA_TBL>;

/* Comando para alterar e adicionar uma coluna em uma determinada tabela*/
alter table <NOME_DA_TBL>
add column <NOME_DA_NOVA_COLUNA> varchar(10);

/* Comando para alterar e excluir uma coluna de uma determinada tabela*/
alter table <NOME_DA_TBL>
drop column <NOME_DA_ANTIGA_COLUNA>;

/* Comando para alterar e adicionar uma coluna com tipo e posição a ser incluida em uma determinada tabela*/
alter table <NOME_DA_TBL>
add column <NOME_DA_NOVA_COLUNA> <tipo> after <NOME_DE_UMA_TBL_EXISTENTE>;

alter table <NOME_DA_TBL>
add column <NOME_DA_NOVA_COLUNA> int first;

/* Comando para alterar e modificar uma característica da coluna de uma determinada tabela*/
alter table <NOME_DA_TBL>
modify column <NOME_DA_COLUNA> varchar(20) not null default '';

/* Comando para alterar e mudar o nome da coluna*/
alter table <NOME_DA_TBL>
change column <NOME_DA_COLUNA> <NOVO_NOME_DA_COLUNA> <tipo> not null default '';

/* Comando para alterar o nome de uma determinada tabela*/
alter table pessoas
rename to gafanhotos;

/* Comando para alterar um dado de um determinado elemento*/
update <NOME_DA_TBL>
set <NOME_DA_COLUNA> = '<NOVO_DADO>'
where <NOME_DA_COLUNA_COMPARATIVA> = '<IDENTIFICADOR>' limit 1;

/* Comando para deletar tuplas onde se aplicam a condição*/
delete from <NOME_DA_TBL>
where <NOME_DA_COLUNA> = '<NOME_DO_DADO>' limit 2;

/* Comando para apagar os dados de uma tabela */
truncate table <NOME_DA_TBL>;

/* Comando para visualizar todas as tuplas de uma determinada tabela*/
select * from <NOME_DA_TBL>;

/* Comando para selecionar todas as tuplas e ordena-las crescentemente*/
select * from <NOME_DA_TBL>
order by <COLUNA_DE_REFERENCIA_PARA_ORDENAR>;

/* Comando para selecionar todas as tuplas e ordena-las decrescentemente*/
select * from <NOME_DA_TBL>
order by <COLUNA_DE_REFERENCIA_PARA_ORDENAR> desc;

/* Comando para selecinar todas as tuplas onde uma condição é feita e tem que ser cumprida para ser selecionada*/
select * from <NOME_DA_TBL>
where <CONDIÇÃO> # <, >, <=, >=, AND, OR, 
order by <COLUNA_DE_REFERENCIA_PARA_ORDENAR> #pode ordenar seguindo mais de uma coluna;

/*Exemplo: */
select nome, descricao, ano from cursos
where ano <= '2015'
order by ano, nome;

/* Comando para selecionar todas as tuplas onde há uma condição entre duas informações*/
select * from <NOME_DA_TBL>
where <NOME_DA_COLUNA> between '<INFO>' and '<OUTRA_INFO>'
order by <COLUNA_DE_REFERENCIA_PARA_ORDENAR>;

select nome from pessoas
where id in(1,4,3) # O in serve para selecionar apenas as tuplas que possui aquela informação
order by nome;

/* Comando para selecionar todas as tuplas e comparar duas condições*/
select * from <NOME_DA_TBL>
where <CONDIÇÃO_1> and <CONDIÇÃO_2>; #pode utilizar or no lugar de and

/* Comando para selecionar todas as tuplas onde o dado de uma determinada 
coluna comece, termine ou tenha em alguma parte da palavra uma letra ou um 
conjunto de letras */
select * from <NOME_DA_TBL>
where <NOME_DA_COLUNA> like 'P%'; # '%P', '%P%', 'ph%p_' ou not like para negar, o _ é para indicar que tenha uma letra qualquer após

/* Comando para listar todas as tuplas com dados distintos*/
select distinct <NOME_DA_COLUNA> from <NOME_DA_TBL>;

/* Comando de agregação para contar todas as tuplas de uma determinada tabela*/
select count(*) from <NOME_DA_TBL>;

#Ex: Dando condição para um comando de agregação
select count(*) from cursos where carga > 40;

/* Comando de agregação para mostrar o maior dado*/
select max(<NOME_DA_COLUNA>) from <NOME_DA_TBL>;

#Ex: Dando condição para um comando de agregação
select min(totaulas) from cursos where ano = '2016';

/* Comando de agregação para somar todos os dados*/
select sum(<NOME_DA_COLUNA>) from <NOME_DA_TBL>;

/* Comando de agregação para calcular a média de dados de uma coluna*/
select avg(<NOME_DA_COLUNA>) from NOME_DA_TBL;

/* Comando de agrupamento*/
select <NOME_DA_COLUNA> from <NOME_DA_TBL>
group by <NOME_DA_COLUNA>; 

#Ex1: 
select carga, count(nome) from cursos
group by carga;

#Ex2: comando de agrupamento utilizando uma condição(having) que só colunas selecionadas pode entrar(ano)
select ano, count(*) from cursos
group by ano
having count(ano) >= 5
order by count(*) desc;

#Ex3: comando de agrupamento utilizando uma condição(having) onde há uma comparação entre dados de apenas a coluna que entrou
select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

/* Comando de Junção mostrando o resultado entre as duas tabelas*/
select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

/* Comando de Junção mostrando o resultado da tabela da direita ou da esquerda*/
select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c #right
on c.idcurso = g.cursopreferido;

#Ex: comando de junção utilizando 3 tabelas distintas
select g.nome, c.nome from gafanhotos g 
join gafanhoto_assiste_curso a 
on g.id = a.idgafanhoto
join cursos c
on c.idcurso = a.idcurso
order by g.nome;
select * from gafanhoto_assiste_curso;

/* Comando para fazer uma união entre duas tabelas*/
SELECT <COLUNAS_A_SEREM_JUNTADAS> FROM <NOME_DA_TBL_1>
UNION SELECT <COLUNAS_A_SEREM_JUNTADAS> FROM <NOME_DA_TBL_2>;

#Ex: 
SELECT id, nome FROM pessoas
UNION SELECT id, nome FROM projetos;
