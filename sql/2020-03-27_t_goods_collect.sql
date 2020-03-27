/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : neighbor

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-03-27 16:38:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_collect`;
CREATE TABLE `t_goods_collect` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `goods_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '物品id',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `dt_create` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1:已删除 0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
