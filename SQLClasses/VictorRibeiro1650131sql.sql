create database empresa;
use empresa;

select*from tb_Departamentos;

create table tb_Funcionario(
Codigo int auto_increment primary key,
PrimeiroNome varchar(255),
SegundoNome varchar(255),
UltimoNome varchar(255),
DataNasci date,
CPF varchar(14) not null,
RG varchar(11),
Endereco varchar(255),
CEP varchar(9),
Cidade varchar(255),
Fone varchar(30),
CodigoDepartamento int references tb_Departamentos(fk_Codigo) ,
Funcao varchar(255),
Salario float not null 
);

create table tb_Departamentos(
fk_Codigo int auto_increment primary key,
Nome varchar(255),
Localizacao varchar (255),
CodigoFuncionarioGerente int 
);

alter table tb_Departamentos add foreign key (CodigoFuncionarioGerente) references tb_Funcionario(Codigo);
drop table tb_Departamentos;
drop table tb_Funcionario;

truncate table tb_Funcionario;


INSERT INTO tb_Departamentos(nome, localizacao) VALUES('TI', 'Segundo Andar');
INSERT INTO tb_Departamentos(nome, localizacao) VALUES('Gerencia', 'Segundo Andar');
INSERT INTO tb_Departamentos(nome, localizacao) VALUES('Direito', 'Primeiro Andar');
INSERT INTO tb_Departamentos(nome, localizacao) VALUES('Administrativo', 'Terceiro Andar');
INSERT INTO tb_Departamentos(nome, localizacao) VALUES('Projetos', 'Terceiro Andar');


insert into tb_Funcionario values (default,'Victor','Santos','Ribeiro','2001-02-13','54.888.888.5','777777','la na casa','144444444','São fael','5555555',1,'nenhuma',5000.00);
insert into tb_Funcionario values (default,'Victor','Santos','Filho','2015-02-22','54.999.999.9','555555','la na rua','5655555','São Sophia','5566665',1,'Ti',1000.00);
insert into tb_Funcionario values (default,'Victor','Santos','Neto','2002-08-19','54.777.878.7','333334','la no chao','03578000','São Tiago','2222222',4,'administrador',8000.00);
insert into tb_Funcionario values (default,'Victor','Santos','Bisneto','2001-07-23','54.666.666.6','3333333','la no teto','6666666','São Lucas','1111111',5,'projetista',10000.00);
insert into tb_Funcionario values (default,'Victor','Santos','Tataraneto','1990-05-30','54.413.818-1','2222222','la na LOLly','8888888','São Luis','9999999',4,'atendente',7000.00);


-- update nometabela set mudança where condicao

update tb_Departamentos set CodigoFuncionarioGerente = 2 where fk_codigo = 1 ;
update tb_Departamentos set CodigoFuncionarioGerente = 1 where fk_codigo = 2 ;
update tb_Departamentos set CodigoFuncionarioGerente = 3 where fk_codigo = 3 ;
update tb_Departamentos set CodigoFuncionarioGerente =  4 where fk_codigo = 4 ;
update tb_Departamentos set CodigoFuncionarioGerente =  5 where fk_codigo = 5 ;



-- 1
select Primeironome,SegundoNome from tb_Funcionario order by SegundoNome ;

-- 2
select * from tb_Funcionario order by cidade; 

-- 3
select * from tb_Funcionario where Salario is not null and Salario > 1000 order by PrimeiroNome;

-- 4
select PrimeiroNome,DataNasci from tb_Funcionario order by DataNasci ASC; 

-- 5 ) Liste os funcionários como uma listagem telefônica (sobrenome, primeironome, segundonome)
select SegundoNome,PrimeiroNome,UltimoNome from tb_Funcionario order by SegundoNome;

-- 6) 
select sum(Salario) as Folha_de_Pagamento from tb_Funcionario;

-- 7) Liste o nome, o nome do departamento e a função de todos os funcionários

-- 8) 




