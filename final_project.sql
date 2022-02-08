1. Составить общее текстовое описание БД и решаемых ею задач;
База данных "EQUIPMENT" создана для ведения учета оборудования внутри компании.
Каждому блоку оборудования, стоящему на учете присваивается единица оборудования. Оборудование распологается на местоположениях.  
БД состоит из следующих таблиц:
-местоположение
-единица оборудования
-производитель
-материально ответственное лицо
-основное средство
-документ поступления
-система для подключения к управлению оборудованию
	-сеть управления
-№ контракта по которому оборудование установлено
	-клиента
	

2.
CREATE DATABASE EQUIPMENT;
use EQUIPMENT;

DROP TABLE IF EXISTS `place`;
CREATE TABLE `place` (
	`id_place` INT DEFAULT NULL,
	`name` varchar(255) DEFAULT NULL,
	`address` varchar(255) DEFAULT NULL,
	
  	PRIMARY KEY (`id_place`)
);

DROP TABLE IF EXISTS `equipment_unit`;
CREATE TABLE `equipment_unit` (
	`id_equipment` int,
	`place` int DEFAULT NULL,
	`manufacturer` INT DEFAULT NULL,
    `responsible_person` int DEFAULT NULL,
    `fixed_asset` int,
  	`come_document` varchar(100) DEFAULT NULL,  	
    `system_managment` int DEFAULT NULL,
	`contract` int,

    FOREIGN KEY (place) REFERENCES place(id_place),
    FOREIGN KEY (manufacturer) REFERENCES manufacturer(id_manufacturer),
    FOREIGN KEY (responsible_person) REFERENCES responsible_person(id_person),
    FOREIGN KEY (fixed_asset) REFERENCES fixed_asset(id_fixed_asset),
    FOREIGN KEY (come_document) REFERENCES come_document(id_come_document),
    FOREIGN KEY (system_managment) REFERENCES system_managment(id_system),
    FOREIGN KEY (contract) REFERENCES contract(contract_number),
  	PRIMARY KEY (`id_equipment`)
);

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
	`id_manufacturer` int,
	`name` varchar(255) DEFAULT NULL,
	`country` varchar(255) DEFAULT NULL,
    
  	PRIMARY KEY (`id_manufacturer`)
);


DROP TABLE IF EXISTS `responsible_person`;
CREATE TABLE `responsible_person` (
	`id_person` int,
	`name` varchar(255) DEFAULT NULL,
	`surname` varchar(255) DEFAULT NULL,
	`adress` varchar(255) DEFAULT NULL,
    
  	PRIMARY KEY (`id_person`)
);

DROP TABLE IF EXISTS `fixed_asset`;
CREATE TABLE `fixed_asset` (
	`id_fixed_asset` int,
	`group` varchar(255) DEFAULT NULL,
	`cost` int unsigned DEFAULT NULL,
    `id_person` int dEFAULT NULL,
    `equipment_unit` int,
    
    FOREIGN KEY (id_person) REFERENCES responsible_person(id_person),
  	PRIMARY KEY (`id_fixed_asset`)
 );

DROP TABLE IF EXISTS `come_document`;
CREATE TABLE `come_document` (
	`id_come_document` varchar(100),
	`created_at` DATETIME default NULL, 
	`equipment units` int unsigned DEFAULT NULL,
    
  	PRIMARY KEY (`id_come_document`)  
  ); 	


DROP TABLE IF EXISTS `system_managment`;
CREATE TABLE `system_managment` (
	`id_system` int,
	`name` varchar(255) DEFAULT NULL,

  	PRIMARY KEY (`id_system`)  	
  ); 	
DROP TABLE IF EXISTS `network`;
CREATE TABLE `network` (
	`ip_network` int,
	`mask` varchar(255) DEFAULT NULL,
	`address_network` varchar(255) DEFAULT NULL,
    `system_managment` int,
    
    FOREIGN KEY (system_managment) REFERENCES system_managment(id_system),
  	PRIMARY KEY (`ip_network`)  
  ); 	
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
	`contract_number` int,
	`name` varchar(255) DEFAULT NULL,
	`cost` int DEFAULT NULL,
	`client_id` INT,
    
    FOREIGN KEY (client_id) REFERENCES client(client_id),
  	PRIMARY KEY (`contract_number`)  	
   );	
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
	`client_id` int ,
	`contract_numbers` int,
	`name` varchar(255) DEFAULT NULL,

	    
  	PRIMARY KEY (`client_id`) 
    );
