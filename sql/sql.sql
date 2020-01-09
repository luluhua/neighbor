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

