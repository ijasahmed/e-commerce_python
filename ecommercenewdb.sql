/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - ecommercerating
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommercerating` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecommercerating`;

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `reply` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`id`,`user_id`,`complaint`,`date`,`reply`) values 
(6,11,'delivery boys behavir is not good\r\n','2022-02-19',' ok\r\n\r\n'),
(7,11,'nm,m,m','2022-06-10',' ok');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `useerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`feedback`,`date`,`useerid`) values 
(4,'easy to use','2022-02-04',8),
(5,'your product not good','2022-02-19',11),
(6,'easy to use','2022-02-19',11),
(7,'mvnm','2022-06-10',11);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'user','user','block'),
(3,'shop','shop','shop'),
(4,'jamjoom','Jamjoom123','shop'),
(5,'786543','9087654321','block'),
(6,'678543','7896543210','user'),
(7,'max','AA123456a','shop'),
(8,'anus','wer@qwe67A','block'),
(9,'vkm','Vkm_123@456','shop'),
(11,'ijas','Ijas1234','user'),
(12,'mfc','Mfc12345','shop'),
(13,'lulu','Lulu1234','shop'),
(14,'HJK','Ijas@1999','shop'),
(15,'ij','Ijas@1999','user'),
(16,'sana','Sana1234','shop');

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `offer` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `offer` */

insert  into `offer`(`id`,`pid`,`offer`,`date`) values 
(4,7,'20%','2022-02-21'),
(5,7,'20','2022-02-22'),
(6,8,'20%','2022-06-12');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `quantity` varchar(300) DEFAULT NULL,
  `status` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `order` */

insert  into `order`(`id`,`userId`,`pid`,`amount`,`quantity`,`status`) values 
(1,5,1,'20','2','rejected'),
(2,8,1,'40','6000','accpted'),
(3,8,2,'2','120','rejected'),
(4,8,2,'2','20','rejected'),
(5,8,3,'5','50','accpted'),
(6,11,2,'12','120','rejected'),
(7,11,4,'10','1200','rejected'),
(8,11,4,'10','1200','accpted'),
(9,11,1,'10','600','accpted'),
(10,11,7,'2','896','pending'),
(11,11,8,'2','60598','pending'),
(12,11,7,'2','896','pending'),
(13,11,13,'1','22200','pending'),
(14,11,15,'1','23890','pending');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` varchar(200) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`id`,`productname`,`description`,`price`,`stock`,`shop_id`,`image`) values 
(11,'DELL Inspiron Core i3','Core i3 11th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 11 Home) Inspiron 3511 Thin and Light Laptop  (15.6 Inch, Carbon Black, 1.8 Kgs, With MS Office)',44999,'6',13,'static/images/23ca4922-d475-44ec-b4de-fe8e5b71eaf1E5.jpeg'),
(14,'POCO C31','POCO C31 (Royal Blue, 64 GB)  (4 GB RAM),Mobile phone',12000,'12',16,'static/images/0a87bc81-02aa-4fc8-8f95-fa60b531dbc9c31-mzb0a0jin-poco-original-imag7bzqxgdhgf2n.webp'),
(15,'Lenovo IdeaPad','Lenovo IdeaPad 1 Intel Celeron N4020 11.6\'\' HD Laptop (4GB/256GB SSD/Windows 11/Office 2021/Platinum Grey/1.2Kg), 81VT009UIN',23890,'1',13,'static/images/5684e4d3-74d6-4565-ada7-0e361619800d61km1VkaCsL._SX679_.jpg'),
(16,'HP Pavilion ','HP Pavilion 14 12th Gen Intel Core i5 16GB SDRAM/512GB SSD 14 inch(35.6cm) ,HP Laptop ,FHD,IPS,Micro-Edge Display/Intel UHD Graphics/B&O/Win 11/Alexa Built-in/Backlit KB/FPR/MSO 2021/Natural Silver, 1',68990,'3',13,'static/images/0f67fb50-7cb7-4dbd-96cf-3f93a8fe2ca961sdH+DGGDL._SX522_.jpg'),
(17,'ASUS ZenBook','ASUS ZenBook 14 (2020) Intel Core i5-1135G7 11th Gen 14-inch (35.56 cms) FHD T&L Laptop (8GB RAM/512GB NVMe SSD/Windows 10/MS Office 2019/Intel Iris X? Graphics/Pine Grey/1.17 kg), UX425EA-BM501TS',78990,'1',13,'static/images/377ea3c5-849d-4deb-b4a3-063517ac783c71lT-zWEYkL._SX522_.jpg'),
(18,'Lenovo IdeaPad','Lenovo IdeaPad Slim 3 10th Gen Intel Core i3 15.6\" FHD Thin & Light Laptop(8GB/1TB HDD/2Yr Warranty/Windows 11/Office 2021/220Nits/3months Xbox Game Pass/Platinum Grey/1.7Kg),81WB018YIN',32990,'2',13,'static/images/444b29b4-65e9-4b4e-8dea-b60bc9c42f2761Dw5Z8LzJL._SX679_.jpg'),
(19,'Leather Chair',' Tall Executive Office Leather Chair, Adjustable Armrest, 350 Pound Capacity, Black with Pewter Finish,Furniture',2000,'2',12,'static/images/1e2475c7-fd09-4b4f-b448-f76ccd72da6271sjjcwJ6cL._SY879_.jpg'),
(20,'Fossil Gen','Fossil Gen 5 Touchscreen Men\'s Smart watch with Speaker, Heart Rate, GPS, Music Storage Notifications',12000,'2',14,'static/images/d2c69c5d-76cb-46db-90f0-e15dd7c0258971qNX0wixBL._UX522_.jpg');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `review` varchar(300) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`id`,`userid`,`review`,`date`,`productid`,`rating`) values 
(1,1,'good product','2022-02-04',1,'3.71999999'),
(2,2,'good','2022-02-04',1,'5.0'),
(3,3,'goood','2022-02-04',1,'2.5'),
(4,1,'goood','2022-02-04',1,'2.5'),
(5,2,'nice to use','2022-02-04',3,'2.915'),
(6,3,'nice to use','2022-02-04',3,'2.915'),
(7,1,'not good to use','2022-02-04',3,'0.27499999'),
(8,3,'good','2022-02-19',4,'5.0'),
(9,1,'nice','2022-02-19',3,'5.0'),
(10,2,'good','2022-02-19',3,'5.0'),
(11,3,'good','2022-02-19',3,'5.0'),
(12,11,'its bad','2022-02-19',2,'1.10999999'),
(13,11,'good','2022-02-19',2,'5.0'),
(14,11,'good','2022-02-19',7,'5.0'),
(15,11,'good','2022-02-19',7,'5.0'),
(16,11,'nice','2022-02-19',8,'5.0'),
(17,11,'GOOD','2022-02-22',10,'5.0'),
(18,11,'good looking and it is worthy','2022-02-22',9,'2.96'),
(19,11,'good product','2022-02-22',11,'3.71999999'),
(20,11,'good','2022-02-22',8,'5.0'),
(21,11,'nbjnm','2022-06-10',7,'2.5'),
(22,11,'mjk','2022-06-10',7,'2.5'),
(23,11,'nnn','2022-06-12',7,'2.5'),
(24,11,'good','2022-06-14',12,'5.0'),
(25,11,'good','2022-06-27',13,'5.0'),
(26,11,'not bad','2022-06-27',8,'3.7'),
(27,11,'good','2022-06-27',14,'5.0'),
(28,11,'bad','2022-06-27',14,'0.0'),
(29,11,'not bad','2022-06-27',14,'3.7'),
(30,11,'good','2022-06-27',14,'5.0');

