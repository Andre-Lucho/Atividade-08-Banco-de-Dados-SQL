# Atividade-08-Banco-de-Dados-SQL

Repositório contendo a atividade obrigatória referente ao Módulo 05 do curso Dev Full Stack +Prati - Exercícios em Banco de dados SQL

## Estrutura do Projeto

```
/bomgosto-DB/
├── SQL/
│ ├──1-schema/
│ │ ├── tables.sql <-- Criação das tabelas e chaves
│ │ └── indexes.sql <-- Criação de índices e outras otimizações
│ ├──2-data/
│ |└── insert_data.sql <-- População de Dados para testes
| └── 3-reports
| └── reports.sql <-- Inclui as consultas SQL referentes às seguintes questões propostas abaixo
└── README.md
```

## Atividade Proposta

A cafeteria BomGosto deseja controlar as suas vendas de café.<br>
A BomGosto controla suas vendas a partir de uma comanda.<br>Uma comanda tem um código único, data, o número da mesa do cliente e o nome do cliente registrados.<br>Nos itens da comanda é possível relacionar vários cafés listados no cardápio que foram vendidos.<br>Cada item da comanda possui o código do cardápio e a quantidade requisitada deste e, não é possível inserir o mesmo código de cardápio mais de uma vez na mesma comanda.<br>No cardápio é apresentado o nome único do café, a descrição da sua composição e o preço unitário.

Desenvolva os scripts SQL para atender cada uma das questões abaixo:

1. Faça uma listagem do cardápio ordenada por nome;

2. Apresente todas as comandas (código, data, mesa e nome do cliente) e os itens da comanda (código comanda, nome do café, descricão, quantidade, preço unitário e preço total do café) destas ordenados data e código da comanda e, também o nome do café;

3. Liste todas as comandas (código, data, mesa e nome do cliente) mais uma coluna com o valor total da comanda. Ordene por data esta listagem;

4. Faça a mesma listagem das comandas da questão anterior (6), mas traga apenas as comandas que possuem mais do que um tipo de café na comanda;

5. Qual o total de faturamento por data? ordene por data esta consulta.

# Como Utilizar

1. Criar o banco de dados:

```
CREATE DATABASE bom_gosto;
```

2. Acessar o banco:

```
psql -U seu_usuario -d bomgosto-db -f sql/1-schema/tables.sql
```

3. Executar as consultas:

```
psql -U seu_usuario -d bomgosto-db -f sql/2-data/insert_data.sql
```

Caso utilize outro cliente SQL, copie cada consulta do arquivo insert_data.sql e execute diretamente no cliente SQL de sua preferência (DBeaver, pgAdmin, MySQL Workbench, etc.).

## Requisitos

Cliente de Banco de dados compatível com SQL padrão (PostgreSQL ou MySQL).<br>O Usuário deve ter permissão de administrador (sudo) para criar e manipular tabelas.
