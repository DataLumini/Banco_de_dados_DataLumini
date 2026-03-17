-- Criando o banco de dados do projeto
CREATE DATABASE dataLumini;
USE dataLumini;

-- Essa tabela foi criada com o intuito de guardar, gerenciar e modelar os dados que se relacionam com o cadastro da empresa
-- no site operacional, no caso, site com função do projeto

CREATE TABLE cadastro_empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT, -- id da empresa ( unico e geral, sendo o mesmo que aparece em várias tabelas )
    razao_social VARCHAR(200) NOT NULL, -- nome completo registrado da empresa | exemp: Nike, Inc.
    nome_fantasia VARCHAR(200) NOT NULL, -- nome social da empresa | exemp: NIKE
    cnpj_empresa CHAR(18) UNIQUE NOT NULL, -- cpnj empresa
    email_empresa VARCHAR(150) NOT NULL, -- email de contato da empresa
    cep_empresa CHAR(8), -- CEP, rua, bairro etc
    status_empresa VARCHAR(20) DEFAULT 'Ativa', -- Ativa ou inativa
    responsavel_legal VARCHAR(150) NOT NULL, -- CEO da empresa, que tem o cpnj linkado ao seu nome
    email_responsavel VARCHAR(150) NOT NULL, -- email do CEO
    cpf_responsavel VARCHAR(14) UNIQUE NOT NULL, -- cpf do CEO
    cnae_empresa CHAR(7), -- tipo economico da empresa ( constituição brasileira )
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP, -- data criação do cadastro da empresa
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data da ultima atualização nos dados da empresa
    CONSTRAINT cStatus_empresa CHECK (status_empresa IN('Ativa', 'Inativa')) -- restrição ativa ou inativa
);

-- Insert de dados

INSERT INTO cadastro_empresa(razao_social, nome_fantasia, cnpj_empresa, email_empresa, cep_empresa, status_empresa, responsavel_legal, email_responsavel, cpf_responsavel, cnae_empresa) VALUES

	('BioPlanta Laboratórios Ltda.', 'BioPlanta', '11.222.333/0001-10', 'contato@bioplanta.com.br', '01002000', 'Ativa', 'Mariana Souza', 'mariana.souza@bioplanta.com.br', '123.987.456-10', '7210000'),
	('AgroTech Pesquisa Vegetal S.A.', 'AgroTech Vegetal', '22.333.444/0001-20', 'contato@agrotechveg.com.br', '13015010', 'Ativa', 'Ricardo Almeida', 'ricardo.almeida@agrotechveg.com.br', '234.876.543-21', '7210000'),
	('Cultivar Biotecnologia de Plantas Ltda.', 'Cultivar Bio', '33.444.555/0001-30', 'contato@cultivarbio.com.br', '14020050', 'Ativa', 'Fernanda Lima', 'fernanda.lima@cultivarbio.com.br', '345.765.432-32', '7210000'),
	('VerdeLab Micropropagação Vegetal Ltda.', 'VerdeLab', '44.555.666/0001-40', 'contato@verdelab.com.br', '15030060', 'Ativa', 'Carlos Henrique Martins', 'carlos.martins@verdelab.com.br', '456.654.321-43', '0161003'),
	('Genética Flora Pesquisa e Desenvolvimento Ltda.', 'GenFlora', '55.666.777/0001-50', 'contato@genflora.com.br', '16040070', 'Ativa', 'Patrícia Rodrigues', 'patricia.rodrigues@genflora.com.br', '567.543.210-54', '7210000'),
	('EstufaTech Cultivo Controlado S.A.', 'EstufaTech', '66.777.888/0001-60', 'contato@estufatech.com.br', '17050080', 'Ativa', 'Eduardo Carvalho', 'eduardo.carvalho@estufatech.com.br', '678.432.109-65', '0113000');
   
-- select de todos os dados na tabela

SELECT * FROM cadastro_empresa;
    
-- Essa tabela foi criada com o intuito de guardar, gerenciar e modelar os dados que se relacionam com o cadastro dos funcionarios
-- nas empresas já cadastradas no nosso site

