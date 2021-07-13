-- Comentarios
-- A Linha abaixo cria um Banco de Dados
create database dbinfox;

-- A Linha Abaixo usa(seleciona) um Banco de Dados
use dbinfox;

-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- o comando a baixo descreve a tabela
describe tbusuarios;

-- A Linha abaixo insere Dados na tabela (CRUD)
-- CREATE -> Insert 
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Jonatas Ojeda','15998425709','jonatas','123456');

-- A Linha abaixo exibe os dados da tabela (CRUD)
-- read -> Select
select *from tbusuarios;

-- Create De novo para Mais Usuarios.
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Julio Silva','11 92002-5852','julio','123456');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Ramilson Felix','11 94475-0565','ramis','123456');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(4,'Administrador','15998455709','admin','admin');
-- read (Ler tabela a cima)
 

-- A Linha abaixo Modifica Dados na Tabela (CRUD)
-- Update -> update
update tbusuarios set fone = '15 99842-5709' where iduser=1;

-- A Linha abaixo Apaga um Registro na Tabela (CRUD)
-- Delete -> delete
delete from tbusuarios where iduser=3;

select *from tbusuarios;

-- Criando Tabela Para Clientes
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);
describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Jonatas Ojeda','Rua Jose Lambert 1031','15 99842-5709','jonatasojeda@hotmail.com');

select *from tbclientes;

-- Criando tabela de Ordem de Serviço (OS)
create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp, -- Esta linha de comando aqui puxa a Data e hora do serviço automaticamente
equipamento varchar(150) not null,
defeito varchar(150) not null,
serviço varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null, -- Ligaçao Chave Estrangeira
foreign key(idcli) references tbclientes(idcli) -- Chave Estrangeira Impede que tenha um equipamento sem um Cliente vinculado ou Obter dado de duas tabelas
);

describe tbos;
insert into tbos(equipamento,defeito,serviço,tecnico,valor, idcli)
values('Computador','Não Liga','Troca da Fonte','ZéPamonha',87.50, 1);

select *from tbos;

-- O Código a Baixo trás informações de Duas Tabelas (Une as tabelas)
select 
O.os,equipamento,defeito,serviço,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

select * from tbusuarios where login ='admin' and senha ='admin';
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Ramilson','15998425709','ramis','123456');
describe tbusuarios;
select *from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(5,'batatinha','9999999','batatinha','123');

describe tbusuarios;
-- Adicionar um Campo
alter table tbusuarios add column perfil varchar(20) not null;

-- Remover um Campo da Tabela
-- alter table tbusuarios drop column perfil;

-- Adicionando O Perfil dos Usuarios pelo ID
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;
update tbusuarios set perfil='admin' where iduser=4;
update tbusuarios set perfil='admin' where iduser=5;
