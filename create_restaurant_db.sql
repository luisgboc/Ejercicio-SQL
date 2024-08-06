-- ///////// SECCION 1 //////////
-- Explorar tabla "menu_items" para conocer los productos del menú
SELECT * FROM menu_items

-- Encontrar el número de artículos en el menú
SELECT COUNT(*)
FROM menu_items

-- ¿Cuál es el artículo menos caro y más caro en el menú?
SELECT MAX(price), MIN(price)
FROM menu_items;

-- ¿Cuántos platos americanos hay en el menú?
SELECT COUNT(category)
FROM menu_items
WHERE (category='American');

-- ¿Cuál es el precio promedio de los platos?
SELECT ROUND(AVG(price),2)
FROM menu_items;

-- ///////// SECCION 2 //////////
-- Explorar la tabal "order_details" para conocer los datos que han sido recolectados
SELECT * FROM order_details;

-- ¿Cuántos pedidos únicos se realizaron en total?
SELECT COUNT (DISTINCT order_id)
FROM order_details;

-- ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT order_id, COUNT(*) AS top_5
FROM order_details
GROUP BY order_id 
ORDER BY top_5 DESC
LIMIT 5;

-- ¿Cuándo se realizó el primer pedido y el último pedido?
(SELECT *
FROM order_details
ORDER BY order_date ASC
    LIMIT 1
)
UNION ALL
(
    SELECT *
    FROM order_details
    ORDER BY order_date DESC
    LIMIT 1
);

-- ¿Cuántos pedidos se hicieron entre el "2023-01-01" y el "2023-01-05"
SELECT COUNT(*)
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';


-- ////////////// SECCIÓN 3 ////////////
-- Realizar  un left join entre order_details y menu_items con el identificador
-- item_id(tabla order_details) y menu_item_id(tabla menu_items).
SELECT *
FROM order_details 
LEFT JOIN menu_items ON item_id = menu_item_id;


-- Análisis de categoría más vendida 
SELECT category, COUNT(order_id) AS ordenes_categoria
FROM order_details
LEFT JOIN menu_items on item_id = menu_item_id
GROUP BY category
ORDER BY ordenes_categoria DESC;
