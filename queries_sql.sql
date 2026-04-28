
# SQL Para Análise de Dados e Data Science - Capítulo 10 - Treinando o uso de queries/consultas junto com o curso.




-- aprendendo: como somar valor total dos pedidos por cidade
SELECT cidade_cliente, SUM(valor_pedido) AS total
FROM cap10.dsa_pedidos P, cap10.dsa_clientes C
WHERE P.id_cliente = C.id_cli
GROUP BY cidade_cliente
ORDER BY 2;


-- aprendendo: como somar o valor dos pedidos por estado e cidade associando também outra tabela
SELECT estado_cliente, cidade_cliente, SUM(valor_pedido) AS total
FROM cap10.dsa_pedidos P, cap10.dsa_clientes C
WHERE P.id_cliente = C.id_cli
GROUP BY cidade_cliente, estado_cliente
ORDER BY total DESC;


-- aprendendo: mesma consulta anterior mas usando join
SELECT estado_cliente, cidade_cliente, SUM(valor_pedido) AS total
FROM cap10.dsa_pedidos P
INNER JOIN cap10.dsa_clientes C
ON P.id_cliente = C.id_cli
GROUP BY cidade_cliente, estado_cliente
ORDER BY total DESC;


-- aprendendo: como fazer a soma mesmo quando não há pedidos cadastrados, retornando como null
SELECT estado_cliente, cidade_cliente, SUM(valor_pedido) AS total
FROM cap10.dsa_pedidos P
RIGHT JOIN cap10.dsa_clientes C
ON P.id_cliente = C.id_cli
GROUP BY cidade_cliente, estado_cliente
ORDER BY total DESC;


-- aprendendo: como somar o valor dos pedidos por estado e cidade e ostrar zero se não houve pedido, ao invés de null
SELECT 
    estado_cliente,
    cidade_cliente,
    CASE 
        WHEN FLOOR(SUM(valor_pedido)) IS NULL THEN 0
        ELSE FLOOR(SUM(valor_pedido))
    end AS total
FROM cap10.dsa_pedidos P 
RIGHT JOIN cap10.dsa_clientes C
ON P.id_cliente = C.id_cli
GROUP BY cidade_cliente, estado_cliente
ORDER BY total DESC;
