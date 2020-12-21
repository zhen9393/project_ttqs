-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 12 月 21 日 16:50
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `team_1`
--

-- --------------------------------------------------------

--
-- 資料表結構 `accompany`
--

CREATE TABLE `accompany` (
  `acc_id` int(11) NOT NULL,
  `acc_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '職訓中心陪同人員'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `allowance`
--

CREATE TABLE `allowance` (
  `all_id` int(11) NOT NULL,
  `all_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '政府補助專案'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `application`
--

CREATE TABLE `application` (
  `app_id` int(11) NOT NULL,
  `app_info` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '申請資料',
  `app_coach` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT '是否輔導',
  `app_rc` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '顧問/委員推薦'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `area`
--

CREATE TABLE `area` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '委員區域'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `area`
--

INSERT INTO `area` (`a_id`, `a_name`) VALUES
(1, '北基宜花金馬區'),
(2, '桃竹苗區'),
(3, '中彰投區'),
(4, '雲嘉南區'),
(5, '高屏澎東區');

-- --------------------------------------------------------

--
-- 資料表結構 `assistant`
--

CREATE TABLE `assistant` (
  `ass_id` int(11) NOT NULL,
  `ass_actual` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '實際助理',
  `ass_sign` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '簽單助理',
  `ass_acc` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '陪同助理',
  `ass_addr` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `ass_mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `assistant`
--

INSERT INTO `assistant` (`ass_id`, `ass_actual`, `ass_sign`, `ass_acc`, `ass_addr`, `ass_mail`) VALUES
(1, '蒲婉華', '', '', '', ''),
(2, '薛朝原', '', '', '', ''),
(3, '詹秉岳', '', '', '', ''),
(4, '李夢詩', '', '', '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `case_number`
--

CREATE TABLE `case_number` (
  `c_id` int(11) NOT NULL,
  `c_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '案號',
  `c_com_a` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '委員A',
  `c_com_b` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '委員B',
  `c_ass` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '助理',
  `c_job` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '發文/上傳',
  `c_sign` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '簽名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `case_number`
--

INSERT INTO `case_number` (`c_id`, `c_no`, `c_com_a`, `c_com_b`, `c_ass`, `c_job`, `c_sign`) VALUES
(1, '109CC0447', '25', '', '1', '1', '蒲婉華'),
(2, '109AC1274', '24', '30', '2', '2', '薛朝原'),
(3, '109CC0713', '30', '', '3', '3', '詹秉岳'),
(4, '109CC0722', '28', '', '', '4', '李夢詩'),
(5, '109AC1989', '26', '23', '1', '5', '蒲婉華'),
(6, '109AC2154', '30', '29', '2', '6', '薛朝原'),
(7, '109AC0854', '23', '27', '3', '7', '詹秉岳'),
(8, '109AC7154', '22', '', '', '8', '詹秉岳'),
(9, '109AC1503', '26', '', '2', '9', ''),
(10, '109AC1889', '30', '', '3', '10', ''),
(11, '109AC5341', '27', '', '1', '11', ''),
(12, '109AC0050', '15', '16', '', '12', '薛朝原'),
(13, '109AC0065', '20', '', '2', '13', ''),
(14, '109CC1546', '24', '', '1', '14', ''),
(15, '109CC4367', '7', '', '', '15', '詹秉岳'),
(16, '109AC4367', '45', '46', '3', '16', ''),
(17, '109CC9521', '23', '', '2', '17', ''),
(18, '109AC1512', '43', '', '', '18', '蒲婉華'),
(19, '109CC7365', '19', '', '4', '19', ''),
(20, '109CC2558', '37', '', '1', '20', ''),
(21, '109AC7088', '50', '51', '2', '21', ''),
(22, '109AC1023', '9', '', '', '22', '薛朝原'),
(23, '109CC6093', '41', '', '', '23', '李夢詩'),
(24, '109CC9701', '27', '', '2', '24', ''),
(25, '109AC4627', '11', '', '3', '25', '');

-- --------------------------------------------------------

--
-- 資料表結構 `committee_a`
--

CREATE TABLE `committee_a` (
  `com_a_id` int(11) NOT NULL,
  `com_a` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '委員a',
  `com_area` int(10) NOT NULL COMMENT '區域',
  `com_a_addr` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `com_a_mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `committee_a`
--

INSERT INTO `committee_a` (`com_a_id`, `com_a`, `com_area`, `com_a_addr`, `com_a_mail`) VALUES
(1, '何偉瑮', 1, '', ''),
(2, '何琇菱', 1, '', ''),
(3, '余瑞華', 1, '', ''),
(4, '倪仁禧', 1, '', ''),
(5, '初炳瑞', 1, '', ''),
(6, '劉秀珍', 1, '', ''),
(7, '卓清松', 1, '', ''),
(8, '吳俊明', 1, '', ''),
(9, '吳俊裕', 1, '', ''),
(10, '吳信昇', 1, '', ''),
(11, '丁姵元', 2, '', ''),
(12, '丁安強', 2, '', ''),
(13, '劉美鈴', 2, '', ''),
(14, '唐勝瑩', 2, '', ''),
(15, '康麗惠', 2, '', ''),
(16, '張偉正', 2, '', ''),
(17, '張情怡', 2, '', ''),
(18, '張新堂', 2, '', ''),
(19, '張滿香', 2, '', ''),
(20, '徐世欣', 2, '', ''),
(21, '徐秀燕', 2, '', ''),
(22, '于子棋', 3, '', ''),
(23, '何崇溢', 3, '', ''),
(24, '劉佳蓉', 3, '', ''),
(25, '劉嘉雯', 3, '', ''),
(26, '劉淑寧', 3, '', ''),
(27, '卓秀足', 3, '', ''),
(28, '吳宥萱', 3, '', ''),
(29, '吳錦錫', 3, '', ''),
(30, '周台龍', 3, '', ''),
(31, '周少凱', 3, '', ''),
(32, '丁鏗升', 4, '', ''),
(33, '侯春明', 4, '', ''),
(34, '劉聖達', 4, '', ''),
(35, '劉錦雲', 4, '', ''),
(36, '吳正雄', 4, '', ''),
(37, '張益賓', 4, '', ''),
(38, '張碩毅', 4, '', ''),
(39, '張若平', 4, '', ''),
(40, '張鳴珊', 4, '', ''),
(41, '方妙玲', 4, '', ''),
(42, '余德成', 5, '', ''),
(43, '劉財龍', 5, '', ''),
(44, '劉賢璟', 5, '', ''),
(45, '古惠菁', 5, '', ''),
(46, '吳炫東', 5, '', ''),
(47, '宋兆賢', 5, '', ''),
(48, '宋明賢', 5, '', ''),
(49, '廖文志', 5, '', ''),
(50, '徐偉智', 5, '', ''),
(51, '徐秀慧', 5, '', ''),
(52, '戴淑媛', 5, '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `committee_b`
--

CREATE TABLE `committee_b` (
  `com_b_id` int(11) NOT NULL,
  `com_b` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '委員b',
  `com_b_addr` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `com_b_mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `committee_b`
--

INSERT INTO `committee_b` (`com_b_id`, `com_b`, `com_b_addr`, `com_b_mail`) VALUES
(1, '何偉瑮', '', ''),
(2, '何琇菱', '', ''),
(3, '余瑞華', '', ''),
(4, '倪仁禧', '', ''),
(5, '初炳瑞', '', ''),
(6, '劉秀珍', '', ''),
(7, '卓清松', '', ''),
(8, '吳俊明', '', ''),
(9, '吳俊裕', '', ''),
(10, '吳信昇', '', ''),
(11, '丁姵元', '', ''),
(12, '丁安強', '', ''),
(13, '劉美鈴', '', ''),
(14, '唐勝瑩', '', ''),
(15, '康麗惠', '', ''),
(16, '張偉正', '', ''),
(17, '張情怡', '', ''),
(18, '張新堂', '', ''),
(19, '張滿香', '', ''),
(20, '徐世欣', '', ''),
(21, '徐秀燕', '', ''),
(22, '于子棋', '', ''),
(23, '何崇溢', '', ''),
(24, '劉佳蓉', '', ''),
(25, '劉嘉雯', '', ''),
(26, '劉淑寧', '', ''),
(27, '卓秀足', '', ''),
(28, '吳宥萱', '', ''),
(29, '吳錦錫', '', ''),
(30, '周台龍', '', ''),
(31, '周少凱', '', ''),
(32, '丁鏗升', '', ''),
(33, '侯春明', '', ''),
(34, '劉聖達', '', ''),
(35, '劉錦雲', '', ''),
(36, '吳正雄', '', ''),
(37, '張益賓', '', ''),
(38, '張碩毅', '', ''),
(39, '張若平', '', ''),
(40, '張鳴珊', '', ''),
(41, '方妙玲', '', ''),
(42, '余德成', '', ''),
(43, '劉財龍', '', ''),
(44, '劉賢璟', '', ''),
(45, '古惠菁', '', ''),
(46, '吳炫東', '', ''),
(47, '宋兆賢', '', ''),
(48, '宋明賢', '', ''),
(49, '廖文志', '', ''),
(50, '徐偉智', '', ''),
(51, '徐秀慧', '', ''),
(52, '戴淑媛', '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `contact`
--

CREATE TABLE `contact` (
  `con_id` int(11) NOT NULL,
  `con_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡人姓名',
  `con_title` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡人職稱',
  `con_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡人電話',
  `con_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡人email',
  `con_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '案號'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `contact`
--

INSERT INTO `contact` (`con_id`, `con_name`, `con_title`, `con_phone`, `con_email`, `con_no`) VALUES
(1, '胡米芬', '', '04-26930636#23', '', '1'),
(2, '黃中志', '', '04-728751', '', '2'),
(3, '翁靖茹', '', '04-23924505轉2701', '', '3'),
(4, '蔡意文', '', '04-26260506', '', '4'),
(5, '司金鳳', '', '04-22131609', '', '5'),
(6, '洪浚銘', '', '04-2681', '', '6'),
(7, '林依萱', '', '04-235', '', '7'),
(8, '胡米芬', '', '04-26930636#23', '', '8'),
(9, '黃中志', '', '04-728751', '', '9'),
(10, '翁靖茹', '', '04-23924505轉2701', '', '10'),
(11, '蔡意文', '', '04-26260506', '', '11'),
(12, '司金鳳', '', '04-22131609', '', '12'),
(13, '洪浚銘', '', '04-2681', '', '13'),
(14, '林依萱', '', '04-235', '', '14'),
(15, '洪浚銘', '', '04-2681', '', '15'),
(16, '林依萱', '', '04-235', '', '16'),
(17, '胡米芬', '', '04-26930636#23', '', '17'),
(18, '黃中志', '', '04-728751', '', '18'),
(19, '翁靖茹', '', '04-23924505轉2701', '', '19'),
(20, '蔡意文', '', '04-26260506', '', '20'),
(21, '司金鳳', '', '04-22131609', '', '21'),
(22, '洪浚銘', '', '04-2681', '', '22'),
(23, '林依萱', '', '04-235', '', '23'),
(24, '洪浚銘', '', '04-2681', '', '24'),
(25, '林依萱', '', '04-235', '', '25');

-- --------------------------------------------------------

--
-- 資料表結構 `date`
--

CREATE TABLE `date` (
  `d_id` int(11) NOT NULL,
  `d_date` date NOT NULL COMMENT '評核日期',
  `d_week` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '評核星期',
  `d_per` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '評核時段',
  `d_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '案號'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `date`
--

INSERT INTO `date` (`d_id`, `d_date`, `d_week`, `d_per`, `d_no`) VALUES
(1, '2020-12-06', '周一', '0900-1200', '1'),
(2, '2020-12-11', '周一', '0900-1200', '2'),
(3, '2020-12-08', '周一', '0900-1200', '3'),
(4, '2020-12-15', '周一', '0900-1200', '4'),
(5, '2020-12-14', '周四', '0900-1200', '5'),
(6, '2020-12-10', '周三', '1400-1700', '6'),
(7, '2020-12-04', '周五', '0900-1200', '7'),
(8, '2020-12-04', '周五', '0900-1200', '8'),
(9, '2020-01-01', '周三', '0900-1200', '9'),
(10, '2020-01-02', '周四', '0900-1200', '10'),
(11, '2020-01-05', '周五', '0900-1200', '11'),
(12, '2020-01-08', '周一', '0900-1200', '12'),
(13, '2020-01-11', '周四', '0900-1200', '13'),
(14, '2020-01-12', '周五', '0900-1200', '14'),
(15, '2020-02-07', '周五', '0900-1200', '15'),
(16, '2020-02-09', '周日', '0900-1200', '16'),
(17, '2020-03-16', '周一', '0900-1200', '17'),
(18, '2020-03-24', '周二', '0900-1200', '18'),
(19, '2020-03-27', '周五', '0900-1200', '19'),
(20, '2020-04-03', '周五', '0900-1200', '20'),
(21, '2020-04-06', '周一', '0900-1200', '21'),
(22, '2020-04-12', '周二', '0900-1200', '22'),
(23, '2020-05-06', '周三', '0900-1200', '23'),
(24, '2020-05-10', '周日', '0900-1200', '24'),
(25, '2020-06-01', '周一', '0900-1200', '25');

-- --------------------------------------------------------

--
-- 資料表結構 `job`
--

CREATE TABLE `job` (
  `job_id` int(11) NOT NULL,
  `job_upload` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '結案上傳',
  `job_closed` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '結案發文',
  `job_ps` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '備註'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `job`
--

INSERT INTO `job` (`job_id`, `job_upload`, `job_closed`, `job_ps`) VALUES
(1, '88天', '88天', ''),
(2, '88天', '88天', ''),
(3, '88天', '88天', ''),
(4, '88天', '88天', ''),
(5, '1天', '1天', ''),
(6, '2天', '2天', ''),
(7, '7天', '7天', ''),
(8, '10天', '10天', ''),
(9, '12天', '12天', ''),
(10, '20天', '20天', ''),
(11, '7天', '7天', ''),
(12, '100天', '100天', ''),
(13, '3天', '3天', ''),
(14, '15天', '15天', ''),
(15, '1天', '1天', ''),
(16, '13天', '13天', ''),
(17, '5天', '5天', ''),
(18, '6天', '6天', ''),
(19, '5天', '5天', ''),
(20, '20天', '20天', ''),
(21, '5天', '5天', ''),
(22, '7天', '7天', ''),
(23, '7天', '7天', ''),
(24, '7天', '7天', ''),
(25, '1天', '1天', '');

-- --------------------------------------------------------

--
-- 資料表結構 `object`
--

CREATE TABLE `object` (
  `ob_id` int(11) NOT NULL,
  `ob_ver` enum('企業機構版','訓練機構版','外訓版','辦訓能力檢核表') COLLATE utf8_unicode_ci NOT NULL COMMENT '評核版本',
  `ob_office` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '受評單位',
  `ob_add_c` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司地址',
  `ob_ass_a` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '諮詢地址',
  `ob_count` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '輔導次數',
  `ob_evcount` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '評核次數',
  `ob_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '案號',
  `ob_con_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡人'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `object`
--

INSERT INTO `object` (`ob_id`, `ob_ver`, `ob_office`, `ob_add_c`, `ob_ass_a`, `ob_count`, `ob_evcount`, `ob_no`, `ob_con_name`) VALUES
(1, '企業機構版', '倡明電機有限公司', '432台中市大肚區', '', '4', '', '1', '1'),
(2, '訓練機構版', '彰化縣勞動力派遣服務人員職業工會', '500彰化縣', '', '', '', '2', '2'),
(3, '訓練機構版', '國立勤益科技大學', '411台中市太平區', '', '2', '', '3', '3'),
(4, '訓練機構版', '大臺中汽車保養修理業職業工會', '433台中市沙鹿區', '', '2', '', '4', '4'),
(5, '訓練機構版', '社團法人臺中市身無礙關懷協會', '401台中市東區', '', '', '', '5', '5'),
(6, '企業機構版', '威輪工業股份有限公司', '437台中市大甲區', '', '', '', '6', '6'),
(7, '企業機構版', '普發工業股份有限公司', '408台中市南屯區', '', '', '', '7', '7'),
(8, '企業機構版', '大甲永和機械工業股份有限公司', '437台中市大甲區', '', '1', '', '8', '8'),
(9, '企業機構版', '大甲化工實業股份有限公司', '437台中市大甲區', '', '4', '', '9', '9'),
(10, '企業機構版', '光鉛企業股份有限公司', '407台中市西屯區', '', '4', '', '10', '10'),
(11, '企業機構版', '經典國際股份有限公司', '404台中市北區', '', '3', '', '11', '11'),
(12, '企業機構版', '寶元數控股份有限公司', '407台中市西屯區', '', '', '', '12', '12'),
(13, '企業機構版', '時刻科技股份有限公司', '403台中市西區', '', '3', '', '13', '13'),
(14, '企業機構版', '豐邑建設', '403台中市西區', '', '1', '', '14', '14'),
(15, '企業機構版', '天剛資訊股份有限公司', '404台中市北區', '', '2', '', '15', '15'),
(16, '企業機構版', '中龍鋼鐵股份有限公司', '434台中市龍井區', '', '', '', '16', '16'),
(17, '企業機構版', '正隆股份有限公司', '435台中市梧棲區', '', '2', '', '17', '17'),
(18, '企業機構版', '瑛瑜精密工業股份有限公司', '433台中市沙鹿區', '', '3', '', '18', '18'),
(19, '企業機構版', '正河源股份有限公司', '436台中市清水區', '', '2', '', '19', '19'),
(20, '企業機構版', '陸雄機械工業股份有限公司', '436台中市清水區', '', '4', '', '20', '20'),
(21, '企業機構版', '台華精技股份有限公司', '408台中市南屯區', '', '', '', '21', '21'),
(22, '企業機構版', '保佑實業股份有限公司', '408台中市南屯區', '', '1', '', '22', '22'),
(23, '企業機構版', '詠基工業股份有限公司', '414台中市烏日區', '', '1', '', '23', '23'),
(24, '企業機構版', '國霖機電管理服務股份有限公司', '432台中市中區', '', '2', '', '24', '24'),
(25, '企業機構版', '青廷自動化有限公司|台中專業半自動化設備', '412台中市大里區', '', '2', '', '25', '25');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `accompany`
--
ALTER TABLE `accompany`
  ADD PRIMARY KEY (`acc_id`);

--
-- 資料表索引 `allowance`
--
ALTER TABLE `allowance`
  ADD PRIMARY KEY (`all_id`);

--
-- 資料表索引 `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`app_id`);

--
-- 資料表索引 `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`a_id`);

--
-- 資料表索引 `assistant`
--
ALTER TABLE `assistant`
  ADD PRIMARY KEY (`ass_id`);

--
-- 資料表索引 `case_number`
--
ALTER TABLE `case_number`
  ADD PRIMARY KEY (`c_id`);

--
-- 資料表索引 `committee_a`
--
ALTER TABLE `committee_a`
  ADD PRIMARY KEY (`com_a_id`);

--
-- 資料表索引 `committee_b`
--
ALTER TABLE `committee_b`
  ADD PRIMARY KEY (`com_b_id`);

--
-- 資料表索引 `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`con_id`);

--
-- 資料表索引 `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`d_id`);

--
-- 資料表索引 `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`);

--
-- 資料表索引 `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`ob_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `accompany`
--
ALTER TABLE `accompany`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `allowance`
--
ALTER TABLE `allowance`
  MODIFY `all_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `application`
--
ALTER TABLE `application`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `area`
--
ALTER TABLE `area`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `assistant`
--
ALTER TABLE `assistant`
  MODIFY `ass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `case_number`
--
ALTER TABLE `case_number`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `committee_a`
--
ALTER TABLE `committee_a`
  MODIFY `com_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `committee_b`
--
ALTER TABLE `committee_b`
  MODIFY `com_b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `contact`
--
ALTER TABLE `contact`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `date`
--
ALTER TABLE `date`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `object`
--
ALTER TABLE `object`
  MODIFY `ob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
