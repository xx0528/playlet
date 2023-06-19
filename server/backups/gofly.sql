-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.20 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 gofly 的数据库结构
CREATE DATABASE IF NOT EXISTS `gofly` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gofly`;

-- 导出  表 gofly.about 结构
CREATE TABLE IF NOT EXISTS `about` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title_cn` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `keywords_cn` varchar(255) NOT NULL DEFAULT '',
  `keywords_en` varchar(255) NOT NULL DEFAULT '',
  `desc_cn` varchar(1024) NOT NULL DEFAULT '',
  `desc_en` varchar(1024) NOT NULL DEFAULT '',
  `css_js` text NOT NULL,
  `html_cn` text NOT NULL,
  `html_en` text NOT NULL,
  `page` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.about 的数据：~0 rows (大约)
DELETE FROM `about`;

-- 导出  表 gofly.config 结构
CREATE TABLE IF NOT EXISTS `config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conf_name` varchar(255) NOT NULL DEFAULT '',
  `conf_key` varchar(255) NOT NULL DEFAULT '',
  `conf_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `conf_key` (`conf_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.config 的数据：~6 rows (大约)
DELETE FROM `config`;
INSERT INTO `config` (`id`, `conf_name`, `conf_key`, `conf_value`) VALUES
	(1, '公告信息', 'AllNotice', '开源智能客服系统为您服务'),
	(2, '离线消息', 'OfflineMessage', '我现在离线，稍后回复您！'),
	(3, '欢迎消息', 'WelcomeMessage', '有什么可以帮您？\n我们正在做活动\n充值50得500金币，额外赠送30金币'),
	(4, '邮箱地址(SMTP地址)', 'NoticeEmailSmtp', ''),
	(5, '邮箱账户', 'NoticeEmailAddress', ''),
	(6, '邮箱密码(SMTP密码)', 'NoticeEmailPassword', '');

-- 导出  表 gofly.ipblack 结构
CREATE TABLE IF NOT EXISTS `ipblack` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kefu_id` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.ipblack 的数据：~0 rows (大约)
DELETE FROM `ipblack`;

-- 导出  表 gofly.land_page 结构
CREATE TABLE IF NOT EXISTS `land_page` (
  `id` int NOT NULL,
  `title` varchar(125) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `keyword` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `page_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  gofly.land_page 的数据：~0 rows (大约)
DELETE FROM `land_page`;

