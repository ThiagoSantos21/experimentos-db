/*Questão 1*/
CREATE TABLE funcionario (
	cod DECIMAL(3, 0) PRIMARY KEY ,
	nome VARCHAR(40),
	salario DECIMAL(9,2),
	cargo VARCHAR(30),
	coddepto DECIMAL(3),
	comissao DECIMAL(9,2)
);

INSERT INTO funcionario (cod, nome, salario, cargo, coddepto, comissao) VALUES
(111, 'JOAO', 1000.00, 'Analista de Sistemas', 111, 100.00),
(222, 'ANA', 2000.00, 'Vendedora', 222, 200.00),
(333, 'LUIS', 3000.00, 'Analista de Sistemas', 111, 300.00),
(144, 'MARIA', 1500.00, 'Analista de Sistemas', 111, 100.00),
(515, 'ANGELA', 900.00, 'Vendedora', 222, 200.00),
(166, 'LUIS RICARDO', 5000.00, 'Analista de Sistemas', 111, 300.00);

/*Questão 2*/
CREATE TABLE requisicao (
	codreq DECIMAL(3),
	codfunc DECIMAL(3),
	datareq DATE
);

INSERT INTO requisicao (codreq, codfunc, datareq) VALUES
(1, 111, '2004-05-01'),
(2, 222, '2004-05-15'),
(3, 111, '2004-05-10');

/*Questão 3*/
SELECT * FROM funcionario

/*Questão 4*/
SELECT cod, nome FROM funcionario WHERE salario > 1000;

/*Questão 5*/
SELECT cod, nome, salario FROM funcionario WHERE salario > 1000 AND salario <=2000;

/*Questão 6*/
SELECT * FROM funcionario WHERE nome LIKE '%NA%' OR nome LIKE 'NA%' OR nome LIKE '%NA';

/*Questão 7*/
SELECT cod, nome FROM funcionario WHERE CAST(cod AS TEXT) LIKE '1%';


/*Questão 8*/
SELECT * FROM funcionario WHERE salario > 1000
ORDER BY cod;

/*Questão 9*/
SELECT * FROM funcionario WHERE salario > 1000
ORDER BY cod DESC;

/*Questão 10*/
SELECT * FROM funcionario WHERE salario > 1000
ORDER BY coddepto, salario DESC;

/*Questão 11*/
SELECT COUNT(*) FROM funcionario











