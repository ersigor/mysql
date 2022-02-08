use shop;

1.Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT distinct 
	name
  FROM users
    JOIN orders ON orders.user_id = users.id
  
 2.Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT  
	 products.name, products.desription, products.price,catalogs.name
  FROM products  
    left JOIN catalogs ON catalogs.id = catalog_id