-- 导出  表 gofly.language 结构
CREATE TABLE IF NOT EXISTS `language` (
  `id` int NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `short_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  gofly.language 的数据：~4 rows (大约)
DELETE FROM `language`;
INSERT INTO `language` (`id`, `country`, `short_key`) VALUES
	(1, '中文简体', 'zh-cn'),
	(2, '正體中文', 'zh-tw'),
	(3, 'English', 'en_us'),
	(4, '日本語', 'ja_jp');

-- 导出  表 gofly.message 结构
CREATE TABLE IF NOT EXISTS `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kefu_id` varchar(100) NOT NULL DEFAULT '',
  `visitor_id` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(2048) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `mes_type` enum('kefu','visitor') NOT NULL DEFAULT 'visitor',
  `status` enum('read','unread') NOT NULL DEFAULT 'unread',
  PRIMARY KEY (`id`),
  KEY `kefu_id` (`kefu_id`),
  KEY `visitor_id` (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  gofly.message 的数据：~49 rows (大约)
DELETE FROM `message`;
INSERT INTO `message` (`id`, `kefu_id`, `visitor_id`, `content`, `created_at`, `updated_at`, `deleted_at`, `mes_type`, `status`) VALUES
	(1, 'kefu', '4313f55a-216e-4015-8c6d-de2e5cef7779', '123423', '2023-06-15 06:53:33', '2023-06-15 07:06:13', NULL, 'visitor', 'unread'),
	(2, 'kefu', '4313f55a-216e-4015-8c6d-de2e5cef7779', '我现在离线，稍后回复您！', '2023-06-15 06:53:34', '2023-06-15 07:06:13', NULL, 'kefu', 'unread'),
	(3, 'kefu', '4313f55a-216e-4015-8c6d-de2e5cef7779', '你是谁', '2023-06-15 07:01:16', '2023-06-15 07:06:13', NULL, 'visitor', 'unread'),
	(4, 'kefu', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', '这个什么给你看', '2023-06-15 07:04:27', '2023-06-15 07:06:13', NULL, 'visitor', 'unread'),
	(5, 'kefu', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', 'face[弱]', '2023-06-15 07:04:35', '2023-06-15 07:06:13', NULL, 'visitor', 'unread'),
	(6, 'kefu', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', '你说个崔子', '2023-06-15 07:04:50', '2023-06-15 07:06:13', NULL, 'kefu', 'unread'),
	(7, 'kefu', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', '你说个锤子', '2023-06-15 07:04:58', '2023-06-15 07:06:13', NULL, 'kefu', 'unread'),
	(8, 'kefu', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', 'img[/static/upload/2023June/12ca4107ed5ebc04e35a303a5e11d6c9.png]', '2023-06-15 07:05:08', '2023-06-15 07:06:13', NULL, 'kefu', 'unread'),
	(9, 'kefu2', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', '拉拉裤', '2023-06-15 07:06:20', '2023-06-15 07:06:20', NULL, 'visitor', 'unread'),
	(10, 'kefu2', '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', '路', '2023-06-15 07:06:50', '2023-06-15 07:06:50', NULL, 'visitor', 'unread'),
	(11, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值', '2023-06-15 07:12:52', '2023-06-15 07:12:52', NULL, 'visitor', 'unread'),
	(12, 'kefu2', 'c984c53d-1930-481c-9f06-71d0412325c7', '我要充值 \n我的id是owigeheor \n我的手机号是 1432142222', '2023-06-15 07:36:01', '2023-06-15 07:36:01', NULL, 'visitor', 'unread'),
	(13, 'kefu2', 'c984c53d-1930-481c-9f06-71d0412325c7', '我现在离线，稍后回复您！', '2023-06-15 07:36:02', '2023-06-15 07:36:02', NULL, 'kefu', 'unread'),
	(14, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 \n我的id是owigeheor \n我的手机号是 1432142222', '2023-06-15 07:40:51', '2023-06-15 07:40:51', NULL, 'visitor', 'unread'),
	(15, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我现在离线，稍后回复您！', '2023-06-15 07:40:52', '2023-06-15 07:40:52', NULL, 'kefu', 'unread'),
	(16, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 \n我的id是owigeheor \n我的手机号是 1432142222', '2023-06-15 07:40:57', '2023-06-15 07:40:57', NULL, 'visitor', 'unread'),
	(17, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我现在离线，稍后回复您！', '2023-06-15 07:40:58', '2023-06-15 07:40:58', NULL, 'kefu', 'unread'),
	(18, 'kefu2', 'c984c53d-1930-481c-9f06-71d0412325c7', '敏敏', '2023-06-15 07:43:33', '2023-06-15 07:43:33', NULL, 'kefu', 'unread'),
	(19, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '冲你妹', '2023-06-15 07:44:05', '2023-06-15 07:44:05', NULL, 'kefu', 'unread'),
	(20, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '提供', '2023-06-15 07:50:06', '2023-06-15 07:50:06', NULL, 'visitor', 'unread'),
	(21, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '兔记录', '2023-06-15 07:50:18', '2023-06-15 07:50:18', NULL, 'visitor', 'unread'),
	(22, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '你以为你', '2023-06-15 07:51:40', '2023-06-15 07:51:40', NULL, 'visitor', 'unread'),
	(23, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 \n我的id是owigeheor \n我的手机号是 1432142222', '2023-06-15 07:52:50', '2023-06-15 07:52:50', NULL, 'visitor', 'unread'),
	(24, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我的钱', '2023-06-15 08:01:12', '2023-06-15 08:01:12', NULL, 'visitor', 'unread'),
	(25, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '账号信息', '2023-06-15 08:32:50', '2023-06-15 08:32:50', NULL, 'visitor', 'unread'),
	(26, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我现在离线，稍后回复您！', '2023-06-15 08:32:51', '2023-06-15 08:32:51', NULL, 'kefu', 'unread'),
	(27, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '账号信息', '2023-06-15 08:32:53', '2023-06-15 08:32:53', NULL, 'visitor', 'unread'),
	(28, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我现在离线，稍后回复您！', '2023-06-15 08:32:54', '2023-06-15 08:32:54', NULL, 'kefu', 'unread'),
	(29, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', 'face[抓狂]', '2023-06-15 08:40:52', '2023-06-15 08:40:52', NULL, 'visitor', 'unread'),
	(30, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 30 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 04:33:40', '2023-06-16 04:33:40', NULL, 'visitor', 'unread'),
	(31, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 30 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 04:33:50', '2023-06-16 04:33:50', NULL, 'visitor', 'unread'),
	(32, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 30 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 05:44:28', '2023-06-16 05:44:28', NULL, 'visitor', 'unread'),
	(33, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 90 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 05:44:34', '2023-06-16 05:44:34', NULL, 'visitor', 'unread'),
	(34, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 90 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 06:54:35', '2023-06-16 06:54:35', NULL, 'visitor', 'unread'),
	(35, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 60 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 06:54:49', '2023-06-16 06:54:49', NULL, 'visitor', 'unread'),
	(36, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值 90 元\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 07:04:15', '2023-06-16 07:04:15', NULL, 'visitor', 'unread'),
	(37, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '我要充值\n我的賬號是: 7eb1a0d117f43023\n我的手機是: ', '2023-06-16 07:29:32', '2023-06-16 07:29:32', NULL, 'visitor', 'unread'),
	(38, 'kefu2', '8c81e712-4643-44bc-a816-5264f2aea0df', '违反', '2023-06-16 07:35:29', '2023-06-16 07:35:29', NULL, 'visitor', 'unread'),
	(39, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 60 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:41:48', '2023-06-16 11:41:48', NULL, 'visitor', 'unread'),
	(40, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我现在离线，稍后回复您！', '2023-06-16 11:41:49', '2023-06-16 11:41:49', NULL, 'kefu', 'unread'),
	(41, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 30 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:42:06', '2023-06-16 11:42:06', NULL, 'visitor', 'unread'),
	(42, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我现在离线，稍后回复您！', '2023-06-16 11:42:07', '2023-06-16 11:42:07', NULL, 'kefu', 'unread'),
	(43, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', 'fghfgh', '2023-06-16 11:42:52', '2023-06-16 11:42:52', NULL, 'kefu', 'unread'),
	(44, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:43:11', '2023-06-16 11:43:11', NULL, 'visitor', 'unread'),
	(45, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 90 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:54:30', '2023-06-16 11:54:30', NULL, 'visitor', 'unread'),
	(46, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 30 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:56:40', '2023-06-16 11:56:40', NULL, 'visitor', 'unread'),
	(47, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 90 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:57:10', '2023-06-16 11:57:10', NULL, 'visitor', 'unread'),
	(48, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:57:49', '2023-06-16 11:57:49', NULL, 'visitor', 'unread'),
	(49, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:57:54', '2023-06-16 11:57:54', NULL, 'visitor', 'unread'),
	(50, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:58:01', '2023-06-16 11:58:01', NULL, 'visitor', 'unread'),
	(51, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:58:07', '2023-06-16 11:58:07', NULL, 'visitor', 'unread'),
	(52, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:58:37', '2023-06-16 11:58:37', NULL, 'visitor', 'unread'),
	(53, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:58:56', '2023-06-16 11:58:56', NULL, 'visitor', 'unread'),
	(54, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 120 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 11:59:04', '2023-06-16 11:59:04', NULL, 'visitor', 'unread'),
	(55, 'kefu2', '73cf4b70-d6b5-4817-bf53-48cc3213c714', '我要充值 90 元\n我的賬號是: 3018829c4fbe28ea\n我的手機是: ', '2023-06-16 12:00:00', '2023-06-16 12:00:00', NULL, 'visitor', 'unread');

-- 导出  表 gofly.reply_group 结构
CREATE TABLE IF NOT EXISTS `reply_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.reply_group 的数据：~0 rows (大约)
DELETE FROM `reply_group`;
INSERT INTO `reply_group` (`id`, `group_name`, `user_id`) VALUES
	(1, '常见问题', 'kefu2');

-- 导出  表 gofly.reply_item 结构
CREATE TABLE IF NOT EXISTS `reply_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `group_id` int NOT NULL DEFAULT '0',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `item_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.reply_item 的数据：~0 rows (大约)
DELETE FROM `reply_item`;
INSERT INTO `reply_item` (`id`, `content`, `group_id`, `user_id`, `item_name`) VALUES
	(1, '在这里[官网]link[https://gofly.sopans.com]!', 1, 'kefu2', '官方地址在哪?');

-- 导出  表 gofly.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `method` varchar(100) NOT NULL DEFAULT '',
  `path` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.role 的数据：~0 rows (大约)
DELETE FROM `role`;
INSERT INTO `role` (`id`, `name`, `method`, `path`) VALUES
	(1, '普通客服', '*', '*');

-- 导出  表 gofly.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `avator` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.user 的数据：~0 rows (大约)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `name`, `password`, `nickname`, `created_at`, `updated_at`, `deleted_at`, `avator`) VALUES
	(1, 'kefu2', 'e10adc3949ba59abbe56e057f20f883e', '智能客服系统', '2020-06-27 11:32:41', '2023-06-15 07:05:43', NULL, '/static/images/4.jpg');

