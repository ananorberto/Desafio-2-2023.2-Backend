CREATE DATABASE
IF NOT EXISTS FISICOSQL;

USE FISICOSQL;

CREATE TABLE VEICULO
(
    placa VARCHAR(8) PRIMARY KEY,
    chassi VARCHAR(17),
    corPredominante VARCHAR(50),
    modelo INT,
    anoDeFabricacao INT,
    categoria INT,
    FK_PROPRIETARIO_cpf VARCHAR(11),
    FOREIGN KEY (FK_PROPRIETARIO_cpf) REFERENCES PROPRIETARIO(cpf)
);

CREATE TABLE PROPRIETARIO
(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    sexo CHAR(1),
    idade_derivado INT,
    dataNascimento DATE,
    telefone VARCHAR(14)
);

CREATE TABLE INFRACAO
(
    ID INT PRIMARY KEY,
    veiculoInfrator VARCHAR(10),
    data DATE,
    tipoDeInfracao INT,
    FK_VEICULO_placa VARCHAR(8),
    FK_AGENTE_matricula INT,
    FOREIGN KEY (FK_VEICULO_placa) REFERENCES VEICULO(placa),
    FOREIGN KEY (FK_AGENTE_matricula) REFERENCES AGENTE(matricula)
);

CREATE TABLE TIPO
(
    ID INT PRIMARY KEY,
    descricao VARCHAR(200),
    valor DECIMAL(10,2),
    FK_INFRACAO_ID INT,
    FOREIGN KEY (FK_INFRACAO_ID) REFERENCES INFRACAO(ID)
);

CREATE TABLE LOCAL
(
    ID INT PRIMARY KEY,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    velocidadeMax INT,
    FK_INFRACAO_ID INT,
    FOREIGN KEY (FK_INFRACAO_ID) REFERENCES INFRACAO(ID)
);

CREATE TABLE AGENTE
(
    matricula INT PRIMARY KEY,
    nome VARCHAR(100),
    dataDeContratacao DATE,
    tempoDeServico INT
);

ALTER TABLE VEICULO ADD CONSTRAINT FK_VEICULO_2
    FOREIGN KEY (FK_PROPRIETARIO_cpf)
    REFERENCES PROPRIETARIO (cpf)
ON DELETE RESTRICT;

ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_2
    FOREIGN KEY (FK_VEICULO_placa)
    REFERENCES VEICULO (placa)
ON DELETE RESTRICT;

ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_3
    FOREIGN KEY (FK_AGENTE_matricula)
    REFERENCES AGENTE (matricula)
ON DELETE RESTRICT;

ALTER TABLE TIPO ADD CONSTRAINT FK_TIPO_2
    FOREIGN KEY (FK_INFRACAO_ID)
    REFERENCES INFRACAO (ID)
ON DELETE RESTRICT;

ALTER TABLE LOCAL ADD CONSTRAINT FK_LOCAL_2
    FOREIGN KEY (FK_INFRACAO_ID)
    REFERENCES INFRACAO (ID)
ON DELETE RESTRICT;