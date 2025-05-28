-- 1) Criação do banco
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

-- 2) Inserção dos registros

INSERT INTO tutores(nome, telefone, email)
VALUES
	('Thiago Santos', '21888888888', 'thiagosantos@email.com'),
    ('Rafael Lima', '21666666666', 'rafaellima@email.com'),
    ('Marcos da Cruz', '21777777777', 'marcosdacruz@gmail.com');

INSERT INTO animais(nome, especie, raca, idade, tutor_id)
VALUES
	('Thor','Cachorro','Golden',0,1),
	('Mel','Gato','Persa',0,1),
	('Fred','Gato','Siamês',0,1),
	('Nina','Cachorro','Labrador',0,2),
	('Zeca','Cachorro','Labrador',0,2),
	('Lola','Gato','Siamês',0,2),
	('Chico','Cachorro','Vira-lata',0,3),
	('Luke','Gato','Persa',0,3),
	('Pipoca','Cachorro','Vira-lata',0,3);

INSERT INTO consulta(data_consulta, diagnostico, tratamento, retorno_marcado, animal_id)
VALUES
    -- Animal 1: Thor (Golden)
    ('2025-02-10', 'Check-up e vacinação anual', 'Aplicação de vacina V10', '2025-02-17', 1),
    ('2025-05-15', 'Pata machucada', 'Limpeza e curativo', '2025-05-22', 1),

    -- Animal 2: Mel (Gato Persa)
    ('2025-03-05', 'Dermatite alérgica', 'Uso de shampoo medicamentoso', '2025-03-12', 2),
    ('2025-03-20', 'Retorno dermatite', 'Melhora no quadro, manter tratamento', '2025-03-27', 2),

    -- Animal 3: Fred (Gato Siamês)
    ('2025-04-01', 'Avaliação dentária', 'Presença de tártaro', '2025-04-08', 3),
    ('2025-04-15', 'Limpeza de tártaro', 'Procedimento realizado com sucesso', '2025-04-22', 3),

    -- Animal 4: Nina (Labrador)
    ('2025-02-20', 'Otite Canina', 'Medicação otológica por 10 dias', NULL, 4),
    ('2025-05-01', 'Alergia de pele', 'Uso de antialérgico', '2025-05-08', 4),

    -- Animal 5: Zeca (Labrador)
    ('2025-01-25', 'Gastroenterite', 'Dieta leve e probióticos', '2025-02-01', 5),
    ('2025-02-01', 'Consulta de retorno', 'Animal recuperado, alta', NULL, 5),

    -- Animal 6: Lola (Gato Siamês)
    ('2025-03-12', 'Check-up de rotina', 'Exames de sangue normais', '2025-03-19', 6),
    ('2025-05-20', 'Infecção urinária', 'Antibiótico e alteração na dieta', '2025-05-27', 6),

    -- Animal 7: Chico (Vira-lata)
    ('2025-04-18', 'Infestação por carrapatos', 'Aplicação de carrapaticida', '2025-04-25', 7),
    ('2025-05-26', 'Conjuntivite', 'Limpeza e colírio antibiótico', '2025-06-02', 7),

    -- Animal 8: Luke (Gato Persa)
    ('2025-02-14', 'Espirros constantes', 'Suspeita de gripe felina', '2025-02-21', 8),
    ('2025-02-21', 'Retorno gripe felina', 'Melhora, continuar medicação', '2025-02-28', 8),

    -- Animal 9: Pipoca (Vira-lata filhote)
    ('2025-01-10', 'Primeira consulta de filhote', 'Vermifugação', '2025-01-17', 9),
    ('2025-02-10', 'Primeira dose da vacina', 'Aplicação de vacina Puppy', '2025-02-17', 9);

-- 3) Consultas no banco

--a. Selecione todos os animais com idade superior a 10 anos.
SELECT * FROM animais WHERE idade > 10;
--b. Selecione todos os cães da raça "Labrador" que têm retorno marcado.
SELECT * FROM animais a 
JOIN consulta c ON c.animal_id = a.id
WHERE a.raca = 'Labrador' AND c.retorno_marcado = NULL
--c. Selecione todos os animais que já passaram por pelo menos uma consulta.
SELECT DISTINCTa.*
FROM animais a
JOIN consulta c ON a.id = c.animal_id;
--d. Selecione todos os animais que ainda não realizaram nenhuma consulta.
SELECTa.*
FROM animais a
LEFT JOIN consulta c ON a.id = c.animal_id
WHERE c.id IS NULL;
--e. Selecione todas as consultas com data de retorno marcada para uma data passada (ou seja, retorno em atraso).
SELECT * 
FROM consulta
WHERE retorno_marcado < NOW();
--f. Selecione o nome do tutor com o maior número de animais cadastrados.
SELECT t.nome
FROM tutores t
JOIN animais a ON t.id = a.tutor_id
GROUP BY t.id
ORDER BY COUNT(a.id) DESC
LIMIT 1;
--g. Selecione a espécie de animal mais atendida pela clínica.
SELECT a.especie
FROM animais a
JOIN consulta c ON a.id = c.animal_id
GROUP BY a.especie
ORDER BY COUNT(c.id) DESC
LIMIT 1;
--h. Selecione o nome do tutor com o maior número de consultas realizadas no último ano.
SELECT t.nome
FROM tutores t
JOIN animais a ON t.id = a.tutor_id
JOIN consulta c ON a.id = c.animal_id
WHERE c.data_consulta BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE()
GROUP BY t.id
ORDER BY COUNT(c.id) DESC
LIMIT 1;
--i. Selecione o animal com mais consultas realizadas ao longo do tempo.
SELECT a.nome, a.especie
FROM animais a
JOIN consulta c ON a.id = c.animal_id
GROUP BY a.id
ORDER BY COUNT(c.id) DESC
LIMIT 1;
--j. Selecione a média de consultas por animal.
SELECT (SELECT COUNT(*) FROM consulta) / (SELECT COUNT(*) FROM animais) AS media_consultas_por_animal;



