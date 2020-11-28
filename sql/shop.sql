/*
 Navicat Premium Data Transfer

 Source Server         : 云数据库连接
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 49.234.70.24:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 28/11/2020 22:54:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_order
-- ----------------------------
DROP TABLE IF EXISTS `base_order`;
CREATE TABLE `base_order`  (
  `pk_base_order_id` bigint(20) NOT NULL DEFAULT 0 AUTO_INCREMENT COMMENT '订单id',
  `fk_merchants_id` bigint(20) NULL DEFAULT NULL COMMENT '商户id',
  `fk_client_id` bigint(20) NULL DEFAULT NULL COMMENT '客户id',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_base_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_order
-- ----------------------------

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `pk_classification_id` bigint(20) NOT NULL COMMENT '商品类别id',
  `classification_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_classification_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classification
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `pk_client_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `client_No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `client_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `head_portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------

-- ----------------------------
-- Table structure for client_account
-- ----------------------------
DROP TABLE IF EXISTS `client_account`;
CREATE TABLE `client_account`  (
  `pk_client_account_id` bigint(20) NOT NULL COMMENT '客户资金账户表id',
  `client_account_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户资金账户编号',
  `client_account_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '总金额',
  `consumption_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `surplus_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '剩余金额',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_client_account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户资金账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_account
-- ----------------------------

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `pk_commodity_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品表id',
  `commodity_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `commodity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `is_promotion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否采取促销价格：n：未采用促销价格，y：已采取促销价格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `promotion_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销价格',
  `volume` bigint(20) NULL DEFAULT NULL COMMENT '销量',
  `evaluate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '累计评价',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `fk_industry_id` bigint(20) NULL DEFAULT NULL COMMENT '主级行业id',
  `fk_secondary_industry_id` bigint(20) NULL DEFAULT NULL COMMENT '次级行业id',
  `fk_classification_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类别id',
  `integral` bigint(20) NULL DEFAULT NULL COMMENT '可送积分',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_commodity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------

-- ----------------------------
-- Table structure for commodity_color
-- ----------------------------
DROP TABLE IF EXISTS `commodity_color`;
CREATE TABLE `commodity_color`  (
  `pk_commodity_color_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品颜色分类表id',
  `commodity_color_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_commodity_color_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品颜色分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_color
-- ----------------------------

-- ----------------------------
-- Table structure for commodity_color_relation
-- ----------------------------
DROP TABLE IF EXISTS `commodity_color_relation`;
CREATE TABLE `commodity_color_relation`  (
  `pk_commodity_color_relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品颜色关联表id',
  `fk_commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品表id',
  `pk_commodity_color_id` bigint(20) NULL DEFAULT NULL COMMENT '商品颜色分类表',
  `number` bigint(20) NULL DEFAULT NULL COMMENT '库存',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_commodity_color_relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品颜色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_color_relation
-- ----------------------------

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express`  (
  `pk_express_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '快递表id',
  `express_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递编号',
  `express_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_express_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES (1, 'SF', '顺丰速运', 1000, '2020-11-28 17:42:49', '2020-11-28 17:42:52', 'n');

-- ----------------------------
-- Table structure for industry
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry`  (
  `pk_industry_id` bigint(20) NOT NULL COMMENT '行业表id',
  `industry_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业编号',
  `industry_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_industry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of industry
-- ----------------------------

-- ----------------------------
-- Table structure for industry_secondary_relation
-- ----------------------------
DROP TABLE IF EXISTS `industry_secondary_relation`;
CREATE TABLE `industry_secondary_relation`  (
  `pk_industry_secondary_relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主次行业关联表id',
  `fk_industry_id` bigint(20) NULL DEFAULT NULL COMMENT '行业表id',
  `fk_secondary_industry_id` bigint(20) NULL DEFAULT NULL COMMENT '次级行业表id',
  `fk_classification_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类别',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_industry_secondary_relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主次行业关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of industry_secondary_relation
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_records
-- ----------------------------
DROP TABLE IF EXISTS `logistics_records`;
CREATE TABLE `logistics_records`  (
  `pk_logistics_records_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单物流记录表id',
  `logistics_records_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流记录编号',
  `fk_base_order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `fk_express_id` bigint(20) NULL DEFAULT NULL COMMENT '快递id',
  `collect_adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `pick_up` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取件地址',
  `seller_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家电话',
  `buyer_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家电话',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流备注',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_logistics_records_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单物流记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logistics_records
-- ----------------------------

-- ----------------------------
-- Table structure for merchants
-- ----------------------------
DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants`  (
  `pk_merchants_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商户表id',
  `merchants_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `fk_client_id` bigint(20) NULL DEFAULT NULL COMMENT '客户id',
  `money` decimal(15, 2) NULL DEFAULT NULL COMMENT '商户总资金',
  `no_withdrawal

_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '已提现金额',
  `cash_advance_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '可提现金额（已确认收货资金）',
  `frozen_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '冻结金额（未确认收货资金）',
  `guarantee

_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '商铺开户担保金额（资质）',
  `merchants_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家级别：merchantsLevel000：青铜卖家，merchants_level001：白银卖家，merchants_level002：黄金卖家，\r\nmerchants_level003：钻石卖家',
  `desc_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺商品描述评分',
  `service_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺服务评分',
  `logistics_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺物流评分',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_merchants_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchants
-- ----------------------------

-- ----------------------------
-- Table structure for order_commodity_relation
-- ----------------------------
DROP TABLE IF EXISTS `order_commodity_relation`;
CREATE TABLE `order_commodity_relation`  (
  `pk_order_commodity_relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单商品关联表id',
  `fk_base_order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `fk_commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `number` bigint(20) NULL DEFAULT NULL COMMENT '购买数量',
  `money` decimal(15, 2) NULL DEFAULT NULL COMMENT '成交金额',
  `discount` decimal(15, 2) NULL DEFAULT NULL COMMENT '折扣',
  `is_settlement` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否结算：settlement000：未结算，settlement001：已结算',
  `fk_logistics_records_id` bigint(20) NULL DEFAULT NULL COMMENT '物流记录表id',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_order_commodity_relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单商品关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_commodity_relation
-- ----------------------------

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner`  (
  `pk_partner_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '合作商表id',
  `partner_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页地址',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_partner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合作商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partner
-- ----------------------------

-- ----------------------------
-- Table structure for secondary_industry
-- ----------------------------
DROP TABLE IF EXISTS `secondary_industry`;
CREATE TABLE `secondary_industry`  (
  `pk_secondary_industry_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '次级行业表id',
  `secondary_industry_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_secondary_industry_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '次级行业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of secondary_industry
-- ----------------------------

-- ----------------------------
-- Table structure for system_parameter
-- ----------------------------
DROP TABLE IF EXISTS `system_parameter`;
CREATE TABLE `system_parameter`  (
  `pk_system_enum_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统枚举表id',
  `system_enum_no` int(11) NULL DEFAULT NULL COMMENT '枚举编号',
  `constant` bigint(20) NULL DEFAULT NULL COMMENT '枚举常量',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举key',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举值',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_del` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '假删除:n未删除y已删除',
  PRIMARY KEY (`pk_system_enum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_parameter
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