insert into client (client_id,contract_numbers,name) values
('1', '1','IBM'),
('2', '2', 'Microsoft'),
('3', '2', 'Apple'),
('4', '6','Oracle'),
('5', '8', 'Amazon'),
('6', '2', 'Telegram')
;
insert into contract (contract_number,name,cost,client_id) values
('1', 'telefon','20000','1'),
('2', 'telefon','2000023','2'),
('3', 'telefon','2000230','2'),
('4', 'telefon','20034','4'),
('5', 'telefon','202323','5'),
('6', 'server','150000','6'),
('7', 'server','3000','6'),
('8', 'server','700000','4'),
('9', 'server','200000','2'),
('10', 'server','20032434','2')
;
insert into come_document (id_come_document,created_at, `equipment units`) values
('1', '1977-07-13 14:33:35','1'),
('2', '1975-07-15 14:33:35','2'),
('3', '2021-07-12 14:33:36','3'),
('4', '2021-07-01 14:33:34','4'),
('5', '2021-03-04 14:33:34','5'),
('6', '2021-01-17 14:35:35','1'),
('7', '2021-09-23 14:34:35','2'),
('8', '2021-10-31 14:31:35','1'),
('9', '2021-09-30 15:33:35','1'),
('10', '2021-02-01 17:33:35','8')
;
insert into fixed_asset (id_fixed_asset,`group`,cost,id_person,equipment_unit)values
('1','mobile','1023','1','1'),
('2','mobile','102323','1','2'),
('3','mobile','1002323','1','3'),
('4','mobile','100454','2','4'),
('5','electric','10045','3','5'),
('6','electric','1076','4','6'),
('7','electric','1212','5','7'),
('8','electric','65887','2','8'),
('9','electric','2427','7','9'),
('10','electric','89766','8','10'),
('11','mobile','1023','1','1'),
('12','mobile','102323','1','2'),
('13','mobile','1002323','1','3'),
('14','mobile','100454','2','4'),
('15','electric','10045','3','5');
insert into manufacturer (id_manufacturer,name,country) values
('1','ibm','usa'),
('2','huawei','china'),
('3','cisco','usa'),
('4','oracle','usa'),
('5','lenovo','china'),
('6','ericsson','sweden'),
('7','nokia','finland'),
('8','alcatel','france'),
('9','ZTE','china'),
('10','yandex','russia');
insert into network (ip_network, mask,address_network,system_managment) values
('1','255','192.168.0.0','1'),
('2','255','192.168.0.0','1'),
('3','255','192.168.0.0','1'),
('4','255','192.168.0.0','2'),
('5','255','192.168.0.0','2'),
('6','255','192.168.0.0','2'),
('7','250','192.168.0.112','3'),
('8','250','192.168.0.112','3'),
('9','250','192.168.0.112','3'),
('10','250','192.168.0.112','1');
insert into place (id_place,name,address) values
('1','office','spb,lenina 9'),
('2','shop','spb,lenina 10'),
('3','office','spb,lenina 12'),
('4','office','spb,lenina 45'),
('5','shop','spb,lenina 34'),
('6','shop','moscow,pupkina 9'),
('7','shop','moscow,pupkina 90'),
('8','office','moscow,pupkina 999'),
('9','office','moscow,pupkina 666'),
('10','office','moscow,pupkina 12');
insert  into responsible_person (id_person,name,surname,adress) values
('1','petr','petrov','spb'),
('2','dmitri','arkanov','spb'),
('3','anton','urupin','spb'),
('4','victor','zigovov','spb'),
('5','svetlana','ruhina','spb'),
('6','maria','ivanova','moscow'),
('7','anna','pup','moscow'),
('8','victoria','chor','moscow'),
('9','ivan','tit','moscow'),
('10','roman','petrov','moscow');
insert  into system_managment (id_system,name) values
('1','iom'),
('2','iop'),
('3','ior');
insert into equipment_unit (id_equipment,place,manufacturer,responsible_person,fixed_asset,come_document,system_managment,contract) values
('1','1','1','1','1','1','1','1'),
('2','2','2','2','2','1','2','1'),
('3','3','3','3','3','1','3','1'),
('4','4','4','4','4','2','4','1'),
('5','5','5','5','5','2','5','1'),
('6','6','6','6','6','2','6','1'),
('7','7','7','7','7','3','7','1'),
('8','8','8','8','8','3','8','1'),
('9','9','9','9','9','3','9','1'),
('10','10','10','10','1','1','10','2'),
('11','1','1','1','1','1','1','2'),
('12','2','2','2','2','1','2','2'),
('13','3','3','3','3','2','3','2'),
('14','4','4','5','4','2','4','2'),
('15','5','5','4','5','2','5','2');
Составить список основных средств и ответственных за них
SELECT 
	cost as COST
	responsible_person.name,
	responsible_person.surname 
	 
  FROM fixed_asset 
  JOIN responsible_person ON  responsible_person.id_person= fixed_asset.id_person;
 
Вывести оборудование находящиеся на площадке типа "office", производителя и систему в которой работает оборудование

select 
	id_equipment,
	manufacturer.name as manufacturer,
	system_managment.name as system_managment 
from equipment_unit 
join place on place.id_place=id_equipment
join manufacturer on manufacturer.id_manufacturer =equipment_unit.manufacturer
join system_managment on system_managment.id_system =system_managment 
where place.name='office'

Представления: ответственные по фамилии
CREATE VIEW 
responsible_persons 
AS SELECT * FROM responsible_person  ORDER BY surname;

Триггер:создание даты в таблице документов при создании новой единицы оборудования
use equipment;
DROP TRIGGER IF EXISTS log_come_documents;
delimiter //
CREATE TRIGGER log_come_documents AFTER INSERT ON `equipment_unit`
FOR EACH row 
BEGIN
	INSERT INTO come_document(id_come_document,created_at)
	VALUES ('null', NOW());
END //
delimiter ;


insert into equipment_unit (id_equipment,place,manufacturer,responsible_person,fixed_asset,come_document,system_managment,contract) values
('20','1','1','1','1','1','1','1');