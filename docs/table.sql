-- 建库
CREATE DATABASE IF NOT EXISTS `wechat_mall` CHARACTER SET = utf8mb4;

-- 小程序-用户表
CREATE TABLE `wechat_mall_user` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '微信openid',
    `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
    `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '微信头像',
    `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
    `city` varchar(30) NOT NULL DEFAULT '' COMMENT '城市',
    `province` varchar(30) NOT NULL DEFAULT '' COMMENT '省份',
    `country` varchar(30) NOT NULL DEFAULT '' COMMENT '国家',
    `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0：未知、1：男、2：女',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_openid`(`openid`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '小程序-用户表';

-- CMS后台用户表
CREATE TABLE `wechat_mall_cms_user` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
    `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
    `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
    `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
    `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
    `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`),
    KEY `idx_email`(`email`),
    KEY `idx_mobile`(`mobile`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = 'CMS后台用户表';

-- CMS-后台用户分组表
CREATE TABLE `wechat_mall_user_group` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` varchar(10) NOT NULL DEFAULT '' COMMENT '名称',
    `description` varchar(30) NOT NULL DEFAULT '' COMMENT '分组描述',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`),
    KEY `idx_name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = 'CMS-后台用户分组表';

-- CMS-组成模块
CREATE TABLE `wechat_mall_module` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` varchar(10) NOT NULL DEFAULT '' COMMENT '模块名称',
    `description` varchar(30) NOT NULL DEFAULT '' COMMENT '描述',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`),
    KEY `idx_name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = 'CMS-组成模块';

-- CMS-模块页面
CREATE TABLE `wechat_mall_module_page` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `module_id` int(11) NOT NULL DEFAULT '0' COMMENT '模块ID',
    `name` varchar(10) NOT NULL DEFAULT '' COMMENT '页面名称',
    `description` varchar(30) NOT NULL DEFAULT '' COMMENT '描述',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`),
    KEY `idx_module_id`(`module_id`),
    KEY `idx_name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = 'CMS-模块页面';

-- CMS-用户分组-页面权限表
CREATE TABLE `wechat_mall_group_page_permission` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
    `page_id` int(11) NOT NULL DEFAULT '0' COMMENT '页面ID',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = 'CMS-用户分组-页面权限表';

-- 小程序Banner表
CREATE TABLE `wechat_mall_banner` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
    `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
    `business_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '业务类型：1-商品',
    `business_id` int(1) NOT NULL DEFAULT '0' COMMENT '业务主键',
    `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示：0-否 1-是',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '小程序Banner表';

-- 商城-分类表
CREATE TABLE `wechat_mall_category` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类ID',
    `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
    `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
    `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上线：0-否 1-是',
    `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
    `description` varchar(50) NOT NULL DEFAULT '' COMMENT '分类描述',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_parent_id`(`parent_id`),
    KEY `idx_name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-分类表';

-- 小程序-首页宫格表
CREATE TABLE `wechat_mall_grid_category` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` varchar(30) NOT NULL DEFAULT '' COMMENT '宫格标题',
    `name` varchar(30) NOT NULL DEFAULT '' COMMENT '宫格名',
    `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '顶级分类ID',
    `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_category_id`(`category_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '小程序-首页宫格表';

-- 商城-规格表
CREATE TABLE `wechat_mall_specification` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` varchar(30) NOT NULL DEFAULT '' COMMENT '规格名名称',
    `description` varchar(30) NOT NULL DEFAULT '' COMMENT '规格名描述',
    `unit` varchar(10) NOT NULL DEFAULT '' COMMENT '单位',
    `standard` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否标准: 0-非标准 1-标准',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_name`(`name`)
) ENGINE = InnoDB auto_increment = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-规格表';

