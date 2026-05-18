-- banco de dados datalumini

CREATE DATABASE datalumini;

USE datalumini;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaosocial VARCHAR(255),
cnpj CHAR(11),
statusEmpresa TINYINT);

CREATE TABLE usuario(
idusuario INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(255),
senha VARCHAR(255),
cpf CHAR(11),
fkEmpresa INT, 
CONSTRAINT chfkempresausuario
FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa));

CREATE TABLE usuario_estufa (
idusuestufa INT PRIMARY KEY AUTO_INCREMENT,
fkUsuario INT,
fkEstufa INT,
CONSTRAINT fkusuarioestufa
FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario));

CREATE TABLE estufa (
idEstufa INT PRIMARY KEY AUTO_INCREMENT,
nomeEstufa VARCHAR(255),
statusEstufa TINYINT,
limiteMaximo FLOAT,
limiteMinimo FLOAT,
fkEmpresa INT,
CONSTRAINT chfkempresaestufa
FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE setor (
idsetor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkEstufa INT,
CONSTRAINT fksetorestufa
FOREIGN KEY (fkEstufa) REFERENCES estufa(idEstufa)
);

 CREATE TABLE estante (
 idEstante INT PRIMARY KEY AUTO_INCREMENT,
 numeroIdentificador INT,
 fkSetor INT,
 CONSTRAINT fksetorestante 
 FOREIGN KEY (fkSetor) REFERENCES setor (idSetor)
 );
 
 CREATE TABLE prateleira (
 idPrateleira INT PRIMARY KEY AUTO_INCREMENT,
  numeroIdentificador INT,
  fkEstante INT,
  CONSTRAINT fkestanteprateleira
  FOREIGN KEY (fkEstante) REFERENCES estante (idEstante)
 );
 
CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(255),
statusSensor TINYINT,
dtinstalacao DATETIME,
dtAtualizacao DATETIME,
fkPrateleira INT UNIQUE,
CONSTRAINT chfkestufasensor 
FOREIGN KEY (fkPrateleira) REFERENCES Prateleira (idPrateleira));

CREATE TABLE leitura(
idLeitura INT AUTO_INCREMENT,
freqLuminosidade FLOAT,
dtCaptDados DATETIME DEFAULT NOW(),
fkSensor INT,
PRIMARY KEY(idleitura, fkSensor),
CONSTRAINT fksensorleitura
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor));

INSERT INTO empresa (razaosocial, cnpj, statusEmpresa) VALUES
('Laboratório de Biologia Vegetal USP', '11111111000', 1),
('Centro de Pesquisa Genética Unicamp', '22222222000', 1),
('Embrapa Recursos Genéticos e Biotecnologia', '11111111000',1),
('Instituto Agronômico de Campinas (IAC)', '55555555000', 1);

INSERT INTO usuario (email, senha, cpf, fkEmpresa) VALUES
('joao.silva@embrapa.br', 'embrapa123', '12345678901', 3),
('ana.ribeiro@usp.br', 'usp123', '34567890123', 1),
('carlos.lima@usp.br', 'usp456', '45678901234', 1),
('lucas.martins@unicamp.br', 'unicamp123', '56789012345', 2),
('maria.santos@iac.sp.gov.br', 'iac123', '89012345678', 4);

INSERT INTO estufa (nomeEstufa, limiteMinimo,limiteMaximo, statusEstufa,fkEmpresa) VALUES
('estufa EMBRAPA',100,200, 1, 3),
('estufa USP', 100,200, 1, 1),
('estufa UNICAMP', 100,200,1, 2),
('estufa IAC',100,200, 1, 4);

INSERT INTO setor (nome, fkEstufa) values
('setorA', 1),
('setorB', 1),
('setorC', 1),
('setorD', 1),
('setorE', 1),
('setorF', 1),
('setorA', 2),
('setorB', 2),
('setorC', 2),
('setorD', 2),
('setorE', 2),
('setorF', 2),
('setorA', 3),
('setorB', 3),
('setorC', 3),
('setorD', 3),
('setorE', 3),
('setorF', 3),
('setorA', 4),
('setorB', 4),
('setorC', 4),
('setorD', 4),
('setorE', 4),
('setorF', 4);

