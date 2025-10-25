-- SCRIPT DE OTIMIZAÇÃO E CRIAÇÃO DE ÍNDICES ADICIONAIS

-- Estes índices são adicionais e focam nas consultas de relatório.

-- Tabela Cardapio
--------------------

-- Otimizar a listagem do cardápio ordenada por nome
-- O índice na coluna nome_cafe foi criado automaticamente na tabela Cardapio devido à restrição UNIQUE. 
-- No entanto, se não fosse UNIQUE, este seria o script:
CREATE INDEX idx_cardapio_nome_cafe ON Cardapio (nome_cafe);

-- Tabela Comanda
--------------------

-- Otimizar consultas que buscam por status ou nome do cliente.
-- Se houver muitas buscas por status
CREATE INDEX idx_comanda_status ON Comanda (status_comanda);


-- Tabela ItemComanda
-----------------------

-- Otimizar a consulta de faturamento por data e o valor total da comanda, que requer um cálculo de agregação.

CREATE INDEX idx_item_comanda_calculo
ON ItemComanda (codigo_comanda)
INCLUDE (preco_momento_venda, quantidade); 


-- Otimizar joins da tabela Cardapio a partir da tabela de Itens,

CREATE INDEX idx_item_comanda_cardapio_fk
ON ItemComanda (codigo_cardapio);