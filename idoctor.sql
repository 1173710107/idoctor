/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.28-log : Database - idoctor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`idoctor` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `idoctor`;

/*Table structure for table `idt_area` */

DROP TABLE IF EXISTS `idt_area`;

CREATE TABLE `idt_area` (
  `id` int(11) NOT NULL COMMENT '主键',
  `zhou` varchar(50) NOT NULL COMMENT '大洲',
  `guo` varchar(50) NOT NULL COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `idt_city` */

DROP TABLE IF EXISTS `idt_city`;

CREATE TABLE `idt_city` (
  `id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) DEFAULT NULL,
  `cityname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `idt_disease` */

DROP TABLE IF EXISTS `idt_disease`;

CREATE TABLE `idt_disease` (
  `id` varchar(30) NOT NULL COMMENT '疾病id',
  `name` varchar(30) DEFAULT NULL COMMENT '疾病名称',
  `classify` varchar(30) DEFAULT NULL COMMENT '分类',
  `severity` varchar(30) DEFAULT NULL COMMENT '严重程度',
  `standty` varchar(30) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_hospital` */

DROP TABLE IF EXISTS `idt_hospital`;

CREATE TABLE `idt_hospital` (
  `id` varchar(30) NOT NULL COMMENT '医院id',
  `name` varchar(40) DEFAULT NULL COMMENT '医院名称',
  `level` varchar(30) DEFAULT NULL COMMENT '等级',
  `type` varchar(30) DEFAULT NULL COMMENT '类型',
  `health_point` int(4) DEFAULT NULL COMMENT '是否是医保点0不是1是',
  `beds` varchar(20) DEFAULT NULL COMMENT '病床数',
  `visits` varchar(20) DEFAULT NULL COMMENT '门诊量',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `web` varchar(255) DEFAULT NULL COMMENT '网址',
  `postcode` varchar(10) DEFAULT NULL COMMENT '邮编',
  `path` varchar(255) DEFAULT NULL COMMENT '乘车路线',
  `equipment` varchar(255) DEFAULT NULL COMMENT '主要设备',
  `subject` varchar(255) DEFAULT NULL COMMENT '特色专科',
  `introduction` varchar(510) DEFAULT NULL COMMENT '主要介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `idt_medicine` */

DROP TABLE IF EXISTS `idt_medicine`;

CREATE TABLE `idt_medicine` (
  `id` varchar(30) NOT NULL COMMENT '药品id',
  `name` varchar(30) DEFAULT NULL COMMENT '药品名称',
  `manufacturer` varchar(30) DEFAULT NULL COMMENT '出产商',
  `classification` varchar(30) DEFAULT NULL COMMENT '分类',
  `evaluation` int(30) DEFAULT NULL COMMENT '评价',
  `standby` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_medicinedetail` */

DROP TABLE IF EXISTS `idt_medicinedetail`;

CREATE TABLE `idt_medicinedetail` (
  `id` bigint(20) NOT NULL COMMENT '药品对应疾病记录id',
  `medicineid` varchar(30) DEFAULT NULL COMMENT '药品id',
  `diseaseid` varchar(30) DEFAULT NULL COMMENT '疾病id',
  PRIMARY KEY (`id`),
  KEY `FK_medicinedetail` (`medicineid`),
  KEY `FK_medicinedetail1` (`diseaseid`),
  CONSTRAINT `FK_medicinedetail` FOREIGN KEY (`medicineid`) REFERENCES `idt_medicine` (`id`),
  CONSTRAINT `FK_medicinedetail1` FOREIGN KEY (`diseaseid`) REFERENCES `idt_disease` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_pharmacy` */

DROP TABLE IF EXISTS `idt_pharmacy`;

CREATE TABLE `idt_pharmacy` (
  `id` varchar(30) NOT NULL COMMENT '药店id',
  `name` varchar(50) DEFAULT NULL COMMENT '药店名称',
  `address` varchar(255) DEFAULT NULL COMMENT '药店地址',
  `continents` varchar(50) DEFAULT NULL COMMENT '大洲',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(30) DEFAULT NULL COMMENT '省',
  `city` varchar(30) DEFAULT NULL COMMENT '市',
  `tel` int(30) DEFAULT NULL COMMENT '电话',
  `evaluation` int(10) DEFAULT NULL COMMENT '评分',
  `standby` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_post` */

DROP TABLE IF EXISTS `idt_post`;

CREATE TABLE `idt_post` (
  `id` bigint(20) NOT NULL COMMENT '帖子id',
  `posterid` varchar(30) DEFAULT NULL COMMENT '发帖人',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(30) DEFAULT NULL COMMENT '副标题',
  `content` varchar(255) DEFAULT NULL COMMENT '正文',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片url',
  `standby` varchar(30) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`),
  KEY `FK_post` (`posterid`),
  CONSTRAINT `FK_post` FOREIGN KEY (`posterid`) REFERENCES `idt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_record` */

DROP TABLE IF EXISTS `idt_record`;

CREATE TABLE `idt_record` (
  `id` varchar(30) NOT NULL COMMENT '档案id',
  `userid` varchar(30) DEFAULT NULL COMMENT '用户id',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片url',
  `standby` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`),
  KEY `FK_record` (`userid`),
  CONSTRAINT `FK_record` FOREIGN KEY (`userid`) REFERENCES `idt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_reply` */

DROP TABLE IF EXISTS `idt_reply`;

CREATE TABLE `idt_reply` (
  `id` bigint(20) NOT NULL COMMENT '回复id',
  `postid` bigint(20) DEFAULT NULL COMMENT '主贴id',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `replier` varchar(30) DEFAULT NULL COMMENT '回复人id',
  `content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `pic` varchar(255) DEFAULT NULL COMMENT '回复图片url',
  `standby` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`),
  KEY `FK_reply` (`postid`),
  KEY `FK_reply1` (`replier`),
  CONSTRAINT `FK_reply` FOREIGN KEY (`postid`) REFERENCES `idt_post` (`id`),
  CONSTRAINT `FK_reply1` FOREIGN KEY (`replier`) REFERENCES `idt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_tweets` */

DROP TABLE IF EXISTS `idt_tweets`;

CREATE TABLE `idt_tweets` (
  `id` varchar(30) NOT NULL COMMENT '推文id',
  `title` varchar(50) DEFAULT NULL COMMENT '主标题',
  `subtitle` varchar(50) DEFAULT NULL COMMENT '副标题',
  `content` varchar(1020) DEFAULT NULL COMMENT '内容',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片url',
  `authorid` varchar(30) DEFAULT NULL COMMENT '作者id',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `standby` varchar(30) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`),
  KEY `FK_tweets` (`authorid`),
  CONSTRAINT `FK_tweets` FOREIGN KEY (`authorid`) REFERENCES `idt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `idt_user` */

DROP TABLE IF EXISTS `idt_user`;

CREATE TABLE `idt_user` (
  `id` varchar(30) NOT NULL COMMENT '用户id',
  `identity` varchar(255) DEFAULT NULL COMMENT '身份认证',
  `credibility` int(50) DEFAULT NULL COMMENT '信誉值',
  `pic` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码md5加密',
  `standby` varchar(20) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
