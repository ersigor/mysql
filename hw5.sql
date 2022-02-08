1.Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
use shop;
UPDATE users 
SET created_at = NOW() where created_at is NULL;
SET updated_at = NOW() where created_at is NULL;

2.Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
ALTER TABLE users 
    CHANGE COLUMN `created_at` `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

3.В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
INSERT INTO
    storehouses_products (storehouse_id, product_id, value)
VALUES
    (1, 1, 13),
    (2, 2, 1),
    (3, 4, 0),
    (4, 6, 3),
    (5, 7, 0);

SELECT 
    value
FROM
    storehouses_products ORDER BY CASE WHEN value = 0 then 1 else 0 end, value;
    
 1.Подсчитайте средний возраст пользователей в таблице users 
 
 select 
 avg(
 FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) as age
 from
 USERS;

2.Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
	COUNT(*) AS total
FROM
	users
GROUP BY
	day
ORDER BY
	total DESC;