INSERT INTO estante (numeroIdentificador,fkSetor) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),
(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),
(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),
(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),
(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),
(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),
(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),
(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),
(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),
(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),
(1,11),(2,11),(3,11),(4,11),(5,11),(6,11),
(1,12),(2,12),(3,12),(4,12),(5,12),(6,12),
(1,13),(2,13),(3,13),(4,13),(5,13),(6,13),
(1,14),(2,14),(3,14),(4,14),(5,14),(6,14),
(1,15),(2,15),(3,15),(4,15),(5,15),(6,15),
(1,16),(2,16),(3,16),(4,16),(5,16),(6,16),
(1,17),(2,17),(3,17),(4,17),(5,17),(6,17),
(1,18),(2,18),(3,18),(4,18),(5,18),(6,18),
(1,19),(2,19),(3,19),(4,19),(5,19),(6,19),
(1,20),(2,20),(3,20),(4,20),(5,20),(6,20),
(1,21),(2,21),(3,21),(4,21),(5,21),(6,21),
(1,22),(2,22),(3,22),(4,22),(5,22),(6,22),
(1,23),(2,23),(3,23),(4,23),(5,23),(6,23),
(1,24),(2,24),(3,24),(4,24),(5,24),(6,24);

INSERT INTO prateleira (numeroIdentificador, fkEstante) VALUES
(1,1),(2,1),(3,1),(4,1),
(1,2),(2,2),(3,2),(4,2),
(1,3),(2,3),(3,3),(4,3),
(1,4),(2,4),(3,4),(4,4),
(1,5),(2,5),(3,5),(4,5),
(1,6),(2,6),(3,6),(4,6),
(1,7),(2,7),(3,7),(4,7),
(1,8),(2,8),(3,8),(4,8),
(1,9),(2,9),(3,9),(4,9),
(1,10),(2,10),(3,10),(4,10),
(1,11),(2,11),(3,11),(4,11),
(1,12),(2,12),(3,12),(4,12),
(1,13),(2,13),(3,13),(4,13),
(1,14),(2,14),(3,14),(4,14),
(1,15),(2,15),(3,15),(4,15),
(1,16),(2,16),(3,16),(4,16),
(1,17),(2,17),(3,17),(4,17),
(1,18),(2,18),(3,18),(4,18),
(1,19),(2,19),(3,19),(4,19),
(1,20),(2,20),(3,20),(4,20),
(1,21),(2,21),(3,21),(4,21),
(1,22),(2,22),(3,22),(4,22),
(1,23),(2,23),(3,23),(4,23),
(1,24),(2,24),(3,24),(4,24);


