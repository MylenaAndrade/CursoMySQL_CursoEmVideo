use cadastro;
select * from cursos
order by nome;

select * from cursos
order by nome desc;

select nome, carga, ano from cursos
order by nome;

select ano, carga, nome from cursos
order by ano, nome;

select * from cursos
where ano = '2016'
order by nome;

select nome, descricao, ano from cursos
where ano <= '2015'
order by ano, nome;

select * from cursos
where ano between '20' and '30'
order by nome;

select nome, descricao, ano from cursos
where ano in(2014,2016)
order by ano;

select nome, carga, totaulas from cursos
where carga > '35' and totaulas < '30';

select nome, carga, totaulas from cursos
where carga > '35' or totaulas < '30';