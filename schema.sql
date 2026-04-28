
# SQL Para Análise de Dados e Data Science - Capítulo 10 DSA - Treinando o uso de queries/consultas junto com o curso.


-- criar schema
CREATE SCHEMA cap10 AUTHORIZATION dsa;


-- criar tabela clientes
CREATE TABLE IF NOT EXISTS cap10.dsa_clientes (
    id_cli INT PRIMARY KEY,
    nome_cliente VARCHAR(50),
    tipo_cliente VARCHAR(50),
    cidade_cliente VARCHAR(50),
    estado_cliente VARCHAR(50)
);

-- criar tabela produtos
CREATE TABLE IF NOT EXISTS cap10.dsa_produtos (
    id_prod INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    nome_formacao VARCHAR(100)
);

-- criar tabela pedidos
CREATE TABLE IF NOT EXISTS cap10.dsa_pedidos (
    id_pedido INT PRIMARY KEY,
    id_produto INT REFERENCES cap10.dsa_produtos(id_prod),
    data_pedido DATE NULL,
    valor_pedido DECIMAL(10, 2) NULL,
    id_cliente INT REFERENCES cap10.dsa_clientes(id_cli)
);
