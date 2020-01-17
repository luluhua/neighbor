2019-12-24    //--  资源表添加两个字段【sell_stale】和【sell_price】
ALTER TABLE `t_goods`
ADD COLUMN `sell_stale`  tinyint(10) DEFAULT '0'  COMMENT '是否支持出售：0不支持 1 支持' AFTER `files`,
ADD COLUMN `sell_price`  decimal(10,2) DEFAULT NULL COMMENT '出售价格' AFTER `sell_stale`;


2019-12-25    //--  资源评分表添加一个字段【score】
ALTER TABLE `t_goods_grade`
ADD COLUMN `score`  int(10) DEFAULT '0'  COMMENT '分数' AFTER `files`;

2020-1-09    //--  资源表添加三个字段【location】、【lng】、【lat】
ALTER TABLE `t_goods`
ADD COLUMN `location`  varchar(255) DEFAULT null  COMMENT '地址' AFTER `sell_price`,
ADD COLUMN `lng`  decimal(20,8) DEFAULT NULL COMMENT '经度' AFTER `lng`;
ADD COLUMN `lat`  decimal(20,8) DEFAULT NULL COMMENT '维度' AFTER `location`;

2020-1-14    //--  资源表添加一个字段【status】
ALTER TABLE `t_goods`
ADD COLUMN `status`  tinyint(2) DEFAULT '0'  COMMENT '0：上架  1下架' AFTER `lat`,

2020-1-17    //--  信息表
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发送者',
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型 0系统消息  1用户消息',
  `userName` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '附件 多个,隔开',
  `status` tinyint(2) DEFAULT NULL COMMENT '是否已读 0：未读 1：已读',
  `dt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(2) DEFAULT NULL COMMENT '是否删除 1:已删除 0：未删除',
  `uset` tinyint(2) DEFAULT NULL COMMENT '0发送者  1自己',
  PRIMARY KEY (`id`)
)