CREATE TABLE cadastro_funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT, -- id funcionario chave primaria
    nome_completo_funcionario VARCHAR(150) NOT NULL, -- nome completo funcionario
    email_funcionario VARCHAR(150) NOT NULL, --  email de contato funcionario
    senha_funcionario VARCHAR(100) NOT NULL, -- senha de login funcionario
    cpf_funcionario CHAR(14) UNIQUE NOT NULL, -- cpf funcionario ( identificação )
    status_funcionario VARCHAR(20) DEFAULT 'Ativo', -- satus do funcionario, se ele está ativo ou inativo
    dt_registro_funcionario DATETIME DEFAULT CURRENT_TIMESTAMP, -- data qque o funcionario foi resgistrado no sistema
    dt_atualizacao_funcionario DATETIME DEFAULT CURRENT_TIMESTAMP, -- data que ocorreu a ultima atulizacao nessa tabela do funcionario
    nome_empresa VARCHAR(200) NOT NULL, -- nome da empresa 
    id_empresa VARCHAR(200) NOT NULL, -- id da empresa que ele atua ( relacional futuro )
    CONSTRAINT cStatus_funcionario CHECK (status_funcionario IN('Ativo', 'Inativo')) -- restrição do status para ativo e inativo
);

-- insert dos dados

INSERT INTO cadastro_funcionario ( nome_completo_funcionario, email_funcionario, senha_funcionario, cpf_funcionario, status_funcionario, nome_empresa, id_empresa ) VALUES

('Carlos Eduardo Mendes', 'carlos.mendes@techsolutions.com.br', 'Senha@123', '123.456.789-01', 'Ativo', 'Tech Solutions LTDA', '1'),
('Mariana Oliveira Santos', 'mariana.santos@techsolutions.com.br', 'Mariana@2024', '123.456.789-02', 'Ativo', 'Tech Solutions LTDA', '1'),
('Rafael Henrique Costa', 'rafael.costa@inovadata.com.br', 'Rafael#2024', '123.456.789-03', 'Ativo', 'InovaData Sistemas', '2'),
('Juliana Ferreira Lima', 'juliana.lima@inovadata.com.br', 'Juliana@321', '123.456.789-04', 'Inativo', 'InovaData Sistemas', '2'),
('Fernanda Almeida Rocha', 'fernanda.rocha@globaltech.com.br', 'Fernanda@789', '123.456.789-05', 'Ativo', 'GlobalTech Tecnologia', '3'),
('Bruno Martins Souza', 'bruno.souza@globaltech.com.br', 'Bruno@456', '123.456.789-06', 'Ativo', 'GlobalTech Tecnologia', '3');

-- select dos dados

SELECT * FROM cadastro_funcionario;

-- -- Essa tabela foi criada com o intuito de guardar, gerenciar e modelar os dados que se relacionam com o cadastro de todos os sensores
-- que a empresa tem acesso, sejam eles ativos ou inativos

CREATE TABLE sensores (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY, -- id de cada sensor 
    nome_sensor VARCHAR(100), -- nome do sensor, que pode ser estilo: 1AB etc
	estufa_sensor VARCHAR(100) NOT NULL, -- estufa que o sensor está localizado
    grupo_estufa_sensor INT NOT NULL, -- grupo de plantas dentro de x estufa no qual o sensor capta os dados
    status_sensor VARCHAR(20) DEFAULT 'Ativo', -- satus do sensor
    dt_instalacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data de instalação do sensor
    dt_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data da ultima atualização nos dados dos sensor
    CONSTRAINT cSensor_status CHECK (status_sensor IN('Ativo', 'Inativo')) -- restrição do status para ativo e inativo
);

-- insert dados

INSERT INTO sensores (nome_sensor, estufa_sensor, grupo_estufa_sensor, status_sensor) VALUES
	('BH1750 Lux Sensor - Estufa 1A', 'Estufa 1', 1, 'Ativo'),
	('TSL2561 Luminosidade - Estufa 1B', 'Estufa 1', 2, 'Ativo'),
	('LDR GL5528 - Estufa 2A', 'Estufa 2', 1, 'Ativo'),
	('VEML7700 Alta Precisão - Estufa 2B', 'Estufa 2', 2, 'Ativo'),
	('MAX44009 Digital Lux - Estufa 3A', 'Estufa 3', 1, 'Inativo'),
	('OPT3001 Texas Instruments - Estufa 3B', 'Estufa 3', 2, 'Ativo');
	
-- select dos dados da tabela

SELECT * FROM sensores;

-- Essa tabela foi criada com o intuito de guardar, gerenciar e modelar os dados que se relacionam com a captação
-- de dados da iluminação de um grupo x de plantas em uma x estufa

