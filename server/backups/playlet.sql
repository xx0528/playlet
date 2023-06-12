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


-- 导出 playlet 的数据库结构
CREATE DATABASE IF NOT EXISTS `playlet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `playlet`;

-- 导出  表 playlet.casbin_rule 结构
CREATE TABLE IF NOT EXISTS `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v6` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v7` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`,`v6`,`v7`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.casbin_rule 的数据：~216 rows (大约)
DELETE FROM `casbin_rule`;
INSERT INTO `casbin_rule` (`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`, `v6`, `v7`) VALUES
	(296, 'p', '888', '/api/createApi', 'POST', '', '', '', '', ''),
	(297, 'p', '888', '/api/deleteApi', 'POST', '', '', '', '', ''),
	(302, 'p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '', '', ''),
	(300, 'p', '888', '/api/getAllApis', 'POST', '', '', '', '', ''),
	(301, 'p', '888', '/api/getApiById', 'POST', '', '', '', '', ''),
	(299, 'p', '888', '/api/getApiList', 'POST', '', '', '', '', ''),
	(298, 'p', '888', '/api/updateApi', 'POST', '', '', '', '', ''),
	(303, 'p', '888', '/authority/copyAuthority', 'POST', '', '', '', '', ''),
	(304, 'p', '888', '/authority/createAuthority', 'POST', '', '', '', '', ''),
	(305, 'p', '888', '/authority/deleteAuthority', 'POST', '', '', '', '', ''),
	(307, 'p', '888', '/authority/getAuthorityList', 'POST', '', '', '', '', ''),
	(308, 'p', '888', '/authority/setDataAuthority', 'POST', '', '', '', '', ''),
	(306, 'p', '888', '/authority/updateAuthority', 'PUT', '', '', '', '', ''),
	(371, 'p', '888', '/authorityBtn/canRemoveAuthorityBtn', 'POST', '', '', '', '', ''),
	(370, 'p', '888', '/authorityBtn/getAuthorityBtn', 'POST', '', '', '', '', ''),
	(369, 'p', '888', '/authorityBtn/setAuthorityBtn', 'POST', '', '', '', '', ''),
	(343, 'p', '888', '/autoCode/createPackage', 'POST', '', '', '', '', ''),
	(341, 'p', '888', '/autoCode/createPlug', 'POST', '', '', '', '', ''),
	(338, 'p', '888', '/autoCode/createTemp', 'POST', '', '', '', '', ''),
	(345, 'p', '888', '/autoCode/delPackage', 'POST', '', '', '', '', ''),
	(349, 'p', '888', '/autoCode/delSysHistory', 'POST', '', '', '', '', ''),
	(340, 'p', '888', '/autoCode/getColumn', 'GET', '', '', '', '', ''),
	(336, 'p', '888', '/autoCode/getDB', 'GET', '', '', '', '', ''),
	(346, 'p', '888', '/autoCode/getMeta', 'POST', '', '', '', '', ''),
	(344, 'p', '888', '/autoCode/getPackage', 'POST', '', '', '', '', ''),
	(348, 'p', '888', '/autoCode/getSysHistory', 'POST', '', '', '', '', ''),
	(337, 'p', '888', '/autoCode/getTables', 'GET', '', '', '', '', ''),
	(342, 'p', '888', '/autoCode/installPlugin', 'POST', '', '', '', '', ''),
	(339, 'p', '888', '/autoCode/preview', 'POST', '', '', '', '', ''),
	(347, 'p', '888', '/autoCode/rollback', 'POST', '', '', '', '', ''),
	(310, 'p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '', '', ''),
	(309, 'p', '888', '/casbin/updateCasbin', 'POST', '', '', '', '', ''),
	(373, 'p', '888', '/chatGpt/createSK', 'POST', '', '', '', '', ''),
	(375, 'p', '888', '/chatGpt/deleteSK', 'DELETE', '', '', '', '', ''),
	(374, 'p', '888', '/chatGpt/getSK', 'GET', '', '', '', '', ''),
	(372, 'p', '888', '/chatGpt/getTable', 'POST', '', '', '', '', ''),
	(333, 'p', '888', '/customer/customer', 'DELETE', '', '', '', '', ''),
	(334, 'p', '888', '/customer/customer', 'GET', '', '', '', '', ''),
	(332, 'p', '888', '/customer/customer', 'POST', '', '', '', '', ''),
	(331, 'p', '888', '/customer/customer', 'PUT', '', '', '', '', ''),
	(335, 'p', '888', '/customer/customerList', 'GET', '', '', '', '', ''),
	(368, 'p', '888', '/email/emailTest', 'POST', '', '', '', '', ''),
	(321, 'p', '888', '/fileUploadAndDownload/breakpointContinue', 'POST', '', '', '', '', ''),
	(322, 'p', '888', '/fileUploadAndDownload/breakpointContinueFinish', 'POST', '', '', '', '', ''),
	(325, 'p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '', '', ''),
	(326, 'p', '888', '/fileUploadAndDownload/editFileName', 'POST', '', '', '', '', ''),
	(320, 'p', '888', '/fileUploadAndDownload/findFile', 'GET', '', '', '', '', ''),
	(327, 'p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '', '', ''),
	(323, 'p', '888', '/fileUploadAndDownload/removeChunk', 'POST', '', '', '', '', ''),
	(324, 'p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '', '', ''),
	(285, 'p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '', '', ''),
	(311, 'p', '888', '/menu/addBaseMenu', 'POST', '', '', '', '', ''),
	(319, 'p', '888', '/menu/addMenuAuthority', 'POST', '', '', '', '', ''),
	(313, 'p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '', '', ''),
	(315, 'p', '888', '/menu/getBaseMenuById', 'POST', '', '', '', '', ''),
	(317, 'p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '', '', ''),
	(312, 'p', '888', '/menu/getMenu', 'POST', '', '', '', '', ''),
	(318, 'p', '888', '/menu/getMenuAuthority', 'POST', '', '', '', '', ''),
	(316, 'p', '888', '/menu/getMenuList', 'POST', '', '', '', '', ''),
	(314, 'p', '888', '/menu/updateBaseMenu', 'POST', '', '', '', '', ''),
	(394, 'p', '888', '/plCost/createPlCost', 'POST', '', '', '', '', ''),
	(395, 'p', '888', '/plCost/deletePlCost', 'DELETE', '', '', '', '', ''),
	(396, 'p', '888', '/plCost/deletePlCostByIds', 'DELETE', '', '', '', '', ''),
	(398, 'p', '888', '/plCost/findPlCost', 'GET', '', '', '', '', ''),
	(399, 'p', '888', '/plCost/getPlCostList', 'GET', '', '', '', '', ''),
	(397, 'p', '888', '/plCost/updatePlCost', 'PUT', '', '', '', '', ''),
	(388, 'p', '888', '/plRecharge/createPlRecharge', 'POST', '', '', '', '', ''),
	(389, 'p', '888', '/plRecharge/deletePlRecharge', 'DELETE', '', '', '', '', ''),
	(390, 'p', '888', '/plRecharge/deletePlRechargeByIds', 'DELETE', '', '', '', '', ''),
	(392, 'p', '888', '/plRecharge/findPlRecharge', 'GET', '', '', '', '', ''),
	(393, 'p', '888', '/plRecharge/getPlRechargeList', 'GET', '', '', '', '', ''),
	(391, 'p', '888', '/plRecharge/updatePlRecharge', 'PUT', '', '', '', '', ''),
	(382, 'p', '888', '/plUser/createPlUser', 'POST', '', '', '', '', ''),
	(383, 'p', '888', '/plUser/deletePlUser', 'DELETE', '', '', '', '', ''),
	(384, 'p', '888', '/plUser/deletePlUserByIds', 'DELETE', '', '', '', '', ''),
	(386, 'p', '888', '/plUser/findPlUser', 'GET', '', '', '', '', ''),
	(387, 'p', '888', '/plUser/getPlUserList', 'GET', '', '', '', '', ''),
	(385, 'p', '888', '/plUser/updatePlUser', 'PUT', '', '', '', '', ''),
	(376, 'p', '888', '/plVideo/createPlVideo', 'POST', '', '', '', '', ''),
	(377, 'p', '888', '/plVideo/deletePlVideo', 'DELETE', '', '', '', '', ''),
	(378, 'p', '888', '/plVideo/deletePlVideoByIds', 'DELETE', '', '', '', '', ''),
	(380, 'p', '888', '/plVideo/findPlVideo', 'GET', '', '', '', '', ''),
	(381, 'p', '888', '/plVideo/getPlVideoList', 'GET', '', '', '', '', ''),
	(379, 'p', '888', '/plVideo/updatePlVideo', 'PUT', '', '', '', '', ''),
	(366, 'p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '', '', ''),
	(367, 'p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '', '', ''),
	(365, 'p', '888', '/simpleUploader/upload', 'POST', '', '', '', '', ''),
	(355, 'p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '', '', ''),
	(356, 'p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '', '', ''),
	(358, 'p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '', '', ''),
	(359, 'p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '', '', ''),
	(357, 'p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '', '', ''),
	(351, 'p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '', '', ''),
	(352, 'p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '', '', ''),
	(353, 'p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '', '', ''),
	(354, 'p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '', '', ''),
	(350, 'p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '', '', ''),
	(360, 'p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '', '', ''),
	(363, 'p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '', '', ''),
	(364, 'p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '', '', ''),
	(361, 'p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '', '', ''),
	(362, 'p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '', '', ''),
	(328, 'p', '888', '/system/getServerInfo', 'POST', '', '', '', '', ''),
	(329, 'p', '888', '/system/getSystemConfig', 'POST', '', '', '', '', ''),
	(330, 'p', '888', '/system/setSystemConfig', 'POST', '', '', '', '', ''),
	(287, 'p', '888', '/user/admin_register', 'POST', '', '', '', '', ''),
	(293, 'p', '888', '/user/changePassword', 'POST', '', '', '', '', ''),
	(286, 'p', '888', '/user/deleteUser', 'DELETE', '', '', '', '', ''),
	(291, 'p', '888', '/user/getUserInfo', 'GET', '', '', '', '', ''),
	(288, 'p', '888', '/user/getUserList', 'POST', '', '', '', '', ''),
	(295, 'p', '888', '/user/resetPassword', 'POST', '', '', '', '', ''),
	(290, 'p', '888', '/user/setSelfInfo', 'PUT', '', '', '', '', ''),
	(292, 'p', '888', '/user/setUserAuthorities', 'POST', '', '', '', '', ''),
	(294, 'p', '888', '/user/setUserAuthority', 'POST', '', '', '', '', ''),
	(289, 'p', '888', '/user/setUserInfo', 'PUT', '', '', '', '', ''),
	(94, 'p', '8881', '/api/createApi', 'POST', '', '', '', '', ''),
	(97, 'p', '8881', '/api/deleteApi', 'POST', '', '', '', '', ''),
	(99, 'p', '8881', '/api/getAllApis', 'POST', '', '', '', '', ''),
	(96, 'p', '8881', '/api/getApiById', 'POST', '', '', '', '', ''),
	(95, 'p', '8881', '/api/getApiList', 'POST', '', '', '', '', ''),
	(98, 'p', '8881', '/api/updateApi', 'POST', '', '', '', '', ''),
	(100, 'p', '8881', '/authority/createAuthority', 'POST', '', '', '', '', ''),
	(101, 'p', '8881', '/authority/deleteAuthority', 'POST', '', '', '', '', ''),
	(102, 'p', '8881', '/authority/getAuthorityList', 'POST', '', '', '', '', ''),
	(103, 'p', '8881', '/authority/setDataAuthority', 'POST', '', '', '', '', ''),
	(121, 'p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '', '', ''),
	(120, 'p', '8881', '/casbin/updateCasbin', 'POST', '', '', '', '', ''),
	(127, 'p', '8881', '/customer/customer', 'DELETE', '', '', '', '', ''),
	(128, 'p', '8881', '/customer/customer', 'GET', '', '', '', '', ''),
	(125, 'p', '8881', '/customer/customer', 'POST', '', '', '', '', ''),
	(126, 'p', '8881', '/customer/customer', 'PUT', '', '', '', '', ''),
	(129, 'p', '8881', '/customer/customerList', 'GET', '', '', '', '', ''),
	(118, 'p', '8881', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '', '', ''),
	(119, 'p', '8881', '/fileUploadAndDownload/editFileName', 'POST', '', '', '', '', ''),
	(117, 'p', '8881', '/fileUploadAndDownload/getFileList', 'POST', '', '', '', '', ''),
	(116, 'p', '8881', '/fileUploadAndDownload/upload', 'POST', '', '', '', '', ''),
	(122, 'p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '', '', ''),
	(106, 'p', '8881', '/menu/addBaseMenu', 'POST', '', '', '', '', ''),
	(108, 'p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '', '', ''),
	(110, 'p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '', '', ''),
	(112, 'p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '', '', ''),
	(107, 'p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '', '', ''),
	(104, 'p', '8881', '/menu/getMenu', 'POST', '', '', '', '', ''),
	(109, 'p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '', '', ''),
	(105, 'p', '8881', '/menu/getMenuList', 'POST', '', '', '', '', ''),
	(111, 'p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '', '', ''),
	(123, 'p', '8881', '/system/getSystemConfig', 'POST', '', '', '', '', ''),
	(124, 'p', '8881', '/system/setSystemConfig', 'POST', '', '', '', '', ''),
	(93, 'p', '8881', '/user/admin_register', 'POST', '', '', '', '', ''),
	(113, 'p', '8881', '/user/changePassword', 'POST', '', '', '', '', ''),
	(130, 'p', '8881', '/user/getUserInfo', 'GET', '', '', '', '', ''),
	(114, 'p', '8881', '/user/getUserList', 'POST', '', '', '', '', ''),
	(115, 'p', '8881', '/user/setUserAuthority', 'POST', '', '', '', '', ''),
	(469, 'p', '9528', '/api/createApi', 'POST', '', '', '', '', ''),
	(470, 'p', '9528', '/api/deleteApi', 'POST', '', '', '', '', ''),
	(473, 'p', '9528', '/api/getAllApis', 'POST', '', '', '', '', ''),
	(474, 'p', '9528', '/api/getApiById', 'POST', '', '', '', '', ''),
	(472, 'p', '9528', '/api/getApiList', 'POST', '', '', '', '', ''),
	(471, 'p', '9528', '/api/updateApi', 'POST', '', '', '', '', ''),
	(475, 'p', '9528', '/authority/createAuthority', 'POST', '', '', '', '', ''),
	(476, 'p', '9528', '/authority/deleteAuthority', 'POST', '', '', '', '', ''),
	(477, 'p', '9528', '/authority/getAuthorityList', 'POST', '', '', '', '', ''),
	(478, 'p', '9528', '/authority/setDataAuthority', 'POST', '', '', '', '', ''),
	(501, 'p', '9528', '/autoCode/createTemp', 'POST', '', '', '', '', ''),
	(480, 'p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '', '', ''),
	(479, 'p', '9528', '/casbin/updateCasbin', 'POST', '', '', '', '', ''),
	(498, 'p', '9528', '/customer/customer', 'DELETE', '', '', '', '', ''),
	(499, 'p', '9528', '/customer/customer', 'GET', '', '', '', '', ''),
	(497, 'p', '9528', '/customer/customer', 'POST', '', '', '', '', ''),
	(496, 'p', '9528', '/customer/customer', 'PUT', '', '', '', '', ''),
	(500, 'p', '9528', '/customer/customerList', 'GET', '', '', '', '', ''),
	(491, 'p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '', '', ''),
	(492, 'p', '9528', '/fileUploadAndDownload/editFileName', 'POST', '', '', '', '', ''),
	(493, 'p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '', '', ''),
	(490, 'p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '', '', ''),
	(463, 'p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '', '', ''),
	(481, 'p', '9528', '/menu/addBaseMenu', 'POST', '', '', '', '', ''),
	(489, 'p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '', '', ''),
	(483, 'p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '', '', ''),
	(485, 'p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '', '', ''),
	(487, 'p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '', '', ''),
	(482, 'p', '9528', '/menu/getMenu', 'POST', '', '', '', '', ''),
	(488, 'p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '', '', ''),
	(486, 'p', '9528', '/menu/getMenuList', 'POST', '', '', '', '', ''),
	(484, 'p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '', '', ''),
	(520, 'p', '9528', '/plCost/createPlCost', 'POST', '', '', '', '', ''),
	(521, 'p', '9528', '/plCost/deletePlCost', 'DELETE', '', '', '', '', ''),
	(522, 'p', '9528', '/plCost/deletePlCostByIds', 'DELETE', '', '', '', '', ''),
	(524, 'p', '9528', '/plCost/findPlCost', 'GET', '', '', '', '', ''),
	(525, 'p', '9528', '/plCost/getPlCostList', 'GET', '', '', '', '', ''),
	(523, 'p', '9528', '/plCost/updatePlCost', 'PUT', '', '', '', '', ''),
	(514, 'p', '9528', '/plRecharge/createPlRecharge', 'POST', '', '', '', '', ''),
	(515, 'p', '9528', '/plRecharge/deletePlRecharge', 'DELETE', '', '', '', '', ''),
	(516, 'p', '9528', '/plRecharge/deletePlRechargeByIds', 'DELETE', '', '', '', '', ''),
	(518, 'p', '9528', '/plRecharge/findPlRecharge', 'GET', '', '', '', '', ''),
	(519, 'p', '9528', '/plRecharge/getPlRechargeList', 'GET', '', '', '', '', ''),
	(517, 'p', '9528', '/plRecharge/updatePlRecharge', 'PUT', '', '', '', '', ''),
	(508, 'p', '9528', '/plUser/createPlUser', 'POST', '', '', '', '', ''),
	(509, 'p', '9528', '/plUser/deletePlUser', 'DELETE', '', '', '', '', ''),
	(510, 'p', '9528', '/plUser/deletePlUserByIds', 'DELETE', '', '', '', '', ''),
	(512, 'p', '9528', '/plUser/findPlUser', 'GET', '', '', '', '', ''),
	(513, 'p', '9528', '/plUser/getPlUserList', 'GET', '', '', '', '', ''),
	(511, 'p', '9528', '/plUser/updatePlUser', 'PUT', '', '', '', '', ''),
	(502, 'p', '9528', '/plVideo/createPlVideo', 'POST', '', '', '', '', ''),
	(503, 'p', '9528', '/plVideo/deletePlVideo', 'DELETE', '', '', '', '', ''),
	(504, 'p', '9528', '/plVideo/deletePlVideoByIds', 'DELETE', '', '', '', '', ''),
	(506, 'p', '9528', '/plVideo/findPlVideo', 'GET', '', '', '', '', ''),
	(507, 'p', '9528', '/plVideo/getPlVideoList', 'GET', '', '', '', '', ''),
	(505, 'p', '9528', '/plVideo/updatePlVideo', 'PUT', '', '', '', '', ''),
	(494, 'p', '9528', '/system/getSystemConfig', 'POST', '', '', '', '', ''),
	(495, 'p', '9528', '/system/setSystemConfig', 'POST', '', '', '', '', ''),
	(464, 'p', '9528', '/user/admin_register', 'POST', '', '', '', '', ''),
	(467, 'p', '9528', '/user/changePassword', 'POST', '', '', '', '', ''),
	(466, 'p', '9528', '/user/getUserInfo', 'GET', '', '', '', '', ''),
	(465, 'p', '9528', '/user/getUserList', 'POST', '', '', '', '', ''),
	(468, 'p', '9528', '/user/setUserAuthority', 'POST', '', '', '', '', '');

-- 导出  表 playlet.exa_customers 结构
CREATE TABLE IF NOT EXISTS `exa_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint unsigned DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` bigint unsigned DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`),
  KEY `idx_exa_customers_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.exa_customers 的数据：~0 rows (大约)
DELETE FROM `exa_customers`;

-- 导出  表 playlet.exa_files 结构
CREATE TABLE IF NOT EXISTS `exa_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_md5` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chunk_total` bigint DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_files_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.exa_files 的数据：~0 rows (大约)
DELETE FROM `exa_files`;

