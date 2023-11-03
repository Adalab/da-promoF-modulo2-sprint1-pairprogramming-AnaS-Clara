SELECT `employee_id`, `last_name`, `first_name`
	FROM `employees`;
    
SELECT `product_name`
	FROM `products`
	WHERE `unit_price` BETWEEN 0 AND 5;

 SELECT `product_name`
	FROM `products`
	WHERE `unit_price` IS NULL;
    
SELECT `product_name`
	FROM `products`
 WHERE `unit_price` < 15 AND `product_id` < 10;
 
SELECT `product_name`
	FROM `products`
 WHERE `unit_price` > 15 AND `product_id` > 10;
 
SELECT `product_name` -- NO CONSEGUIMOS EL RESULTADO CON WHERE NOT, SOLO CUMPLE LA PRIMERA CONDICIÓN
	FROM `products`
 WHERE NOT `unit_price` < 15 `product_id` < 10;
 
 SELECT DISTINCT `ship_country`
	FROM `orders`
    
SELECT `product_name`, `unit_price`
	FROM `products`
    ORDER BY `product_id` ASC
    LIMIT 10;
    
SELECT `product_name`, `unit_price`
	FROM `products`
    ORDER BY `product_id` DESC
    LIMIT 10;

SELECT DISTINCT `order_id`
	FROM `order_details`

SELECT `unit_price`, `quantity`, `unit_price` * `quantity` AS `importe_total`
	FROM `order_details`
	ORDER BY `importe_total` DESC
	LIMIT 3;

SELECT `unit_price`, `quantity`, `unit_price` * `quantity` AS `importe_total`
	FROM `order_details`
	ORDER BY `importe_total` DESC
	LIMIT 5 OFFSET 4;

SELECT `category_name` AS `nombre_de_categoria`
	FROM `categories`

SELECT `shipped_date` AS `fecha_retrasada`,
	DATE_ADD(`shipped_date`, INTERVAL 5 DAY) AS `nueva_fecha_envio`
	FROM `orders`
    WHERE DATE_ADD(`shipped_date`, INTERVAL 5 DAY) < NOW();