/*Table structure for table `shop_reg` */

DROP TABLE IF EXISTS `shop_reg`;

CREATE TABLE `shop_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(200) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `post` varchar(200) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `shop_reg` */

insert  into `shop_reg`(`id`,`shopname`,`place`,`post`,`pin`,`phone`,`lid`) values 
(1,'max','clt','clts',656785,7890567890,7),
(2,'vkm','Areacode','areacode',673639,9807654321,9),
(3,'mfc','Pulamanthole','Pulamanthole',679309,7034455703,12),
(4,'lulu','kochi','kochi',679309,7034455703,13),
(5,'HJK','VBN','NBHJ',679309,7034455703,14),
(6,'sana','Pulamanthole','Pulamanthole',679309,9447254307,16);

/*Table structure for table `user_reg` */

DROP TABLE IF EXISTS `user_reg`;

CREATE TABLE `user_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `post` varchar(200) DEFAULT NULL,
  `pin` varchar(200) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`phone`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user_reg` */

insert  into `user_reg`(`id`,`firstname`,`lastname`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`lid`) values 
(1,'user','k','male','kochi','kochi','654321',9087654321,'user@gmail.com',5),
(2,'anu','k','female','cls','cls','678908',8978987890,'an@gmail.com',8),
(3,'IJAS','AHAMMED M','male','Pulamanthole','Plamanthole','679309',7034455703,'mijasahammed@gmail.com',11);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
