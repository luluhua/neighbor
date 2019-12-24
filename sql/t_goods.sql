/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : neighbor

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-12-24 15:52:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `tag_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签id',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户Id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '物品名称',
  `describe` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `specification` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '规格',
  `intro` text COLLATE utf8_bin COMMENT '介绍',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `Images` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `price_type` tinyint(10) DEFAULT '0' COMMENT '价格类型 0单价 1总价',
  `sort_index` int(10) DEFAULT NULL,
  `navigation_code` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '导航code',
  `dt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '是否删除 1:已删除 0：未删除',
  `files` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `sell_stale` tinyint(10) DEFAULT '0' COMMENT '是否支持出售：0不支持 1 支持',
  `sell_price` decimal(10,2) DEFAULT NULL COMMENT '出售价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='物品信息表';