-- 导出  表 playlet.exa_file_chunks 结构
CREATE TABLE IF NOT EXISTS `exa_file_chunks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `exa_file_id` bigint unsigned DEFAULT NULL,
  `file_chunk_number` bigint DEFAULT NULL,
  `file_chunk_path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_chunks_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.exa_file_chunks 的数据：~0 rows (大约)
DELETE FROM `exa_file_chunks`;

-- 导出  表 playlet.exa_file_upload_and_downloads 结构
CREATE TABLE IF NOT EXISTS `exa_file_upload_and_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.exa_file_upload_and_downloads 的数据：~2 rows (大约)
DELETE FROM `exa_file_upload_and_downloads`;
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES
	(1, '2023-06-02 17:02:30.316', '2023-06-02 17:02:30.316', NULL, '10.png', 'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png'),
	(2, '2023-06-02 17:02:30.316', '2023-06-02 17:02:30.316', NULL, 'logo.png', 'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');

-- 导出  表 playlet.jwt_blacklists 结构
CREATE TABLE IF NOT EXISTS `jwt_blacklists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jwt` text COLLATE utf8mb4_general_ci COMMENT 'jwt',
  PRIMARY KEY (`id`),
  KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.jwt_blacklists 的数据：~0 rows (大约)
DELETE FROM `jwt_blacklists`;

-- 导出  表 playlet.pl_cost 结构
CREATE TABLE IF NOT EXISTS `pl_cost` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `user_id` bigint DEFAULT NULL COMMENT '用户Id',
  `cost_gold` double DEFAULT NULL COMMENT '消费金币',
  `time` datetime(3) DEFAULT NULL COMMENT '时间',
  `left_gold` double DEFAULT NULL COMMENT '剩余金币',
  `buy_video` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '购买视频',
  `created_by` bigint unsigned DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新者',
  `deleted_by` bigint unsigned DEFAULT NULL COMMENT '删除者',
  PRIMARY KEY (`id`),
  KEY `idx_pl_cost_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.pl_cost 的数据：~0 rows (大约)
DELETE FROM `pl_cost`;

-- 导出  表 playlet.pl_recharge 结构
CREATE TABLE IF NOT EXISTS `pl_recharge` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `user_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户Id',
  `recharge` double DEFAULT NULL COMMENT '充值金额',
  `time` datetime(3) DEFAULT NULL COMMENT '时间',
  `buy_gold` double DEFAULT NULL COMMENT '购买金币',
  `give_gold` double DEFAULT NULL COMMENT '赠送金币',
  `left_gold` double DEFAULT NULL COMMENT '剩余金币',
  `admin_id` bigint DEFAULT NULL COMMENT '操作人',
  `created_by` bigint unsigned DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新者',
  `deleted_by` bigint unsigned DEFAULT NULL COMMENT '删除者',
  PRIMARY KEY (`id`),
  KEY `idx_pl_recharge_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.pl_recharge 的数据：~0 rows (大约)
DELETE FROM `pl_recharge`;

-- 导出  表 playlet.pl_user 结构
CREATE TABLE IF NOT EXISTS `pl_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `user_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户Id',
  `guest_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访客id',
  `recharge` double DEFAULT NULL COMMENT '累计充值',
  `cur_gold` double DEFAULT NULL COMMENT '当前金币',
  `buy_videos` text COLLATE utf8mb4_general_ci COMMENT '解锁记录',
  `register_time` datetime(3) DEFAULT NULL COMMENT '注册时间',
  `last_login_time` datetime(3) DEFAULT NULL COMMENT '最后登录时间',
  `like_videos` text COLLATE utf8mb4_general_ci COMMENT '收藏剧集',
  `created_by` bigint unsigned DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新者',
  `deleted_by` bigint unsigned DEFAULT NULL COMMENT '删除者',
  `phone` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  KEY `idx_pl_user_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.pl_user 的数据：~0 rows (大约)
DELETE FROM `pl_user`;

-- 导出  表 playlet.pl_video 结构
CREATE TABLE IF NOT EXISTS `pl_video` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `video_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '短剧名',
  `video_type` bigint DEFAULT NULL COMMENT '短剧类型',
  `type_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型名',
  `video_desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
  `like_count` bigint DEFAULT NULL COMMENT '收藏数',
  `finish` bigint DEFAULT NULL COMMENT '是否完结',
  `hot` bigint DEFAULT NULL COMMENT '是否推荐',
  `count` bigint DEFAULT NULL COMMENT '集数',
  `img_url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `video_url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频地址',
  `create_time` datetime(3) DEFAULT NULL COMMENT '上架时间',
  `free_count` bigint DEFAULT NULL COMMENT '免费集数',
  `created_by` bigint unsigned DEFAULT NULL COMMENT '创建者',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新者',
  `deleted_by` bigint unsigned DEFAULT NULL COMMENT '删除者',
  `lock_count` bigint DEFAULT NULL COMMENT '解锁集数',
  PRIMARY KEY (`id`),
  KEY `idx_pl_video_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.pl_video 的数据：~44 rows (大约)
