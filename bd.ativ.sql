CREATE DATABASE faculdade;
USE faculdade;


CREATE TABLE grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255)
);


CREATE TABLE aluno (
    ra CHAR(8) PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    id_grupo INT,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    disciplina VARCHAR(100)
) AUTO_INCREMENT = 10000;


CREATE TABLE avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_grupo INT,
    id_professor INT,
    data_hora DATETIME,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);


INSERT INTO grupo (nome, descricao) VALUES
('Grupo Alpha', 'Sistema de controle de temperatura'),
('Grupo Beta', 'App de gestão financeira');

INSERT INTO aluno VALUES
('20230001', 'João', 'joao@email.com', 1),
('20230002', 'Maria', 'maria@email.com', 1),
('20230003', 'Pedro', 'pedro@email.com', 2),
('20230004', 'Ana', 'ana@email.com', 2);

INSERT INTO professor (nome, disciplina) VALUES
('Carlos', 'Banco de Dados'),
('Fernanda', 'Engenharia de Software'),
('Ricardo', 'Algoritmos');

INSERT INTO avaliacao (id_grupo, id_professor, data_hora, nota) VALUES
(1, 10000, '2026-04-20 10:00:00', 8.5),
(1, 10001, '2026-04-20 10:30:00', 9.0),
(2, 10000, '2026-04-21 11:00:00', 7.5),
(2, 10002, '2026-04-21 11:30:00', 8.0);

SELECT * FROM grupo;
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM avaliacao;

SELECT g.nome, p.nome, a.data_hora
FROM avaliacao a
JOIN grupo g ON a.id_grupo = g.id_grupo
JOIN professor p ON a.id_professor = p.id_professor
ORDER BY g.nome, a.data_hora;

SELECT g.nome, p.nome, a.data_hora
FROM avaliacao a
JOIN grupo g ON a.id_grupo = g.id_grupo
JOIN professor p ON a.id_professor = p.id_professor
WHERE g.id_grupo = 1
ORDER BY a.data_hora;

SELECT DISTINCT g.nome
FROM avaliacao a
JOIN grupo g ON a.id_grupo = g.id_grupo
WHERE a.id_professor = 10000
ORDER BY g.nome;

SELECT g.nome, al.nome, p.nome, a.data_hora
FROM avaliacao a
JOIN grupo g ON a.id_grupo = g.id_grupo
JOIN aluno al ON al.id_grupo = g.id_grupo
JOIN professor p ON a.id_professor = p.id_professor
ORDER BY g.nome, al.nome;

SELECT COUNT(DISTINCT nota)
FROM avaliacao;

SELECT p.id_professor, p.nome,
       AVG(a.nota),
       SUM(a.nota)
FROM avaliacao a
JOIN professor p ON a.id_professor = p.id_professor
GROUP BY p.id_professor, p.nome;

SELECT g.id_grupo, g.nome,
       AVG(a.nota),
       SUM(a.nota)
FROM avaliacao a
JOIN grupo g ON a.id_grupo = g.id_grupo
GROUP BY g.id_grupo, g.nome;

SELECT p.id_professor, p.nome,
       MIN(a.nota),
       MAX(a.nota)
FROM avaliacao a
JOIN professor p ON a.id_professor = p.id_professor
GROUP BY p.id_professor, p.nome;

SELECT g.id_grupo, g.nome,
       MIN(a.nota),
       MAX(a.nota)
FROM avaliacao a
JOIN grupo g ON a.id_grupo = g.id_grupo
GROUP BY g.id_grupo, g.nome;
