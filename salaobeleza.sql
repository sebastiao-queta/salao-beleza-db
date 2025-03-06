
CREATE DATABASE IF NOT EXISTS salao_beleza;
USE salao_beleza;

CREATE TABLE IF NOT EXISTS cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS funcionario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    formacao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS trabalho_salao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    servico VARCHAR(255),
    nome_cliente VARCHAR(255),
    custo DECIMAL(10,2),
    FOREIGN KEY (nome_cliente) REFERENCES cliente(nome_completo)
);


CREATE TABLE IF NOT EXISTS cosmetico (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    nome VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS venda_cosmetico (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    cliente INT NOT NULL,
    valor_total DECIMAL(10,2),
    quantidade INT,
    FOREIGN KEY (cliente) REFERENCES cliente(ID)
);


INSERT INTO cliente (nome_completo, telefone, endereco) VALUES
('João Silva', '1234567890', 'Rua das Flores, 123'),
('Maria Oliveira', '9876543210', 'Avenida Central, 456'),
('Ana Santos', '2223334444', 'Praça das Águas, 789');


INSERT INTO funcionario (nome_completo, telefone, endereco, formacao) VALUES
('Carla Mendes', '5556667777', 'Rua Nova, 321', 'Cabeleireira Profissional'),
('Pedro Lima', '8889990000', 'Vila Sol, 654', 'Massagista Certificado');


INSERT INTO trabalho_salao (data, servico, nome_cliente, custo) VALUES
('2022-02-07', 'Corte de cabelo', 'João Silva', 50.00),
('2022-02-08', 'Massagem relaxante', 'Maria Oliveira', 120.00);

INSERT INTO cosmetico (tipo, preco, nome) VALUES
('Shampoo', 30.00, 'Shampoo Nutritivo'),
('Creme', 50.00, 'Creme Hidratante'),
('Loção', 70.00, 'Loção Corporal');


INSERT INTO venda_cosmetico (data_venda, cliente, valor_total, quantidade) VALUES
('2022-02-09', 1, 90.00, 3),
('2022-02-10', 2, 150.00, 2);


SELECT * FROM cliente;

SELECT * FROM funcionario;

SELECT * FROM trabalho_salao;

SELECT * FROM cosmetico;

SELECT cliente.nome_completo, SUM(venda_cosmetico.valor_total) AS total_vendas
FROM venda_cosmetico
JOIN cliente ON venda_cosmetico.cliente = cliente.ID
GROUP BY cliente.nome_completo;