-- 导出  表 gofly.user_client 结构
CREATE TABLE IF NOT EXISTS `user_client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kefu` varchar(100) NOT NULL DEFAULT '',
  `client_id` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user` (`kefu`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.user_client 的数据：~0 rows (大约)
DELETE FROM `user_client`;

-- 导出  表 gofly.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.user_role 的数据：~0 rows (大约)
DELETE FROM `user_role`;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 1);

-- 导出  表 gofly.visitor 结构
CREATE TABLE IF NOT EXISTS `visitor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `avator` varchar(500) NOT NULL DEFAULT '',
  `source_ip` varchar(50) NOT NULL DEFAULT '',
  `to_id` varchar(50) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visitor_id` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint NOT NULL DEFAULT '0',
  `refer` varchar(500) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `client_ip` varchar(100) NOT NULL DEFAULT '',
  `extra` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_id` (`visitor_id`),
  KEY `to_id` (`to_id`),
  KEY `idx_update` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.visitor 的数据：~6 rows (大约)
DELETE FROM `visitor`;
INSERT INTO `visitor` (`id`, `name`, `avator`, `source_ip`, `to_id`, `created_at`, `updated_at`, `deleted_at`, `visitor_id`, `status`, `refer`, `city`, `client_ip`, `extra`) VALUES
	(1, '本机地址本机地址网友', '/static/images/2.png', '127.0.0.1', 'kefu', '2023-06-15 06:53:27', '2023-06-15 07:38:27', NULL, '4313f55a-216e-4015-8c6d-de2e5cef7779', 0, '直接访问', '本机地址本机地址', '127.0.0.1', ''),
	(2, '局域网局域网网友', '/static/images/1.png', '192.168.3.75', 'kefu', '2023-06-15 07:03:05', '2023-06-15 07:28:22', NULL, '2ea9b7d9-f8ea-4d7b-9369-73965117adf7', 0, 'http://192.168.3.67:8081/', '局域网局域网', '192.168.3.75', ''),
	(3, '局域网局域网网友', '/static/images/1.png', '192.168.3.67', 'kefu2', '2023-06-15 07:12:17', '2023-06-19 03:42:42', NULL, '8c81e712-4643-44bc-a816-5264f2aea0df', 0, '直接访问', '局域网局域网', '192.168.3.67', ''),
	(4, '本机地址本机地址网友', '/static/images/2.png', '127.0.0.1', 'kefu2', '2023-06-15 07:26:53', '2023-06-15 08:39:35', NULL, 'c984c53d-1930-481c-9f06-71d0412325c7', 0, '直接访问', '本机地址本机地址', '127.0.0.1', ''),
	(5, '局域网局域网网友', '/static/images/1.png', '192.168.3.75', 'kefu2', '2023-06-15 07:39:09', '2023-06-16 12:00:02', NULL, '73cf4b70-d6b5-4817-bf53-48cc3213c714', 0, '直接访问', '局域网局域网', '192.168.3.75', ''),
	(6, '局域网局域网网友', '/static/images/1.png', '192.168.3.75', 'kefu2', '2023-06-15 07:51:06', '2023-06-15 07:53:26', NULL, '2a8683b8-0b3b-4169-9dd9-1d3af9607676', 0, 'http://192.168.3.67:8081/', '局域网局域网', '192.168.3.75', '');

-- 导出  表 gofly.welcome 结构
CREATE TABLE IF NOT EXISTS `welcome` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(500) NOT NULL DEFAULT '',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  gofly.welcome 的数据：~2 rows (大约)
DELETE FROM `welcome`;
INSERT INTO `welcome` (`id`, `user_id`, `keyword`, `content`, `is_default`, `ctime`) VALUES
	(1, 'kefu2', 'offline', '我暂时离线，留言已转发到我的邮箱，稍后回复~', 1, '2020-08-23 18:57:49'),
	(2, 'kefu2', 'welcome', '请问有什么可以帮您？', 0, '2020-08-23 18:57:49');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
