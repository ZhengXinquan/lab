-- phpMyAdmin SQL Dump
-- version 4.0.6-rc1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2022-10-17 23:53:35
-- 服务器版本: 5.5.19
-- PHP 版本: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `oss`
--

-- --------------------------------------------------------

--
-- 表的结构 `bucket`
--

CREATE TABLE IF NOT EXISTS `bucket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ct` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `n` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `n` (`n`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `bucket`
--

INSERT INTO `bucket` (`id`, `ct`, `n`) VALUES
(1, '2022-10-13 16:15:06', 'please-enter-english-bucket-name-as-your-group-name'),
(2, '2022-10-15 10:10:01', '1111daping');

-- --------------------------------------------------------

--
-- 表的结构 `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n` varchar(255) DEFAULT NULL COMMENT '展示的文件名',
  `k` varchar(255) DEFAULT NULL COMMENT 'oss上的文件key，包含路径',
  `t` varchar(50) DEFAULT NULL COMMENT '文件后缀',
  `s` int(11) DEFAULT NULL COMMENT '文件大小',
  `b` varchar(255) DEFAULT NULL COMMENT 'bucket',
  `uid` int(11) DEFAULT NULL COMMENT '创建者id',
  `ct` datetime DEFAULT NULL COMMENT '创建时间',
  `ut` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k` (`k`) USING BTREE,
  KEY `b` (`b`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- 转存表中的数据 `file`
--

INSERT INTO `file` (`id`, `n`, `k`, `t`, `s`, `b`, `uid`, `ct`, `ut`) VALUES
(1, '镜头-光头.mp4', '品牌茅台/产品飞天酱香/日期20221014/镜头-光头.mp4', 'mp4', 32737269, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 00:23:24', '2022-10-14 07:34:23'),
(2, '镜头-毛手.mp4', '品牌茅台/产品飞天酱香/日期20221014/镜头-毛手.mp4', 'mp4', 43290870, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 00:23:45', '2022-10-14 07:33:58'),
(3, '镜头-堂哥.mp4', '品牌茅台/产品飞天酱香/日期20221014/镜头-堂哥.mp4', 'mp4', 21349359, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 00:23:55', '2022-10-14 07:34:07'),
(6, 'The-Ultimate-Guide-for-Chinese-B2B-Marketing (2).jpg', '品牌茅台/产品飞天酱香/日期20221014/The-Ultimate-Guide-for-Chinese-B2B-Marketing (2).jpg', 'jpg', 209873, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 17:28:26', '2022-10-14 09:28:26'),
(5, 'The-Ultimate-Guide-for-Chinese-B2B-Marketing (1).jpg', '品牌茅台/产品飞天酱香/日期20221014/The-Ultimate-Guide-for-Chinese-B2B-Marketing (1).jpg', 'jpg', 209873, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 15:39:59', '2022-10-14 07:39:59'),
(7, '微信图片_20220812174237.jpg', '品牌茅台/产品飞天酱香/日期20221014/微信图片_20220812174237.jpg', 'jpg', 10791, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 17:36:50', '2022-10-14 09:36:50'),
(8, 'HeaderTop.js', '品牌茅台/产品飞天酱香/日期20221014/HeaderTop.js', 'js', 2462, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 17:46:23', '2022-10-14 09:46:23'),
(9, '路径.txt', '品牌茅台/产品飞天酱香/日期20221014/路径.txt', 'txt', 130, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 17:49:19', '2022-10-14 09:49:19'),
(10, 'movie (1).mp4', '品牌茅台/产品飞天酱香/日期20221014/movie (1).mp4', 'mp4', 243104, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-14 17:53:19', '2022-10-14 09:53:19'),
(11, 'movie.mp4', '品牌茅台/产品飞天酱香/日期20221015/movie.mp4', 'mp4', 243104, 'please-enter-english-bucket-name-as-your-group-name', 2, '2022-10-14 18:52:24', '2022-10-14 10:52:24'),
(12, '103 郑贝媛 8.mp4', '品牌茅台/产品飞天酱香/日期20221015/103 郑贝媛 8.mp4', 'mp4', 47991330, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:10:51', '2022-10-15 10:10:51'),
(13, '贵发8.25裂.mp4', '品牌茅台/产品飞天酱香/日期20221015/贵发8.25裂.mp4', 'mp4', 52889442, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:11:03', '2022-10-15 10:11:03'),
(14, '贵发824裂.mp4', '品牌茅台/产品飞天酱香/日期20221015/贵发824裂.mp4', 'mp4', 42951818, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:11:12', '2022-10-15 10:11:12'),
(15, '贵发819裂.mp4', '品牌茅台/产品飞天酱香/日期20221015/贵发819裂.mp4', 'mp4', 42317379, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:11:20', '2022-10-15 10:11:20'),
(16, '8.17牙 颜.mov', '品牌茅台/产品飞天酱香/日期20221015/8.17牙 颜.mov', 'mov', 40885368, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:11:31', '2022-10-15 10:11:31'),
(17, '晓滨817动漫.mp4', '品牌茅台/产品飞天酱香/日期20221015/晓滨817动漫.mp4', 'mp4', 43115172, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:11:39', '2022-10-15 10:11:39'),
(18, '8C27B475-1A49-411F-A782-9CCEFA2ABAD9.png', '品牌茅台/产品飞天酱香/日期20221014/8C27B475-1A49-411F-A782-9CCEFA2ABAD9.png', 'png', 2169962, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:34', '2022-10-15 10:16:34'),
(19, '864C23CC-A448-421C-A24D-6F76213E8D2E.png', '品牌茅台/产品飞天酱香/日期20221014/864C23CC-A448-421C-A24D-6F76213E8D2E.png', 'png', 7362689, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:35', '2022-10-15 10:16:35'),
(20, 'C9DD088B-99AE-4E91-BDBD-3A12C0AEF381.png', '品牌茅台/产品飞天酱香/日期20221014/C9DD088B-99AE-4E91-BDBD-3A12C0AEF381.png', 'png', 2406006, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:36', '2022-10-15 10:16:36'),
(21, '38F4F44E-C1D3-4902-A840-C507DB0DFBE8.png', '品牌茅台/产品飞天酱香/日期20221014/38F4F44E-C1D3-4902-A840-C507DB0DFBE8.png', 'png', 10097732, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:40', '2022-10-15 10:16:40'),
(103, 'test20- (3).jpg', '10月15日素人/243r23/234134/test20- (3).jpg', 'jpg', 209873, '1111daping', 2, '2022-10-17 17:37:21', '2022-10-17 09:37:21'),
(102, 'test20- (7).mp4', '10月15日素人/243r23/234134/test20- (7).mp4', 'mp4', 47991330, '1111daping', 2, '2022-10-17 17:37:21', '2022-10-17 09:37:21'),
(101, 'test20- (1).js', '10月15日素人/243r23/234134/test20- (1).js', 'js', 2462, '1111daping', 2, '2022-10-17 17:37:09', '2022-10-17 09:37:09'),
(24, '8D8792A9-33D9-47FD-B14C-4C64944CE294.png', '品牌茅台/产品飞天酱香/日期20221014/8D8792A9-33D9-47FD-B14C-4C64944CE294.png', 'png', 1085055, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:44', '2022-10-15 10:16:44'),
(25, 'IMG_2645.MOV', '品牌茅台/产品飞天酱香/日期20221014/IMG_2645.MOV', 'MOV', 3366246, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:45', '2022-10-15 10:16:45'),
(26, '87394D27-7F9C-4C86-80E9-66F8AD030D9B.jpeg', '品牌茅台/产品飞天酱香/日期20221014/87394D27-7F9C-4C86-80E9-66F8AD030D9B.jpeg', 'jpeg', 433433, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:46', '2022-10-15 10:16:46'),
(27, 'B2D67209-1C45-460A-8B77-50F74C97280D.png', '品牌茅台/产品飞天酱香/日期20221014/B2D67209-1C45-460A-8B77-50F74C97280D.png', 'png', 1054046, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:47', '2022-10-15 10:16:47'),
(99, 'test20- (2).mp4', '10月15日素人/243r23/234134/test20- (2).mp4', 'mp4', 243104, '1111daping', 2, '2022-10-17 17:37:08', '2022-10-17 09:37:08'),
(100, 'test20- (1).mp4', '10月15日素人/243r23/234134/test20- (1).mp4', 'mp4', 243104, '1111daping', 2, '2022-10-17 17:37:09', '2022-10-17 09:37:09'),
(91, 'test20- (1).txt', '10月15日素人/243r23/234134/test20- (1).txt', 'txt', 130, '1111daping', 2, '2022-10-17 17:36:34', '2022-10-17 09:36:34'),
(92, 'test20- (1).zip', '10月15日素人/243r23/234134/test20- (1).zip', 'zip', 1121, '1111daping', 2, '2022-10-17 17:36:35', '2022-10-17 09:36:35'),
(30, 'B2FE8B2F-34DA-4FF2-8131-93CB950082FD.png', '品牌茅台/产品飞天酱香/日期20221014/B2FE8B2F-34DA-4FF2-8131-93CB950082FD.png', 'png', 929459, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:48', '2022-10-15 10:16:48'),
(98, 'test20- (1).jpg', '10月15日素人/243r23/234134/test20- (1).jpg', 'jpg', 209873, '1111daping', 2, '2022-10-17 17:37:08', '2022-10-17 09:37:08'),
(97, 'test20- (11).mp4', '10月15日素人/243r23/234134/test20- (11).mp4', 'mp4', 21349359, '1111daping', 2, '2022-10-17 17:37:07', '2022-10-17 09:37:07'),
(96, 'test20- (6).mp4', '10月15日素人/243r23/234134/test20- (6).mp4', 'mp4', 42951818, '1111daping', 2, '2022-10-17 17:37:01', '2022-10-17 09:37:01'),
(33, '78663557-43BD-4B0A-9415-56C3320BB55A.png', '品牌茅台/产品飞天酱香/日期20221014/78663557-43BD-4B0A-9415-56C3320BB55A.png', 'png', 877733, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:50', '2022-10-15 10:16:50'),
(34, '8E9CBFFB-E48F-472D-8029-6C9DE256F3CB.png', '品牌茅台/产品飞天酱香/日期20221014/8E9CBFFB-E48F-472D-8029-6C9DE256F3CB.png', 'png', 589491, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:51', '2022-10-15 10:16:51'),
(35, '13879118-78CB-499D-A931-8301FC696B85.png', '品牌茅台/产品飞天酱香/日期20221014/13879118-78CB-499D-A931-8301FC696B85.png', 'png', 947244, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:51', '2022-10-15 10:16:51'),
(36, '46E0DC5B-D532-486A-AA83-A624BD336F6F.png', '品牌茅台/产品飞天酱香/日期20221014/46E0DC5B-D532-486A-AA83-A624BD336F6F.png', 'png', 8189309, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 18:16:52', '2022-10-15 10:16:52'),
(95, 'test20- (10).mp4', '10月15日素人/243r23/234134/test20- (10).mp4', 'mp4', 43290870, '1111daping', 2, '2022-10-17 17:36:48', '2022-10-17 09:36:48'),
(38, '黄薇1010 (2).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (2).mp4', 'mp4', 29068731, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:00:48', '2022-10-15 14:00:48'),
(39, '黄薇1010 (3).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (3).mp4', 'mp4', 26878033, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:01:00', '2022-10-15 14:01:00'),
(40, '黄薇1010 (4).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (4).mp4', 'mp4', 26898464, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:01:11', '2022-10-15 14:01:11'),
(41, '黄薇1010 (5).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (5).mp4', 'mp4', 27445188, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:01:24', '2022-10-15 14:01:24'),
(42, '黄薇1010 (6).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (6).mp4', 'mp4', 27143723, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:01:37', '2022-10-15 14:01:37'),
(43, '黄薇1010 (7).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (7).mp4', 'mp4', 20016394, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:01:46', '2022-10-15 14:01:46'),
(44, '黄薇1010 (8).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (8).mp4', 'mp4', 20076969, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:01:54', '2022-10-15 14:01:54'),
(45, '黄薇1010 (9).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (9).mp4', 'mp4', 25584263, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:03', '2022-10-15 14:02:03'),
(46, '黄薇1010 (10).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (10).mp4', 'mp4', 25413028, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:13', '2022-10-15 14:02:13'),
(47, '黄薇1010 (11).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (11).mp4', 'mp4', 19539337, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:20', '2022-10-15 14:02:20'),
(48, '黄薇1010 (12).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (12).mp4', 'mp4', 20697555, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:27', '2022-10-15 14:02:27'),
(49, '黄薇1010 (13).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (13).mp4', 'mp4', 23344535, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:37', '2022-10-15 14:02:37'),
(50, '黄薇1010 (14).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (14).mp4', 'mp4', 22956596, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:48', '2022-10-15 14:02:48'),
(51, '黄薇1010 (15).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (15).mp4', 'mp4', 27399117, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:02:57', '2022-10-15 14:02:57'),
(52, '黄薇1010 (16).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (16).mp4', 'mp4', 27253374, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:03:11', '2022-10-15 14:03:11'),
(53, '黄薇1010 (17).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (17).mp4', 'mp4', 23096277, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:03:23', '2022-10-15 14:03:23'),
(54, '黄薇1010 (18).mp4', '品牌茅台/大瓶素人/10月15日素人/黄薇1010 (18).mp4', 'mp4', 24035132, 'please-enter-english-bucket-name-as-your-group-name', 1, '2022-10-15 22:03:34', '2022-10-15 14:03:34'),
(94, 'test20- (1).png', '10月15日素人/243r23/234134/test20- (1).png', 'png', 10097732, '1111daping', 2, '2022-10-17 17:36:37', '2022-10-17 09:36:37'),
(93, 'test20- (4).jpg', '10月15日素人/243r23/234134/test20- (4).jpg', 'jpg', 10791, '1111daping', 2, '2022-10-17 17:36:35', '2022-10-17 09:36:35'),
(90, 'test20- (1).log', '10月15日素人/243r23/234134/test20- (1).log', 'log', 14, '1111daping', 2, '2022-10-17 17:36:34', '2022-10-17 09:36:34'),
(89, 'test20- (8).mp4', '10月15日素人/243r23/234134/test20- (8).mp4', 'mp4', 52889442, '1111daping', 2, '2022-10-17 17:36:33', '2022-10-17 09:36:33'),
(88, 'test20- (3).mp4', '10月15日素人/243r23/234134/test20- (3).mp4', 'mp4', 43290870, '1111daping', 2, '2022-10-17 17:36:17', '2022-10-17 09:36:17'),
(87, 'test20- (4).mp4', '10月15日素人/243r23/234134/test20- (4).mp4', 'mp4', 21349359, '1111daping', 2, '2022-10-17 17:36:00', '2022-10-17 09:36:00'),
(86, 'test20- (9).mp4', '10月15日素人/243r23/234134/test20- (9).mp4', 'mp4', 32737269, '1111daping', 2, '2022-10-17 17:35:56', '2022-10-17 09:35:56'),
(85, 'test20- (5).mp4', '10月15日素人/243r23/234134/test20- (5).mp4', 'mp4', 32737269, '1111daping', 2, '2022-10-17 17:35:48', '2022-10-17 09:35:48'),
(104, 'test20- (2).jpg', '10月15日素人/243r23/234134/test20- (2).jpg', 'jpg', 10791, '1111daping', 2, '2022-10-17 17:37:22', '2022-10-17 09:37:22');

-- --------------------------------------------------------

--
-- 表的结构 `folder`
--

CREATE TABLE IF NOT EXISTS `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n` varchar(255) NOT NULL COMMENT '文件夹名称',
  `lvl` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '文件夹层级  1 / 2 / 3 ',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上一层文件夹id ，第1层的pid默认为 0',
  `bucket` varchar(255) NOT NULL DEFAULT '' COMMENT 'bucket  是哪个桶下的文件夹',
  `ct` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`bucket`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `folder`
--

INSERT INTO `folder` (`id`, `n`, `lvl`, `pid`, `bucket`, `ct`) VALUES
(1, '品牌茅台', 1, 0, 'please-enter-english-bucket-name-as-your-group-name', '2022-10-13 16:15:48'),
(2, '产品飞天酱香', 2, 1, 'please-enter-english-bucket-name-as-your-group-name', '2022-10-13 16:16:34'),
(3, '日期20221014', 3, 2, 'please-enter-english-bucket-name-as-your-group-name', '2022-10-13 16:17:12'),
(4, '日期20221015', 3, 2, 'please-enter-english-bucket-name-as-your-group-name', '2022-10-14 10:51:57'),
(5, '大瓶素人', 2, 1, 'please-enter-english-bucket-name-as-your-group-name', '2022-10-15 10:17:06'),
(6, '10月15日素人', 3, 5, 'please-enter-english-bucket-name-as-your-group-name', '2022-10-15 10:17:45'),
(7, '10月15日素人', 1, 0, '1111daping', '2022-10-15 10:19:00'),
(8, '243r23', 2, 7, '1111daping', '2022-10-17 08:57:29'),
(9, '234134', 3, 8, '1111daping', '2022-10-17 08:57:37');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `psw` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `bucket` varchar(255) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `utime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(10) DEFAULT NULL COMMENT 'user / admin / sys',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `psw`, `token`, `bucket`, `ctime`, `utime`, `role`) VALUES
(1, 'admin', '3be7f4999d9b61a19b94b0bc017ef27e', 'edca0164410d9fcac38132d83b3c085c', '', NULL, '2022-10-17 01:53:36', 'sys'),
(2, 'admin_ccj', '3be7f4999d9b61a19b94b0bc017ef27e', '54a170892c8312fc36127c32616baf6b', NULL, '2022-10-14 09:57:54', '2022-10-17 10:09:31', 'admin'),
(3, 'xiao_ming', 'c9447bb2326b55500405693cb92d8f98', '382edba40a82e49ed31fd8db22de8cb6', 'please-enter-english-bucket-name-as-your-group-name', '2022-10-14 10:08:31', '2022-10-14 10:10:15', 'user'),
(4, '13588888888', '3be7f4999d9b61a19b94b0bc017ef27e', 'ca6c890e2d77e2c39872c2084d2885ef', NULL, '2022-10-14 10:09:50', '2022-10-14 02:09:50', 'user'),
(5, 'admin_cjj', '3be7f4999d9b61a19b94b0bc017ef27e', '14cb8f70864c5f90bbd01d4ef452e650', NULL, '2022-10-14 10:33:28', '2022-10-14 10:33:37', 'admin'),
(6, '123qwe', '3be7f4999d9b61a19b94b0bc017ef27e', 'cb8248323dd915b2f85084a280f458b6', NULL, '2022-10-14 10:44:44', '2022-10-14 02:44:44', 'user');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