-- 商城-规格属性表
CREATE TABLE `wechat_mall_specification_attr` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格ID',
    `value` varchar(20) NOT NULL DEFAULT '' COMMENT '属性值',
    `extend` varchar(30) NOT NULL DEFAULT '' COMMENT '扩展',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_spec_id`(`spec_id`),
    KEY `idx_value`(`value`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-规格属性表';

-- 商城-商品表
CREATE TABLE `wechat_mall_goods` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `brand_name` varchar(30) NOT NULL DEFAULT '' COMMENT '品牌名称',
    `title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
    `price` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '价格',
    `discount_price` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
    `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
    `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架：0-下架 1-上架',
    `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '主图',
    `banner_picture` text COMMENT '轮播图',
    `detail_picture` text COMMENT '详情图',
    `tags` varchar(100) NOT NULL DEFAULT '' COMMENT '标签，示例：包邮$热门',
    `sale_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品总销量',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_title`(`title`),
    KEY `idx_category_id`(`category_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-商品表';

-- 商城-商品规格表
CREATE TABLE `wechat_mall_goods_spec` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
    `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格ID',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_goods_id`(`goods_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-商品规格表';

-- 商城-SKU表
CREATE TABLE `wechat_mall_sku` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
    `price` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '价格',
    `code` varchar(30) NOT NULL DEFAULT '' COMMENT '编码',
    `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
    `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属商品',
    `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架: 0-下架 1-上架',
    `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
    `specs` varchar(500) NOT NULL DEFAULT '' COMMENT '规格属性',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_title`(`title`),
    KEY `idx_code`(`code`),
    KEY `idx_goods_id`(`goods_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-SKU表';

-- 商城-SKU关联的规格属性
CREATE TABLE `wechat_mall_sku_spec_attr` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku表主键',
    `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格ID',
    `attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格-属性ID',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_sku_id`(`sku_id`),
    KEY `idx_spec_id`(`spec_id`),
    KEY `idx_attr_id`(`attr_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-SKU关联的规格属性';

-- 商城-优惠券表
CREATE TABLE `wechat_mall_coupon` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
    `full_money` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '满减额',
    `minus` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '优惠额',
    `rate` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
    `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '券类型：1-满减券 2-折扣券 3-代金券 4-满金额折扣券',
    `grant_num` int(11) NOT NULL DEFAULT '0' COMMENT '发券数量',
    `limit_num` int(11) NOT NULL DEFAULT '0' COMMENT '单人限领',
    `start_time` datetime NOT NULL COMMENT '开始时间',
    `end_time` datetime NOT NULL COMMENT '结束时间',
    `description` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '描述',
    `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架: 0-下架 1-上架',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-优惠券表';

-- 商城-优惠券领取记录表
CREATE TABLE `wechat_mall_coupon_log` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
    `use_time` datetime DEFAULT NULL COMMENT '使用时间',
    `expire_time` datetime NOT NULL COMMENT '过期时间',
    `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0-未使用 1-已使用 2-已过期',
    `code` varchar(30) NOT NULL DEFAULT '' COMMENT '兑换码',
    `order_no` varchar(30) NOT NULL DEFAULT '' COMMENT '核销的订单号',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY(`id`),
    KEY `idx_coupon_id`(`coupon_id`),
    KEY `idx_user_id`(`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-优惠券领取记录表';

-- 商城-购物车表
CREATE TABLE `wechat_mall_user_cart` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
    `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
    `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku ID',
    `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id`(`user_id`),
    KEY `idx_goods_id`(`goods_id`),
    KEY `idx_sku_id`(`sku_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-购物车表';

-- 商城-用户收货地址表
CREATE TABLE `wechat_mall_user_address` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
    `contacts` varchar(15) NOT NULL DEFAULT '' COMMENT '联系人',
    `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
    `province_id` varchar(10) NOT NULL DEFAULT '' COMMENT '省份编码',
    `city_id` varchar(10) NOT NULL DEFAULT '' COMMENT '城市编码',
    `area_id` varchar(10) NOT NULL DEFAULT '' COMMENT '地区编码',
    `province_str` varchar(10) NOT NULL DEFAULT '' COMMENT '省份',
    `city_str` varchar(10) NOT NULL DEFAULT '' COMMENT '城市',
    `area_str` varchar(10) NOT NULL DEFAULT '' COMMENT '地区',
    `address` varchar(30) NOT NULL DEFAULT '' COMMENT '详细地址',
    `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认收货地址：0-否 1-是',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id`(`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-用户收货地址表';

-- 商城-订单表
CREATE TABLE `wechat_mall_order` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `order_no` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '订单号',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
    `pay_amount` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '订单金额（商品金额 + 运费 - 优惠金额）',
    `goods_amount` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '商品小计金额',
    `discount_amount` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
    `dispatch_amount` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '运费',
    `pay_time` datetime NOT NULL COMMENT '支付时间',
    `deliver_time` datetime NOT NULL COMMENT '发货时间',
    `finish_time` datetime NOT NULL COMMENT '成交时间',
    `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 -1 已取消 0-待付款 1-待发货 2-待收货 3-已完成 4-（待发货）退款申请 5-已退款',
    `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货地址ID',
    `address_snapshot` varchar(200) NOT NULL DEFAULT '' COMMENT '收货地址快照',
    `wxapp_prepay_id` varchar(50) NOT NULL DEFAULT '' COMMENT '微信预支付ID',
    `transaction_id` varchar(50) NOT NULL DEFAULT '' COMMENT '微信支付单号',
    `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '订单备注',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_order_no`(`order_no`),
    KEY `idx_user_id`(`user_id`)
) ENGINE = InnoDB auto_increment = 0 DEFAULT CHARSET = utf8mb4 COMMENT = '商城订单表';

-- 商城-订单-商品表
CREATE TABLE `wechat_mall_order_goods` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `order_no` varchar(30) NOT NULL DEFAULT '' COMMENT '订单号',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
    `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
    `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku ID',
    `picture` varchar(200) NOT NULL  DEFAULT '' COMMENT '商品图片',
    `title` varchar(80) NOT NULL DEFAULT '' COMMENT '商品标题',
    `price` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '价格',
    `specs` varchar(500) NOT NULL DEFAULT '' COMMENT 'sku规格属性',
    `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
    `lock_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '锁定状态：0-锁定 1-解锁',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_order_no`(`order_no`),
    KEY `idx_goods_id`(`goods_id`),
    KEY `idx_sku_id`(`sku_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = '商城订单-商品表';

-- 商城-访客记录表
CREATE TABLE `wechat_mall_visitor_record` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台用户ID',
    `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '独立IP',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id`(`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-访客记录表';

-- 商城-订单退款记录表
CREATE TABLE `wechat_mall_order_refund` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `refund_no` varchar(30) NOT NULL DEFAULT '' COMMENT '退款编号',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台用户ID',
    `order_no` varchar(30) NOT NULL DEFAULT '' COMMENT '订单号',
    `reason` varchar(30) NOT NULL DEFAULT '' COMMENT '退款原因',
    `refund_amount` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
    `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0-退款申请 1-退款完成 2-撤销申请',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `refund_time` datetime NOT NULL COMMENT '退款时间',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id`(`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT  = '商城-订单退款申请表';

-- 商城-商品浏览记录
CREATE TABLE `wechat_mall_goods_browse_record` (
    `id` int(11) NOT NULL AUTO_INCREMENT comment '主键',
    `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
    `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
    `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '商品图片',
    `title` varchar(80) NOT NULL DEFAULT '' COMMENT '商品名称',
    `price` decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
    `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-否 1-是',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id`(`user_id`),
    KEY `idx_goods_id`(`goods_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8mb4 COMMENT = '商城-商品浏览记录';
