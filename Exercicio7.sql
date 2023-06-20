use cadastro;

select * from cursos
where nome like 'P%';

select * from cursos
where nome like '%A';

select * from cursos
where nome like '%A%';

select * from cursos
where nome not like '%A%';

select * from cursos
where nome like 'ph%p_';

select distinct nacionalidade from gafanhotos
order by nacionalidade;

select count(*) from cursos;

select count(*) from cursos where carga > 40;

select max(carga) from cursos;

select max(totaulas) from cursos where ano = '2016';

select sum(totaulas) from cursos where ano = '2016';

select avg(totaulas) from cursos where ano = '2016';
