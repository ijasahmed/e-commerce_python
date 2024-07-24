`mysql``performance_schema`/*
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) DEFAULT NULL,
  `complaint` VARCHAR(200) DEFAULT NULL,
  `date` VARCHAR(200) DEFAULT NULL,
  `reply` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

INSERT  INTO `complaint`(`id`,`user_id`,`complaint`,`date`,`reply`) VALUES 
(1,5,'cccc','2012-08-08',' finn'),
(2,8,'kkll','2022-02-04',' kjgjhn'),
(3,8,'jkhdsfkj\r\n','2022-02-04',' '),
(4,8,'not ok','2022-02-04',' Ok... let me check');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `feedback` VARCHAR(200) DEFAULT NULL,
  `date` VARCHAR(200) DEFAULT NULL,
  `useerid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

INSERT  INTO `feedback`(`id`,`feedback`,`date`,`useerid`) VALUES 
(1,'good','9/12/22',5),
(2,'good','2022-02-04',8),
(3,'good','2022-02-04',8),
(4,'easy to use','2022-02-04',8);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) DEFAULT NULL,
  `password` VARCHAR(200) DEFAULT NULL,
  `type` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`username`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

INSERT  INTO `login`(`id`,`username`,`password`,`type`) VALUES 
(1,'admin','admin','admin'),
(2,'user','user','block'),
(3,'shop','shop','shop'),
(4,'jamjoom','Jamjoom123','shop'),
(5,'786543','9087654321','block'),
(6,'678543','7896543210','user'),
(7,'max','AA123456a','shop'),
(8,'anus','wer@qwe67A','user'),
(9,'vkm','Vkm_123@456','shop'),
(10,NULL,NULL,NULL);

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pid` INT(11) DEFAULT NULL,
  `offer` VARCHAR(200) DEFAULT NULL,
  `date` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `offer` */

INSERT  INTO `offer`(`id`,`pid`,`offer`,`date`) VALUES 
(1,1,'87ghjfhf','2022-02-03'),
(2,3,'buy one get 2','2022-02-04');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userId` INT(11) DEFAULT NULL,
  `pid` INT(11) DEFAULT NULL,
  `amount` VARCHAR(200) DEFAULT NULL,
  `quantity` VARCHAR(300) DEFAULT NULL,
  `status` VARCHAR(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `order` */

INSERT  INTO `order`(`id`,`userId`,`pid`,`amount`,`quantity`,`status`) VALUES 
(1,5,1,'20','2','rejected'),
(2,8,1,'40','6000','accpted'),
(3,8,2,'2','120','pending'),
(4,8,2,'2','20','rejected'),
(5,8,3,'5','50','accpted');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `productname` VARCHAR(200) DEFAULT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `price` INT(11) DEFAULT NULL,
  `stock` VARCHAR(200) DEFAULT NULL,
  `shop_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

INSERT  INTO `product`(`id`,`productname`,`description`,`price`,`stock`,`shop_id`) VALUES 
(1,'soap','bnm',60,'200',7),
(2,'Tissue','good and soft',10,'4',9),
(3,'pencil','Apsara',10,'5',9);

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userid` INT(11) DEFAULT NULL,
  `review` VARCHAR(300) DEFAULT NULL,
  `date` VARCHAR(200) DEFAULT NULL,
  `productid` INT(11) DEFAULT NULL,
  `rating` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

INSERT  INTO `review`(`id`,`userid`,`review`,`date`,`productid`,`rating`) VALUES 
(1,8,'good product','2022-02-04',1,'3.71999999'),
(2,8,'good','2022-02-04',1,'5.0'),
(3,8,'goood','2022-02-04',1,'2.5'),
(4,8,'goood','2022-02-04',1,'2.5'),
(5,8,'nice to use','2022-02-04',3,'2.915'),
(6,8,'nice to use','2022-02-04',3,'2.915'),
(7,8,'not good to use','2022-02-04',3,'0.27499999');

/*Table structure for table `shop_reg` */

DROP TABLE IF EXISTS `shop_reg`;

CREATE TABLE `shop_reg` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `shopname` VARCHAR(200) DEFAULT NULL,
  `place` VARCHAR(200) DEFAULT NULL,
  `post` VARCHAR(200) DEFAULT NULL,
  `pin` INT(11) DEFAULT NULL,
  `phone` BIGINT(20) DEFAULT NULL,
  `lid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `shop_reg` */

INSERT  INTO `shop_reg`(`id`,`shopname`,`place`,`post`,`pin`,`phone`,`lid`) VALUES 
(1,'max','clt','clts',656785,7890567890,7),
(2,'vkm','Areacode','areacode',673639,9807654321,9);

/*Table structure for table `user_reg` */

DROP TABLE IF EXISTS `user_reg`;

CREATE TABLE `user_reg` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(200) DEFAULT NULL,
  `lastname` VARCHAR(200) DEFAULT NULL,
  `gender` VARCHAR(200) DEFAULT NULL,
  `place` VARCHAR(200) DEFAULT NULL,
  `post` VARCHAR(200) DEFAULT NULL,
  `pin` VARCHAR(200) DEFAULT NULL,
  `phone` BIGINT(20) DEFAULT NULL,
  `email` VARCHAR(200) DEFAULT NULL,
  `lid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`phone`,`email`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user_reg` */

INSERT  INTO `user_reg`(`id`,`firstname`,`lastname`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`lid`) VALUES 
(1,'user','k','male','kochi','kochi','654321',9087654321,'user@gmail.com',5),
(2,'anu','k','female','cls','cls','678908',8978987890,'an@gmail.com',8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
