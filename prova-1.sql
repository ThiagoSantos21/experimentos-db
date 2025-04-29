create table CLIENTES  (Cod_Cli varchar(4), Nome_Cli varchar(20), Cidade varchar(15), Limite_Credito decimal(10,2)); 
alter table CLIENTES add constraint pk_clientes primary key (Cod_Cli);

insert into CLIENTES values ('0101', 'José C. Santos', 'Campinas', 10500.00);
insert into CLIENTES values ('0102', 'Maria Oliver', 'Campinas', 7500.00);
insert into CLIENTES values ('0103', 'Ana Gimenes', 'Valinhos', 12500.00);
insert into CLIENTES values ('0104', 'José Porto', 'Campinas', 14500.00);
insert into CLIENTES values ('0105', 'Ana Erickson', 'Valinhos', 8500.00);
insert into CLIENTES values ('0106', 'Paulo Amaro', 'Itatiba', 16500.00);
insert into CLIENTES values ('0107', 'Ruth Almeida', 'Itatiba', 12500.00);
insert into CLIENTES values ('0108', 'João Dickson', 'Itatiba', 0.00);
insert into CLIENTES values ('0109', 'Carla Alves', 'Valinhos', 20500.00);
insert into CLIENTES values ('0110', 'Caê Cerri', 'Campinas', 22000.00);
insert into CLIENTES values ('0120', 'João Alves', 'Itatiba', 0.00);
insert into CLIENTES values ('0121', 'Cátia Abreu', 'Valinhos', 20500.00);
insert into CLIENTES values ('0122', 'Ana Morris', 'Campinas', 22000.00);
insert into CLIENTES values ('2121', 'Paula Morgado', 'Campinas', 2000.00);

create table VENDAS (Cod_Cli varchar(4), Data_Venda date, Valor decimal(10,2));

insert into VENDAS values 
	('0101', str_to_date('22/02/2023', '%d/%m/%Y'), 1500.00),
	('0101', str_to_date('25/02/2023', '%d/%m/%Y'), 2000.00),
	('0101', str_to_date('27/02/2023', '%d/%m/%Y'), 3500.00),
	('0101', str_to_date('22/03/2023', '%d/%m/%Y'), 3500.00),
	('0102', str_to_date('22/03/2023', '%d/%m/%Y'), 1500.00),
	('0102', str_to_date('12/02/2023', '%d/%m/%Y'),   500.00),
	('0103', str_to_date('22/02/2023', '%d/%m/%Y'), 1500.00),
	('0104', str_to_date('25/02/2023', '%d/%m/%Y'), 2000.00),
	('0105', str_to_date('27/02/2023', '%d/%m/%Y'), 5500.00),
	('0105', str_to_date('22/03/2023', '%d/%m/%Y'), 2000.00),
	('0105', str_to_date('22/03/2023', '%d/%m/%Y'), 3500.00),
	('0106', str_to_date('12/02/2023', '%d/%m/%Y'),2500.00),
	('0107', str_to_date('02/02/2023', '%d/%m/%Y'), 1500.00),
	('0107', str_to_date('05/03/2023', '%d/%m/%Y'), 2000.00),
	('0108', str_to_date('27/08/2023', '%d/%m/%Y'), 5500.00),
	('0108', str_to_date('23/02/2023', '%d/%m/%Y'), 2000.00),
	('0109', str_to_date('22/02/2023', '%d/%m/%Y'), 1500.00),
	('0110', str_to_date('12/03/2023', '%d/%m/%Y'),2500.00),
	('0120', str_to_date('20/02/2023', '%d/%m/%Y'), 1500.00),
	('0121', str_to_date('26/02/2023', '%d/%m/%Y'), 2000.00),
	('0122', str_to_date('14/02/2023', '%d/%m/%Y'), 2500.00),
	('2121', str_to_date('04/03/2023', '%d/%m/%Y'), 2500.00),
	('2121', str_to_date('22/02/2023', '%d/%m/%Y'),  500.00);

-- Thiago Lima Santos
-- 21012009

/*Questão 1*/

-- a)
select cod_cli, nome_cli from CLIENTES where limite_credito > 12000;
-- b)
select cod_cli, nome_cli from CLIENTES where limite_credito > 12000 and cidade = 'Campinas';
-- c)
select cod_cli, nome_cli from CLIENTES where limite_credito = (select max(limite_credito) from CLIENTES);
-- d)
select distinct cidade from CLIENTES;
-- e)
select max(limite_credito) from CLIENTES;
-- f)
select avg(limite_credito) from CLIENTES where Cidade = 'Valinhos';
-- g)
update CLIENTES set limite_credito = limite_credito * 1.2 where cidade = 'Valinhos';
-- h)
delete from CLIENTES where cidade = 'Itatiba' and limite_credito = '0';
-- i)
select sum(valor) from VENDAS where cod_cli = '2121';
-- j)
select sum(valor) from VENDAS where cod_cli = '2121' and data_venda = str_to_date('04/03/2023', '%d/%m/%Y');
-- k)
select * from VENDAS where valor > 3000;
-- l)
select valor, data_venda from VENDAS where cod_cli = (select cod_cli from CLIENTES where nome_cli = 'José C. Santos');
-- m)
select sum(valor) from VENDAS where cod_cli = (select cod_cli from CLIENTES where nome_cli = 'José C. Santos');
-- n)
select cod_cli, data_venda, valor from VENDAS where valor between 3000 and 5000;

/* Questão 2 */

-- a)
create table TIPO(
	CodTipo int not null auto_increment,
    NomeTipo varchar(40) not null,
    primary key (CodTipo)
);

create table PRODUTOS (
	CodProd int not null auto_increment, 
    DescProd varchar(40) not null, 
    CodTipo int not null, 
    Qtd int not null, 
    Valor_Unit decimal(10,2) not null,
    primary key (CodProd),
    foreign key (CodTipo) references TIPO(CodTipo)
); 
-- b)

insert into TIPO values
	('Higiene'),
    ('Alimentos'),
    ('Limpeza');

insert into PRODUTOS values
	('Pasta de dente', 0, 500, 10),
    ('Sabonete liquido', 0, 200, 30),
    ('Arroz Branco', 1, 300, 15),
    ('Maçã Argentina', 1, 100, 40),

    ('Vassoura', 2, 50, 25);
