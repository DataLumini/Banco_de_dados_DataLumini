CREATE DATABASE datalumini;
USE datalumini;

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(255),
    cnpj CHAR(18),
    status TINYINT
);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    senha VARCHAR(255),
    email VARCHAR(255),
    cpf CHAR(11),
    status TINYINT,
    fkEmpresa INT, 
    CONSTRAINT chfk_empresa_usuario FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Estufa (
    idEstufa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    limiteMaximo FLOAT,
    limiteMinimo FLOAT,
    status TINYINT,
    fkEmpresa INT,
    CONSTRAINT chfk_empresa_estufa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Usuario_Estufa (
    fkUsuario INT,
    fkEstufa INT,
    dataHora DATETIME DEFAULT NOW(),
    PRIMARY KEY (fkUsuario, fkEstufa),
    CONSTRAINT chfk_usuario_assoc FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT chfk_estufa_assoc FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa)
);

CREATE TABLE Setor (
    idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    fkEstufa INT,
    CONSTRAINT chfk_estufa_setor FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa)
);

CREATE TABLE Estante (
    idEstante INT PRIMARY KEY AUTO_INCREMENT,
    numeroIdentificador INT,
    fkSetor INT,
    CONSTRAINT chfk_setor_estante FOREIGN KEY (fkSetor) REFERENCES Setor(idSetor)
);

CREATE TABLE Prateleira (
    idPrateleira INT PRIMARY KEY AUTO_INCREMENT,
    numeroIdentificador INT,
    fkEstante INT,
    CONSTRAINT chfk_estante_prateleira FOREIGN KEY (fkEstante) REFERENCES Estante(idEstante)
);

CREATE TABLE Sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    dt_instalacao DATETIME,
    dt_atualizacao DATETIME,
    status TINYINT,
    fkPrateleira INT,
    CONSTRAINT chfk_prateleira_sensor FOREIGN KEY (fkPrateleira) REFERENCES Prateleira(idPrateleira)
);

CREATE TABLE Leitura (
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    frequenciaLuminosidade FLOAT,
    dtCaptacaoDados DATETIME DEFAULT NOW(),
    fkSensor INT,
    CONSTRAINT chfk_sensor_leitura FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor)
);

INSERT INTO Empresa (razaoSocial, cnpj, status) VALUES
('Laboratório de Biologia Vegetal USP', '11.111.111/0001-00', 1),
('Centro de Pesquisa Genética Unicamp', '22.222.222/0001-00', 1),
('Embrapa Rec Genéticos e Biotecnologia', '33.333.333/0001-00', 1),
('Instituto Agronômico de Campinas (IAC)', '44.444.444/0001-00', 1);

INSERT INTO Usuario (nome, email, senha, cpf, status, fkEmpresa) VALUES
('João Silva', 'joao.silva@embrapa.br', 'embrapa123', '12345678901', 1, 3),
('Ana Ribeiro', 'ana.ribeiro@usp.br', 'usp123', '34567890123', 1, 1),
('Carlos Lima', 'carlos.lima@usp.br', 'usp456', '45678901234', 1, 1),
('Lucas Martins', 'lucas.martins@unicamp.br', 'unicamp123', '56789012345', 1, 2),
('Maria Santos', 'maria.santos@iac.sp.gov.br', 'iac123', '89012345678', 1, 4);

INSERT INTO Estufa (nome, limiteMinimo, limiteMaximo, status, fkEmpresa) VALUES
('Estufa EMBRAPA Principal', 100, 200, 1, 3),
('Estufa USP Bloco B', 100, 200, 1, 1),
('Estufa UNICAMP Central', 100, 200, 1, 2),
('Estufa IAC Estufa 1', 100, 200, 1, 4);

INSERT INTO Usuario_Estufa (fkUsuario, fkEstufa) VALUES
(1, 1), (2, 2), (3, 2), (4, 3), (5, 4);

INSERT INTO Setor (nome, fkEstufa) VALUES
('Setor Norte', 1), ('Setor Sul', 2), ('Setor Leste', 3), ('Setor Oeste', 4);

INSERT INTO Estante (numeroIdentificador, fkSetor) VALUES
(101, 1), (201, 2), (301, 3), (401, 4);

INSERT INTO Prateleira (numeroIdentificador, fkEstante) VALUES
(1, 1), (1, 2), (1, 3), (1, 4);

INSERT INTO Sensor (nome, status, dt_instalacao, dt_atualizacao, fkPrateleira) VALUES
('Sensor A - EMBRAPA', 1, '2026-03-01 08:00:00', '2026-04-01 09:00:00', 1),
('Sensor B - USP', 1, '2026-03-02 09:00:00', '2026-04-01 09:20:00', 2),
('Sensor C - UNICAMP', 1, '2026-03-03 10:00:00', '2026-04-01 09:40:00', 3),
('Sensor D - IAC', 1, '2026-03-05 12:00:00', '2026-04-01 10:10:00', 4);

INSERT INTO Leitura (frequenciaLuminosidade, dtCaptacaoDados, fkSensor) VALUES
(110.5, '2026-04-01 09:00:00', 1),
(120.0, '2026-04-01 10:00:00', 1),
(130.2, '2026-04-01 11:00:00', 1),
(150.0, '2026-04-01 09:00:00', 2),
(160.4, '2026-04-01 10:00:00', 2),
(180.3, '2026-04-01 09:00:00', 3),
(175.0, '2026-04-01 10:00:00', 3),
(400.0, '2026-04-01 09:00:00', 4),
(420.8, '2026-04-01 10:00:00', 4);

SELECT 
    es.nome AS Estufa,
    s.nome AS Setor,
    est.numeroIdentificador AS Estante,
    p.numeroIdentificador AS Prateleira,
    sen.nome AS Sensor,
    l.frequenciaLuminosidade AS FrequenciaLuminosa,
    l.dtCaptacaoDados AS DataLeitura
FROM Usuario u
JOIN Empresa e 
    ON u.fkEmpresa = e.idEmpresa
JOIN Estufa es 
    ON e.idEmpresa = es.fkEmpresa
JOIN Setor s 
    ON es.idEstufa = s.fkEstufa
JOIN Estante est 
    ON s.idSetor = est.fkSetor
JOIN Prateleira p 
    ON est.idEstante = p.fkEstante
JOIN Sensor sen 
    ON p.idPrateleira = sen.fkPrateleira
JOIN Leitura l 
    ON sen.idSensor = l.fkSensor
WHERE 
    u.idUsuario = 2;
    