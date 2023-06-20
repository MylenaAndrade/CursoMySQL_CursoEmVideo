create	table if not exists cursos(
	nome varchar(30) not null unique,
    descricao text,
    carga int unsigned,
    totalaulas int,
    ano year default '2023'
)default charset = utf8;

alter table cursos
add column idcursos int first;

alter table cursos
add primary key (idcursos);

alter table cursos
modify column idcursos int auto_increment;

drop table if exists cursos;