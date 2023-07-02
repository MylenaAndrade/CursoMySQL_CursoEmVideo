use cadastro;

select carga from cursos
group by carga; 

select carga, count(nome) from cursos
group by carga;

select ano, count(*) from cursos
group by ano
having count(ano) >= 5
order by count(*) desc;


select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);
