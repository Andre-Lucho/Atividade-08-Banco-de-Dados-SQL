-- SCRIPT DE CRIAÇÃO DO ESQUEMA (TABLES E CHAVES)

-- 1. Tabela Cardapio
CREATE TABLE Cardapio (
    codigo_cardapio INT PRIMARY KEY AUTO_INCREMENT,
    nome_cafe VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    preco_unitario NUMERIC(10, 2) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CHECK (preco_unitario > 0)
);

-- 2. Tabela Comanda
CREATE TABLE Comanda (
    codigo_comanda BIGINT PRIMARY KEY AUTO_INCREMENT,
    data_abertura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numero_mesa SMALLINT NOT NULL,
    nome_cliente VARCHAR(150),
    status_comanda VARCHAR(20) NOT NULL DEFAULT 'ABERTA', 
    
    INDEX idx_data_mesa (data_abertura, numero_mesa)
);

-- 3. Tabela ItemComanda (Detalhe da Venda)
CREATE TABLE ItemComanda (
    codigo_comanda BIGINT NOT NULL,
    codigo_cardapio INT NOT NULL,
    quantidade SMALLINT NOT NULL,
    
    preco_momento_venda NUMERIC(10, 2) NOT NULL,
    
    -- Chave Primária Composta
    PRIMARY KEY (codigo_comanda, codigo_cardapio),
    
    -- Chaves Estrangeiras
    FOREIGN KEY (codigo_comanda) REFERENCES Comanda(codigo_comanda),
    FOREIGN KEY (codigo_cardapio) REFERENCES Cardapio(codigo_cardapio),
    
    CHECK (quantidade > 0)
);