DELETE FROM `pl_video`;
INSERT INTO `pl_video` (`id`, `created_at`, `updated_at`, `deleted_at`, `video_name`, `video_type`, `type_name`, `video_desc`, `like_count`, `finish`, `hot`, `count`, `img_url`, `video_url`, `create_time`, `free_count`, `created_by`, `updated_by`, `deleted_by`, `lock_count`) VALUES
	(1, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(2, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(3, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(4, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(5, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配4', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(6, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安5', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(7, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿6', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(8, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深7', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(9, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配8', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(10, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安9', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(11, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿10', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(12, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深11', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(13, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配12', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(14, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安13', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(15, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿14', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(16, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深15', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(17, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配16', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(18, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安17', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(19, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿18', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(20, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深19', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(21, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配20', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(22, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安21', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(23, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿22', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(24, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深23', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(25, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配24', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(26, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安25', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(27, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿26', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(28, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深27', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(29, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配28', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(30, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安29', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(31, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿30', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(32, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深31', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(33, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配32', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(34, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安33', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(35, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿34', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(36, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深35', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(37, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配36', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(38, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安37', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(39, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿38', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(40, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深39', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL),
	(41, '2023-06-05 17:43:03.204', '2023-06-05 17:54:05.727', NULL, '少帅，夫人说她不配40', 1, '逆袭', '世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖', 122, 1, 0, 17, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei', '2023-06-04 00:00:00.000', 5, 1, 1, 0, NULL),
	(42, '2023-06-05 17:44:31.661', '2023-06-05 17:54:38.654', NULL, '神豪保安41', 3, '神豪', '毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金', 2123, 0, 0, 5, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan', '2023-06-05 17:43:03.224', 3, 1, 1, 0, NULL),
	(43, '2023-06-05 17:47:15.133', '2023-06-05 17:54:59.471', NULL, '神医狂婿42', 5, '神医', '一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代', 513, 1, 0, 20, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shenyikx', '2023-06-05 17:44:31.674', 7, 1, 1, 0, NULL),
	(44, '2023-06-05 17:49:05.510', '2023-06-05 17:55:15.455', NULL, '蚀骨情深43', 9, '暧昧', '林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。', 55, 1, 0, 10, 'cover.png', 'http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen', '2023-06-05 17:47:15.146', 5, 1, 1, 0, NULL);

-- 导出  表 playlet.sys_apis 结构
CREATE TABLE IF NOT EXISTS `sys_apis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_apis 的数据：~104 rows (大约)
DELETE FROM `sys_apis`;
INSERT INTO `sys_apis` (`id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method`) VALUES
	(1, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/jwt/jsonInBlacklist', 'jwt加入黑名单(退出，必选)', 'jwt', 'POST'),
	(2, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/deleteUser', '删除用户', '系统用户', 'DELETE'),
	(3, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/admin_register', '用户注册', '系统用户', 'POST'),
	(4, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/getUserList', '获取用户列表', '系统用户', 'POST'),
	(5, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/setUserInfo', '设置用户信息', '系统用户', 'PUT'),
	(6, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/setSelfInfo', '设置自身信息(必选)', '系统用户', 'PUT'),
	(7, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/getUserInfo', '获取自身信息(必选)', '系统用户', 'GET'),
	(8, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/setUserAuthorities', '设置权限组', '系统用户', 'POST'),
	(9, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/changePassword', '修改密码（建议选择)', '系统用户', 'POST'),
	(10, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/setUserAuthority', '修改用户角色(必选)', '系统用户', 'POST'),
	(11, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/user/resetPassword', '重置用户密码', '系统用户', 'POST'),
	(12, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/createApi', '创建api', 'api', 'POST'),
	(13, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/deleteApi', '删除Api', 'api', 'POST'),
	(14, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/updateApi', '更新Api', 'api', 'POST'),
	(15, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/getApiList', '获取api列表', 'api', 'POST'),
	(16, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/getAllApis', '获取所有api', 'api', 'POST'),
	(17, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/getApiById', '获取api详细信息', 'api', 'POST'),
	(18, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/api/deleteApisByIds', '批量删除api', 'api', 'DELETE'),
	(19, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authority/copyAuthority', '拷贝角色', '角色', 'POST'),
	(20, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authority/createAuthority', '创建角色', '角色', 'POST'),
	(21, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authority/deleteAuthority', '删除角色', '角色', 'POST'),
	(22, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authority/updateAuthority', '更新角色信息', '角色', 'PUT'),
	(23, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authority/getAuthorityList', '获取角色列表', '角色', 'POST'),
	(24, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authority/setDataAuthority', '设置角色资源权限', '角色', 'POST'),
	(25, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/casbin/updateCasbin', '更改角色api权限', 'casbin', 'POST'),
	(26, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/casbin/getPolicyPathByAuthorityId', '获取权限列表', 'casbin', 'POST'),
	(27, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/addBaseMenu', '新增菜单', '菜单', 'POST'),
	(28, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/getMenu', '获取菜单树(必选)', '菜单', 'POST'),
	(29, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/deleteBaseMenu', '删除菜单', '菜单', 'POST'),
	(30, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/updateBaseMenu', '更新菜单', '菜单', 'POST'),
	(31, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/getBaseMenuById', '根据id获取菜单', '菜单', 'POST'),
	(32, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/getMenuList', '分页获取基础menu列表', '菜单', 'POST'),
	(33, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/getBaseMenuTree', '获取用户动态路由', '菜单', 'POST'),
	(34, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/getMenuAuthority', '获取指定角色menu', '菜单', 'POST'),
	(35, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/menu/addMenuAuthority', '增加menu和角色关联关系', '菜单', 'POST'),
	(36, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/findFile', '寻找目标文件（秒传）', '分片上传', 'GET'),
	(37, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/breakpointContinue', '断点续传', '分片上传', 'POST'),
	(38, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/breakpointContinueFinish', '断点续传完成', '分片上传', 'POST'),
	(39, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/removeChunk', '上传完成移除文件', '分片上传', 'POST'),
	(40, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/upload', '文件上传示例', '文件上传与下载', 'POST'),
	(41, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/deleteFile', '删除文件', '文件上传与下载', 'POST'),
	(42, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/editFileName', '文件名或者备注编辑', '文件上传与下载', 'POST'),
	(43, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/fileUploadAndDownload/getFileList', '获取上传文件列表', '文件上传与下载', 'POST'),
	(44, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/system/getServerInfo', '获取服务器信息', '系统服务', 'POST'),
	(45, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/system/getSystemConfig', '获取配置文件内容', '系统服务', 'POST'),
	(46, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/system/setSystemConfig', '设置配置文件内容', '系统服务', 'POST'),
	(47, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/customer/customer', '更新客户', '客户', 'PUT'),
	(48, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/customer/customer', '创建客户', '客户', 'POST'),
	(49, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/customer/customer', '删除客户', '客户', 'DELETE'),
	(50, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/customer/customer', '获取单一客户', '客户', 'GET'),
	(51, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/customer/customerList', '获取客户列表', '客户', 'GET'),
	(52, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/getDB', '获取所有数据库', '代码生成器', 'GET'),
	(53, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/getTables', '获取数据库表', '代码生成器', 'GET'),
	(54, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/createTemp', '自动化代码', '代码生成器', 'POST'),
	(55, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/preview', '预览自动化代码', '代码生成器', 'POST'),
	(56, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/getColumn', '获取所选table的所有字段', '代码生成器', 'GET'),
	(57, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/createPlug', '自动创建插件包', '代码生成器', 'POST'),
	(58, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/installPlugin', '安装插件', '代码生成器', 'POST'),
	(59, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/createPackage', '生成包(package)', '包（pkg）生成器', 'POST'),
	(60, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/getPackage', '获取所有包(package)', '包（pkg）生成器', 'POST'),
	(61, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/delPackage', '删除包(package)', '包（pkg）生成器', 'POST'),
	(62, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/getMeta', '获取meta信息', '代码生成器历史', 'POST'),
	(63, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/rollback', '回滚自动生成代码', '代码生成器历史', 'POST'),
	(64, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/getSysHistory', '查询回滚记录', '代码生成器历史', 'POST'),
	(65, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/autoCode/delSysHistory', '删除回滚记录', '代码生成器历史', 'POST'),
	(66, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionaryDetail/updateSysDictionaryDetail', '更新字典内容', '系统字典详情', 'PUT'),
	(67, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionaryDetail/createSysDictionaryDetail', '新增字典内容', '系统字典详情', 'POST'),
	(68, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionaryDetail/deleteSysDictionaryDetail', '删除字典内容', '系统字典详情', 'DELETE'),
	(69, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionaryDetail/findSysDictionaryDetail', '根据ID获取字典内容', '系统字典详情', 'GET'),
	(70, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionaryDetail/getSysDictionaryDetailList', '获取字典内容列表', '系统字典详情', 'GET'),
	(71, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionary/createSysDictionary', '新增字典', '系统字典', 'POST'),
	(72, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionary/deleteSysDictionary', '删除字典', '系统字典', 'DELETE'),
	(73, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionary/updateSysDictionary', '更新字典', '系统字典', 'PUT'),
	(74, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionary/findSysDictionary', '根据ID获取字典', '系统字典', 'GET'),
	(75, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysDictionary/getSysDictionaryList', '获取字典列表', '系统字典', 'GET'),
	(76, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysOperationRecord/createSysOperationRecord', '新增操作记录', '操作记录', 'POST'),
	(77, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysOperationRecord/findSysOperationRecord', '根据ID获取操作记录', '操作记录', 'GET'),
	(78, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysOperationRecord/getSysOperationRecordList', '获取操作记录列表', '操作记录', 'GET'),
	(79, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysOperationRecord/deleteSysOperationRecord', '删除操作记录', '操作记录', 'DELETE'),
	(80, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/sysOperationRecord/deleteSysOperationRecordByIds', '批量删除操作历史', '操作记录', 'DELETE'),
	(81, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/simpleUploader/upload', '插件版分片上传', '断点续传(插件版)', 'POST'),
	(82, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/simpleUploader/checkFileMd5', '文件完整度验证', '断点续传(插件版)', 'GET'),
	(83, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/simpleUploader/mergeFileMd5', '上传完成合并文件', '断点续传(插件版)', 'GET'),
	(84, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/email/emailTest', '发送测试邮件', 'email', 'POST'),
	(85, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/email/emailSend', '发送邮件示例', 'email', 'POST'),
	(86, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authorityBtn/setAuthorityBtn', '设置按钮权限', '按钮权限', 'POST'),
	(87, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authorityBtn/getAuthorityBtn', '获取已有按钮权限', '按钮权限', 'POST'),
	(88, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/authorityBtn/canRemoveAuthorityBtn', '删除按钮', '按钮权限', 'POST'),
	(89, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/chatGpt/getTable', '通过gpt获取内容', '万用表格', 'POST'),
	(90, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/chatGpt/createSK', '录入sk', '万用表格', 'POST'),
	(91, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/chatGpt/getSK', '获取sk', '万用表格', 'GET'),
	(92, '2023-06-02 17:02:29.928', '2023-06-02 17:02:29.928', NULL, '/chatGpt/deleteSK', '删除sk', '万用表格', 'DELETE'),
	(93, '2023-06-02 18:28:19.308', '2023-06-02 18:28:19.308', NULL, '/plVideo/createPlVideo', '新增短剧表', 'plVideo', 'POST'),
	(94, '2023-06-02 18:28:19.309', '2023-06-02 18:28:19.309', NULL, '/plVideo/deletePlVideo', '删除短剧表', 'plVideo', 'DELETE'),
	(95, '2023-06-02 18:28:19.310', '2023-06-02 18:28:19.310', NULL, '/plVideo/deletePlVideoByIds', '批量删除短剧表', 'plVideo', 'DELETE'),
	(96, '2023-06-02 18:28:19.311', '2023-06-02 18:28:19.311', NULL, '/plVideo/updatePlVideo', '更新短剧表', 'plVideo', 'PUT'),
	(97, '2023-06-02 18:28:19.312', '2023-06-02 18:28:19.312', NULL, '/plVideo/findPlVideo', '根据ID获取短剧表', 'plVideo', 'GET'),
	(98, '2023-06-02 18:28:19.313', '2023-06-02 18:28:19.313', NULL, '/plVideo/getPlVideoList', '获取短剧表列表', 'plVideo', 'GET'),
	(99, '2023-06-02 18:36:01.676', '2023-06-02 18:36:01.676', NULL, '/plUser/createPlUser', '新增短剧用户表', 'plUser', 'POST'),
	(100, '2023-06-02 18:36:01.677', '2023-06-02 18:36:01.677', NULL, '/plUser/deletePlUser', '删除短剧用户表', 'plUser', 'DELETE'),
	(101, '2023-06-02 18:36:01.678', '2023-06-02 18:36:01.678', NULL, '/plUser/deletePlUserByIds', '批量删除短剧用户表', 'plUser', 'DELETE'),
	(102, '2023-06-02 18:36:01.679', '2023-06-02 18:36:01.679', NULL, '/plUser/updatePlUser', '更新短剧用户表', 'plUser', 'PUT'),
	(103, '2023-06-02 18:36:01.680', '2023-06-02 18:36:01.680', NULL, '/plUser/findPlUser', '根据ID获取短剧用户表', 'plUser', 'GET'),
	(104, '2023-06-02 18:36:01.681', '2023-06-02 18:36:01.681', NULL, '/plUser/getPlUserList', '获取短剧用户表列表', 'plUser', 'GET'),
	(105, '2023-06-02 18:40:17.363', '2023-06-02 18:40:17.363', NULL, '/plRecharge/createPlRecharge', '新增充值记录', 'plRecharge', 'POST'),
	(106, '2023-06-02 18:40:17.365', '2023-06-02 18:40:17.365', NULL, '/plRecharge/deletePlRecharge', '删除充值记录', 'plRecharge', 'DELETE'),
	(107, '2023-06-02 18:40:17.365', '2023-06-02 18:40:17.365', NULL, '/plRecharge/deletePlRechargeByIds', '批量删除充值记录', 'plRecharge', 'DELETE'),
	(108, '2023-06-02 18:40:17.366', '2023-06-02 18:40:17.366', NULL, '/plRecharge/updatePlRecharge', '更新充值记录', 'plRecharge', 'PUT'),
	(109, '2023-06-02 18:40:17.367', '2023-06-02 18:40:17.367', NULL, '/plRecharge/findPlRecharge', '根据ID获取充值记录', 'plRecharge', 'GET'),
	(110, '2023-06-02 18:40:17.368', '2023-06-02 18:40:17.368', NULL, '/plRecharge/getPlRechargeList', '获取充值记录列表', 'plRecharge', 'GET'),
	(111, '2023-06-02 18:43:54.870', '2023-06-02 18:43:54.870', NULL, '/plCost/createPlCost', '新增消费记录', 'plCost', 'POST'),
	(112, '2023-06-02 18:43:54.871', '2023-06-02 18:43:54.871', NULL, '/plCost/deletePlCost', '删除消费记录', 'plCost', 'DELETE'),
	(113, '2023-06-02 18:43:54.872', '2023-06-02 18:43:54.872', NULL, '/plCost/deletePlCostByIds', '批量删除消费记录', 'plCost', 'DELETE'),
	(114, '2023-06-02 18:43:54.873', '2023-06-02 18:43:54.873', NULL, '/plCost/updatePlCost', '更新消费记录', 'plCost', 'PUT'),
	(115, '2023-06-02 18:43:54.873', '2023-06-02 18:43:54.873', NULL, '/plCost/findPlCost', '根据ID获取消费记录', 'plCost', 'GET'),
	(116, '2023-06-02 18:43:54.875', '2023-06-02 18:43:54.875', NULL, '/plCost/getPlCostList', '获取消费记录列表', 'plCost', 'GET');

-- 导出  表 playlet.sys_authorities 结构
CREATE TABLE IF NOT EXISTS `sys_authorities` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `authority_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `authority_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `authority_id` (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_authorities 的数据：~3 rows (大约)
DELETE FROM `sys_authorities`;
INSERT INTO `sys_authorities` (`created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router`) VALUES
	('2023-06-02 17:02:29.948', '2023-06-02 19:10:47.909', NULL, 888, '普通用户', 0, 'dashboard'),
	('2023-06-02 17:02:29.948', '2023-06-02 17:02:30.300', NULL, 8881, '普通用户子角色', 888, 'dashboard'),
	('2023-06-02 17:02:29.948', '2023-06-02 19:11:11.348', NULL, 9528, '测试角色', 0, 'dashboard');

-- 导出  表 playlet.sys_authority_btns 结构
CREATE TABLE IF NOT EXISTS `sys_authority_btns` (
  `authority_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint unsigned DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_authority_btns 的数据：~0 rows (大约)
DELETE FROM `sys_authority_btns`;

-- 导出  表 playlet.sys_authority_menus 结构
CREATE TABLE IF NOT EXISTS `sys_authority_menus` (
  `sys_base_menu_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_authority_menus 的数据：~57 rows (大约)
DELETE FROM `sys_authority_menus`;
INSERT INTO `sys_authority_menus` (`sys_base_menu_id`, `sys_authority_authority_id`) VALUES
	(1, 888),
	(1, 8881),
	(2, 888),
	(2, 8881),
	(3, 888),
	(3, 9528),
	(4, 888),
	(4, 8881),
	(5, 888),
	(5, 8881),
	(6, 888),
	(6, 8881),
	(7, 888),
	(7, 8881),
	(8, 888),
	(8, 8881),
	(8, 9528),
	(9, 888),
	(9, 8881),
	(10, 888),
	(10, 8881),
	(11, 888),
	(11, 8881),
	(12, 888),
	(13, 888),
	(13, 8881),
	(14, 888),
	(14, 8881),
	(15, 888),
	(15, 8881),
	(16, 888),
	(16, 8881),
	(17, 888),
	(17, 8881),
	(18, 888),
	(19, 888),
	(20, 888),
	(21, 888),
	(22, 888),
	(23, 888),
	(24, 888),
	(25, 888),
	(26, 888),
	(27, 888),
	(28, 888),
	(29, 888),
	(30, 888),
	(31, 888),
	(31, 9528),
	(32, 888),
	(32, 9528),
	(33, 888),
	(33, 9528),
	(34, 888),
	(34, 9528);

-- 导出  表 playlet.sys_auto_codes 结构
CREATE TABLE IF NOT EXISTS `sys_auto_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包名',
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示名',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_codes_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_auto_codes 的数据：~0 rows (大约)
DELETE FROM `sys_auto_codes`;
INSERT INTO `sys_auto_codes` (`id`, `created_at`, `updated_at`, `deleted_at`, `package_name`, `label`, `desc`) VALUES
	(1, '2023-06-02 18:17:02.745', '2023-06-02 18:17:02.745', NULL, 'playlet', 'playlet', '短剧包');

-- 导出  表 playlet.sys_auto_code_histories 结构
CREATE TABLE IF NOT EXISTS `sys_auto_code_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `package` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `business_db` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_meta` text COLLATE utf8mb4_general_ci,
  `auto_code_path` text COLLATE utf8mb4_general_ci,
  `injection_meta` text COLLATE utf8mb4_general_ci,
  `struct_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `struct_cn_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_ids` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flag` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_auto_code_histories 的数据：~4 rows (大约)
DELETE FROM `sys_auto_code_histories`;
INSERT INTO `sys_auto_code_histories` (`id`, `created_at`, `updated_at`, `deleted_at`, `package`, `business_db`, `table_name`, `request_meta`, `auto_code_path`, `injection_meta`, `struct_name`, `struct_cn_name`, `api_ids`, `flag`) VALUES
	(1, '2023-06-02 18:28:19.384', '2023-06-02 18:28:19.384', NULL, 'playlet', '', 'pl_video', '{"structName":"PlVideo","tableName":"pl_video","packageName":"plVideo","humpPackageName":"pl_video","abbreviation":"plVideo","description":"短剧表","autoCreateApiToSql":true,"autoCreateResource":true,"autoMoveFile":true,"businessDB":"","fields":[{"fieldName":"VideoName","fieldDesc":"短剧名","fieldType":"string","fieldJson":"videoName","dataTypeLong":"","comment":"短剧名","columnName":"video_name","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"VideoType","fieldDesc":"短剧类型","fieldType":"int","fieldJson":"videoType","dataTypeLong":"","comment":"短剧类型","columnName":"video_type","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"TypeName","fieldDesc":"类型名","fieldType":"string","fieldJson":"typeName","dataTypeLong":"","comment":"类型名","columnName":"type_name","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"VideoDesc","fieldDesc":"简介","fieldType":"string","fieldJson":"videoDesc","dataTypeLong":"","comment":"简介","columnName":"video_desc","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"LikeCount","fieldDesc":"收藏数","fieldType":"int","fieldJson":"likeCount","dataTypeLong":"","comment":"收藏数","columnName":"like_count","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"Finish","fieldDesc":"是否完结","fieldType":"int","fieldJson":"finish","dataTypeLong":"","comment":"是否完结","columnName":"finish","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"Count","fieldDesc":"集数","fieldType":"int","fieldJson":"count","dataTypeLong":"","comment":"集数","columnName":"count","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"ImgUrl","fieldDesc":"图片","fieldType":"string","fieldJson":"imgUrl","dataTypeLong":"","comment":"图片","columnName":"img_url","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"VideoUrl","fieldDesc":"视频地址","fieldType":"string","fieldJson":"videoUrl","dataTypeLong":"","comment":"视频地址","columnName":"video_url","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"CreateTime","fieldDesc":"上架时间","fieldType":"time.Time","fieldJson":"createTime","dataTypeLong":"","comment":"上架时间","columnName":"create_time","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"FreeCount","fieldDesc":"免费集数","fieldType":"int","fieldJson":"freeCount","dataTypeLong":"","comment":"免费集数","columnName":"free_count","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false}],"HasTimer":true,"package":"playlet"}', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\pl_video.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\pl_video.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\request\\pl_video.go;d:\\Work\\playlet\\server\\server\\router\\playlet\\pl_video.go;d:\\Work\\playlet\\server\\server\\service\\playlet\\pl_video.go;d:\\Work\\playlet\\server\\web\\src\\api\\plVideo.js;d:\\Work\\playlet\\server\\web\\src\\view\\plVideo\\plVideoForm.vue;d:\\Work\\playlet\\server\\web\\src\\view\\plVideo\\plVideo.vue;', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\enter.go@ApiGroup@PlVideoApi;d:\\Work\\playlet\\server\\server\\router\\playlet\\enter.go@RouterGroup@PlVideoRouter;d:\\Work\\playlet\\server\\server\\service\\playlet\\enter.go@ServiceGroup@PlVideoService;', 'PlVideo', '短剧表', '93;94;95;96;97;98;', 0),
	(2, '2023-06-02 18:36:01.753', '2023-06-02 18:36:01.753', NULL, 'playlet', '', 'pl_user', '{"structName":"PlUser","tableName":"pl_user","packageName":"plUser","humpPackageName":"pl_user","abbreviation":"plUser","description":"短剧用户表","autoCreateApiToSql":true,"autoCreateResource":true,"autoMoveFile":true,"businessDB":"","fields":[{"fieldName":"UserName","fieldDesc":"用户名","fieldType":"string","fieldJson":"userName","dataTypeLong":"","comment":"用户名","columnName":"user_name","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"UserId","fieldDesc":"用户Id","fieldType":"string","fieldJson":"userId","dataTypeLong":"","comment":"用户Id","columnName":"user_id","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"GuestId","fieldDesc":"访客id","fieldType":"string","fieldJson":"guestId","dataTypeLong":"","comment":"访客id","columnName":"guest_id","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"Recharge","fieldDesc":"累计充值","fieldType":"float64","fieldJson":"recharge","dataTypeLong":"","comment":"累计充值","columnName":"recharge","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"CurGold","fieldDesc":"当前金币","fieldType":"float64","fieldJson":"curGold","dataTypeLong":"","comment":"当前金币","columnName":"cur_gold","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"BuyVideos","fieldDesc":"解锁记录","fieldType":"string","fieldJson":"buyVideos","dataTypeLong":"","comment":"解锁记录","columnName":"buy_videos","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"RegisterTime","fieldDesc":"注册时间","fieldType":"time.Time","fieldJson":"registerTime","dataTypeLong":"","comment":"注册时间","columnName":"register_time","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"LastLoginTime","fieldDesc":"最后登录时间","fieldType":"time.Time","fieldJson":"lastLoginTime","dataTypeLong":"","comment":"最后登录时间","columnName":"last_login_time","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"LikeVideos","fieldDesc":"收藏剧集","fieldType":"string","fieldJson":"likeVideos","dataTypeLong":"","comment":"收藏剧集","columnName":"like_videos","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false}],"HasTimer":true,"package":"playlet"}', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\pl_user.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\pl_user.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\request\\pl_user.go;d:\\Work\\playlet\\server\\server\\router\\playlet\\pl_user.go;d:\\Work\\playlet\\server\\server\\service\\playlet\\pl_user.go;d:\\Work\\playlet\\server\\web\\src\\api\\plUser.js;d:\\Work\\playlet\\server\\web\\src\\view\\plUser\\plUserForm.vue;d:\\Work\\playlet\\server\\web\\src\\view\\plUser\\plUser.vue;', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\enter.go@ApiGroup@PlUserApi;d:\\Work\\playlet\\server\\server\\router\\playlet\\enter.go@RouterGroup@PlUserRouter;d:\\Work\\playlet\\server\\server\\service\\playlet\\enter.go@ServiceGroup@PlUserService;', 'PlUser', '短剧用户表', '99;100;101;102;103;104;', 0),
	(3, '2023-06-02 18:40:17.442', '2023-06-02 18:40:17.442', NULL, 'playlet', '', 'pl_recharge', '{"structName":"PlRecharge","tableName":"pl_recharge","packageName":"plRecharge","humpPackageName":"pl_recharge","abbreviation":"plRecharge","description":"充值记录","autoCreateApiToSql":true,"autoCreateResource":true,"autoMoveFile":true,"businessDB":"","fields":[{"fieldName":"UserName","fieldDesc":"用户名","fieldType":"string","fieldJson":"userName","dataTypeLong":"","comment":"用户名","columnName":"user_name","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"UserId","fieldDesc":"用户Id","fieldType":"string","fieldJson":"userId","dataTypeLong":"","comment":"用户Id","columnName":"user_id","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"Recharge","fieldDesc":"充值金额","fieldType":"float64","fieldJson":"recharge","dataTypeLong":"","comment":"充值金额","columnName":"recharge","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"Time","fieldDesc":"时间","fieldType":"time.Time","fieldJson":"time","dataTypeLong":"","comment":"时间","columnName":"time","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"BuyGold","fieldDesc":"购买金币","fieldType":"float64","fieldJson":"buyGold","dataTypeLong":"","comment":"购买金币","columnName":"buy_gold","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"GiveGold","fieldDesc":"赠送金币","fieldType":"float64","fieldJson":"giveGold","dataTypeLong":"","comment":"赠送金币","columnName":"give_gold","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"LeftGold","fieldDesc":"剩余金币","fieldType":"float64","fieldJson":"leftGold","dataTypeLong":"","comment":"剩余金币","columnName":"left_gold","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"AdminId","fieldDesc":"操作人","fieldType":"int","fieldJson":"adminId","dataTypeLong":"","comment":"操作人","columnName":"admin_id","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false}],"HasTimer":true,"package":"playlet"}', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\pl_recharge.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\pl_recharge.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\request\\pl_recharge.go;d:\\Work\\playlet\\server\\server\\router\\playlet\\pl_recharge.go;d:\\Work\\playlet\\server\\server\\service\\playlet\\pl_recharge.go;d:\\Work\\playlet\\server\\web\\src\\api\\plRecharge.js;d:\\Work\\playlet\\server\\web\\src\\view\\plRecharge\\plRechargeForm.vue;d:\\Work\\playlet\\server\\web\\src\\view\\plRecharge\\plRecharge.vue;', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\enter.go@ApiGroup@PlRechargeApi;d:\\Work\\playlet\\server\\server\\router\\playlet\\enter.go@RouterGroup@PlRechargeRouter;d:\\Work\\playlet\\server\\server\\service\\playlet\\enter.go@ServiceGroup@PlRechargeService;', 'PlRecharge', '充值记录', '105;106;107;108;109;110;', 0),
	(4, '2023-06-02 18:43:54.944', '2023-06-02 18:43:54.944', NULL, 'playlet', '', 'pl_cost', '{"structName":"PlCost","tableName":"pl_cost","packageName":"plCost","humpPackageName":"pl_cost","abbreviation":"plCost","description":"消费记录","autoCreateApiToSql":true,"autoCreateResource":true,"autoMoveFile":true,"businessDB":"","fields":[{"fieldName":"UserName","fieldDesc":"用户名","fieldType":"string","fieldJson":"userName","dataTypeLong":"","comment":"用户名","columnName":"user_name","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"UserId","fieldDesc":"用户Id","fieldType":"int","fieldJson":"userId","dataTypeLong":"","comment":"用户Id","columnName":"user_id","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"CostGold","fieldDesc":"消费金币","fieldType":"float64","fieldJson":"costGold","dataTypeLong":"","comment":"消费金币","columnName":"cost_gold","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"Time","fieldDesc":"时间","fieldType":"time.Time","fieldJson":"time","dataTypeLong":"","comment":"时间","columnName":"time","fieldSearchType":"","dictType":"","require":false,"errorText":"","clearable":true,"sort":false},{"fieldName":"LeftGold","fieldDesc":"剩余金币","fieldType":"float64","fieldJson":"leftGold","dataTypeLong":"","comment":"剩余金币","columnName":"left_gold","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false},{"fieldName":"BuyVideo","fieldDesc":"购买视频","fieldType":"string","fieldJson":"buyVideo","dataTypeLong":"","comment":"购买视频","columnName":"buy_video","fieldSearchType":"","dictType":"","require":true,"errorText":"","clearable":true,"sort":false}],"HasTimer":true,"package":"playlet"}', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\pl_cost.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\pl_cost.go;d:\\Work\\playlet\\server\\server\\model\\playlet\\request\\pl_cost.go;d:\\Work\\playlet\\server\\server\\router\\playlet\\pl_cost.go;d:\\Work\\playlet\\server\\server\\service\\playlet\\pl_cost.go;d:\\Work\\playlet\\server\\web\\src\\api\\plCost.js;d:\\Work\\playlet\\server\\web\\src\\view\\plCost\\plCostForm.vue;d:\\Work\\playlet\\server\\web\\src\\view\\plCost\\plCost.vue;', 'd:\\Work\\playlet\\server\\server\\api\\v1\\playlet\\enter.go@ApiGroup@PlCostApi;d:\\Work\\playlet\\server\\server\\router\\playlet\\enter.go@RouterGroup@PlCostRouter;d:\\Work\\playlet\\server\\server\\service\\playlet\\enter.go@ServiceGroup@PlCostService;', 'PlCost', '消费记录', '111;112;113;114;115;116;', 0);

-- 导出  表 playlet.sys_base_menus 结构
CREATE TABLE IF NOT EXISTS `sys_base_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `menu_level` bigint unsigned DEFAULT NULL,
  `parent_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `active_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_base_menus 的数据：~30 rows (大约)
DELETE FROM `sys_base_menus`;
INSERT INTO `sys_base_menus` (`id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `active_name`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab`) VALUES
	(1, '2023-06-02 17:02:30.021', '2023-06-02 19:09:14.947', NULL, 0, '0', 'dashboard', 'dashboard', 1, 'view/dashboard/index.vue', 1, '', 0, 0, '仪表盘', 'odometer', 0),
	(2, '2023-06-02 17:02:30.021', '2023-06-02 19:09:56.483', NULL, 0, '0', 'about', 'about', 1, 'view/about/index.vue', 9, '', 0, 0, '关于我们', 'info-filled', 0),
	(3, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '0', 'admin', 'superAdmin', 0, 'view/superAdmin/index.vue', 3, '', 0, 0, '超级管理员', 'user', 0),
	(4, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'authority', 'authority', 0, 'view/superAdmin/authority/authority.vue', 1, '', 0, 0, '角色管理', 'avatar', 0),
	(5, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'menu', 'menu', 0, 'view/superAdmin/menu/menu.vue', 2, '', 1, 0, '菜单管理', 'tickets', 0),
	(6, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'api', 'api', 0, 'view/superAdmin/api/api.vue', 3, '', 1, 0, 'api管理', 'platform', 0),
	(7, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'user', 'user', 0, 'view/superAdmin/user/user.vue', 4, '', 0, 0, '用户管理', 'coordinate', 0),
	(8, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'dictionary', 'dictionary', 0, 'view/superAdmin/dictionary/sysDictionary.vue', 5, '', 0, 0, '字典管理', 'notebook', 0),
	(9, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'dictionaryDetail/:id', 'dictionaryDetail', 1, 'view/superAdmin/dictionary/sysDictionaryDetail.vue', 1, 'dictionary', 0, 0, '字典详情-${id}', 'list', 0),
	(10, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '3', 'operation', 'operation', 0, 'view/superAdmin/operation/sysOperationRecord.vue', 6, '', 0, 0, '操作历史', 'pie-chart', 0),
	(11, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '0', 'person', 'person', 1, 'view/person/person.vue', 4, '', 0, 0, '个人信息', 'message', 0),
	(12, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '0', 'example', 'example', 0, 'view/example/index.vue', 7, '', 0, 0, '示例文件', 'management', 0),
	(13, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '12', 'upload', 'upload', 0, 'view/example/upload/upload.vue', 5, '', 0, 0, '媒体库（上传下载）', 'upload', 0),
	(14, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '12', 'breakpoint', 'breakpoint', 0, 'view/example/breakpoint/breakpoint.vue', 6, '', 0, 0, '断点续传', 'upload-filled', 0),
	(15, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '12', 'customer', 'customer', 0, 'view/example/customer/customer.vue', 7, '', 0, 0, '客户列表（资源示例）', 'avatar', 0),
	(16, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '0', 'systemTools', 'systemTools', 0, 'view/systemTools/index.vue', 5, '', 0, 0, '系统工具', 'tools', 0),
	(17, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'autoCode', 'autoCode', 0, 'view/systemTools/autoCode/index.vue', 1, '', 1, 0, '代码生成器', 'cpu', 0),
	(18, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'formCreate', 'formCreate', 0, 'view/systemTools/formCreate/index.vue', 2, '', 1, 0, '表单生成器', 'magic-stick', 0),
	(19, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'system', 'system', 0, 'view/systemTools/system/system.vue', 3, '', 0, 0, '系统配置', 'operation', 0),
	(20, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'autoCodeAdmin', 'autoCodeAdmin', 0, 'view/systemTools/autoCodeAdmin/index.vue', 1, '', 0, 0, '自动化代码管理', 'magic-stick', 0),
	(21, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'autoCodeEdit/:id', 'autoCodeEdit', 1, 'view/systemTools/autoCode/index.vue', 0, '', 0, 0, '自动化代码-${id}', 'magic-stick', 0),
	(22, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'autoPkg', 'autoPkg', 0, 'view/systemTools/autoPkg/autoPkg.vue', 0, '', 0, 0, '自动化package', 'folder', 0),
	(23, '2023-06-02 17:02:30.021', '2023-06-02 19:09:24.571', NULL, 0, '0', 'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 1, '/', 0, '', 0, 0, '官方网站', 'home-filled', 0),
	(24, '2023-06-02 17:02:30.021', '2023-06-02 19:09:48.411', NULL, 0, '0', 'state', 'state', 1, 'view/system/state.vue', 8, '', 0, 0, '服务器状态', 'cloudy', 0),
	(25, '2023-06-02 17:02:30.021', '2023-06-02 19:09:39.083', NULL, 0, '0', 'plugin', 'plugin', 1, 'view/routerHolder.vue', 6, '', 0, 0, '插件系统', 'cherry', 0),
	(26, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '25', 'https://plugin.gin-vue-admin.com/', 'https://plugin.gin-vue-admin.com/', 0, 'https://plugin.gin-vue-admin.com/', 0, '', 0, 0, '插件市场', 'shop', 0),
	(27, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '25', 'installPlugin', 'installPlugin', 0, 'view/systemTools/installPlugin/index.vue', 1, '', 0, 0, '插件安装', 'box', 0),
	(28, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '25', 'autoPlug', 'autoPlug', 0, 'view/systemTools/autoPlug/autoPlug.vue', 2, '', 0, 0, '插件模板', 'folder', 0),
	(29, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '25', 'plugin-email', 'plugin-email', 0, 'plugin/email/view/index.vue', 3, '', 0, 0, '邮件插件', 'message', 0),
	(30, '2023-06-02 17:02:30.021', '2023-06-02 17:02:30.021', NULL, 0, '16', 'chatTable', 'chatTable', 0, 'view/chatgpt/chatTable.vue', 6, '', 0, 0, '万用表格', 'chat-dot-square', 0),
	(31, '2023-06-02 19:03:34.071', '2023-06-02 19:03:34.071', NULL, 0, '0', 'plVideo', 'plVideo', 0, 'view/plVideo/plVideo.vue', 20, '', 0, 0, '视频管理', 'video-camera-filled', 0),
	(32, '2023-06-02 19:04:50.227', '2023-06-02 19:04:50.227', NULL, 0, '0', 'plUser', 'plUser', 0, 'view/plUser/plUser.vue', 22, '', 0, 0, '注册用户', 'avatar', 0),
	(33, '2023-06-02 19:06:49.709', '2023-06-02 19:06:49.709', NULL, 0, '0', 'plRecharge', 'plRecharge', 0, 'view/plRecharge/plRecharge.vue', 24, '', 0, 0, '充值几率', 'money', 0),
	(34, '2023-06-02 19:08:36.493', '2023-06-02 19:08:36.493', NULL, 0, '0', 'plCost', 'plCost', 0, 'view/plCost/plCost.vue', 26, '', 0, 0, '消费记录', 'shopping-cart-full', 0);

-- 导出  表 playlet.sys_base_menu_btns 结构
CREATE TABLE IF NOT EXISTS `sys_base_menu_btns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_base_menu_btns 的数据：~0 rows (大约)
DELETE FROM `sys_base_menu_btns`;

-- 导出  表 playlet.sys_base_menu_parameters 结构
CREATE TABLE IF NOT EXISTS `sys_base_menu_parameters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_base_menu_parameters 的数据：~0 rows (大约)
DELETE FROM `sys_base_menu_parameters`;

-- 导出  表 playlet.sys_chat_gpt_options 结构
CREATE TABLE IF NOT EXISTS `sys_chat_gpt_options` (
  `sk` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_chat_gpt_options 的数据：~0 rows (大约)
DELETE FROM `sys_chat_gpt_options`;

-- 导出  表 playlet.sys_data_authority_id 结构
CREATE TABLE IF NOT EXISTS `sys_data_authority_id` (
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`,`data_authority_id_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_data_authority_id 的数据：~5 rows (大约)
DELETE FROM `sys_data_authority_id`;
INSERT INTO `sys_data_authority_id` (`sys_authority_authority_id`, `data_authority_id_authority_id`) VALUES
	(888, 888),
	(888, 8881),
	(888, 9528),
	(9528, 8881),
	(9528, 9528);

-- 导出  表 playlet.sys_dictionaries 结构
CREATE TABLE IF NOT EXISTS `sys_dictionaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_dictionaries 的数据：~8 rows (大约)
DELETE FROM `sys_dictionaries`;
INSERT INTO `sys_dictionaries` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc`) VALUES
	(1, '2023-06-02 17:02:29.970', '2023-06-02 17:02:29.978', NULL, '性别', 'gender', 1, '性别字典'),
	(2, '2023-06-02 17:02:29.970', '2023-06-02 17:02:29.986', NULL, '数据库int类型', 'int', 1, 'int类型对应的数据库类型'),
	(3, '2023-06-02 17:02:29.970', '2023-06-02 17:02:29.993', NULL, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型'),
	(4, '2023-06-02 17:02:29.970', '2023-06-02 17:02:29.999', NULL, '数据库浮点型', 'float64', 1, '数据库浮点型'),
	(5, '2023-06-02 17:02:29.970', '2023-06-02 17:02:30.008', NULL, '数据库字符串', 'string', 1, '数据库字符串'),
	(6, '2023-06-02 17:02:29.970', '2023-06-02 17:02:30.015', NULL, '数据库bool类型', 'bool', 1, '数据库bool类型'),
	(7, '2023-06-02 18:51:45.664', '2023-06-02 18:51:45.664', NULL, '更新状态', 'finish', 1, '更新状态'),
	(8, '2023-06-02 18:53:16.435', '2023-06-02 18:53:16.435', NULL, '视频分类', 'videoType', 1, '视频分类');

-- 导出  表 playlet.sys_dictionary_details 结构
CREATE TABLE IF NOT EXISTS `sys_dictionary_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示值',
  `value` bigint DEFAULT NULL COMMENT '字典值',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint unsigned DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_dictionary_details 的数据：~34 rows (大约)
DELETE FROM `sys_dictionary_details`;
INSERT INTO `sys_dictionary_details` (`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `status`, `sort`, `sys_dictionary_id`) VALUES
	(1, '2023-06-02 17:02:29.978', '2023-06-02 17:02:29.978', NULL, '男', 1, 1, 1, 1),
	(2, '2023-06-02 17:02:29.978', '2023-06-02 17:02:29.978', NULL, '女', 2, 1, 2, 1),
	(3, '2023-06-02 17:02:29.987', '2023-06-02 17:02:29.987', NULL, 'smallint', 1, 1, 1, 2),
	(4, '2023-06-02 17:02:29.987', '2023-06-02 17:02:29.987', NULL, 'mediumint', 2, 1, 2, 2),
	(5, '2023-06-02 17:02:29.987', '2023-06-02 17:02:29.987', NULL, 'int', 3, 1, 3, 2),
	(6, '2023-06-02 17:02:29.987', '2023-06-02 17:02:29.987', NULL, 'bigint', 4, 1, 4, 2),
	(7, '2023-06-02 17:02:29.994', '2023-06-02 17:02:29.994', NULL, 'date', 0, 1, 0, 3),
	(8, '2023-06-02 17:02:29.994', '2023-06-02 17:02:29.994', NULL, 'time', 1, 1, 1, 3),
	(9, '2023-06-02 17:02:29.994', '2023-06-02 17:02:29.994', NULL, 'year', 2, 1, 2, 3),
	(10, '2023-06-02 17:02:29.994', '2023-06-02 17:02:29.994', NULL, 'datetime', 3, 1, 3, 3),
	(11, '2023-06-02 17:02:29.994', '2023-06-02 17:02:29.994', NULL, 'timestamp', 5, 1, 5, 3),
	(12, '2023-06-02 17:02:30.001', '2023-06-02 17:02:30.001', NULL, 'float', 0, 1, 0, 4),
	(13, '2023-06-02 17:02:30.001', '2023-06-02 17:02:30.001', NULL, 'double', 1, 1, 1, 4),
	(14, '2023-06-02 17:02:30.001', '2023-06-02 17:02:30.001', NULL, 'decimal', 2, 1, 2, 4),
	(15, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'char', 0, 1, 0, 5),
	(16, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'varchar', 1, 1, 1, 5),
	(17, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'tinyblob', 2, 1, 2, 5),
	(18, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'tinytext', 3, 1, 3, 5),
	(19, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'text', 4, 1, 4, 5),
	(20, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'blob', 5, 1, 5, 5),
	(21, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'mediumblob', 6, 1, 6, 5),
	(22, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'mediumtext', 7, 1, 7, 5),
	(23, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'longblob', 8, 1, 8, 5),
	(24, '2023-06-02 17:02:30.009', '2023-06-02 17:02:30.009', NULL, 'longtext', 9, 1, 9, 5),
	(25, '2023-06-02 17:02:30.016', '2023-06-02 17:02:30.016', NULL, 'tinyint', 0, 1, 0, 6),
	(26, '2023-06-02 18:52:05.905', '2023-06-02 18:52:05.905', NULL, '已完结', 1, 1, 1, 7),
	(27, '2023-06-02 18:52:14.675', '2023-06-02 18:52:14.675', NULL, '更新中', 2, 1, 2, 7),
	(28, '2023-06-02 18:55:51.987', '2023-06-02 18:55:51.987', NULL, '逆袭', 1, 1, 1, 8),
	(29, '2023-06-02 18:56:05.761', '2023-06-02 18:56:05.761', NULL, '赘婿', 2, 1, 2, 8),
	(30, '2023-06-02 18:56:31.438', '2023-06-02 18:56:31.438', NULL, '神豪', 3, 1, 3, 8),
	(31, '2023-06-02 18:56:51.171', '2023-06-02 18:56:51.171', NULL, '美女', 4, 1, 4, 8),
	(32, '2023-06-02 18:57:09.069', '2023-06-02 18:57:09.069', NULL, '神医', 5, 1, 5, 8),
	(33, '2023-06-02 18:57:33.482', '2023-06-02 18:57:33.482', NULL, '现言', 6, 1, 6, 8),
	(34, '2023-06-02 18:57:45.566', '2023-06-02 18:57:45.566', NULL, '乡村', 7, 1, 7, 8),
	(35, '2023-06-02 18:57:56.788', '2023-06-02 18:57:56.788', NULL, '重生', 8, 1, 8, 8),
	(36, '2023-06-02 18:58:09.332', '2023-06-02 18:58:09.332', NULL, '暧昧', 9, 1, 9, 8),
	(37, '2023-06-02 18:58:21.694', '2023-06-02 18:58:21.694', NULL, '家庭', 10, 1, 10, 8);

-- 导出  表 playlet.sys_operation_records 结构
CREATE TABLE IF NOT EXISTS `sys_operation_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `status` bigint DEFAULT NULL COMMENT '请求状态',
  `latency` bigint DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误信息',
  `body` text COLLATE utf8mb4_general_ci COMMENT '请求Body',
  `resp` text COLLATE utf8mb4_general_ci COMMENT '响应Body',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_operation_records 的数据：~41 rows (大约)
DELETE FROM `sys_operation_records`;
INSERT INTO `sys_operation_records` (`id`, `created_at`, `updated_at`, `deleted_at`, `ip`, `method`, `path`, `status`, `latency`, `agent`, `error_message`, `body`, `resp`, `user_id`) VALUES
	(1, '2023-06-02 17:03:00.024', '2023-06-02 17:03:00.024', NULL, '127.0.0.1', 'POST', '/system/getServerInfo', 200, 370718500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '', '{"code":0,"data":{"server":{"os":{"goos":"windows","numCpu":16,"compiler":"gc","goVersion":"go1.20.2","numGoroutine":10},"cpu":{"cpus":[84.61538461538461,92.3076923076923,84.61538461538461,92.3076923076923,92.3076923076923,84.61538461538461,92.3076923076923,84.61538461538461,84.61538461538461,92.3076923076923,76.92307692307693,92.3076923076923,84.61538461538461,100,92.85714285714286,92.3076923076923],"cores":8},"ram":{"usedMb":27080,"totalMb":65388,"usedPercent":41},"disk":{"usedMb":427171,"usedGb":417,"totalMb":771642,"totalGb":753,"usedPercent":55}}},"msg":"获取成功"}', 1),
	(2, '2023-06-02 18:51:45.669', '2023-06-02 18:51:45.669', NULL, '127.0.0.1', 'POST', '/sysDictionary/createSysDictionary', 200, 5473100, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"name":"更新状态","type":"finish","status":true,"desc":"更新状态"}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(3, '2023-06-02 18:52:05.911', '2023-06-02 18:52:05.911', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 4215300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"已完结","value":1,"status":true,"sort":1,"sysDictionaryID":7}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(4, '2023-06-02 18:52:14.680', '2023-06-02 18:52:14.680', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 5058700, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"更新中","value":2,"status":true,"sort":2,"sysDictionaryID":7}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(5, '2023-06-02 18:53:16.440', '2023-06-02 18:53:16.440', NULL, '127.0.0.1', 'POST', '/sysDictionary/createSysDictionary', 200, 5100600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"name":"视频分类","type":"videoType","status":true,"desc":"视频分类"}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(6, '2023-06-02 18:55:51.999', '2023-06-02 18:55:51.999', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 11757800, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"逆袭","value":1,"status":true,"sort":1,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(7, '2023-06-02 18:56:05.773', '2023-06-02 18:56:05.773', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 11765600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"赘婿","value":2,"status":true,"sort":2,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(8, '2023-06-02 18:56:31.442', '2023-06-02 18:56:31.442', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 4172500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"神豪","value":3,"status":true,"sort":3,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(9, '2023-06-02 18:56:51.183', '2023-06-02 18:56:51.183', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 10780300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"美女","value":4,"status":true,"sort":4,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(10, '2023-06-02 18:57:09.081', '2023-06-02 18:57:09.081', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 10842500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"神医","value":5,"status":true,"sort":5,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(11, '2023-06-02 18:57:33.494', '2023-06-02 18:57:33.494', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 10861000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"现言","value":6,"status":true,"sort":6,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(12, '2023-06-02 18:57:45.577', '2023-06-02 18:57:45.577', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 10779500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"乡村","value":7,"status":true,"sort":7,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(13, '2023-06-02 18:57:56.800', '2023-06-02 18:57:56.800', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 11767000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"重生","value":8,"status":true,"sort":8,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(14, '2023-06-02 18:58:09.344', '2023-06-02 18:58:09.344', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 11836000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"暧昧","value":9,"status":true,"sort":9,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(15, '2023-06-02 18:58:21.705', '2023-06-02 18:58:21.705', NULL, '127.0.0.1', 'POST', '/sysDictionaryDetail/createSysDictionaryDetail', 200, 11838400, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"label":"家庭","value":10,"status":true,"sort":10,"sysDictionaryID":8}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(16, '2023-06-02 19:00:11.688', '2023-06-02 19:00:11.688', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 13359800, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":23,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"https://www.gin-vue-admin.com","name":"https://www.gin-vue-admin.com","hidden":false,"component":"/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"官方网站","icon":"home-filled","closeTab":true},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(17, '2023-06-02 19:00:32.785', '2023-06-02 19:00:32.785', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 12439900, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":24,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"state","name":"state","hidden":false,"component":"view/system/state.vue","sort":8,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"服务器状态","icon":"cloudy","closeTab":true},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(18, '2023-06-02 19:00:38.920', '2023-06-02 19:00:38.920', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 13356600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":2,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"about","name":"about","hidden":false,"component":"view/about/index.vue","sort":9,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"关于我们","icon":"info-filled","closeTab":true},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(19, '2023-06-02 19:03:34.083', '2023-06-02 19:03:34.083', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200, 12350500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":0,"path":"plVideo","name":"plVideo","hidden":false,"parentId":"0","component":"view/plVideo/plVideo.vue","meta":{"title":"视频管理","icon":"video-camera-filled","defaultMenu":false,"closeTab":false,"keepAlive":false},"sort":20}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(20, '2023-06-02 19:04:50.232', '2023-06-02 19:04:50.232', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200, 5360500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":0,"path":"plUser","name":"plUser","hidden":false,"parentId":"0","component":"view/plUser/plUser.vue","meta":{"title":"注册用户","icon":"avatar","defaultMenu":false,"closeTab":false,"keepAlive":false},"sort":22}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(21, '2023-06-02 19:06:49.720', '2023-06-02 19:06:49.720', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200, 12358500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":0,"path":"plRecharge","name":"plRecharge","hidden":false,"parentId":"0","component":"view/plRecharge/plRecharge.vue","meta":{"title":"充值几率","icon":"money","defaultMenu":false,"closeTab":false,"keepAlive":false},"sort":24}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(22, '2023-06-02 19:08:36.497', '2023-06-02 19:08:36.497', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200, 4170200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":0,"path":"plCost","name":"plCost","hidden":false,"parentId":"0","component":"view/plCost/plCost.vue","meta":{"title":"消费记录","icon":"shopping-cart-full","defaultMenu":false,"closeTab":false,"keepAlive":false},"sort":26}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(23, '2023-06-02 19:08:53.449', '2023-06-02 19:08:53.449', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 5612400, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":25,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"plugin","name":"plugin","hidden":false,"component":"view/routerHolder.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件系统","icon":"cherry","closeTab":true},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(24, '2023-06-02 19:09:14.959', '2023-06-02 19:09:14.959', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 12397400, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":1,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"dashboard","name":"dashboard","hidden":true,"component":"view/dashboard/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"仪表盘","icon":"odometer","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(25, '2023-06-02 19:09:24.583', '2023-06-02 19:09:24.583', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 12948900, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":23,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:00:11.684+08:00","parentId":"0","path":"https://www.gin-vue-admin.com","name":"https://www.gin-vue-admin.com","hidden":true,"component":"/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"官方网站","icon":"home-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(26, '2023-06-02 19:09:39.095', '2023-06-02 19:09:39.095', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 12436500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":25,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:08:53.444+08:00","parentId":"0","path":"plugin","name":"plugin","hidden":true,"component":"view/routerHolder.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件系统","icon":"cherry","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(27, '2023-06-02 19:09:48.423', '2023-06-02 19:09:48.423', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 12611500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":24,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:00:32.772+08:00","parentId":"0","path":"state","name":"state","hidden":true,"component":"view/system/state.vue","sort":8,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"服务器状态","icon":"cloudy","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(28, '2023-06-02 19:09:56.495', '2023-06-02 19:09:56.495', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 12798700, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"ID":2,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:00:38.908+08:00","parentId":"0","path":"about","name":"about","hidden":true,"component":"view/about/index.vue","sort":9,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"关于我们","icon":"info-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(29, '2023-06-02 19:10:34.818', '2023-06-02 19:10:34.818', NULL, '127.0.0.1', 'POST', '/system/getSystemConfig', 200, 976000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '', '{"code":0,"data":{"config":{"jwt":{"signing-key":"656586af-2903-442f-80c8-18c480dd7896","expires-time":"7d","buffer-time":"1d","issuer":"qmPlus"},"zap":{"level":"info","prefix":"[github.com/flipped-aurora/gin-vue-admin/server]","format":"console","director":"log","encode-level":"LowercaseColorLevelEncoder","stacktrace-key":"stacktrace","max-age":0,"show-line":true,"log-in-console":true},"redis":{"db":0,"addr":"127.0.0.1:6379","password":""},"email":{"to":"xxx@qq.com","port":465,"from":"xxx@163.com","host":"smtp.163.com","is-ssl":true,"secret":"xxx","nickname":"test"},"system":{"env":"public","addr":8888,"db-type":"mysql","oss-type":"local","use-multipoint":false,"use-redis":false,"iplimit-count":15000,"iplimit-time":3600,"router-prefix":""},"captcha":{"key-long":6,"img-width":240,"img-height":80,"open-captcha":0,"open-captcha-timeout":3600},"autocode":{"transfer-restart":true,"root":"d:\\\\Work\\\\playlet\\\\server","server":"/server","server-api":"/api/v1/%s","server-plug":"/plugin/%s","server-initialize":"/initialize","server-model":"/model/%s","server-request":"/model/%s/request/","server-router":"/router/%s","server-service":"/service/%s","web":"/web/src","web-api":"/api","web-form":"/view","web-table":"/view"},"mysql":{"path":"127.0.0.1","port":"3306","config":"charset=utf8mb4\\u0026parseTime=True\\u0026loc=Local","db-name":"playlet","username":"root","password":"123456","prefix":"","singular":false,"engine":"","max-idle-conns":10,"max-open-conns":100,"log-mode":"error","log-zap":false},"mssql":{"path":"","port":"","config":"","db-name":"","username":"","password":"","prefix":"","singular":false,"engine":"","max-idle-conns":10,"max-open-conns":100,"log-mode":"","log-zap":false},"pgsql":{"path":"","port":"","config":"","db-name":"","username":"","password":"","prefix":"","singular":false,"engine":"","max-idle-conns":10,"max-open-conns":100,"log-mode":"","log-zap":false},"oracle":{"path":"","port":"","config":"","db-name":"","username":"","password":"","prefix":"","singular":false,"engine":"","max-idle-conns":10,"max-open-conns":100,"log-mode":"","log-zap":false},"db-list":[{"disable":true,"type":"","alias-name":"","path":"","port":"","config":"","db-name":"","username":"","password":"","prefix":"","singular":false,"engine":"","max-idle-conns":10,"max-open-conns":100,"log-mode":"","log-zap":false}],"local":{"path":"uploads/file","store-path":"uploads/file"},"qiniu":{"zone":"ZoneHuaDong","bucket":"","img-path":"","use-https":false,"access-key":"","secret-key":"","use-cdn-domains":false},"aliyun-oss":{"endpoint":"yourEndpoint","access-key-id":"yourAccessKeyId","access-key-secret":"yourAccessKeySecret","bucket-name":"yourBucketName","bucket-url":"yourBucketUrl","base-path":"yourBasePath"},"hua-wei-obs":{"path":"you-path","bucket":"you-bucket","endpoint":"you-endpoint","access-key":"you-access-key","secret-key":"you-secret-key"},"tencent-cos":{"bucket":"xxxxx-10005608","region":"ap-shanghai","secret-id":"your-secret-id","secret-key":"your-secret-key","base-url":"https://gin.vue.admin","path-prefix":"github.com/flipped-aurora/gin-vue-admin/server"},"aws-s3":{"bucket":"xxxxx-10005608","region":"ap-shanghai","endpoint":"","s3-force-path-style":false,"disable-ssl":false,"secret-id":"your-secret-id","secret-key":"your-secret-key","base-url":"https://gin.vue.admin","path-prefix":"github.com/flipped-aurora/gin-vue-admin/server"},"excel":{"dir":"./resource/excel/"},"timer":{"start":true,"spec":"@daily","with_seconds":false,"detail":[{"tableName":"sys_operation_records","compareField":"created_at","interval":"2160h"},{"tableName":"jwt_blacklists","compareField":"created_at","interval":"168h"}]},"cors":{"mode":"strict-whitelist","whitelist":[{"allow-origin":"example1.com","allow-methods":"POST, GET","allow-headers":"Content-Type,AccessToken,X-CSRF-Token, Authorization, Token,X-Token,X-User-Id","expose-headers":"Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type","allow-credentials":true},{"allow-origin":"example2.com","allow-methods":"GET, POST","allow-headers":"content-type","expose-headers":"Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type","allow-credentials":true}]}}},"msg":"获取成功"}', 1),
	(30, '2023-06-02 19:10:47.308', '2023-06-02 19:10:47.308', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 12133200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"menus":[{"ID":23,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:24.571+08:00","parentId":"0","path":"https://www.gin-vue-admin.com","name":"https://www.gin-vue-admin.com","hidden":true,"component":"/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"官方网站","icon":"home-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":1,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:14.947+08:00","parentId":"0","path":"dashboard","name":"dashboard","hidden":true,"component":"view/dashboard/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"仪表盘","icon":"odometer","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":3,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"admin","name":"superAdmin","hidden":false,"component":"view/superAdmin/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"超级管理员","icon":"user","closeTab":false},"authoritys":null,"children":[{"ID":4,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"authority","name":"authority","hidden":false,"component":"view/superAdmin/authority/authority.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"角色管理","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":9,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionaryDetail/:id","name":"dictionaryDetail","hidden":true,"component":"view/superAdmin/dictionary/sysDictionaryDetail.vue","sort":1,"meta":{"activeName":"dictionary","keepAlive":false,"defaultMenu":false,"title":"字典详情-${id}","icon":"list","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":5,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"menu","name":"menu","hidden":false,"component":"view/superAdmin/menu/menu.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"菜单管理","icon":"tickets","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":6,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"api","name":"api","hidden":false,"component":"view/superAdmin/api/api.vue","sort":3,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"api管理","icon":"platform","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":7,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"user","name":"user","hidden":false,"component":"view/superAdmin/user/user.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"用户管理","icon":"coordinate","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":8,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionary","name":"dictionary","hidden":false,"component":"view/superAdmin/dictionary/sysDictionary.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"字典管理","icon":"notebook","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":10,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"operation","name":"operation","hidden":false,"component":"view/superAdmin/operation/sysOperationRecord.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"操作历史","icon":"pie-chart","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":4,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"authority","name":"authority","hidden":false,"component":"view/superAdmin/authority/authority.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"角色管理","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":9,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionaryDetail/:id","name":"dictionaryDetail","hidden":true,"component":"view/superAdmin/dictionary/sysDictionaryDetail.vue","sort":1,"meta":{"activeName":"dictionary","keepAlive":false,"defaultMenu":false,"title":"字典详情-${id}","icon":"list","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":5,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"menu","name":"menu","hidden":false,"component":"view/superAdmin/menu/menu.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"菜单管理","icon":"tickets","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":6,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"api","name":"api","hidden":false,"component":"view/superAdmin/api/api.vue","sort":3,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"api管理","icon":"platform","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":7,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"user","name":"user","hidden":false,"component":"view/superAdmin/user/user.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"用户管理","icon":"coordinate","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":8,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionary","name":"dictionary","hidden":false,"component":"view/superAdmin/dictionary/sysDictionary.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"字典管理","icon":"notebook","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":10,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"operation","name":"operation","hidden":false,"component":"view/superAdmin/operation/sysOperationRecord.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"操作历史","icon":"pie-chart","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":11,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"person","name":"person","hidden":true,"component":"view/person/person.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"个人信息","icon":"message","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":16,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"systemTools","name":"systemTools","hidden":false,"component":"view/systemTools/index.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"系统工具","icon":"tools","closeTab":false},"authoritys":null,"children":[{"ID":22,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoPkg","name":"autoPkg","hidden":false,"component":"view/systemTools/autoPkg/autoPkg.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化package","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":21,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeEdit/:id","name":"autoCodeEdit","hidden":true,"component":"view/systemTools/autoCode/index.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码-${id}","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":20,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeAdmin","name":"autoCodeAdmin","hidden":false,"component":"view/systemTools/autoCodeAdmin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码管理","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":17,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCode","name":"autoCode","hidden":false,"component":"view/systemTools/autoCode/index.vue","sort":1,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"代码生成器","icon":"cpu","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":18,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"formCreate","name":"formCreate","hidden":false,"component":"view/systemTools/formCreate/index.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"表单生成器","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":19,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"system","name":"system","hidden":false,"component":"view/systemTools/system/system.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"系统配置","icon":"operation","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":30,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"chatTable","name":"chatTable","hidden":false,"component":"view/chatgpt/chatTable.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"万用表格","icon":"chat-dot-square","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":22,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoPkg","name":"autoPkg","hidden":false,"component":"view/systemTools/autoPkg/autoPkg.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化package","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":21,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeEdit/:id","name":"autoCodeEdit","hidden":true,"component":"view/systemTools/autoCode/index.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码-${id}","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":20,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeAdmin","name":"autoCodeAdmin","hidden":false,"component":"view/systemTools/autoCodeAdmin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码管理","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":17,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCode","name":"autoCode","hidden":false,"component":"view/systemTools/autoCode/index.vue","sort":1,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"代码生成器","icon":"cpu","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":18,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"formCreate","name":"formCreate","hidden":false,"component":"view/systemTools/formCreate/index.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"表单生成器","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":19,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"system","name":"system","hidden":false,"component":"view/systemTools/system/system.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"系统配置","icon":"operation","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":30,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"chatTable","name":"chatTable","hidden":false,"component":"view/chatgpt/chatTable.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"万用表格","icon":"chat-dot-square","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":25,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:39.083+08:00","parentId":"0","path":"plugin","name":"plugin","hidden":true,"component":"view/routerHolder.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件系统","icon":"cherry","closeTab":false},"authoritys":null,"children":[{"ID":26,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"https://plugin.gin-vue-admin.com/","name":"https://plugin.gin-vue-admin.com/","hidden":false,"component":"https://plugin.gin-vue-admin.com/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件市场","icon":"shop","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":27,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"installPlugin","name":"installPlugin","hidden":false,"component":"view/systemTools/installPlugin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件安装","icon":"box","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":28,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"autoPlug","name":"autoPlug","hidden":false,"component":"view/systemTools/autoPlug/autoPlug.vue","sort":2,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件模板","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":29,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"plugin-email","name":"plugin-email","hidden":false,"component":"plugin/email/view/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"邮件插件","icon":"message","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":26,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"https://plugin.gin-vue-admin.com/","name":"https://plugin.gin-vue-admin.com/","hidden":false,"component":"https://plugin.gin-vue-admin.com/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件市场","icon":"shop","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":27,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"installPlugin","name":"installPlugin","hidden":false,"component":"view/systemTools/installPlugin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件安装","icon":"box","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":28,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"autoPlug","name":"autoPlug","hidden":false,"component":"view/systemTools/autoPlug/autoPlug.vue","sort":2,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件模板","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":29,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"plugin-email","name":"plugin-email","hidden":false,"component":"plugin/email/view/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"邮件插件","icon":"message","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":12,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"example","name":"example","hidden":false,"component":"view/example/index.vue","sort":7,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"示例文件","icon":"management","closeTab":false},"authoritys":null,"children":[{"ID":13,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"upload","name":"upload","hidden":false,"component":"view/example/upload/upload.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"媒体库（上传下载）","icon":"upload","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":14,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"breakpoint","name":"breakpoint","hidden":false,"component":"view/example/breakpoint/breakpoint.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"断点续传","icon":"upload-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":15,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"customer","name":"customer","hidden":false,"component":"view/example/customer/customer.vue","sort":7,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"客户列表（资源示例）","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":13,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"upload","name":"upload","hidden":false,"component":"view/example/upload/upload.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"媒体库（上传下载）","icon":"upload","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":14,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"breakpoint","name":"breakpoint","hidden":false,"component":"view/example/breakpoint/breakpoint.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"断点续传","icon":"upload-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":15,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"customer","name":"customer","hidden":false,"component":"view/example/customer/customer.vue","sort":7,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"客户列表（资源示例）","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":24,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:48.411+08:00","parentId":"0","path":"state","name":"state","hidden":true,"component":"view/system/state.vue","sort":8,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"服务器状态","icon":"cloudy","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":2,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:56.483+08:00","parentId":"0","path":"about","name":"about","hidden":true,"component":"view/about/index.vue","sort":9,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"关于我们","icon":"info-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":31,"CreatedAt":"2023-06-02T19:03:34.071+08:00","UpdatedAt":"2023-06-02T19:03:34.071+08:00","parentId":"0","path":"plVideo","name":"plVideo","hidden":false,"component":"view/plVideo/plVideo.vue","sort":20,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"视频管理","icon":"video-camera-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":32,"CreatedAt":"2023-06-02T19:04:50.227+08:00","UpdatedAt":"2023-06-02T19:04:50.227+08:00","parentId":"0","path":"plUser","name":"plUser","hidden":false,"component":"view/plUser/plUser.vue","sort":22,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"注册用户","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":33,"CreatedAt":"2023-06-02T19:06:49.709+08:00","UpdatedAt":"2023-06-02T19:06:49.709+08:00","parentId":"0","path":"plRecharge","name":"plRecharge","hidden":false,"component":"view/plRecharge/plRecharge.vue","sort":24,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"充值几率","icon":"money","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":34,"CreatedAt":"2023-06-02T19:08:36.493+08:00","UpdatedAt":"2023-06-02T19:08:36.493+08:00","parentId":"0","path":"plCost","name":"plCost","hidden":false,"component":"view/plCost/plCost.vue","sort":26,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"消费记录","icon":"shopping-cart-full","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"authorityId":888}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(31, '2023-06-02 19:10:47.919', '2023-06-02 19:10:47.919', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 13750300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"menus":[{"ID":23,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:24.571+08:00","parentId":"0","path":"https://www.gin-vue-admin.com","name":"https://www.gin-vue-admin.com","hidden":true,"component":"/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"官方网站","icon":"home-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":1,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:14.947+08:00","parentId":"0","path":"dashboard","name":"dashboard","hidden":true,"component":"view/dashboard/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"仪表盘","icon":"odometer","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":3,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"admin","name":"superAdmin","hidden":false,"component":"view/superAdmin/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"超级管理员","icon":"user","closeTab":false},"authoritys":null,"children":[{"ID":4,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"authority","name":"authority","hidden":false,"component":"view/superAdmin/authority/authority.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"角色管理","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":9,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionaryDetail/:id","name":"dictionaryDetail","hidden":true,"component":"view/superAdmin/dictionary/sysDictionaryDetail.vue","sort":1,"meta":{"activeName":"dictionary","keepAlive":false,"defaultMenu":false,"title":"字典详情-${id}","icon":"list","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":5,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"menu","name":"menu","hidden":false,"component":"view/superAdmin/menu/menu.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"菜单管理","icon":"tickets","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":6,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"api","name":"api","hidden":false,"component":"view/superAdmin/api/api.vue","sort":3,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"api管理","icon":"platform","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":7,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"user","name":"user","hidden":false,"component":"view/superAdmin/user/user.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"用户管理","icon":"coordinate","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":8,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionary","name":"dictionary","hidden":false,"component":"view/superAdmin/dictionary/sysDictionary.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"字典管理","icon":"notebook","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":10,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"operation","name":"operation","hidden":false,"component":"view/superAdmin/operation/sysOperationRecord.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"操作历史","icon":"pie-chart","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":4,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"authority","name":"authority","hidden":false,"component":"view/superAdmin/authority/authority.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"角色管理","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":9,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionaryDetail/:id","name":"dictionaryDetail","hidden":true,"component":"view/superAdmin/dictionary/sysDictionaryDetail.vue","sort":1,"meta":{"activeName":"dictionary","keepAlive":false,"defaultMenu":false,"title":"字典详情-${id}","icon":"list","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":5,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"menu","name":"menu","hidden":false,"component":"view/superAdmin/menu/menu.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"菜单管理","icon":"tickets","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":6,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"api","name":"api","hidden":false,"component":"view/superAdmin/api/api.vue","sort":3,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"api管理","icon":"platform","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":7,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"user","name":"user","hidden":false,"component":"view/superAdmin/user/user.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"用户管理","icon":"coordinate","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":8,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionary","name":"dictionary","hidden":false,"component":"view/superAdmin/dictionary/sysDictionary.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"字典管理","icon":"notebook","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":10,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"operation","name":"operation","hidden":false,"component":"view/superAdmin/operation/sysOperationRecord.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"操作历史","icon":"pie-chart","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":11,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"person","name":"person","hidden":true,"component":"view/person/person.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"个人信息","icon":"message","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":16,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"systemTools","name":"systemTools","hidden":false,"component":"view/systemTools/index.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"系统工具","icon":"tools","closeTab":false},"authoritys":null,"children":[{"ID":22,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoPkg","name":"autoPkg","hidden":false,"component":"view/systemTools/autoPkg/autoPkg.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化package","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":21,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeEdit/:id","name":"autoCodeEdit","hidden":true,"component":"view/systemTools/autoCode/index.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码-${id}","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":20,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeAdmin","name":"autoCodeAdmin","hidden":false,"component":"view/systemTools/autoCodeAdmin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码管理","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":17,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCode","name":"autoCode","hidden":false,"component":"view/systemTools/autoCode/index.vue","sort":1,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"代码生成器","icon":"cpu","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":18,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"formCreate","name":"formCreate","hidden":false,"component":"view/systemTools/formCreate/index.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"表单生成器","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":19,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"system","name":"system","hidden":false,"component":"view/systemTools/system/system.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"系统配置","icon":"operation","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":30,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"chatTable","name":"chatTable","hidden":false,"component":"view/chatgpt/chatTable.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"万用表格","icon":"chat-dot-square","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":22,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoPkg","name":"autoPkg","hidden":false,"component":"view/systemTools/autoPkg/autoPkg.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化package","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":21,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeEdit/:id","name":"autoCodeEdit","hidden":true,"component":"view/systemTools/autoCode/index.vue","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码-${id}","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":20,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCodeAdmin","name":"autoCodeAdmin","hidden":false,"component":"view/systemTools/autoCodeAdmin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"自动化代码管理","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":17,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"autoCode","name":"autoCode","hidden":false,"component":"view/systemTools/autoCode/index.vue","sort":1,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"代码生成器","icon":"cpu","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":18,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"formCreate","name":"formCreate","hidden":false,"component":"view/systemTools/formCreate/index.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"表单生成器","icon":"magic-stick","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":19,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"system","name":"system","hidden":false,"component":"view/systemTools/system/system.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"系统配置","icon":"operation","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":30,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"16","path":"chatTable","name":"chatTable","hidden":false,"component":"view/chatgpt/chatTable.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"万用表格","icon":"chat-dot-square","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":25,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:39.083+08:00","parentId":"0","path":"plugin","name":"plugin","hidden":true,"component":"view/routerHolder.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件系统","icon":"cherry","closeTab":false},"authoritys":null,"children":[{"ID":26,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"https://plugin.gin-vue-admin.com/","name":"https://plugin.gin-vue-admin.com/","hidden":false,"component":"https://plugin.gin-vue-admin.com/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件市场","icon":"shop","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":27,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"installPlugin","name":"installPlugin","hidden":false,"component":"view/systemTools/installPlugin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件安装","icon":"box","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":28,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"autoPlug","name":"autoPlug","hidden":false,"component":"view/systemTools/autoPlug/autoPlug.vue","sort":2,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件模板","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":29,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"plugin-email","name":"plugin-email","hidden":false,"component":"plugin/email/view/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"邮件插件","icon":"message","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":26,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"https://plugin.gin-vue-admin.com/","name":"https://plugin.gin-vue-admin.com/","hidden":false,"component":"https://plugin.gin-vue-admin.com/","sort":0,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件市场","icon":"shop","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":27,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"installPlugin","name":"installPlugin","hidden":false,"component":"view/systemTools/installPlugin/index.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件安装","icon":"box","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":28,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"autoPlug","name":"autoPlug","hidden":false,"component":"view/systemTools/autoPlug/autoPlug.vue","sort":2,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"插件模板","icon":"folder","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":29,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"25","path":"plugin-email","name":"plugin-email","hidden":false,"component":"plugin/email/view/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"邮件插件","icon":"message","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":12,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"example","name":"example","hidden":false,"component":"view/example/index.vue","sort":7,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"示例文件","icon":"management","closeTab":false},"authoritys":null,"children":[{"ID":13,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"upload","name":"upload","hidden":false,"component":"view/example/upload/upload.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"媒体库（上传下载）","icon":"upload","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":14,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"breakpoint","name":"breakpoint","hidden":false,"component":"view/example/breakpoint/breakpoint.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"断点续传","icon":"upload-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":15,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"customer","name":"customer","hidden":false,"component":"view/example/customer/customer.vue","sort":7,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"客户列表（资源示例）","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":13,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"upload","name":"upload","hidden":false,"component":"view/example/upload/upload.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"媒体库（上传下载）","icon":"upload","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":14,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"breakpoint","name":"breakpoint","hidden":false,"component":"view/example/breakpoint/breakpoint.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"断点续传","icon":"upload-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":15,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"12","path":"customer","name":"customer","hidden":false,"component":"view/example/customer/customer.vue","sort":7,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"客户列表（资源示例）","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":24,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:48.411+08:00","parentId":"0","path":"state","name":"state","hidden":true,"component":"view/system/state.vue","sort":8,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"服务器状态","icon":"cloudy","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":2,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T19:09:56.483+08:00","parentId":"0","path":"about","name":"about","hidden":true,"component":"view/about/index.vue","sort":9,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"关于我们","icon":"info-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":31,"CreatedAt":"2023-06-02T19:03:34.071+08:00","UpdatedAt":"2023-06-02T19:03:34.071+08:00","parentId":"0","path":"plVideo","name":"plVideo","hidden":false,"component":"view/plVideo/plVideo.vue","sort":20,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"视频管理","icon":"video-camera-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":32,"CreatedAt":"2023-06-02T19:04:50.227+08:00","UpdatedAt":"2023-06-02T19:04:50.227+08:00","parentId":"0","path":"plUser","name":"plUser","hidden":false,"component":"view/plUser/plUser.vue","sort":22,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"注册用户","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":33,"CreatedAt":"2023-06-02T19:06:49.709+08:00","UpdatedAt":"2023-06-02T19:06:49.709+08:00","parentId":"0","path":"plRecharge","name":"plRecharge","hidden":false,"component":"view/plRecharge/plRecharge.vue","sort":24,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"充值几率","icon":"money","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":34,"CreatedAt":"2023-06-02T19:08:36.493+08:00","UpdatedAt":"2023-06-02T19:08:36.493+08:00","parentId":"0","path":"plCost","name":"plCost","hidden":false,"component":"view/plCost/plCost.vue","sort":26,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"消费记录","icon":"shopping-cart-full","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"authorityId":888}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(32, '2023-06-02 19:10:56.904', '2023-06-02 19:10:56.904', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 13741300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"authorityId":888,"casbinInfos":[{"path":"/jwt/jsonInBlacklist","method":"POST"},{"path":"/user/deleteUser","method":"DELETE"},{"path":"/user/admin_register","method":"POST"},{"path":"/user/getUserList","method":"POST"},{"path":"/user/setUserInfo","method":"PUT"},{"path":"/user/setSelfInfo","method":"PUT"},{"path":"/user/getUserInfo","method":"GET"},{"path":"/user/setUserAuthorities","method":"POST"},{"path":"/user/changePassword","method":"POST"},{"path":"/user/setUserAuthority","method":"POST"},{"path":"/user/resetPassword","method":"POST"},{"path":"/api/createApi","method":"POST"},{"path":"/api/deleteApi","method":"POST"},{"path":"/api/updateApi","method":"POST"},{"path":"/api/getApiList","method":"POST"},{"path":"/api/getAllApis","method":"POST"},{"path":"/api/getApiById","method":"POST"},{"path":"/api/deleteApisByIds","method":"DELETE"},{"path":"/authority/copyAuthority","method":"POST"},{"path":"/authority/createAuthority","method":"POST"},{"path":"/authority/deleteAuthority","method":"POST"},{"path":"/authority/updateAuthority","method":"PUT"},{"path":"/authority/getAuthorityList","method":"POST"},{"path":"/authority/setDataAuthority","method":"POST"},{"path":"/casbin/updateCasbin","method":"POST"},{"path":"/casbin/getPolicyPathByAuthorityId","method":"POST"},{"path":"/menu/addBaseMenu","method":"POST"},{"path":"/menu/getMenu","method":"POST"},{"path":"/menu/deleteBaseMenu","method":"POST"},{"path":"/menu/updateBaseMenu","method":"POST"},{"path":"/menu/getBaseMenuById","method":"POST"},{"path":"/menu/getMenuList","method":"POST"},{"path":"/menu/getBaseMenuTree","method":"POST"},{"path":"/menu/getMenuAuthority","method":"POST"},{"path":"/menu/addMenuAuthority","method":"POST"},{"path":"/fileUploadAndDownload/findFile","method":"GET"},{"path":"/fileUploadAndDownload/breakpointContinue","method":"POST"},{"path":"/fileUploadAndDownload/breakpointContinueFinish","method":"POST"},{"path":"/fileUploadAndDownload/removeChunk","method":"POST"},{"path":"/fileUploadAndDownload/upload","method":"POST"},{"path":"/fileUploadAndDownload/deleteFile","method":"POST"},{"path":"/fileUploadAndDownload/editFileName","method":"POST"},{"path":"/fileUploadAndDownload/getFileList","method":"POST"},{"path":"/system/getServerInfo","method":"POST"},{"path":"/system/getSystemConfig","method":"POST"},{"path":"/system/setSystemConfig","method":"POST"},{"path":"/customer/customer","method":"PUT"},{"path":"/customer/customer","method":"POST"},{"path":"/customer/customer","method":"DELETE"},{"path":"/customer/customer","method":"GET"},{"path":"/customer/customerList","method":"GET"},{"path":"/autoCode/getDB","method":"GET"},{"path":"/autoCode/getTables","method":"GET"},{"path":"/autoCode/createTemp","method":"POST"},{"path":"/autoCode/preview","method":"POST"},{"path":"/autoCode/getColumn","method":"GET"},{"path":"/autoCode/createPlug","method":"POST"},{"path":"/autoCode/installPlugin","method":"POST"},{"path":"/autoCode/createPackage","method":"POST"},{"path":"/autoCode/getPackage","method":"POST"},{"path":"/autoCode/delPackage","method":"POST"},{"path":"/autoCode/getMeta","method":"POST"},{"path":"/autoCode/rollback","method":"POST"},{"path":"/autoCode/getSysHistory","method":"POST"},{"path":"/autoCode/delSysHistory","method":"POST"},{"path":"/sysDictionaryDetail/updateSysDictionaryDetail","method":"PUT"},{"path":"/sysDictionaryDetail/createSysDictionaryDetail","method":"POST"},{"path":"/sysDictionaryDetail/deleteSysDictionaryDetail","method":"DELETE"},{"path":"/sysDictionaryDetail/findSysDictionaryDetail","method":"GET"},{"path":"/sysDictionaryDetail/getSysDictionaryDetailList","method":"GET"},{"path":"/sysDictionary/createSysDictionary","method":"POST"},{"path":"/sysDictionary/deleteSysDictionary","method":"DELETE"},{"path":"/sysDictionary/updateSysDictionary","method":"PUT"},{"path":"/sysDictionary/findSysDictionary","method":"GET"},{"path":"/sysDictionary/getSysDictionaryList","method":"GET"},{"path":"/sysOperationRecord/createSysOperationRecord","method":"POST"},{"path":"/sysOperationRecord/findSysOperationRecord","method":"GET"},{"path":"/sysOperationRecord/getSysOperationRecordList","method":"GET"},{"path":"/sysOperationRecord/deleteSysOperationRecord","method":"DELETE"},{"path":"/sysOperationRecord/deleteSysOperationRecordByIds","method":"DELETE"},{"path":"/simpleUploader/upload","method":"POST"},{"path":"/simpleUploader/checkFileMd5","method":"GET"},{"path":"/simpleUploader/mergeFileMd5","method":"GET"},{"path":"/email/emailTest","method":"POST"},{"path":"/authorityBtn/setAuthorityBtn","method":"POST"},{"path":"/authorityBtn/getAuthorityBtn","method":"POST"},{"path":"/authorityBtn/canRemoveAuthorityBtn","method":"POST"},{"path":"/chatGpt/getTable","method":"POST"},{"path":"/chatGpt/createSK","method":"POST"},{"path":"/chatGpt/getSK","method":"GET"},{"path":"/chatGpt/deleteSK","method":"DELETE"},{"path":"/plVideo/createPlVideo","method":"POST"},{"path":"/plVideo/deletePlVideo","method":"DELETE"},{"path":"/plVideo/deletePlVideoByIds","method":"DELETE"},{"path":"/plVideo/updatePlVideo","method":"PUT"},{"path":"/plVideo/findPlVideo","method":"GET"},{"path":"/plVideo/getPlVideoList","method":"GET"},{"path":"/plUser/createPlUser","method":"POST"},{"path":"/plUser/deletePlUser","method":"DELETE"},{"path":"/plUser/deletePlUserByIds","method":"DELETE"},{"path":"/plUser/updatePlUser","method":"PUT"},{"path":"/plUser/findPlUser","method":"GET"},{"path":"/plUser/getPlUserList","method":"GET"},{"path":"/plRecharge/createPlRecharge","method":"POST"},{"path":"/plRecharge/deletePlRecharge","method":"DELETE"},{"path":"/plRecharge/deletePlRechargeByIds","method":"DELETE"},{"path":"/plRecharge/updatePlRecharge","method":"PUT"},{"path":"/plRecharge/findPlRecharge","method":"GET"},{"path":"/plRecharge/getPlRechargeList","method":"GET"},{"path":"/plCost/createPlCost","method":"POST"},{"path":"/plCost/deletePlCost","method":"DELETE"},{"path":"/plCost/deletePlCostByIds","method":"DELETE"},{"path":"/plCost/updatePlCost","method":"PUT"},{"path":"/plCost/findPlCost","method":"GET"},{"path":"/plCost/getPlCostList","method":"GET"}]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(33, '2023-06-02 19:10:57.707', '2023-06-02 19:10:57.707', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 15735600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"authorityId":888,"casbinInfos":[{"path":"/jwt/jsonInBlacklist","method":"POST"},{"path":"/user/deleteUser","method":"DELETE"},{"path":"/user/admin_register","method":"POST"},{"path":"/user/getUserList","method":"POST"},{"path":"/user/setUserInfo","method":"PUT"},{"path":"/user/setSelfInfo","method":"PUT"},{"path":"/user/getUserInfo","method":"GET"},{"path":"/user/setUserAuthorities","method":"POST"},{"path":"/user/changePassword","method":"POST"},{"path":"/user/setUserAuthority","method":"POST"},{"path":"/user/resetPassword","method":"POST"},{"path":"/api/createApi","method":"POST"},{"path":"/api/deleteApi","method":"POST"},{"path":"/api/updateApi","method":"POST"},{"path":"/api/getApiList","method":"POST"},{"path":"/api/getAllApis","method":"POST"},{"path":"/api/getApiById","method":"POST"},{"path":"/api/deleteApisByIds","method":"DELETE"},{"path":"/authority/copyAuthority","method":"POST"},{"path":"/authority/createAuthority","method":"POST"},{"path":"/authority/deleteAuthority","method":"POST"},{"path":"/authority/updateAuthority","method":"PUT"},{"path":"/authority/getAuthorityList","method":"POST"},{"path":"/authority/setDataAuthority","method":"POST"},{"path":"/casbin/updateCasbin","method":"POST"},{"path":"/casbin/getPolicyPathByAuthorityId","method":"POST"},{"path":"/menu/addBaseMenu","method":"POST"},{"path":"/menu/getMenu","method":"POST"},{"path":"/menu/deleteBaseMenu","method":"POST"},{"path":"/menu/updateBaseMenu","method":"POST"},{"path":"/menu/getBaseMenuById","method":"POST"},{"path":"/menu/getMenuList","method":"POST"},{"path":"/menu/getBaseMenuTree","method":"POST"},{"path":"/menu/getMenuAuthority","method":"POST"},{"path":"/menu/addMenuAuthority","method":"POST"},{"path":"/fileUploadAndDownload/findFile","method":"GET"},{"path":"/fileUploadAndDownload/breakpointContinue","method":"POST"},{"path":"/fileUploadAndDownload/breakpointContinueFinish","method":"POST"},{"path":"/fileUploadAndDownload/removeChunk","method":"POST"},{"path":"/fileUploadAndDownload/upload","method":"POST"},{"path":"/fileUploadAndDownload/deleteFile","method":"POST"},{"path":"/fileUploadAndDownload/editFileName","method":"POST"},{"path":"/fileUploadAndDownload/getFileList","method":"POST"},{"path":"/system/getServerInfo","method":"POST"},{"path":"/system/getSystemConfig","method":"POST"},{"path":"/system/setSystemConfig","method":"POST"},{"path":"/customer/customer","method":"PUT"},{"path":"/customer/customer","method":"POST"},{"path":"/customer/customer","method":"DELETE"},{"path":"/customer/customer","method":"GET"},{"path":"/customer/customerList","method":"GET"},{"path":"/autoCode/getDB","method":"GET"},{"path":"/autoCode/getTables","method":"GET"},{"path":"/autoCode/createTemp","method":"POST"},{"path":"/autoCode/preview","method":"POST"},{"path":"/autoCode/getColumn","method":"GET"},{"path":"/autoCode/createPlug","method":"POST"},{"path":"/autoCode/installPlugin","method":"POST"},{"path":"/autoCode/createPackage","method":"POST"},{"path":"/autoCode/getPackage","method":"POST"},{"path":"/autoCode/delPackage","method":"POST"},{"path":"/autoCode/getMeta","method":"POST"},{"path":"/autoCode/rollback","method":"POST"},{"path":"/autoCode/getSysHistory","method":"POST"},{"path":"/autoCode/delSysHistory","method":"POST"},{"path":"/sysDictionaryDetail/updateSysDictionaryDetail","method":"PUT"},{"path":"/sysDictionaryDetail/createSysDictionaryDetail","method":"POST"},{"path":"/sysDictionaryDetail/deleteSysDictionaryDetail","method":"DELETE"},{"path":"/sysDictionaryDetail/findSysDictionaryDetail","method":"GET"},{"path":"/sysDictionaryDetail/getSysDictionaryDetailList","method":"GET"},{"path":"/sysDictionary/createSysDictionary","method":"POST"},{"path":"/sysDictionary/deleteSysDictionary","method":"DELETE"},{"path":"/sysDictionary/updateSysDictionary","method":"PUT"},{"path":"/sysDictionary/findSysDictionary","method":"GET"},{"path":"/sysDictionary/getSysDictionaryList","method":"GET"},{"path":"/sysOperationRecord/createSysOperationRecord","method":"POST"},{"path":"/sysOperationRecord/findSysOperationRecord","method":"GET"},{"path":"/sysOperationRecord/getSysOperationRecordList","method":"GET"},{"path":"/sysOperationRecord/deleteSysOperationRecord","method":"DELETE"},{"path":"/sysOperationRecord/deleteSysOperationRecordByIds","method":"DELETE"},{"path":"/simpleUploader/upload","method":"POST"},{"path":"/simpleUploader/checkFileMd5","method":"GET"},{"path":"/simpleUploader/mergeFileMd5","method":"GET"},{"path":"/email/emailTest","method":"POST"},{"path":"/authorityBtn/setAuthorityBtn","method":"POST"},{"path":"/authorityBtn/getAuthorityBtn","method":"POST"},{"path":"/authorityBtn/canRemoveAuthorityBtn","method":"POST"},{"path":"/chatGpt/getTable","method":"POST"},{"path":"/chatGpt/createSK","method":"POST"},{"path":"/chatGpt/getSK","method":"GET"},{"path":"/chatGpt/deleteSK","method":"DELETE"},{"path":"/plVideo/createPlVideo","method":"POST"},{"path":"/plVideo/deletePlVideo","method":"DELETE"},{"path":"/plVideo/deletePlVideoByIds","method":"DELETE"},{"path":"/plVideo/updatePlVideo","method":"PUT"},{"path":"/plVideo/findPlVideo","method":"GET"},{"path":"/plVideo/getPlVideoList","method":"GET"},{"path":"/plUser/createPlUser","method":"POST"},{"path":"/plUser/deletePlUser","method":"DELETE"},{"path":"/plUser/deletePlUserByIds","method":"DELETE"},{"path":"/plUser/updatePlUser","method":"PUT"},{"path":"/plUser/findPlUser","method":"GET"},{"path":"/plUser/getPlUserList","method":"GET"},{"path":"/plRecharge/createPlRecharge","method":"POST"},{"path":"/plRecharge/deletePlRecharge","method":"DELETE"},{"path":"/plRecharge/deletePlRechargeByIds","method":"DELETE"},{"path":"/plRecharge/updatePlRecharge","method":"PUT"},{"path":"/plRecharge/findPlRecharge","method":"GET"},{"path":"/plRecharge/getPlRechargeList","method":"GET"},{"path":"/plCost/createPlCost","method":"POST"},{"path":"/plCost/deletePlCost","method":"DELETE"},{"path":"/plCost/deletePlCostByIds","method":"DELETE"},{"path":"/plCost/updatePlCost","method":"PUT"},{"path":"/plCost/findPlCost","method":"GET"},{"path":"/plCost/getPlCostList","method":"GET"}]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(34, '2023-06-02 19:11:11.359', '2023-06-02 19:11:11.359', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority', 200, 12366600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"menus":[{"ID":3,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"0","path":"admin","name":"superAdmin","hidden":false,"component":"view/superAdmin/index.vue","sort":3,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"超级管理员","icon":"user","closeTab":false},"authoritys":null,"children":[{"ID":4,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"authority","name":"authority","hidden":false,"component":"view/superAdmin/authority/authority.vue","sort":1,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"角色管理","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":9,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionaryDetail/:id","name":"dictionaryDetail","hidden":true,"component":"view/superAdmin/dictionary/sysDictionaryDetail.vue","sort":1,"meta":{"activeName":"dictionary","keepAlive":false,"defaultMenu":false,"title":"字典详情-${id}","icon":"list","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":5,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"menu","name":"menu","hidden":false,"component":"view/superAdmin/menu/menu.vue","sort":2,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"菜单管理","icon":"tickets","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":6,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"api","name":"api","hidden":false,"component":"view/superAdmin/api/api.vue","sort":3,"meta":{"activeName":"","keepAlive":true,"defaultMenu":false,"title":"api管理","icon":"platform","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":7,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"user","name":"user","hidden":false,"component":"view/superAdmin/user/user.vue","sort":4,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"用户管理","icon":"coordinate","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":8,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionary","name":"dictionary","hidden":false,"component":"view/superAdmin/dictionary/sysDictionary.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"字典管理","icon":"notebook","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":10,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"operation","name":"operation","hidden":false,"component":"view/superAdmin/operation/sysOperationRecord.vue","sort":6,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"操作历史","icon":"pie-chart","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"parameters":[],"menuBtn":[]},{"ID":8,"CreatedAt":"2023-06-02T17:02:30.021+08:00","UpdatedAt":"2023-06-02T17:02:30.021+08:00","parentId":"3","path":"dictionary","name":"dictionary","hidden":false,"component":"view/superAdmin/dictionary/sysDictionary.vue","sort":5,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"字典管理","icon":"notebook","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":31,"CreatedAt":"2023-06-02T19:03:34.071+08:00","UpdatedAt":"2023-06-02T19:03:34.071+08:00","parentId":"0","path":"plVideo","name":"plVideo","hidden":false,"component":"view/plVideo/plVideo.vue","sort":20,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"视频管理","icon":"video-camera-filled","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":32,"CreatedAt":"2023-06-02T19:04:50.227+08:00","UpdatedAt":"2023-06-02T19:04:50.227+08:00","parentId":"0","path":"plUser","name":"plUser","hidden":false,"component":"view/plUser/plUser.vue","sort":22,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"注册用户","icon":"avatar","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":33,"CreatedAt":"2023-06-02T19:06:49.709+08:00","UpdatedAt":"2023-06-02T19:06:49.709+08:00","parentId":"0","path":"plRecharge","name":"plRecharge","hidden":false,"component":"view/plRecharge/plRecharge.vue","sort":24,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"充值几率","icon":"money","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]},{"ID":34,"CreatedAt":"2023-06-02T19:08:36.493+08:00","UpdatedAt":"2023-06-02T19:08:36.493+08:00","parentId":"0","path":"plCost","name":"plCost","hidden":false,"component":"view/plCost/plCost.vue","sort":26,"meta":{"activeName":"","keepAlive":false,"defaultMenu":false,"title":"消费记录","icon":"shopping-cart-full","closeTab":false},"authoritys":null,"children":null,"parameters":[],"menuBtn":[]}],"authorityId":9528}', '{"code":0,"data":{},"msg":"添加成功"}', 1),
	(35, '2023-06-02 19:11:19.380', '2023-06-02 19:11:19.380', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 10946600, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"authorityId":9528,"casbinInfos":[{"path":"/jwt/jsonInBlacklist","method":"POST"},{"path":"/user/admin_register","method":"POST"},{"path":"/user/getUserList","method":"POST"},{"path":"/user/getUserInfo","method":"GET"},{"path":"/user/changePassword","method":"POST"},{"path":"/user/setUserAuthority","method":"POST"},{"path":"/api/createApi","method":"POST"},{"path":"/api/deleteApi","method":"POST"},{"path":"/api/updateApi","method":"POST"},{"path":"/api/getApiList","method":"POST"},{"path":"/api/getAllApis","method":"POST"},{"path":"/api/getApiById","method":"POST"},{"path":"/authority/createAuthority","method":"POST"},{"path":"/authority/deleteAuthority","method":"POST"},{"path":"/authority/getAuthorityList","method":"POST"},{"path":"/authority/setDataAuthority","method":"POST"},{"path":"/casbin/updateCasbin","method":"POST"},{"path":"/casbin/getPolicyPathByAuthorityId","method":"POST"},{"path":"/menu/addBaseMenu","method":"POST"},{"path":"/menu/getMenu","method":"POST"},{"path":"/menu/deleteBaseMenu","method":"POST"},{"path":"/menu/updateBaseMenu","method":"POST"},{"path":"/menu/getBaseMenuById","method":"POST"},{"path":"/menu/getMenuList","method":"POST"},{"path":"/menu/getBaseMenuTree","method":"POST"},{"path":"/menu/getMenuAuthority","method":"POST"},{"path":"/menu/addMenuAuthority","method":"POST"},{"path":"/fileUploadAndDownload/upload","method":"POST"},{"path":"/fileUploadAndDownload/deleteFile","method":"POST"},{"path":"/fileUploadAndDownload/editFileName","method":"POST"},{"path":"/fileUploadAndDownload/getFileList","method":"POST"},{"path":"/system/getSystemConfig","method":"POST"},{"path":"/system/setSystemConfig","method":"POST"},{"path":"/customer/customer","method":"PUT"},{"path":"/customer/customer","method":"POST"},{"path":"/customer/customer","method":"DELETE"},{"path":"/customer/customer","method":"GET"},{"path":"/customer/customerList","method":"GET"},{"path":"/autoCode/createTemp","method":"POST"},{"path":"/plVideo/createPlVideo","method":"POST"},{"path":"/plVideo/deletePlVideo","method":"DELETE"},{"path":"/plVideo/deletePlVideoByIds","method":"DELETE"},{"path":"/plVideo/updatePlVideo","method":"PUT"},{"path":"/plVideo/findPlVideo","method":"GET"},{"path":"/plVideo/getPlVideoList","method":"GET"},{"path":"/plUser/createPlUser","method":"POST"},{"path":"/plUser/deletePlUser","method":"DELETE"},{"path":"/plUser/deletePlUserByIds","method":"DELETE"},{"path":"/plUser/updatePlUser","method":"PUT"},{"path":"/plUser/findPlUser","method":"GET"},{"path":"/plUser/getPlUserList","method":"GET"},{"path":"/plRecharge/createPlRecharge","method":"POST"},{"path":"/plRecharge/deletePlRecharge","method":"DELETE"},{"path":"/plRecharge/deletePlRechargeByIds","method":"DELETE"},{"path":"/plRecharge/updatePlRecharge","method":"PUT"},{"path":"/plRecharge/findPlRecharge","method":"GET"},{"path":"/plRecharge/getPlRechargeList","method":"GET"},{"path":"/plCost/createPlCost","method":"POST"},{"path":"/plCost/deletePlCost","method":"DELETE"},{"path":"/plCost/deletePlCostByIds","method":"DELETE"},{"path":"/plCost/updatePlCost","method":"PUT"},{"path":"/plCost/findPlCost","method":"GET"},{"path":"/plCost/getPlCostList","method":"GET"}]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(36, '2023-06-02 19:11:20.123', '2023-06-02 19:11:20.123', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200, 10346500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', '', '{"authorityId":9528,"casbinInfos":[{"path":"/jwt/jsonInBlacklist","method":"POST"},{"path":"/user/admin_register","method":"POST"},{"path":"/user/getUserList","method":"POST"},{"path":"/user/getUserInfo","method":"GET"},{"path":"/user/changePassword","method":"POST"},{"path":"/user/setUserAuthority","method":"POST"},{"path":"/api/createApi","method":"POST"},{"path":"/api/deleteApi","method":"POST"},{"path":"/api/updateApi","method":"POST"},{"path":"/api/getApiList","method":"POST"},{"path":"/api/getAllApis","method":"POST"},{"path":"/api/getApiById","method":"POST"},{"path":"/authority/createAuthority","method":"POST"},{"path":"/authority/deleteAuthority","method":"POST"},{"path":"/authority/getAuthorityList","method":"POST"},{"path":"/authority/setDataAuthority","method":"POST"},{"path":"/casbin/updateCasbin","method":"POST"},{"path":"/casbin/getPolicyPathByAuthorityId","method":"POST"},{"path":"/menu/addBaseMenu","method":"POST"},{"path":"/menu/getMenu","method":"POST"},{"path":"/menu/deleteBaseMenu","method":"POST"},{"path":"/menu/updateBaseMenu","method":"POST"},{"path":"/menu/getBaseMenuById","method":"POST"},{"path":"/menu/getMenuList","method":"POST"},{"path":"/menu/getBaseMenuTree","method":"POST"},{"path":"/menu/getMenuAuthority","method":"POST"},{"path":"/menu/addMenuAuthority","method":"POST"},{"path":"/fileUploadAndDownload/upload","method":"POST"},{"path":"/fileUploadAndDownload/deleteFile","method":"POST"},{"path":"/fileUploadAndDownload/editFileName","method":"POST"},{"path":"/fileUploadAndDownload/getFileList","method":"POST"},{"path":"/system/getSystemConfig","method":"POST"},{"path":"/system/setSystemConfig","method":"POST"},{"path":"/customer/customer","method":"PUT"},{"path":"/customer/customer","method":"POST"},{"path":"/customer/customer","method":"DELETE"},{"path":"/customer/customer","method":"GET"},{"path":"/customer/customerList","method":"GET"},{"path":"/autoCode/createTemp","method":"POST"},{"path":"/plVideo/createPlVideo","method":"POST"},{"path":"/plVideo/deletePlVideo","method":"DELETE"},{"path":"/plVideo/deletePlVideoByIds","method":"DELETE"},{"path":"/plVideo/updatePlVideo","method":"PUT"},{"path":"/plVideo/findPlVideo","method":"GET"},{"path":"/plVideo/getPlVideoList","method":"GET"},{"path":"/plUser/createPlUser","method":"POST"},{"path":"/plUser/deletePlUser","method":"DELETE"},{"path":"/plUser/deletePlUserByIds","method":"DELETE"},{"path":"/plUser/updatePlUser","method":"PUT"},{"path":"/plUser/findPlUser","method":"GET"},{"path":"/plUser/getPlUserList","method":"GET"},{"path":"/plRecharge/createPlRecharge","method":"POST"},{"path":"/plRecharge/deletePlRecharge","method":"DELETE"},{"path":"/plRecharge/deletePlRechargeByIds","method":"DELETE"},{"path":"/plRecharge/updatePlRecharge","method":"PUT"},{"path":"/plRecharge/findPlRecharge","method":"GET"},{"path":"/plRecharge/getPlRechargeList","method":"GET"},{"path":"/plCost/createPlCost","method":"POST"},{"path":"/plCost/deletePlCost","method":"DELETE"},{"path":"/plCost/deletePlCostByIds","method":"DELETE"},{"path":"/plCost/updatePlCost","method":"PUT"},{"path":"/plCost/findPlCost","method":"GET"},{"path":"/plCost/getPlCostList","method":"GET"}]}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(37, '2023-06-05 17:43:03.216', '2023-06-05 17:43:03.216', NULL, '127.0.0.1', 'POST', '/plVideo/createPlVideo', 200, 11924500, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"videoName":"少帅，夫人说她不配","videoType":1,"typeName":"逆袭","videoDesc":"","likeCount":122,"finish":1,"count":17,"imgUrl":"cover.png","videoUrl":"http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei","createTime":"2023-06-03T16:00:00.000Z","freeCount":5}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(38, '2023-06-05 17:44:31.669', '2023-06-05 17:44:31.669', NULL, '127.0.0.1', 'POST', '/plVideo/createPlVideo', 200, 6831800, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"videoName":"神豪保安","videoType":3,"typeName":"神豪","videoDesc":"","likeCount":2123,"finish":0,"count":5,"imgUrl":"cover.png","videoUrl":"http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan","createTime":"2023-06-05T09:43:03.224Z","freeCount":3}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(39, '2023-06-05 17:47:15.139', '2023-06-05 17:47:15.139', NULL, '127.0.0.1', 'POST', '/plVideo/createPlVideo', 200, 6064200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"videoName":"神医狂婿","videoType":5,"typeName":"神医","videoDesc":"","likeCount":513,"finish":1,"count":20,"imgUrl":"cover.png","videoUrl":" http://rvrwh3ioy.sabkt.gdipper.com/shenyikuangxu","createTime":"2023-06-05T09:44:31.674Z","freeCount":7}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(40, '2023-06-05 17:49:05.523', '2023-06-05 17:49:05.523', NULL, '127.0.0.1', 'POST', '/plVideo/createPlVideo', 200, 12824300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"videoName":"蚀骨情深","videoType":9,"typeName":"暧昧","videoDesc":"","likeCount":55,"finish":1,"count":10,"imgUrl":"cover.png","videoUrl":"http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen","createTime":"2023-06-05T09:47:15.146Z","freeCount":5}', '{"code":0,"data":{},"msg":"创建成功"}', 1),
	(41, '2023-06-05 17:54:05.732', '2023-06-05 17:54:05.732', NULL, '127.0.0.1', 'PUT', '/plVideo/updatePlVideo', 200, 6039000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"ID":1,"CreatedAt":"2023-06-05T17:43:03.204+08:00","UpdatedAt":"2023-06-05T17:43:03.204+08:00","videoName":"少帅，夫人说她不配","videoType":1,"typeName":"逆袭","videoDesc":"世间灵骨，共分四品。 一品，天灵骨。二品，金灵骨。三品，玄灵骨。四品，白灵骨。 余者，皆为凡骨，无缘修行。 一介凡骨许太平，誓要向这修行界证明，凡骨亦能斩妖，凡骨亦能除魔，凡骨亦能登仙！","likeCount":122,"finish":1,"hot":0,"count":17,"imgUrl":"cover.png","videoUrl":"http://rvrwh3ioy.sabkt.gdipper.com/shaotabupei","createTime":"2023-06-04T00:00:00+08:00","freeCount":5,"CreatedBy":1,"UpdatedBy":0,"DeletedBy":0}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(42, '2023-06-05 17:54:38.666', '2023-06-05 17:54:38.666', NULL, '127.0.0.1', 'PUT', '/plVideo/updatePlVideo', 200, 11848000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"ID":2,"CreatedAt":"2023-06-05T17:44:31.661+08:00","UpdatedAt":"2023-06-05T17:44:31.661+08:00","videoName":"神豪保安","videoType":3,"typeName":"神豪","videoDesc":"【无敌文，每一个字都爽，剧情节奏爆快，不拖拉，杀伐果断】毕业酒席上，父母兄弟惨死，遭遇追杀，侥幸逃生，昆仑山上习武五年，我强势归来！ 　　“你是顶尖阔少，我惹不起你？我师父一巴掌可以拍死！” 　　“你是中医之王？我师父乃鬼门传人，十三针定天下人生死！” 　　“你是宗师武者，一人之下，万人之上？我师父坐镇昆仑，天下宗师来拜！” 　　“你是江南王，权倾天下？我师父曾为帝师，是你上司的上司！” 　　“你亿万家产，左右世界金","likeCount":2123,"finish":0,"hot":0,"count":5,"imgUrl":"cover.png","videoUrl":"http://rvrwh3ioy.sabkt.gdipper.com/shenhaobaoan","createTime":"2023-06-05T17:43:03.224+08:00","freeCount":3,"CreatedBy":1,"UpdatedBy":0,"DeletedBy":0}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(43, '2023-06-05 17:54:59.483', '2023-06-05 17:54:59.483', NULL, '127.0.0.1', 'PUT', '/plVideo/updatePlVideo', 200, 11859200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"ID":3,"CreatedAt":"2023-06-05T17:47:15.133+08:00","UpdatedAt":"2023-06-05T17:47:15.133+08:00","videoName":"神医狂婿","videoType":5,"typeName":"神医","videoDesc":"【非爽文+平淡日常+轻松诙谐+无女主+无刀子+苟王】入坑谨慎。 一本以长生者视角跨越几个修仙大时代的长生文，从平凡小山村走出小界域，跨入修仙大世，经历修仙界蓬勃发展时代、黄金鼎盛时代、规则崩灭时代，黑暗大动乱时代，万灵皆寂时代…… 陈浔穿越到浩瀚无垠的修仙界，觉醒长生系统，竟然还送了一头长生灵兽为伴。 我陈浔对打打杀杀没有兴趣，也不想招惹任何人，只想带着老牛看遍世间繁华。","likeCount":513,"finish":1,"hot":0,"count":20,"imgUrl":"cover.png","videoUrl":" http://rvrwh3ioy.sabkt.gdipper.com/shenyikuangxu","createTime":"2023-06-05T17:44:31.674+08:00","freeCount":7,"CreatedBy":1,"UpdatedBy":0,"DeletedBy":0}', '{"code":0,"data":{},"msg":"更新成功"}', 1),
	(44, '2023-06-05 17:55:15.461', '2023-06-05 17:55:15.461', NULL, '127.0.0.1', 'PUT', '/plVideo/updatePlVideo', 200, 5908200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '', '{"ID":4,"CreatedAt":"2023-06-05T17:49:05.51+08:00","UpdatedAt":"2023-06-05T17:49:05.51+08:00","videoName":"蚀骨情深","videoType":9,"typeName":"暧昧","videoDesc":"林舒发现自己怀孕的那天，还没来得及告诉唐亦琛，就收到了离婚协议书。 她强忍心脏的疼痛，潇洒转身离开。 3年的时间终究没能改变结局，没能改变他的心是自己的错。 后来，她带着那个没来得及说出口的秘密 ，选择放手。 林舒离开后，唐亦琛每天面对空荡荡的房子，借酒消愁。 四年后，一对粉雕玉琢的双胞胎兄妹出现在江城机场~~~ 引起周围无数人围观。 后来 林舒走到哪里都能看见唐总的身影。 “唐总，我们已经离婚了。” “再结就好了。”唐总","likeCount":55,"finish":1,"hot":0,"count":10,"imgUrl":"cover.png","videoUrl":"http://rvrwh3ioy.sabkt.gdipper.com/shiguqingshen","createTime":"2023-06-05T17:47:15.146+08:00","freeCount":5,"CreatedBy":1,"UpdatedBy":0,"DeletedBy":0}', '{"code":0,"data":{},"msg":"更新成功"}', 1);

-- 导出  表 playlet.sys_users 结构
CREATE TABLE IF NOT EXISTS `sys_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '系统用户' COMMENT '用户昵称',
  `side_mode` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dark' COMMENT '用户侧边主题',
  `header_img` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `base_color` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '#fff' COMMENT '基础颜色',
  `active_color` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '#1890ff' COMMENT '活跃颜色',
  `authority_id` bigint unsigned DEFAULT '888' COMMENT '用户角色ID',
  `phone` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `enable` bigint DEFAULT '1' COMMENT '用户是否被冻结 1正常 2冻结',
  PRIMARY KEY (`id`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`),
  KEY `idx_sys_users_uuid` (`uuid`),
  KEY `idx_sys_users_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_users 的数据：~2 rows (大约)
DELETE FROM `sys_users`;
INSERT INTO `sys_users` (`id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `active_color`, `authority_id`, `phone`, `email`, `enable`) VALUES
	(1, '2023-06-02 17:02:30.208', '2023-06-02 17:02:30.227', NULL, '02de2122-81e8-4e41-846a-c103cc4629ee', 'admin', '$2a$10$Lkb6NajLOWIKVzWLzOUl7.QHjVgMbmbY92HoWvjIw6ZRqMGoCyz8m', 'Mr.奇淼', 'dark', 'https://qmplusimg.henrongyi.top/gva_header.jpg', '#fff', '#1890ff', 888, '17611111111', '333333333@qq.com', 1),
	(2, '2023-06-02 17:02:30.208', '2023-06-02 17:02:30.244', NULL, '6ff24dad-81e4-45f7-8f27-53bf228558aa', 'a303176530', '$2a$10$YUGxxm4JWG9JVB57P8pQP.c2bxHO8ky1CWou84Cg2ga8KpjlzdMj2', '用户1', 'dark', 'https:///qmplusimg.henrongyi.top/1572075907logo.png', '#fff', '#1890ff', 9528, '17611111111', '333333333@qq.com', 1);

-- 导出  表 playlet.sys_user_authority 结构
CREATE TABLE IF NOT EXISTS `sys_user_authority` (
  `sys_user_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  playlet.sys_user_authority 的数据：~4 rows (大约)
DELETE FROM `sys_user_authority`;
INSERT INTO `sys_user_authority` (`sys_user_id`, `sys_authority_authority_id`) VALUES
	(1, 888),
	(1, 8881),
	(1, 9528),
	(2, 888);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
