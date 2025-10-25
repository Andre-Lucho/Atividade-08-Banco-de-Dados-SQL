--1) Faça uma listagem do cardápio ordenada por nome;
--SQL

SELECT
    nome_cafe,
    descricao,
    preco_unitario
FROM
    Cardapio
ORDER BY
    nome_cafe;

--2) Apresente todas as comandas (código, data, mesa e nome do cliente) e os itens da comanda (código comanda, nome do café, descricão, quantidade, preço unitário e preço total do café) destas ordenados data e código da comanda e, também o nome do café;

SELECT
    C.codigo_comanda,
    C.data,
    C.numero_mesa,
    C.nome_cliente,
    CA.nome_cafe,
    CA.descricao,
    IC.quantidade,
    CA.preco_unitario,
    (IC.quantidade * CA.preco_unitario) AS preco_total_cafe
FROM
    Comanda C
INNER JOIN
    ItemComanda IC ON C.codigo_comanda = IC.codigo_comanda
INNER JOIN
    Cardapio CA ON IC.codigo_cardapio = CA.codigo_cardapio
ORDER BY
    C.data,
    C.codigo_comanda,
    CA.nome_cafe;


--3) Liste todas as comandas (código, data, mesa e nome do cliente) mais uma coluna com o valor total da comanda. Ordene por data esta listagem;

SELECT
    C.codigo_comanda,
    C.data,
    C.numero_mesa,
    C.nome_cliente,
    SUM(IC.quantidade * CA.preco_unitario) AS valor_total_comanda
FROM
    Comanda C
INNER JOIN
    ItemComanda IC ON C.codigo_comanda = IC.codigo_comanda
INNER JOIN
    Cardapio CA ON IC.codigo_cardapio = CA.codigo_cardapio
GROUP BY
    C.codigo_comanda,
    C.data,
    C.numero_mesa,
    C.nome_cliente
ORDER BY
    C.data;

--4) Faça a mesma listagem das comandas da questão anterior (3), mas traga apenas as comandas que possuem mais do que um tipo de café na comanda;

SELECT
    C.codigo_comanda,
    C.data,
    C.numero_mesa,
    C.nome_cliente,
    SUM(IC.quantidade * CA.preco_unitario) AS valor_total_comanda
FROM
    Comanda C
INNER JOIN
    ItemComanda IC ON C.codigo_comanda = IC.codigo_comanda
INNER JOIN
    Cardapio CA ON IC.codigo_cardapio = CA.codigo_cardapio
GROUP BY
    C.codigo_comanda,
    C.data,
    C.numero_mesa,
    C.nome_cliente
HAVING
    COUNT(IC.codigo_cardapio) > 1
ORDER BY
    C.data;

--5) Qual o total de faturamento por data? ordene por data esta consulta.

SELECT
    C.data,
    SUM(IC.quantidade * CA.preco_unitario) AS faturamento_diario
FROM
    Comanda C
INNER JOIN
    ItemComanda IC ON C.codigo_comanda = IC.codigo_comanda
INNER JOIN
    Cardapio CA ON IC.codigo_cardapio = CA.codigo_cardapio
GROUP BY
    C.data\
ORDER BY
    C.data;