USE FISICOSQL

INSERT INTO PROPRIETARIO
    (cpf, nome, endereco, bairro, cidade, estado, sexo, idade, dataNascimento, telefone)
VALUES
    ('12345678901', 'Ana Beatriz', 'Rua A, 123', 'Centro', 'Cidade A', 'SP', 'M', 35, '1988-05-10', '111-1111'),
    ('98765432109', 'João Gomes', 'Av. B, 456', 'Bairro B', 'Cidade B', 'RJ', 'F', 28, '1995-02-15', '222-2222'),
    ('55555555555', 'Cleitin da Silva', 'Rua C, 789', 'Centro', 'Cidade A', 'SP', 'M', 40, '1982-09-20', '333-3333');


INSERT INTO VEICULO
    (placa, chassi, corPredominante, modelo, anoDeFabricacao, categoria, FK_PROPRIETARIO_cpf)
VALUES
    ('ABC1234', '1JR 6xAZBF n2 nS9748', 'Azul', 123456, 2000, 1, '12345678901'),
    ('XYZ5678', '127 9h1CNs 12 1W4113', 'Preto', 654321, 2001, 2, '98765432109'),
    ('QWE9876', '7wz 61FAKJ g7 sd8248', 'Prata', 789456, 2002, 1, '55555555555');


INSERT INTO INFRACAO
    (ID, veiculoInfrator, data, tipoDeInfracao, FK_VEICULO_placa, FK_AGENTE_matricula)
VALUES
    (1, 'ABC1234', '2023-05-01', 1, 'ABC1234', 12345),
    (2, 'XYZ5678', '2023-06-15', 2, 'XYZ5678', 23456),
    (3, 'QWE9876', '2023-07-20', 3, 'QWE9876', 34567);


INSERT INTO TIPO
    (ID, descricao, valor, FK_INFRACAO_ID)
VALUES
    (1, 'Excesso de Velocidade', 150.00, 1),
    (2, 'Avanço de Sinal Vermelho', 200.00, 2),
    (3, 'Tava bebo', 100.00, 3);

INSERT INTO LOCAL
    (ID, latitude, longitude, velocidadeMax, FK_INFRACAO_ID)
VALUES
    (1, -23.550520, -46.633308, 60, 1),
    (2, -22.906841, -43.172896, 50, 2),
    (3, -23.550340, -46.634274, 40, 3);

INSERT INTO AGENTE
    (matricula, nome, dataDeContratacao, tempoDeServico)
VALUES
    (12345, 'Ramon Dino', '04-11-2013', 10),
    (23456, 'Chris Bumbstead', '04-11-2003', 20),
    (34567, 'Urs Kasdjfeki', '04-11-2000', 23);
