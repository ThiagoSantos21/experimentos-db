-- a)
CREATE TABLE genero (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

-- b)
CREATE TABLE editora (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL
);

-- c)
CREATE TABLE livro (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(255) NOT NULL,
	preco DECIMAl(6,2) NOT NULL,
    genero_id INTEGER NOT NULL,
    editora_id INTEGER NOT NULL,
    FOREIGN KEY (genero_id) REFERENCES genero(id),
    FOREIGN KEY (editora_id) REFERENCES editora(id)
);

-- d)
INSERT INTO genero (nome)
VALUES
	('Ficção Científica'),
    ('Romance');

INSERT INTO editora (nome, pais)
VALUES
	('Companhia das letras', 'Brasil'),
    ('HarperColins', 'Estados Unidos');

-- e)
INSERT INTO livro (titulo, preco, genero_id, editora_id)
VALUES
	('Duna', 89.90, 1, 2),
    ('Orgulho e preconceito', 59.90, 2, 2),
    ('A Máquina do tempo', 45.00, 1, 1);

-- f)
SELECT l.titulo, l.preco, g.nome AS genero, e.nome AS editora FROM livro l
JOIN editora e ON e.id = l.editora_id
JOIN genero g ON g.id = l.genero_id;

-- g)
SELECT l.titulo, l.preco, e.nome AS editora FROM livro l
JOIN editora e ON e.id = l.editora_id
JOIN genero g ON g.id = l.genero_id
WHERE g.nome = 'Romance';

-- h)
SELECT g.nome, ROUND(AVG(l.preco), 2) AS media FROM genero g
JOIN livro l ON l.genero_id = g.id
GROUP BY g.nome;

-- i)
SELECT e.nome FROM livro l
JOIN editora e ON e.id = l.editora_id
ORDER BY l.preco DESC
LIMIT 1;