INSERT INTO sensor (nomeSensor, statusSensor, dtInstalacao, dtAtualizacao, fkPrateleira) VALUES
('Sensor 1', 1, '2026-03-01 08:00:00', '2026-04-01 09:00:00', 1),
('Sensor 2', 1, '2026-03-01 08:10:00', '2026-04-01 09:10:00', 2),
('Sensor 3', 1, '2026-03-01 08:20:00', '2026-04-01 09:20:00', 3),
('Sensor 4', 1, '2026-03-01 08:30:00', '2026-04-01 09:30:00', 4),
('Sensor 5', 1, '2026-03-01 08:40:00', '2026-04-01 09:40:00', 5),
('Sensor 6', 1, '2026-03-01 08:50:00', '2026-04-01 09:50:00', 6),
('Sensor 7', 1, '2026-03-01 09:00:00', '2026-04-01 10:00:00', 7),
('Sensor 8', 1, '2026-03-01 09:10:00', '2026-04-01 10:10:00', 8),
('Sensor 9', 1, '2026-03-01 09:20:00', '2026-04-01 10:20:00', 9),
('Sensor 10', 1, '2026-03-01 09:30:00', '2026-04-01 10:30:00', 10),
('Sensor 11', 1, '2026-03-01 09:40:00', '2026-04-01 10:40:00', 11),
('Sensor 12', 1, '2026-03-01 09:50:00', '2026-04-01 10:50:00', 12),
('Sensor 13', 1, '2026-03-01 10:00:00', '2026-04-01 11:00:00', 13),
('Sensor 14', 1, '2026-03-01 10:10:00', '2026-04-01 11:10:00', 14),
('Sensor 15', 1, '2026-03-01 10:20:00', '2026-04-01 11:20:00', 15),
('Sensor 16', 1, '2026-03-01 10:30:00', '2026-04-01 11:30:00', 16),
('Sensor 17', 1, '2026-03-01 10:40:00', '2026-04-01 11:40:00', 17),
('Sensor 18', 1, '2026-03-01 10:50:00', '2026-04-01 11:50:00', 18),
('Sensor 19', 1, '2026-03-01 11:00:00', '2026-04-01 12:00:00', 19),
('Sensor 20', 1, '2026-03-01 11:10:00', '2026-04-01 12:10:00', 20),
('Sensor 21', 1, '2026-03-01 11:20:00', '2026-04-01 12:20:00', 21),
('Sensor 22', 1, '2026-03-01 11:30:00', '2026-04-01 12:30:00', 22),
('Sensor 23', 1, '2026-03-01 11:40:00', '2026-04-01 12:40:00', 23),
('Sensor 24', 1, '2026-03-01 11:50:00', '2026-04-01 12:50:00', 24),
('Sensor 25', 1, '2026-03-01 12:00:00', '2026-04-01 13:00:00', 25),
('Sensor 26', 1, '2026-03-01 12:10:00', '2026-04-01 13:10:00', 26),
('Sensor 27', 1, '2026-03-01 12:20:00', '2026-04-01 13:20:00', 27),
('Sensor 28', 1, '2026-03-01 12:30:00', '2026-04-01 13:30:00', 28),
('Sensor 29', 1, '2026-03-01 12:40:00', '2026-04-01 13:40:00', 29),
('Sensor 30', 1, '2026-03-01 12:50:00', '2026-04-01 13:50:00', 30),
('Sensor 31', 1, '2026-03-01 13:00:00', '2026-04-01 14:00:00', 31),
('Sensor 32', 1, '2026-03-01 13:10:00', '2026-04-01 14:10:00', 32),
('Sensor 33', 1, '2026-03-01 13:20:00', '2026-04-01 14:20:00', 33),
('Sensor 34', 1, '2026-03-01 13:30:00', '2026-04-01 14:30:00', 34),
('Sensor 35', 1, '2026-03-01 13:40:00', '2026-04-01 14:40:00', 35),
('Sensor 36', 1, '2026-03-01 13:50:00', '2026-04-01 14:50:00', 36),
('Sensor 37', 1, '2026-03-01 14:00:00', '2026-04-01 15:00:00', 37),
('Sensor 38', 1, '2026-03-01 14:10:00', '2026-04-01 15:10:00', 38),
('Sensor 39', 1, '2026-03-01 14:20:00', '2026-04-01 15:20:00', 39),
('Sensor 40', 1, '2026-03-01 14:30:00', '2026-04-01 15:30:00', 40),
('Sensor 41', 1, '2026-03-01 14:40:00', '2026-04-01 15:40:00', 41),
('Sensor 42', 1, '2026-03-01 14:50:00', '2026-04-01 15:50:00', 42),
('Sensor 43', 1, '2026-03-01 15:00:00', '2026-04-01 16:00:00', 43),
('Sensor 44', 1, '2026-03-01 15:10:00', '2026-04-01 16:10:00', 44),
('Sensor 45', 1, '2026-03-01 15:20:00', '2026-04-01 16:20:00', 45),
('Sensor 46', 1, '2026-03-01 15:30:00', '2026-04-01 16:30:00', 46),
('Sensor 47', 1, '2026-03-01 15:40:00', '2026-04-01 16:40:00', 47),
('Sensor 48', 1, '2026-03-01 15:50:00', '2026-04-01 16:50:00', 48),
('Sensor 49', 1, '2026-03-01 16:00:00', '2026-04-01 17:00:00', 49),
('Sensor 50', 1, '2026-03-01 16:10:00', '2026-04-01 17:10:00', 50),
('Sensor 51', 1, '2026-03-01 16:20:00', '2026-04-01 17:20:00', 51),
('Sensor 52', 1, '2026-03-01 16:30:00', '2026-04-01 17:30:00', 52),
('Sensor 53', 1, '2026-03-01 16:40:00', '2026-04-01 17:40:00', 53),
('Sensor 54', 1, '2026-03-01 16:50:00', '2026-04-01 17:50:00', 54),
('Sensor 55', 1, '2026-03-01 17:00:00', '2026-04-01 18:00:00', 55),
('Sensor 56', 1, '2026-03-01 17:10:00', '2026-04-01 18:10:00', 56),
('Sensor 57', 1, '2026-03-01 17:20:00', '2026-04-01 18:20:00', 57),
('Sensor 58', 1, '2026-03-01 17:30:00', '2026-04-01 18:30:00', 58),
('Sensor 59', 1, '2026-03-01 17:40:00', '2026-04-01 18:40:00', 59),
('Sensor 60', 1, '2026-03-01 17:50:00', '2026-04-01 18:50:00', 60),
('Sensor 61', 1, '2026-03-01 18:00:00', '2026-04-01 19:00:00', 61),
('Sensor 62', 1, '2026-03-01 18:10:00', '2026-04-01 19:10:00', 62),
('Sensor 63', 1, '2026-03-01 18:20:00', '2026-04-01 19:20:00', 63),
('Sensor 64', 1, '2026-03-01 18:30:00', '2026-04-01 19:30:00', 64),
('Sensor 65', 1, '2026-03-01 18:40:00', '2026-04-01 19:40:00', 65),
('Sensor 66', 1, '2026-03-01 18:50:00', '2026-04-01 19:50:00', 66),
('Sensor 67', 1, '2026-03-01 19:00:00', '2026-04-01 20:00:00', 67),
('Sensor 68', 1, '2026-03-01 19:10:00', '2026-04-01 20:10:00', 68),
('Sensor 69', 1, '2026-03-01 19:20:00', '2026-04-01 20:20:00', 69),
('Sensor 70', 1, '2026-03-01 19:30:00', '2026-04-01 20:30:00', 70),
('Sensor 71', 1, '2026-03-01 19:40:00', '2026-04-01 20:40:00', 71),
('Sensor 72', 1, '2026-03-01 19:50:00', '2026-04-01 20:50:00', 72),
('Sensor 73', 1, '2026-03-01 20:00:00', '2026-04-01 21:00:00', 73),
('Sensor 74', 1, '2026-03-01 20:10:00', '2026-04-01 21:10:00', 74),
('Sensor 75', 1, '2026-03-01 20:20:00', '2026-04-01 21:20:00', 75),
('Sensor 76', 1, '2026-03-01 20:30:00', '2026-04-01 21:30:00', 76),
('Sensor 77', 1, '2026-03-01 20:40:00', '2026-04-01 21:40:00', 77),
('Sensor 78', 1, '2026-03-01 20:50:00', '2026-04-01 21:50:00', 78),
('Sensor 79', 1, '2026-03-01 21:00:00', '2026-04-01 22:00:00', 79),
('Sensor 80', 1, '2026-03-01 21:10:00', '2026-04-01 22:10:00', 80),
('Sensor 81', 1, '2026-03-01 21:20:00', '2026-04-01 22:20:00', 81),
('Sensor 82', 1, '2026-03-01 21:30:00', '2026-04-01 22:30:00', 82),
('Sensor 83', 1, '2026-03-01 21:40:00', '2026-04-01 22:40:00', 83),
('Sensor 84', 1, '2026-03-01 21:50:00', '2026-04-01 22:50:00', 84),
('Sensor 85', 1, '2026-03-01 22:00:00', '2026-04-01 23:00:00', 85),
('Sensor 86', 1, '2026-03-01 22:10:00', '2026-04-01 23:10:00', 86),
('Sensor 87', 1, '2026-03-01 22:20:00', '2026-04-01 23:20:00', 87),
('Sensor 88', 1, '2026-03-01 22:30:00', '2026-04-01 23:30:00', 88),
('Sensor 89', 1, '2026-03-01 22:40:00', '2026-04-01 23:40:00', 89),
('Sensor 90', 1, '2026-03-01 22:50:00', '2026-04-01 23:50:00', 90),
('Sensor 91', 1, '2026-03-01 23:00:00', '2026-04-02 00:00:00', 91),
('Sensor 92', 1, '2026-03-01 23:10:00', '2026-04-02 00:10:00', 92),
('Sensor 93', 1, '2026-03-01 23:20:00', '2026-04-02 00:20:00', 93),
('Sensor 94', 1, '2026-03-01 23:30:00', '2026-04-02 00:30:00', 94),
('Sensor 95', 1, '2026-03-01 23:40:00', '2026-04-02 00:40:00', 95),
('Sensor 96', 1, '2026-03-01 23:50:00', '2026-04-02 00:50:00', 96);
INSERT INTO leitura (freqLuminosidade, dtCaptDados, fkSensor) VALUES
(110.5, '2026-04-01 09:00:00', 1),
(120.0, '2026-04-01 10:00:00', 1),
(130.2, '2026-04-01 11:00:00', 1),
(150.0, '2026-04-01 09:00:00', 2),
(160.4, '2026-04-01 10:00:00',2),
(180.3, '2026-04-01 09:00:00', 3),
(175.0, '2026-04-01 10:00:00', 3),
(400.0, '2026-04-01 09:00:00', 4),
(420.8, '2026-04-01 10:00:00', 4);


SELECT 
    l.idLeitura,
    l.freqLuminosidade,
    l.dtCaptDados,
    s.nomeSensor,
    es.nomeEstufa,
    emp.razaosocial
FROM leitura l
JOIN sensor s 
    ON l.fkSensor = s.idSensor
JOIN prateleira p 
    ON s.fkPrateleira = p.idPrateleira
JOIN estante est 
    ON p.fkEstante = est.idEstante
JOIN setor setr 
    ON est.fkSetor = setr.idSetor
JOIN estufa es 
    ON setr.fkEstufa = es.idEstufa
JOIN empresa emp 
    ON es.fkEmpresa = emp.idEmpresa;
    
    
SELECT 
    es.limiteMinimo,
    es.limiteMaximo,
    l.dtCaptDados,
    l.freqLuminosidade,
    es.nomeEstufa 
FROM estufa es 
JOIN setor setr 
    ON setr.fkEstufa = es.idEstufa
JOIN estante est 
    ON est.fkSetor = setr.idSetor
JOIN prateleira p 
    ON p.fkEstante = est.idEstante
JOIN sensor s 
    ON s.fkPrateleira = p.idPrateleira
JOIN leitura l
    ON l.fkSensor = s.idSensor;
