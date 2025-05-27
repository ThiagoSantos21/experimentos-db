CREATE TABLE animais(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade SMALLINT,
    tutor_id INT,
    FOREIGN KEY (tutor_id) REFERENCES tutores(id)
);

CREATE TABLE tutores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(11),
    email VARCHAR(50)
);

CREATE TABLE consulta(
	id INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE,
    diagnostico VARCHAR(50),
    tratamento VARCHAR(50),
    retorno_marcado DATE,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES animais(id)
);

#Inserção no banco
INSERT INTO tutores(nome, telefone, email)
VALUES
	('Thiago Santos', '21888888888', 'thiagosantos@email.com'),
    ('Rafael Lima', '21666666666', 'rafaellima@email.com'),
    ('Marcos da Cruz', '21777777777', 'marcosdacruz@gmail.com');

INSERT INTO animais(nome, especie, raca, idade, tutor_id)
VALUES
	(