CREATE TABLE leituras_luminosidade (
    id_data INT AUTO_INCREMENT PRIMARY KEY, -- id dos dados
    id_sensor INT NOT NULL, -- id do sensor que relaciona com a tabela sensores
	status_arduino VARCHAR(100) NOT NULL, -- status do
    luminosidade DECIMAL(10,2) NOT NULL,  -- valor medido
    unidade VARCHAR(20) DEFAULT 'lux',    -- lux, PPFD, etc
    status_luminosidade VARCHAR(100) NOT NULL, -- se está no nível baixo, médio ou alto
	estufa_sensor VARCHAR(100) NOT NULL, -- estufa que os dados estão sendo captados
    grupo_estufa_sensor INT NOT NULL, -- grupo da planta em x estufa que o sensor capta
	dt_captacao_dados DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- data que os dados foram captados
    dt_instalacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data de instalação do sensor, que relaciona com a tabela dos sensores
    dt_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data da ultima atualização dos dados 
	CONSTRAINT cStatus_arduino CHECK (status_arduino In('Ativo', 'Inativo'))
);

-- inserindo dados

INSERT INTO leituras_luminosidade (id_sensor, status_arduino, luminosidade, unidade, status_luminosidade, estufa_sensor, grupo_estufa_sensor) VALUES

	(1, 'Ativo', 12500.50, 'lux', 'Alto', 'Estufa 1', 1),
	(2, 'Ativo', 8420.30, 'lux', 'Médio', 'Estufa 1', 2),
	(3, 'Ativo', 3200.75, 'lux', 'Baixo', 'Estufa 2', 1),
	(4, 'Ativo', 15400.90, 'lux', 'Alto', 'Estufa 2', 2),
	(5, 'Inativo', 0.00, 'lux', 'Sem leitura', 'Estufa 3', 1),
	(6, 'Ativo', 6780.45, 'lux', 'Médio', 'Estufa 3', 2);
    
-- SELECT dos dados da tabela

SELECT * FROM leituras_luminosidade;
    
-- Essa tabela foi criada com o intuito de guardar, gerenciar e modelar os dados que se relacionam com a organização de grupos
-- em uma x estufa, separadas por colunas e linhas que criam "quadrados" nos quais os sensores poderam analisar 
-- captando dados diferentes para cada grupo seleto.

CREATE TABLE grupo_plantas (
    id_grupo_plantas INT PRIMARY KEY AUTO_INCREMENT, -- id grupo das plantas
    nome_grupo_plantas VARCHAR(100), -- nome "social" utilizado para referenciar um x grupo de plantas 
    qtd_plantas_grupo INT, -- número de espécimes nesse x grupo.
    coluna_plantas VARCHAR(30) NOT NULL, -- coluna da estufa em que essas tais plantas estão localizadas
    linha_plantas VARCHAR(30) NOT NULL, -- linha da estufa em que essas tais plantas estão localizadas
    sensor_modelo VARCHAR(30) NOT NULL, -- nome do sensor senso utlizado nesse grupo de plantas relacionado com a table sensores
    id_sensor INT, -- id do sensor utilizado nesse grupo relacionado com a table sensores
    status_grupo_plantas VARCHAR(15) DEFAULT 'Ativo' NOT NULL,
	dt_instalacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data de instalação do sensor, que relaciona com a tabela dos sensores
    dt_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP, -- data da ultima atualização dos dados 
    CONSTRAINT cStatus_grupo_plantas CHECK (status_grupo_plantas IN('Ativo', 'Inativo'))
);

INSERT INTO grupo_plantas (nome_grupo_plantas, qtd_plantas_grupo, coluna_plantas, linha_plantas, sensor_modelo, id_sensor, status_grupo_plantas) VALUES

	('Arabidopsis thaliana - WT (Wild Type)', 40, 'Coluna 1', 'Linha A', 'BH1750 Lux Sensor', 1, 'Ativo'),
	('Arabidopsis thaliana - phyA Mutante', 35, 'Coluna 2', 'Linha A', 'TSL2561 Luminosidade', 2, 'Ativo'),
	('Arabidopsis thaliana - phyB Mutante', 30, 'Coluna 1', 'Linha B', 'LDR GL5528', 3, 'Ativo'),
	('Arabidopsis thaliana - cry1 Mutante', 28, 'Coluna 2', 'Linha B', 'VEML7700', 4, 'Ativo'),
	('Arabidopsis thaliana - hy5 Mutante', 25, 'Coluna 3', 'Linha A', 'MAX44009', 5, 'Ativo'),
	('Arabidopsis thaliana - cop1 Mutante', 20, 'Coluna 3', 'Linha B', 'OPT3001', 6, 'Ativo');
    
SELECT * FROM grupo_plantas;

-- table futura
/*
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
luminosidade_min DECIMAL(20,2),
luminosidade_max DECIMAL(20,2)
*/