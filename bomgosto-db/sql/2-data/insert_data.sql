-- SCRIPT DE POPULAÇÃO DE DADOS PARA DESENVOLVIMENTO

-- Resetando AUTO_INCREMENT
ALTER TABLE Cardapio AUTO_INCREMENT = 1;
ALTER TABLE Comanda AUTO_INCREMENT = 1;

-- 1. Inserção no Cardapio
INSERT INTO Cardapio (nome_cafe, descricao, preco_unitario) VALUES
('Expresso Simples', 'Café 100% arábica, torra média.', 6.50),
('Capuccino', 'Expresso, leite vaporizado e canela em pó.', 10.00),
('Moccha', 'Expresso, calda de chocolate, leite vaporizado e chantilly.', 14.50),
('Latte Caramelo', 'Expresso, leite vaporizado e xarope de caramelo.', 12.00);

-- 2. Inserção na Comanda (Simulando 3 dias de vendas)

-- Comanda 1: 2025-10-20
INSERT INTO Comanda (data_abertura, numero_mesa, nome_cliente, status_comanda) 
VALUES ('2025-10-20 10:00:00', 5, 'Ana Silva', 'FECHADA'); 

-- Comanda 2: 2025-10-20 (Mais de 1 tipo de café)
INSERT INTO Comanda (data_abertura, numero_mesa, nome_cliente, status_comanda) 
VALUES ('2025-10-20 10:30:00', 2, 'Bruno Costa', 'FECHADA'); 

-- Comanda 3: 2025-10-21
INSERT INTO Comanda (data_abertura, numero_mesa, nome_cliente, status_comanda) 
VALUES ('2025-10-21 14:00:00', 1, 'Carlos Mendes', 'FECHADA');

-- Comanda 4: 2025-10-21 (Aberta)
INSERT INTO Comanda (data_abertura, numero_mesa, nome_cliente, status_comanda) 
VALUES ('2025-10-21 15:00:00', 3, 'Daniela Ribeiro', 'ABERTA');


-- 3. Inserção no ItemComanda (Detalhe das Vendas)

-- Comanda 1 (Expresso Simples)
INSERT INTO ItemComanda (codigo_comanda, codigo_cardapio, quantidade, preco_momento_venda) 
VALUES (1, 1, 2, 6.50);

-- Comanda 2 (Capuccino e Latte Caramelo)
INSERT INTO ItemComanda (codigo_comanda, codigo_cardapio, quantidade, preco_momento_venda) 
VALUES (2, 2, 1, 10.00); 

INSERT INTO ItemComanda (codigo_comanda, codigo_cardapio, quantidade, preco_momento_venda) 
VALUES (2, 4, 1, 12.00); 

-- Comanda 3 (Moccha)
INSERT INTO ItemComanda (codigo_comanda, codigo_cardapio, quantidade, preco_momento_venda) 
VALUES (3, 3, 3, 14.50);

-- Comanda 4 (Expresso Simples - em andamento)
INSERT INTO ItemComanda (codigo_comanda, codigo_cardapio, quantidade, preco_momento_venda) 
VALUES (4, 1, 1, 6.50);