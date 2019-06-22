-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2019 at 03:44 PM
-- Server version: 5.5.62-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mymapbas_eratos`
--

-- --------------------------------------------------------

--
-- Table structure for table `0__comment`
--

CREATE TABLE `0__comment` (
  `id` int(24) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email_address` varchar(50) CHARACTER SET latin1 NOT NULL,
  `title` varchar(50) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__comment`
--

INSERT INTO `0__comment` (`id`, `first_name`, `last_name`, `email_address`, `title`, `comment`, `user_id`, `time`) VALUES
(37, 'murat', 'kendir', 'muratkendir@gmail.com', 'philosophy', 'What is the NORTH?!', 1, '2012-05-07 05:32:03'),
(38, 'osman', 'Ä±sman', 'osman@osman.com', 'Ne gerek', 'Ne gerek vardÄ± ÅŸimdi bÃ¶le saÃ§ma sapan ÅŸeylerle uÄŸraÅŸmaya?', 16, '2013-01-27 11:28:12'),
(39, 'hasan', 'hasan', 'hasan@hasan.com', 'osmana', 'akÄ±llÄ± ol osman! mahalleni biliyorum!', 16, '2013-01-27 11:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `0__frame`
--

CREATE TABLE `0__frame` (
  `id` int(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `wms_layer_ids` varchar(100) NOT NULL,
  `public_private` tinyint(1) NOT NULL,
  `width` int(6) NOT NULL,
  `height` int(6) NOT NULL,
  `get_center_lat` decimal(10,7) NOT NULL,
  `get_center_long` decimal(10,7) NOT NULL,
  `zoom_to_extend` int(4) NOT NULL,
  `get_center_point` point NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__frame`
--

INSERT INTO `0__frame` (`id`, `title`, `wms_layer_ids`, `public_private`, `width`, `height`, `get_center_lat`, `get_center_long`, `zoom_to_extend`, `get_center_point`, `owner_id`) VALUES
(79, 'Ä°TÃœ AyazaÄŸa KampÃ¼sÃ¼', '12,10,1,2,3,4,5,6,11,13', 1, 800, 600, '41.1057316', '29.0229759', 15, '\0\0\0\0\0\0\0£¿á=@®òœˆD@', 1),
(52, 'osman deneme', '2,5,8', 1, 800, 400, '41.0000000', '29.0000000', 11, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 2),
(83, 'Ä°TÃœ KampÃ¼sleri', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 800, 600, '41.0754415', '29.0161309', 12, '\0\0\0\0\0\0\0~ô—\'!=@n¡+¨‰D@', 16),
(84, 'Ä°TÃœ AyazaÄŸa KampÃ¼sÃ¼', '12,1,2', 1, 800, 600, '41.1047385', '29.0231781', 15, '\0\0\0\0\0\0\0Á{ıÿî=@é8hD@', 16),
(85, 'Ä°TÃœ MaÃ§ka KampÃ¼sÃ¼', '1,2', 1, 800, 600, '41.0455679', '28.9954325', 16, '\0\0\0\0\0\0\0\"àªÔş<@«@+Õ…D@', 16),
(86, 'Ä°TÃœ GÃ¼mÃ¼ÅŸsuyu KampÃ¼sÃ¼', '12,1,2', 1, 800, 600, '41.0377805', '28.9916813', 16, '\0\0\0\0\0\0\0_ÓŞı<@˜öÍıÕ„D@', 16),
(80, 'Ä°TÃœ Makine FakÃ¼ltesi', '1,4', 0, 600, 400, '41.0381648', '28.9913113', 17, '\0\0\0\0\0\0\0¾§Í“Æı<@ßí‹•â„D@', 1),
(138, 'istanbuldacamiler', '12', 1, 600, 400, '41.0000000', '29.0000000', 9, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 1),
(87, 'Aktogay Copper Mine Project', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 800, 600, '46.9462969', '79.9621590', 12, '\0\0\0\0\0\0\0U£W”ıS@1ç¾A yG@', 16),
(89, 'sevdugum', '12,10,1,2,3,4,5,6,13', 0, 800, 600, '41.1824286', '41.8192065', 14, '\0\0\0\0\0\0\0×3ÂÛèD@smÒY—D@', 21),
(92, 'ITU Campus Area', '12,2,5,19,13', 1, 800, 600, '41.1049532', '29.0228502', 15, '\0\0\0\0\0\0\0µ½‚Ù=@&Î@oD@', 16),
(95, 'Ionia Cities', '12,14,2,5,19,16,11', 1, 800, 600, '37.8921883', '25.8618256', 9, '\0\0\0\0\0\0\0fffffæ:@ÍÌÌÌÌC@', 1),
(96, 'Turkey Map', '12', 1, 900, 450, '39.0000000', '35.0000000', 6, '\0\0\0\0\0\0\0\0\0\0\0\0€A@\0\0\0\0\0€C@', 1),
(97, 'EminÃ¶nÃ¼', '1,17,19,16', 1, 800, 600, '41.0081274', '28.9755606', 15, '\0\0\0\0\0\0\0\"DèV¾ù<@Ë™’Q\nD@', 1),
(98, 'RNC_Frame01', '1', 0, 1000, 1000, '41.0000000', '29.0000000', 2, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 28),
(101, 'Ä°stanbul', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 1200, 600, '41.0000000', '29.0000000', 12, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 32),
(102, 'TÃ¼rkiye Projeksiyonu', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 800, 600, '39.3682673', '35.0244293', 5, '\0\0\0\0\0\0\07HÒ ƒA@Ö×b#¯C@', 1),
(107, 'KUSCAMÄ°_OCAGÄ°', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 1200, 600, '37.0000000', '27.0000000', 9, '\0\0\0\0\0\0\0\0\0\0\0\0\0<@\0\0\0\0\0€B@', 32),
(108, 'ankara', '12', 1, 800, 600, '39.2000000', '32.7000000', 14, '\0\0\0\0\0\0\0š™™™™Y@@fffffæC@', 16),
(110, 'istanbul', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 960, 720, '41.0000000', '29.0000000', 12, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 33),
(111, 'Ã¼skÃ¼dar', '2,5,19', 1, 600, 600, '41.0213241', '29.0067078', 17, '\0\0\0\0\0\0\0ğ‚š·=@ı¥¿º‚D@', 1),
(113, 'MuÄŸla-AydÄ±n-Ä°zmir', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 800, 600, '37.8314681', '27.7514801', 7, '\0\0\0\0\0\0\0Eõÿ`À;@i•ô‹mêB@', 33),
(114, 'MuÄŸla Åehir Merkezi', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 1000, 800, '37.2150677', '28.3638054', 14, '\0\0\0\0\0\0\0³ÇY\"]<@…ö V‡›B@', 33),
(115, 'AydÄ±n', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 960, 750, '37.8421710', '27.8398949', 14, '\0\0\0\0\0\0\0Ã“\'Z×;@ßQcBÌëB@', 33),
(134, 'prova', '3', 1, 400, 400, '41.0000000', '12.0000000', 12, '\0\0\0\0\0\0\0\0\0\0\0\0€D@\0\0\0\0\0\0(@', 16),
(119, 'egebolgesi', '12,1,2,5,16,13', 1, 960, 480, '37.4900000', '27.2600000', 6, '\0\0\0\0\0\0\0Ãõ(\\B;@…ëQ¸¾B@', 16),
(120, 'demo', '1', 0, 800, 800, '30.0000000', '30.0000000', 10, '\0\0\0\0\0\0\0\0\0\0\0\0\0>@\0\0\0\0\0\0>@', 16),
(124, 'Ege BÃ¶lgesi', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 800, 600, '38.5000000', '27.0000000', 7, '\0\0\0\0\0\0\0\0\0\0\0\0\0;@\0\0\0\0\0@C@', 1),
(125, 'TÃ¼rkiye', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 0, 800, 600, '39.0000000', '34.0000000', 6, '\0\0\0\0\0\0\0\0\0\0\0\0\0A@\0\0\0\0\0€C@', 38),
(129, 'Test', '12,1,2,20', 0, 800, 600, '41.1049532', '29.0228502', 15, '\0\0\0\0\0\0\0µ½‚Ù=@&Î@oD@', 40),
(133, 'turkiyegenel', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 1024, 768, '41.0000000', '29.0000000', 6, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 16),
(135, 'test45', '21', 1, 600, 400, '41.0000000', '29.0000000', 10, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 16),
(136, 'geomsan', '12', 1, 800, 500, '3.1547830', '36.7250560', 4, '\0\0\0\0\0\0\0lĞ—Şş<	@aâ¢Î\\B@', 16),
(137, 'Aynalar', '12,24', 1, 1200, 800, '41.0000000', '29.0000000', 2, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 1);

-- --------------------------------------------------------

--
-- Table structure for table `0__line`
--

CREATE TABLE `0__line` (
  `id` int(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `frame_id` int(24) NOT NULL,
  `public_private` tinyint(1) NOT NULL,
  `line_line` linestring NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__line`
--

INSERT INTO `0__line` (`id`, `title`, `frame_id`, `public_private`, `line_line`, `owner_id`) VALUES
(40, 'KÃ¼tÃ¼phaneden Ä°nÅŸaat FaÃ¼ltesine', 79, 0, '\0\0\0\0\0\0\0\0\0\0€5½z=@šX…rGD@ßRÎ{=@ÚŞ$aD@ıƒH†=@Ñr[D@ ÁC=@kØï‰uD@)ŸÔM=@ÍÍ7¢{D@ƒ\'XÒ=@:|-CwD@XU/¿Ó=@Ko$uD@', 1),
(21, 'osman line 1', 52, 0, '\0\0\0\0\0\0\0\0\0\0\n×£p=\n=@fffff†D@…ëQ¸=@\n×£p=ŠD@', 2),
(41, 'RektÃ¶rlÃ¼kten Ä°nÅŸaat FakÃ¼ltesine', 79, 0, '\0\0\0\0\0\0\0\0\0\0\n:Hx=@¼Ôc¶¿D@à†¯y=@&(¸D@Ç[ø‡=@Âğ¶w²D@óªÎj=@§ÕF+­D@œt¶Û‰=@‰N….—D@Ç[ø‡=@g(îx“D@³7BP=@¼‘D@5!Rxu=@{Ic´D@¬À5;=@®òœˆD@…¬<*=@ÓÇ2³…D@İâ+Ë!=@‚e¶uD@)ŸÔM=@ÍÍ7¢{D@ƒ\'XÒ=@:|-CwD@XU/¿Ó=@Ko$uD@', 1),
(43, 'FEB-Ä°nÅŸaat yaya yolu', 84, 0, '\0\0\0\0\0\0\0\0\0\0¹WAg-=@\0I\"E®D@ $˜À=@@)ÿÿ¤D@Å\ZÓ¸Ü=@¬¾¸jD@nàw=@é!dj\\D@qªµ0=@ö.4|D@^¶BıÓ=@xÔ˜sD@', 16),
(45, 'Prf. Dr. Bedri Karafakioglu Caddesi', 84, 1, '\0\0\0\0\0\0\0\0\0\0ô{ı[g=@Ä\ni	;D@µ{ıs=@ï;¶ID@|ı;ÿ=@cŸ¥WD@|ı#=@I øZD@', 16),
(46, 'mecburiyetimiz', 89, 1, '\0\0\0\0\0\0\0\0\0\0¦3˜èD@m[Ö!å–D@3·èD@âÆ^A\"—D@', 21),
(47, 'Stadium to Faculty', 92, 1, '\0\0\0\0\0\0\0\0\0\0ü¶½v¸=@C\'6)øŒD@w¶½ƒ=@¼ßaD@\"¶½^=@„Ç‡YD@X¶½N=@² “{D@ú¶½ä=@÷¿)ÙwD@', 16),
(48, 'Ã‡emberlitaÅŸ -> BasÄ±n MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0{Dè‚“ø<@ph@ÙD@&DèÒø<@;Z_7D@', 1),
(49, 'BasÄ±n MÃ¼zesi -> Mozaik MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0&DèÒø<@Ş©I{D@xCèöµø<@ßòŠD@‰CèBµø<@j[D@<Dèš/ù<@h‘é½€D@0Dè†ù<@|¶*=¥€D@oDèª—ù<@w›~\\š€D@íCèV‘ù<@ù˜v“€D@mCèºù<@»,ˆ€D@/Dè–Éù<@Ğn1µ}€D@ÿCèÎúù<@LÍ´î…€D@jDè¾ú<@…Â$Ê‡€D@EDè\Z\'ú<@ß„€D@8CèZ2ú<@LÍ´î…€D@ÊDèŠ\\ú<@ 9ù—€D@', 1),
(50, 'Mozaik MÃ¼zesi -> DikilitaÅŸ', 97, 1, '\0\0\0\0\0\0\0\0\0\0ŸCè>]ú<@ 9ù—€D@íBè\"ˆú<@.ŠeB®€D@÷BèVŸú<@\"ú•¼€D@|CèÆÔú<@AáŒGÑ€D@%Cè.©ú<@øˆ\'Wß€D@ÂCèÆú<@ıæŞì€D@', 1),
(51, 'DikilitaÅŸ -> TÃ¼rbe MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0ÂCèÆú<@0¼fí€D@ÈCè*éú<@èŞuîú€D@ûCèçú<@Ç“sş€D@', 1),
(52, 'TÃ¼rbe MÃ¼zesi -> TopkapÄ± MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0½è]æú<@Ç“sş€D@Òè5ğú<@xH¥ş€D@¶èÕOû<@M\nF\"!D@èEXû<@¢<Gı<D@GBè’û<@“[›ÒiD@', 1),
(53, 'DikilitaÅŸ -> Ayasofya', 97, 1, '\0\0\0\0\0\0\0\0\0\0äCèšÄú<@ª0¼fí€D@ÂCèÆú<@œèzañ€D@CèN˜ú<@§±€\0D@', 1),
(54, 'Ayasofya -> Yerebatan SarnÄ±cÄ±', 97, 1, '\0\0\0\0\0\0\0\0\0\0Cè™ú<@§±€\0D@©Cèrtú<@e&¥D@èCè–}ú<@4Ÿp\"D@Dèz{ú<@xÆD@', 1),
(55, 'TopkapÄ± -> Arkeoloji MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0PCèFŸû<@‹nZjD@ÄBè®Fû<@~%G”XD@BCèÊîú<@R+UnD@', 1),
(56, 'RUHSAT_IZIN', 107, 1, '\0\0\0\0\0\0\0\0\0\0’\0ÜÙ;@edzÆ+½B@Â\0g×;@¼q	v˜¼B@Ä\0ŒB×;@xm·BÖ»B@Â\0g×;@–D³í»B@`\0¬?Ø;@f®v»B@g\0L­Ù;@7Pàa§»B@›\0\\Ú;@§\\ìV½B@â\0L&Ù;@¥{/½B@', 32),
(57, 'test45_1_l', 135, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@333333=@\0\0\0\0\0€D@', 16);

-- --------------------------------------------------------

--
-- Table structure for table `0__membership`
--

CREATE TABLE `0__membership` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `user_name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `password` varchar(32) CHARACTER SET latin1 NOT NULL,
  `email_address` varchar(50) CHARACTER SET latin1 NOT NULL,
  `access_level` int(1) NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `user_tables` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__membership`
--

INSERT INTO `0__membership` (`id`, `first_name`, `last_name`, `profession`, `user_name`, `password`, `email_address`, `access_level`, `approval`, `user_tables`) VALUES
(1, 'murat FÄ±stÄ±kÃ§Ä±', 'kendir Åahap', '', 'muratkendir', '252aea65536ae7423623ca54488c9bdc', 'muratkendir@gmail.com', 15, 1, '1__ionia,1__turkishinstruments,1__eminonumuseums,1__ed50_3_derece,1__aynalar,1__camiler'),
(2, 'osman', 'kenevir', '', 'osmankenevir', '252aea65536ae7423623ca54488c9bdc', 'osmankenevir@hatmeyil.com', 2, 0, ''),
(16, 'demo', 'demo', '', 'demo', 'e10adc3949ba59abbe56e057f20f883e', 'demo@demo.com', 3, 1, '16__fakulteler,16__campus_area,16__test45'),
(25, 'burcu', 'celebi', 'Survey Engineer/Geomatics', 'B', 'd1c9a3b47be1ed2599196a8a5fd4ec45', 'burcelebi@gmail.com', 2, 1, ''),
(24, 'M Ozan', 'Karaman', 'Survey Engineer/Geomatics', 'ozan0104', '3fc669818dd2b2482ffcc2ef69d1e978', 'ozan0104@gmail.com', 2, 1, ''),
(23, 'Behzat', 'Ulucan', 'Survey Engineer/Geomatics', 'behzatulucan', '196757b7487eb46b34c09e057ac32e3f', 'behzatulucan@gmail.com', 2, 1, ''),
(21, 'esra', 'elacmaz', 'City Planner', 'esracmaz', '848cd2309b325a6af2155e1f64010599', 'esracmaz@hotmail.com', 2, 1, ''),
(26, 'HÃ¼seyin', 'Kurt', 'Survey Engineer/Geomatics', 'pgss21', 'eadeb7960f3b32172dca166a1522a5f3', 'hsyn.kurt21@gmail.com', 2, 1, ''),
(22, 'deneme3', 'osman', 'Survey Engineer/Geomatics', 'deneme45', '252aea65536ae7423623ca54488c9bdc', 'deneme5@hatmayil.com', 2, 1, ''),
(27, 'Ã–nder', 'Ã–zÃ¼temiz', 'Survey Engineer/Geomatics', 'korsaatci', '5399ca5342cc745d97983d7038ab565d', 'o_ozutemiz@yahoo.com', 2, 1, '27__oturdugum_evler'),
(28, 'Rahmi Nurhan', 'Ã‡elik', 'Survey Engineer/Geomatics', 'celikn', 'd9c48329a448adc1aeb7819ce39bc5d9', 'celikn@itu.edu.tr', 2, 1, ''),
(29, 'mehmet sinan', 'bilgiÃ§', 'Survey Engineer/Geomatics', 'mesib', 'b29f57edfe9da908b94f66ea6b31baef', 'puhten@hotmail.com', 2, 1, ''),
(30, 'Walter', 'Andreeff', 'Survey Engineer/Geomatics', 'wandreef@gmail.com', '0d0138424a2f50c471a52fdfa3201e02', 'wandreef@gmail.com', 2, 1, ''),
(31, 'Ã‡iÄŸdem', 'TÃ¼ren', 'Survey Engineer/Geomatics', 'goolem', '9bda59bb217175557f30f4f51c7a41fe', 'turencigdem@gmail.com', 2, 1, ''),
(32, 'Ã‡aÄŸdaÅŸ', 'Korkmaz', 'Survey Engineer/Geomatics', 'cagdaskorkmaz', 'f1d657c72dc01d9db88f932cf40c841f', 'cgdskrkmz@hotmail.com', 2, 1, '32__kuscami,32__kuscami_ocagi'),
(33, 'Sistem', 'Murat', 'Survey Engineer/Geomatics', 'muratsistem', '252aea65536ae7423623ca54488c9bdc', 'deneme@sharklasers.com', 2, 1, '33__cbs_kurumlar'),
(34, 'Matthieu', 'Molinier', 'Survey Engineer/Geomatics', 'MatthieuM', '23ae4d0e70450ab64a2647d010a77350', 'matthieu.molinier @vtt.fi', 2, 1, ''),
(35, 'deneme', 'deneme34', 'Survey Engineer/Geomatics', 'zencefil', '00001926', 'zencefil@operamail.com', 2, 1, ''),
(36, 'esra', 'elaÃ§maz', 'Survey Engineer/Geomatics', 'esraelacmaz', 'zbambam08', 'esraelacmaz@gmail.com', 2, 1, ''),
(38, 'SistemAS', 'HiTarget', 'Survey Engineer/Geomatics', 'sistemas', '9c59fa943aa39f1cd3c820128b591cb4', 'muratkendir@sistemas.com.tr', 2, 1, ''),
(37, 'Ozan', 'Tan', 'Database Operator', 'ozantan', 'e10adc3949ba59abbe56e057f20f883e', 'ozantan@gmail.com', 2, 1, ''),
(39, 'Zeynel', 'AydÄ±n', 'Survey Engineer/Geomatics', 'aydinzey', '9f28452a2bc39d52486eeb8338dd867a', 'zafenapena@gmail.com', 2, 1, ''),
(40, 'Murat', 'Akcan', 'Survey Engineer/Geomatics', 'akcanmrat', '80c85e948f5a660e962e63063c840b33', 'mrtakcn1@gmail.com', 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `0__point`
--

CREATE TABLE `0__point` (
  `id` int(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `frame_id` int(24) NOT NULL,
  `public_private` tinyint(1) NOT NULL,
  `point_point` point NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__point`
--

INSERT INTO `0__point` (`id`, `title`, `frame_id`, `public_private`, `point_point`, `owner_id`) VALUES
(40, 'Elektrik/Elektronik FakÃ¼ltesi GiriÅŸi', 79, 0, '\0\0\0\0\0\0\0åÒø…W=@×w4ÄgD@', 1),
(38, 'Ä°nÅŸaat FakÃ¼ltesi GiriÅŸi', 79, 0, '\0\0\0\0\0\0\0XU/¿Ó=@Ko$uD@', 1),
(39, 'Yeni RektÃ¶rlÃ¼k BinasÄ± GiriÅŸi', 79, 0, '\0\0\0\0\0\0\0\n:Hx=@¼Ôc¶¿D@', 1),
(23, 'osman nokta 1', 52, 0, '\0\0\0\0\0\0\0ÍÌÌÌÌ=@fffff†D@', 2),
(41, 'Maden FakÃ¼ltesi A GiriÅŸi', 79, 0, '\0\0\0\0\0\0\0&~ÖF†=@ó²ÏjD@', 1),
(42, 'Maden FakÃ¼ltesi B GiriÅŸi', 79, 0, '\0\0\0\0\0\0\0\\¯Dû³=@¤­¥ÛmD@', 1),
(43, 'Mustafa Ä°nan KÃ¼tÃ¼phanesi GiriÅŸi', 79, 0, '\0\0\0\0\0\0\0€5½z=@šX…rGD@', 1),
(51, 'Ä°TÃœ Ä°ÅŸletme MÃ¼hendisliÄŸi GiriÅŸi', 85, 0, '\0\0\0\0\0\0\0ªA-ÿ<@çdó‚™…D@', 16),
(48, 'Ä°TÃœ Ä°nÅŸaat FakÃ¼ltesi GiriÅŸi', 84, 0, '\0\0\0\0\0\0\0^¶BıÓ=@xÔ˜sD@', 16),
(49, 'Ä°TÃœ FEB GiriÅŸi', 84, 0, '\0\0\0\0\0\0\0¹WAg-=@\0I\"E®D@', 16),
(50, 'Ä°TÃœ Makina FakÃ¼ltesi GiriÅŸi', 86, 0, '\0\0\0\0\0\0\0Æ‚gçÙı<@•é%Æ„D@', 16),
(273, '104_beijing', 137, 1, '\0\0\0\0\0\0\0\"‡ˆ]@E)!XUõC@', 1),
(46, 'macka guney-dogu', 82, 0, '\0\0\0\0\0\0\0V],±×ş<@VÏî5©…D@', 1),
(47, 'macka kuzey-batÄ±', 82, 0, '\0\0\0\0\0\0\0€;¨ş<@‰ğ/‚Æ…D@', 1),
(52, 'Ä°TÃœ YabancÄ± Diller KampÃ¼sÃ¼ GiriÅŸi', 85, 0, '\0\0\0\0\0\0\04˜+(±ş<@ëi,´…D@', 16),
(53, 'Ä°BB StadÄ±', 84, 0, '\0\0\0\0\0\0\0	}ı×ø=@.âvD@', 16),
(55, 'Bilisim Enstitusu', 84, 0, '\0\0\0\0\0\0\0ø|ı›4=@N–¢KFD@', 16),
(56, 'Vadi Yurtlari', 84, 0, '\0\0\0\0\0\0\0|ıçA=@.$ú9D@', 16),
(57, 'Vadsi', 83, 0, '\0\0\0\0\0\0\0Îó—\'K=@«ßÖŒD@', 16),
(58, 'deneme', 84, 1, '\0\0\0\0\0\0\0Îó—\'K=@«ßÖŒD@', 16),
(59, 'Leach Pad Phase 1 - 8', 87, 1, '\0\0\0\0\0\0\0NCTáÏÿS@Å\Z.rOyG@', 16),
(60, 'Leach Pad Phase 1 - 7', 87, 1, '\0\0\0\0\0\0\0’Ï+zÿS@40ò²&zG@', 16),
(61, 'Leach Pad Phase 1 - 4', 87, 1, '\0\0\0\0\0\0\0+¿Æˆ\0T@\0\0\0\0\0zG@', 16),
(62, 'Leach Pad Phase 1 - 5', 87, 1, '\0\0\0\0\0\0\0-Ğîb\0T@4õºE`zG@', 16),
(63, 'Leach Pad Phase 1 - 6', 87, 1, '\0\0\0\0\0\0\0¬«µ\0T@ÎŒ~4œzG@', 16),
(64, 'Koldar', 88, 1, '\0\0\0\0\0\0\0®YºÄIúS@ÎêW‘{G@', 1),
(65, 'Krayniy', 88, 1, '\0\0\0\0\0\0\07o…lşS@z“¶#â}G@', 1),
(66, 'Kyryk', 88, 1, '\0\0\0\0\0\0\0\ry™›NüS@şP‚amzG@', 1),
(67, 'Lager', 88, 1, '\0\0\0\0\0\0\0H×ÿ3üS@n.Å{G@', 1),
(68, 'Saryzhal', 88, 1, '\0\0\0\0\0\0\0Gı7\'İòS@¹¨X-{G@', 1),
(69, 'Shygys', 88, 1, '\0\0\0\0\0\0\0¤ê‘å(ÿS@áúfQvG@', 1),
(70, 'Kiak', 88, 1, '\0\0\0\0\0\0\0Î.zâõS@Õê½pG@', 1),
(71, 'Trig_x', 88, 1, '\0\0\0\0\0\0\0Š—DIŠ÷S@‘¾ƒ~*yG@', 1),
(72, 'Tumek', 88, 1, '\0\0\0\0\0\0\0&°s²˜ûS@¢»â±¸vG@', 1),
(73, 'Mys Koldara', 88, 1, '\0\0\0\0\0\0\0ZÿšfõS@‚d®Ê\ruG@', 1),
(74, 'TBM-1', 88, 1, '\0\0\0\0\0\0\0·ÿĞå°üS@w“J>—{G@', 1),
(75, 'TBM-2', 88, 1, '\0\0\0\0\0\0\0)F3¢¶üS@È©„ÄIyG@', 1),
(76, 'TBM-3', 88, 1, '\0\0\0\0\0\0\0^‡ÅeşS@Y£¢QyG@', 1),
(77, 'TBM-4', 88, 1, '\0\0\0\0\0\0\0rE1’`şS@)ó‡MzG@', 1),
(78, 'sevdugumun evi', 89, 0, '\0\0\0\0\0\0\0½3º?çD@ôĞ€lØ—D@', 21),
(79, 'sevdugumun isi', 89, 0, '\0\0\0\0\0\0\0S3ÊXëD@|–D@', 21),
(80, 'Kyryk (P.106)', 90, 1, '\0\0\0\0\0\0\0(Éc›NüS@ÉB®³%yG@', 1),
(81, 'Koldar (P.108)', 90, 1, '\0\0\0\0\0\0\0È©„ÄIúS@zW˜‘{G@', 1),
(82, 'TBM-1 (P. 110)', 90, 1, '\0\0\0\0\0\0\0ÒO›å°üS@$\0‹>—{G@', 1),
(83, 'TBM-2 (P. 111)', 90, 1, '\0\0\0\0\0\0\0C–ı¡¶üS@uÅÄIyG@', 1),
(84, 'TBM-3 (P.112)', 90, 1, '\0\0\0\0\0\0\0y×eşS@w–I¢QyG@', 1),
(85, 'TBM-4 (P.113)', 90, 1, '\0\0\0\0\0\0\0’`şS@Ö_ÈMzG@', 1),
(86, 'My Faculty', 92, 1, '\0\0\0\0\0\0\0ì´½ÂÖ=@nJöõpD@', 16),
(87, 'My Dormitory', 92, 0, '\0\0\0\0\0\0\0H´½8O=@Gê2Œ\"D@', 16),
(88, 'Stadium', 92, 1, '\0\0\0\0\0\0\0–µ½°ö=@•GùLD@', 16),
(123, 'miletus', 95, 1, '\0\0\0\0\0\0\0ÇeÜÔ@G;@çäE&àÃB@', 1),
(124, 'myus', 95, 1, '\0\0\0\0\0\0\0£v¿\nğm;@âwÓ-;ÌB@', 1),
(125, 'priene', 95, 1, '\0\0\0\0\0\0\0âwÓ-;L;@Ò9?ÅqÔB@', 1),
(126, 'ephesus', 95, 1, '\0\0\0\0\0\0\0=Y¤‰W;@ósCSvøB@', 1),
(127, 'colophon', 95, 1, '\0\0\0\0\0\0\0%ìÛID$;@sò\"ğ\rC@', 1),
(128, 'lebedos', 95, 1, '\0\0\0\0\0\0\0Q»_øö:@× /½ı	C@', 1),
(129, 'teos', 95, 1, '\0\0\0\0\0\0\0)\\ÂõÈ:@Üã5¯C@', 1),
(130, 'erythrae', 95, 1, '\0\0\0\0\0\0\0kÖß{:@lĞ—Şş0C@', 1),
(131, 'klazomenai', 95, 1, '\0\0\0\0\0\0\0/÷ÉQ€Ä:@ÓÀjØ-C@', 1),
(132, 'phocaea', 95, 1, '\0\0\0\0\0\0\0]‰@õÂ:@=\n×£pUC@', 1),
(133, 'chios', 95, 1, '\0\0\0\0\0\0\0%ìÛID:@333333C@', 1),
(134, 'samos', 95, 1, '\0\0\0\0\0\0\0u­½OUÕ:@\0\0\0\0\0àB@', 1),
(136, 'smyrna', 95, 1, '\0\0\0\0\0\0\0îÚ>F¤+;@ÇóôÓi;C@', 1),
(137, 'EskiÅŸehir', 96, 1, '\0\0\0\0\0\0\0¼s(C…>@ôpÓiãC@', 1),
(138, 'ElazÄ±ÄŸ', 96, 1, '\0\0\0\0\0\0\0ğœúœC@K\0ş)WC@', 1),
(139, 'izmir', 96, 1, '\0\0\0\0\0\0\0TW>Ëó ;@ıöuàœ5C@', 1),
(140, 'BeyazÄ±t Istanbul', 96, 1, '\0\0\0\0\0\0\0=ÖŒr÷<@Wì/»\'D@', 1),
(141, 'trabzon', 96, 1, '\0\0\0\0\0\0\0ÎˆÒŞàÛC@#J{ƒ/€D@', 1),
(142, 'Kayseri', 96, 1, '\0\0\0\0\0\0\0ÊRëıF½A@/ñ˜]C@', 1),
(143, 'Burdur', 96, 1, '\0\0\0\0\0\0\0)^emS@>@+1ÏJÈB@', 1),
(144, 'Ã‡emberlitaÅŸ', 97, 1, '\0\0\0\0\0\0\0Iú“ø<@$IïŸD@', 1),
(145, 'BasÄ±n MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0ÖVË!Òø<@¤ÇÎ_D@', 1),
(148, 'PadiÅŸah TÃ¼rbeleri MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0Š³¿?çú<@¦Êÿı€D@', 1),
(147, 'Mozaik MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0³@ı_\\ú<@5ùûÿ—€D@', 1),
(149, 'TopkapÄ± Saray MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0ôßÿû<@Á¡¿iD@', 1),
(150, 'Ä°stanbul Arkeoloji MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0Ùëİïú<@°ËğŸnD@', 1),
(151, 'DikilitaÅŸ', 97, 1, '\0\0\0\0\0\0\0enßÆú<@8Òßì€D@', 1),
(152, 'Yerebatan SarnÄ±cÄ±', 97, 1, '\0\0\0\0\0\0\0†ëÍzú<@\":ãD@', 1),
(153, 'Ayasofya MÃ¼zesi', 97, 1, '\0\0\0\0\0\0\0ôRÒ?˜ú<@Ä!<V\0D@', 1),
(156, 'KÄ°RACI MURAT KENDÄ°R', 101, 1, '\0\0\0\0\0\0\0\n\0\0=@èP¬…D@', 32),
(155, 'KÄ°RACI Ã‡AÄDAÅ KORMAZ', 101, 1, '\0\0\0\0\0\0\0¬ÿÿ4=@VĞŠSv‚D@', 32),
(160, 'F2220435', 104, 1, '\0\0\0\0\0\0\06++%A=@4}D@', 1),
(159, 'beylerbeyi polis karakolu', 79, 1, '\0\0\0\0\0\0\0éh²Nç\n=@¸êœ…D@', 1),
(169, 'Ä°BB Merter Ek Hizmet BinasÄ±', 110, 1, '\0\0\0\0\0\0\0\0\0\0€€â<@¦ˆq1D@', 33),
(162, 'KN1', 105, 1, '\0\0\0\0\0\0\0\"œWìr@@LãTÅC@', 1),
(163, 'KN2', 105, 1, '\0\0\0\0\0\0\0À(œ8s@@™kêŸTÅC@', 1),
(164, 'KN3', 105, 1, '\0\0\0\0\0\0\0±dØrøt@@ûæÆC@', 1),
(165, 'kn1', 106, 1, '\0\0\0\0\0\0\0‚1lŞÄC@úK¤—ÅfD@', 1),
(166, 'KUSCAMI', 107, 1, '\0\0\0\0\0\0\08ÿÿ_mØ;@ƒj­öM¼B@', 32),
(168, 'silence_stand', 109, 1, '\0\0\0\0\0\0\0ıøå\'\"=@V&¡™Ì}D@', 16),
(170, 'Ä°BB CBS Gen. MÃ¼d. SaraÃ§hane', 110, 1, '\0\0\0\0\0\0\0\0\0\0ê|ô<@cXoÂÁD@', 33),
(171, 'Ä°SKÄ° KaÄŸÄ±thane', 110, 1, '\0\0\0\0\0\0\0¶j×„´ö<@\'İ–È‹D@', 33),
(172, 'igdaÅŸ kavacÄ±k hizmet binasÄ±', 110, 1, '\0\0\0\0\0\0\0‹ÿÿŸt=@\\’ÈoË‹D@', 33),
(173, 'Ã‡evre ve Åehircilik Ä°stanbul Ä°l MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', 110, 1, '\0\0\0\0\0\0\0êÿÿ{r=@U?lˆP‡D@', 33),
(174, 'Ã¼skÃ¼dar pilye', 111, 1, '\0\0\0\0\0\0\0ğ‚š·=@ı¥¿º‚D@', 1),
(175, 'MuÄŸla Ä°l Ã–zel Ä°daresi', 113, 1, '\0\0\0\0\0\0\0Ô,Ğî^<@(îx“ßšB@', 33),
(176, 'MuÄŸla KÃ¼ltÃ¼r VarlÄ±klarÄ±nÄ± Kor. BÃ¶l. Kur.', 113, 1, '\0\0\0\0\0\0\0¸’\\<@Lª¶›à›B@', 33),
(177, 'MuÄŸla Ã‡ÅB Ä°l MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0dÎ3ö%[<@ó“jŸ›B@', 33),
(178, 'AydÄ±n Ä°l Ã–zel Ä°daresi', 113, 1, '\0\0\0\0\0\0\0¤‹M+…Ô;@LbõGìB@', 33),
(179, 'AydÄ±n Ã‡ÅB Ä°l MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0ê=•ÓÒ;@ËfI-ìB@', 33),
(180, 'Ä°zmir Orman Ä°l Gen. MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0\rà- ;@B=}:C@', 33),
(181, 'Ä°zmir Ã‡ÅB Ä°l MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0JFÎÂ*;@İa™¹:C@', 33),
(182, 'Ä°zmir BB', 113, 1, '\0\0\0\0\0\0\0:“6U÷ ;@“°«É5C@', 33),
(183, 'Ä°ZSU', 113, 1, '\0\0\0\0\0\0\0\r\Zú\'¸ ;@vÃ¶E5C@', 33),
(184, 'Gediz Elektrik', 113, 1, '\0\0\0\0\0\0\0¢\rÀD0;@½8d9C@', 33),
(185, 'DEU MÃ¼hendislik Fak.', 113, 1, '\0\0\0\0\0\0\0÷ç¢!ã5;@1]ˆÕ/C@', 33),
(186, 'VGM Ä°zmir', 113, 1, '\0\0\0\0\0\0\0÷V$&¨!;@µl­/6C@', 33),
(187, 'Ä°zmirGaz', 113, 1, '\0\0\0\0\0\0\0\0\0\0`¤+;@r\'úMY7C@', 33),
(188, 'MuÄŸla Belediyesi', 113, 1, '\0\0\0\0\0\0\0Hà?ÿ]<@ºì¿Î›B@', 33),
(189, 'TarÄ±m ve KÃ¶yiÅŸleri MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0üıÿOd[<@Á˜+(‰›B@', 33),
(190, 'KarayollarÄ± 26. Åube MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0=õKà]<@CX6¡ÁšB@', 33),
(191, 'Orman BÃ¶lge MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', 113, 1, '\0\0\0\0\0\0\0àõ\'}]<@Jİ3›B@', 33),
(192, 'MuÄŸla Ãœniversitesi CBS', 113, 1, '\0\0\0\0\0\0\0ãĞ‰ì_<@ÕCš5•B@', 33),
(193, 'MuÄŸla Ä°l Afet ve Acil Durum', 113, 1, '\0\0\0\0\0\0\0]Ş®Õ^<@ìì†m›B@', 33),
(194, 'AydÄ±n DSÄ°', 115, 1, '\0\0\0\0\0\0\0•\'\n	Ö;@6f–ëB@', 33),
(195, 'AydÄ±n KarayollarÄ±', 115, 1, '\0\0\0\0\0\0\0 ”\'ÎqÖ;@¸‡-‹QëB@', 33),
(196, 'AydÄ±n Orman Genel MÃ¼d.', 115, 1, '\0\0\0\0\0\0\0Ò“\'¶ÍÎ;@‡N5´ìB@', 33),
(197, 'AydÄ±n KÃ¼ltÃ¼r Turizm', 115, 1, '\0\0\0\0\0\0\0IZÖı×;@ 4Ô($íB@', 33),
(198, 'UTAEM', 113, 1, '\0\0\0\0\0\0\0[]N	ˆ\r;@$cµùSC@', 33),
(199, 'MuÄŸla BESOT', 114, 1, '\0\0\0\0\0\0\0²Ç¥^<@RšˆÊ›B@', 33),
(200, 'MuÄŸla DSÄ°', 114, 1, '\0\0\0\0\0\0\0\ZÇU^<@6µ¿¶šB@', 33),
(201, 'AydÄ±n Belediyesi', 115, 1, '\0\0\0\0\0\0\0b“\'´˜Ø;@?A¶ÿqìB@', 33),
(202, 'AydÄ±n DefterdarlÄ±k', 115, 1, '\0\0\0\0\0\0\0À”\'ÔZØ;@U¶ıÈéìB@', 33),
(203, 'AydÄ±n TarÄ±m ve KÃ¶yiÅŸleri Ä°l MÃ¼d.', 115, 1, '\0\0\0\0\0\0\0^”\'ÆàØ;@‘PdT@ëB@', 33),
(204, 'Ä°zmir BB CSB Åb MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0îõ«ù!;@ğp1=ü5C@', 33),
(205, 'Ä°ZSU', 113, 1, '\0\0\0\0\0\0\0zõË4!;@Q£?•¹5C@', 33),
(206, 'Ä°zmir Turizm ve KÃ¼ltÃ¼r BakanlÄ±ÄŸÄ± Ä°l MÃ¼d.', 113, 1, '\0\0\0\0\0\0\0¯õ[³!;@Eo‹¼J6C@', 33),
(207, 'Ä°zmir BB Kentsel DÃ¶nÃ¼ÅŸÃ¼m Hizm.', 113, 1, '\0\0\0\0\0\0\0÷õ3½!;@[Äáë\06C@', 33),
(208, 'Trabzon Ä°l Ã–zel Ä°dare', 110, 1, '\0\0\0\0\0\0\0\0çC@CX~D@', 33),
(209, 'Trabzon DSÄ°', 110, 1, '\0\0\0\0\0\0\0 ÿÿ»jêC@ÌÍTUœ}D@', 33),
(210, 'SEDAÅ', 110, 1, '\0\0\0\0\0\0\0ÏÿÿGÌb>@k½í½ˆ_D@', 33),
(211, 'Samsun Ä°l Ã–zel Ä°daresi', 110, 1, '\0\0\0\0\0\0\04\0\0®â\'B@¬LË˜©D@', 33),
(212, 'Ordu Ä°l Ã–zel Ä°daresi', 110, 1, '\0\0\0\0\0\0\0o\0\0Š\nöB@c„„}D@', 33),
(213, 'Giresun Ä°l Ã–zel Ä°daresi', 110, 1, '\0\0\0\0\0\0\0ßşÿçg+C@Lt->ştD@', 33),
(214, 'Artvin Ä°l Ã–zel Ä°daresi', 110, 1, '\0\0\0\0\0\0\0—ÿÿÙµéD@ùtHc—D@', 33),
(215, 'Sivas Belediyesi', 110, 1, '\0\0\0\0\0\0\06ÿÿ»‚B@Ì2é\ZàC@', 33),
(216, 'Zonguldak TTK', 110, 1, '\0\0\0\0\0\0\0Zıÿ©Ã?@ò¼˜~·D@', 33),
(217, 'Ankara Orman ve SuiÅŸleri BakanlÄ±ÄŸÄ±', 110, 1, '\0\0\0\0\0\0\0¿ÿÿÕŒf@@˜˜özöC@', 33),
(218, 'beylerbeyi', 83, 1, '\0\0\0\0\0\0\0eÿ53\r=@°,m…D@', 16),
(219, 'GÃ¶kÃ§eada deprem', 117, 1, '\0\0\0\0\0\0\0‡ÙÎ÷s9@òÒMb(D@', 1),
(220, 'ozan', 119, 1, '\0\0\0\0\0\0\0Ãe6â:@›9$µP-C@', 16),
(221, 'MÃ¼ÅŸteri1', 124, 1, '\0\0\0\0\0\0\0\0\0\0\0 2;@?Yöd9C@', 1),
(222, 'MÃ¼ÅŸteri2', 124, 1, '\0\0\0\0\0\0\0\0\0\0\0ğÿ;@ZG2.XC@', 1),
(223, '183_4', 121, 1, '\0\0\0\0\0\0\0hš	Šm¾:@]åµ.{\"C@', 16),
(274, '104_cenova', 137, 1, '\0\0\0\0\0\0\0IÛø•İ!@OIŸ4F@', 1),
(275, '112_rouen', 137, 1, '\0\0\0\0\0\0\0š™™™™™ñ?¸…ëQ¸H@', 1),
(276, 'sultanahmet', 138, 1, '\0\0\0\0\0\0\0:ÿÿİ	ú<@=ºÅ¯€D@', 1),
(229, 'Nokta1', 130, 1, '\0\0\0\0\0\0\0ç÷€{e@@!ó÷C@', 16),
(230, 'Nokta2', 130, 1, '\0\0\0\0\0\0\0šï\0j0;@	\'Ãœ:C@', 16),
(231, '1', 133, 1, '\0\0\0\0\0\0\0\0\0\0\0@e=@¥Û\nömîC@', 16),
(232, '_2', 133, 1, '\0\0\0\0\0\0\0\0\0\0ğ\"B@:òtƒB@', 16),
(233, 'test45_1', 135, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0€D@', 16),
(234, 'test45_2', 135, 1, '\0\0\0\0\0\0\0333333=@\0\0\0\0\0€D@', 16),
(235, '10-exu', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0@\nHÀş¥çÒÜ1/À', 1),
(236, '11-tassiliki', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\"@\0\0\0\0\0€9@', 1),
(237, '13-dagara', 137, 1, '\0\0\0\0\0\0\0 µ‰“û÷¿+j0\r£@', 1),
(238, '17-y azi', 137, 1, '\0\0\0\0\0\0\0Ó\0\0\0$¾E@#bŸ„Ë@@', 1),
(239, '19-masa_ayinleri', 137, 1, '\0\0\0\0\0\0\0YÚ©¹Ü^C@şG¦C§ıB@', 1),
(240, '20-bira', 137, 1, '\0\0\0\0\0\0\0ññ	Ùy÷F@Œ¿í	Ÿ?@', 1),
(241, '21-sarap', 137, 1, '\0\0\0\0\0\0\0ŸË24J@CqÇ›ü>@', 1),
(242, '21-gilgamis', 137, 1, '\0\0\0\0\0\0\0W%‘}ÑF@CqÇ›üR?@', 1),
(243, '22-maui', 137, 1, '\0\0\0\0\0\0\0¯µ÷©ªŠcÀÍÌÌÌÌÌ4@', 1),
(244, '24-rosetta', 137, 1, '\0\0\0\0\0\0\0ğÁk—6@?@36t³?Ø=@', 1),
(245, '27-tavuk', 137, 1, '\0\0\0\0\0\0\0BwIœM@@-ÌB;§½9@', 1),
(246, '28-hatsepsut', 137, 1, '\0\0\0\0\0\0\0Õ{*§=M@@’\"‹4½9@', 1),
(247, '30-savas_tiyatrosu', 137, 1, '\0\0\0\0\0\0\0]ıØ$¿î`@Gä»”ºDA@', 1),
(248, '31-savas_sanati', 137, 1, '\0\0\0\0\0\0\033333“]@TR\' ‰hB@', 1),
(249, '31-lao-tse', 137, 1, '\0\0\0\0\0\0\0•C‹lß[@‹lçû©‘@@', 1),
(250, '33-cin_kitabi', 137, 1, '\0\0\0\0\0\0\0ò—õIo\\@=\r$}2A@', 1),
(251, '38-yang_huanyi', 137, 1, '\0\0\0\0\0\0\0Ë¡E¶óÕ[@ÙÎ÷SãE9@', 1),
(252, '43-cicero', 137, 1, '\0\0\0\0\0\0\0­Mc{-8+@¾ˆ¶cêÒD@', 1),
(253, '44_terme', 137, 1, '\0\0\0\0\0\0\0TpxAD„B@š™™™™™D@', 1),
(254, '48-milet', 137, 1, '\0\0\0\0\0\0\0ÇeÜÔ@G;@çäE&àÃB@', 1),
(255, '51-gottingen', 137, 1, '\0\0\0\0\0\0\05\'/2ß#@ÚX‰yVÄI@', 1),
(256, '53-pella', 137, 1, '\0\0\0\0\0\0\0u­½OU6@E)!XUuD@', 1),
(257, '54-truva', 137, 1, '\0\0\0\0\0\0\0È_ZÔ\'=:@Ãõ(\\úC@', 1),
(258, '62-istankoy', 137, 1, '\0\0\0\0\0\0\0{®Gá:;@ÍÌÌÌÌlB@', 1),
(259, '63-miletus', 137, 1, '\0\0\0\0\0\0\0ÇeÜÔ@G;@çäE&àÃB@', 1),
(260, '63-midilli', 137, 1, '\0\0\0\0\0\0\0ÍÌÌÌÌŒ:@ÍÌÌÌÌŒC@', 1),
(261, '66_sicilya_enna', 137, 1, '\0\0\0\0\0\0\0¸!Æk^,@øàµKÈB@', 1),
(262, '67_capua', 137, 1, '\0\0\0\0\0\0\0ÃòçÛ‚m,@ÃòçÛ‚D@', 1),
(263, '69_rome', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0)@33333óD@', 1),
(264, '70_iskenderiye', 137, 1, '\0\0\0\0\0\0\0Ñ\"Ûù~ê=@333333?@', 1),
(265, '78_kapadokya', 137, 1, '\0\0\0\0\0\0\0ôpÓikA@{mÇÔUC@', 1),
(266, '79_oaxaca', 137, 1, '\0\0\0\0\0\0\0´Èv¾Ÿ\ZXÀfffffæ0@', 1),
(267, '81_new_york', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0\0€RÀš™™™™YD@', 1),
(268, '83_iskendireye', 137, 1, '\0\0\0\0\0\0\0ìQ¸…ë=@333333?@', 1),
(269, '85_basra', 137, 1, '\0\0\0\0\0\0\0y\\T‹ˆèG@\0\0\0\0\0€>@', 1),
(270, '88_bagdat', 137, 1, '\0\0\0\0\0\0\0!=E1F@»ÖŞ§ªª@@', 1),
(271, '89_beziers', 137, 1, '\0\0\0\0\0\0\0—nƒÀ	@x$(~¬E@', 1),
(272, '91_maarat', 137, 1, '\0\0\0\0\0\0\0¶f+/ùUB@ÔîW¾ÑA@', 1);

-- --------------------------------------------------------

--
-- Table structure for table `0__polygon`
--

CREATE TABLE `0__polygon` (
  `id` int(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `frame_id` int(24) NOT NULL,
  `public_private` tinyint(1) NOT NULL,
  `polygon_polygon` polygon NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__polygon`
--

INSERT INTO `0__polygon` (`id`, `title`, `frame_id`, `public_private`, `polygon_polygon`, `owner_id`) VALUES
(20, 'Mustafa Ä°nan KÃ¼tÃ¼phanesi', 79, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\04é\0ÒH=@¶“Ò}JD@›<e5]=@Vû*¯KD@kN¹u=@KD@u”Ş’w=@¬.GD@’›~=@šX…rGD@´kŒç}=@]RJD@ıˆ_±†=@ìÚŞnID@›@lD‹=@;àºbFD@¦ºÛPŒ=@é]afDD@1N2(‰=@Ñ¿n\"DD@<”W‹=@]~p>D@è0_^€=@Iö5CD@Õ@ó9w=@º#­BD@ GÖ+v=@æàã]?D@–1ô>D=@¥3û<D@ ÅJA=@Éå?D@•ı©§E=@†H<@D@4é\0ÒH=@¶“Ò}JD@', 1),
(5, 'osman polygon 1', 52, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0Ãõ(\\=@áz®GD@\n×£p=\n=@Ãõ(\\‚D@Âõ(\\=@fffff†D@Ãõ(\\=@áz®GD@', 2),
(21, 'Ä°nÅŸaat FakÃ¼ltesi', 79, 0, '\0\0\0\0\0\0\0\0\0\0	\0\0\0ÿæÅ‰¯=@=\n×£pD@wÃÿ=@²²ÇUvD@ô¥·?=@Û%»ã^D@å}=@]õ%ÀUD@=†\"8‰=@S\\Uö]D@ÂGiÛÕ=@¼\\ÄwbD@M\nJÑ=@ÉaæñjD@	ù g³=@SK)iD@ÿæÅ‰¯=@=\n×£pD@\0\0\0?*á=@FMªlD@¹mß£ş=@VÈ¦¦nD@øx×=@ßtdD@~5æ=@ıKR™bD@?*á=@FMªlD@', 1),
(25, 'Ä°nÅŸaat FakÃ¼ltesi Parseli', 84, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0iC´=@FrVvD@şz*L„=@o´ˆÍlD@ç·×=@ò´üÀUD@_Ì;ó=@^2éJ_D@iC´=@FrVvD@', 16),
(26, 'FEB FakÃ¼lte Parseli', 84, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0yt#,*=@›ü»ã¹D@vÕMs<=@¥·ä]šD@Ñ,¿Â=@¨4bfŸD@a‚dK =@\ZM.ÆÀD@yt#,*=@›ü»ã¹D@', 16),
(22, 'Yeni RektÃ¶rlÃ¼k BinasÄ±', 79, 0, '\0\0\0\0\0\0\0\0\0\0\n\0\0\0D:—=d=@ö§ÍD@ƒyÙÀg=@Íx[éµD@6Uœt=@0€À¹D@kN¹u=@ÓrVú¿D@O¸\rY“=@gä=ÂD@Û®Ç=@\\+ÌD@\\s=@¤%E\ZËD@÷I¤#o=@V@FåËD@-wÉn=@F‘ZÍD@D:—=d=@ö§ÍD@', 1),
(23, 'Maden FakÃ¼ltesi', 79, 0, '\0\0\0\0\0\0\0\0\0\0\r\0\0\0Z ‹~=@kéâiD@T	[Û=@ùdÅpD@TÕºÃÜ=@²Ãó­jD@ÚÅ4Ó½=@‰’5hD@îéêÅ=@kúG:^D@“ıFà=@“+Y`D@gÅ&èå=@g}Ê1YD@ÂÎ^ÇÉ=@¼mğÏVD@@±Õ=@Iö5CD@¯Şò¢À=@P0AD@Æm4€·=@EW3|UD@Ğ{O=@4Äg¡SD@Z ‹~=@kéâiD@\0\0\0d!:=@\n‘eD@Ø%Oş“=@¿êmØ[D@\'¶\'í²=@¸ßFo]D@èª/®=@xÿi´fD@d!:=@\n‘eD@', 1),
(28, 'Tenis KortlarÄ±', 84, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0Ã|ı_b=@Ä1ÖD@™}ı/e=@>P»LD@ü|ıùš=@ìÄÑD@H}ıÏ—=@)„_|D@Ã|ı_b=@Ä1ÖD@', 16),
(29, 'Kimya FakÃ¼ltesi', 84, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0ô}ıé!=@àÏçbD@r}ı\\\'=@›„^D@	~ıÏ,=@åØA‘TD@ø}½®$=@&¿ÄSD@~}\'=@°»ışND@½}ı2$=@+&¹ND@ }ım%=@#‘»JD@E}-ı)=@šÄğJD@$}],=@˜«Ä_FD@ì}½ü0=@C}GD@è}}4=@Ã&Ù@D@}ı:+=@Ô:ø?D@ğ}ıİ-=@.$ú9D@}ı\' =@õ\r§8D@ü|ı =@*à÷S7D@Ç|ıó=@œñ4D@/|ıGâ=@§M6^D@ô}ıé!=@àÏçbD@', 16),
(30, 'Open Pit Area', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\00£W›’ıS@§XöW}G@3£Wk•ıS@ÛrçÅ{G@£WVşS@‰èëe{G@>£WSèşS@¿ôCê{G@£W#EÿS@$xpV\\{G@J£W£.ÿS@QF.Ü|G@*£Ws×şS@3	¡s4}G@G£WKZşS@j€è±.}G@c£W3şS@ÖRËïo}G@T£WÏıS@ ùXl}G@0£W›’ıS@§XöW}G@', 16),
(31, 'Leach Pad Phase 2 (approximately)', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0~£W+ÅşS@Xú$A°yG@g£W{eÿS@,*ĞÊ\"xG@=£WÛm\0T@Ç0R7	yG@i£WãÀÿS@ÍuÑÔyzG@~£W+ÅşS@Xú$A°yG@', 16),
(32, 'Leach Pad Phase 1 (approx.)', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0£WÅÿS@˜Ô@À{zG@£WCo\0T@7°e\ryG@\"£Wã(T@şå(j¬yG@ù¢W»«\0T@ÏC¤zG@ò¢W£\0T@yB·zG@£WëÿS@ŒõıMzG@£WÅÿS@˜Ô@À{zG@', 16),
(33, 'deneme', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0£W«\0T@Ò 2e|G@£W›ÛÿS@^À®÷|{G@B£WÌ\0T@©$.F¥{G@£W«\0T@Ò 2e|G@', 16),
(34, 'Proje Sorumluluk AlanÄ±', 88, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0Zh	Í3\0T@RÉc(n{G@yh	\rzT@D-±xG@‹h	\rEúS@Ó˜´kxwG@‚h	úS@°){G@Zh	Í3\0T@RÉc(n{G@', 1),
(35, 'sevdugumun poligonu', 89, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0æ3jöéD@N\"uí—D@+3zåêD@ätäã?—D@è3JèêD@<Ê²èš—D@ã3š§êD@¢Á\nÂà—D@æ3jöéD@N\"uí—D@', 21),
(36, 'Stadium-Dorm-Faculty Triangulation', 92, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0µ½bR=@yîIß#D@–´½¢õ=@É\"ÌD@/µ½òÓ=@`3gtD@µ½bR=@yîIß#D@', 16),
(37, 'KÄ°RACI Ã‡AÄDAÅ KORKMAZ', 101, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0m\0-=@ñ	•úx‚D@¹\0=@ä4ó2u‚D@H\0‰=@Û`€¬s‚D@\r\0ÿ\Z=@^–w‚D@m\0-=@ñ	•úx‚D@', 32),
(38, 'KÄ°RACI MURAT KENDÄ°R', 101, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0I\0€‡=@ß!8	®…D@ä\0€Í=@ªy!©…D@Øÿ\r=@!<«…D@^\0€m=@»{Œ~¯…D@I\0€‡=@ß!8	®…D@', 32),
(40, 'epsg2319', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0×£p=\n—9@\0\0\0\0\0@B@×£p=\n—9@ÍÌÌÌÌE@\0\0\0\0\0€<@ÍÌÌÌÌE@\0\0\0\0\0€<@\0\0\0\0\0@B@×£p=\n—9@\0\0\0\0\0@B@', 1),
(42, 'epsg2320', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€<@fffffB@\0\0\0\0\0€<@ÍÌÌÌÌE@\0\0\0\0\0€?@ÍÌÌÌÌE@\0\0\0\0\0€?@fffffB@\0\0\0\0\0€<@fffffB@', 1),
(43, 'epsg2321', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€?@33333óA@\0\0\0\0\0€?@ÍÌÌÌÌE@\0\0\0\0\0@A@ÍÌÌÌÌE@\0\0\0\0\0@A@33333óA@\0\0\0\0\0€?@33333óA@', 1),
(44, 'epsg2322', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@A@š™™™™ÙA@\0\0\0\0\0@A@ÍÌÌÌÌE@\0\0\0\0\0ÀB@ÍÌÌÌÌE@\0\0\0\0\0ÀB@š™™™™ÙA@\0\0\0\0\0@A@š™™™™ÙA@', 1),
(45, 'epsg2323', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÀB@ÍÌÌÌÌLB@\0\0\0\0\0ÀB@33333“D@\0\0\0\0\0@D@33333“D@\0\0\0\0\0@D@ÍÌÌÌÌLB@\0\0\0\0\0ÀB@ÍÌÌÌÌLB@', 1),
(46, 'epsg2324', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@D@\0\0\0\0\0€B@\0\0\0\0\0@D@ÍÌÌÌÌÌD@\0\0\0\0\0ÀE@ÍÌÌÌÌÌD@\0\0\0\0\0ÀE@\0\0\0\0\0€B@\0\0\0\0\0@D@\0\0\0\0\0€B@', 1),
(47, 'epsg2325', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÀE@33333sB@\0\0\0\0\0ÀE@\0\0\0\0\0ÀD@ÍÌÌÌÌlF@\0\0\0\0\0ÀD@ÍÌÌÌÌlF@33333sB@\0\0\0\0\0ÀE@33333sB@', 1),
(48, 'EPSG:23035', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08@\0\0\0\0\0`A@\0\0\0\0\0\08@33333T@\0\0\0\0\0\0>@33333T@\0\0\0\0\0\0>@\0\0\0\0\0`A@\0\0\0\0\0\08@\0\0\0\0\0`A@', 1),
(49, 'EPSG:23036', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>@\0\0\0\0\0\0?@\0\0\0\0\0\0>@fffff¦E@\0\0\0\0\0\0B@fffff¦E@\0\0\0\0\0\0B@\0\0\0\0\0\0?@\0\0\0\0\0\0>@\0\0\0\0\0\0?@', 1),
(50, 'EPSG:23037', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B@\n×£p=êA@\0\0\0\0\0\0B@fffff¦E@\0\0\0\0\0\0E@fffff¦E@\0\0\0\0\0\0E@\n×£p=êA@\0\0\0\0\0\0B@\n×£p=êA@', 1),
(51, 'EPSG:23038', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E@\0\0\0\0\0€B@\0\0\0\0\0\0E@33333ÓD@\0\0\0\0\0\0H@33333ÓD@\0\0\0\0\0\0H@\0\0\0\0\0€B@\0\0\0\0\0\0E@\0\0\0\0\0€B@', 1),
(52, '1', 132, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ò¸=@}9Äõ¿‹D@°\0\0\0öÁ=@6ÓK°ú†D@`\0\0|Ò=@™K\"L8‹D@í\0\0¤È=@Ê–ê[uD@\0\0Ò¸=@}9Äõ¿‹D@', 1);

-- --------------------------------------------------------

--
-- Table structure for table `0__table`
--

CREATE TABLE `0__table` (
  `id` int(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `public_private` tinyint(1) NOT NULL,
  `exact_name` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__table`
--

INSERT INTO `0__table` (`id`, `title`, `public_private`, `exact_name`, `owner_id`) VALUES
(0, 'Åantiye', 1, 'santiye', 16),
(1, 'FakÃ¼lteler', 1, 'fakulteler', 16),
(0, 'Aktogay Copper Project GPS Stations', 0, 'aktogay_copper_project_gps_stations', 1),
(0, 'deneme', 1, 'deneme', 1),
(0, 'fhj', 0, 'fhj', 16),
(0, 'Aktogay_Point_Table', 0, 'aktogay_point_table', 1),
(0, 'Campus Area', 1, 'campus_area', 16),
(0, 'OccupyGeziSolidarityMap', 1, 'occupygezisolidaritymap', 1),
(0, 'occupygezi', 1, 'occupygezi', 1),
(0, 'ionia_cities', 1, 'ionia_cities', 1),
(0, 'ionia cities', 1, 'ionia_cities', 1),
(0, 'IoniaCities', 1, 'ioniacities', 1),
(0, 'ionia_cities', 1, 'ionia_cities', 1),
(0, 'ionia', 1, 'ionia', 1),
(0, 'Turkish Folk Songs and origins', 1, 'turkish_folk_songs_and_origins', 1),
(0, 'turkishinstruments', 1, 'turkishinstruments', 1),
(0, 'EminonuMuseums', 1, 'eminonumuseums', 1),
(0, 'OturduÄŸum Evler', 0, 'oturdugum_evler', 27),
(0, 'MALÄ°K OSMAN GÃœNDÃœZ', 1, 'malik_osman_gunduz', 32),
(0, 'ED50_3_derece_dilimler', 1, 'ed50_3_derece_dilimler', 1),
(0, 'ED50_3_derece', 1, 'ed50_3_derece', 1),
(0, 'ed50_6_derece', 1, 'ed50_6_derece', 1),
(0, 'ed50_6_der', 1, 'ed50_6_der', 1),
(0, 'ED50UTM', 1, 'ed50utm', 1),
(0, '6derecelikUTM', 1, '6derecelikutm', 1),
(0, 'ed50utm', 1, 'ed50utm', 1),
(0, 'turkiyeutm', 1, 'turkiyeutm', 1),
(0, 'ed50_6_derece', 1, 'ed50_6_derece', 1),
(0, 'KUSÃ‡AMI', 1, 'kuscami', 32),
(0, 'KUSCAMÄ°', 1, 'kuscami', 32),
(0, 'KUSCAMÄ°', 1, 'kuscami', 32),
(0, 'KUSCAMI', 1, 'kuscami', 32),
(0, 'KUSCAMI OCAGI', 1, 'kuscami_ocagi', 32),
(0, 'Istanbul_CBS_IS', 0, 'istanbul_cbs_is', 1),
(0, 'IstanbulCBS', 0, 'istanbulcbs', 1),
(0, 'istcbs', 0, 'istcbs', 1),
(0, 'cbs', 1, 'cbs', 1),
(0, 'CBS_kurumlar', 0, 'cbs_kurumlar', 33),
(0, 'depremler', 1, 'depremler', 1),
(0, 'depremler', 1, 'depremler', 1),
(0, 'deprem', 1, 'deprem', 1),
(0, 'arkadasslarim', 1, 'arkadasslarim', 16),
(0, 'deneme', 1, 'deneme', 16),
(0, 'musterilerim', 1, 'musterilerim', 1),
(0, 'musteri', 1, 'musteri', 1),
(0, 'kbakkalkoytest', 1, 'kbakkalkoytest', 1),
(0, 'BuyukSehirler', 1, 'buyuksehirler', 16),
(0, 'tablo1', 1, 'tablo1', 1),
(0, 'banane', 1, 'banane', 1),
(0, 'sanane', 0, 'sanane', 1),
(0, 'test', 0, 'test', 1),
(0, 'testA', 1, 'testa', 16),
(0, 'test45', 1, 'test45', 16),
(0, 'aynalar', 1, 'aynalar', 1),
(0, 'test', 0, 'test', 1),
(0, 'test34', 1, 'test34', 1),
(0, 'test45', 0, 'test45', 1),
(0, 'camiler', 1, 'camiler', 1);

-- --------------------------------------------------------

--
-- Table structure for table `0__wms_layer`
--

CREATE TABLE `0__wms_layer` (
  `id` int(3) NOT NULL,
  `uniq_name` varchar(12) NOT NULL,
  `func_name` varchar(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `source` varchar(400) CHARACTER SET ascii NOT NULL,
  `options` varchar(400) NOT NULL,
  `script_id` int(24) NOT NULL,
  `Order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__wms_layer`
--

INSERT INTO `0__wms_layer` (`id`, `uniq_name`, `func_name`, `title`, `source`, `options`, `script_id`, `Order`) VALUES
(1, 'ggl_strts', 'Google', 'Google Streets', '', '{sphericalMercator: true}', 1, 4),
(2, 'ggl_stllt', 'Google', 'Google Satellite', '', '{type: google.maps.MapTypeId.SATELLITE, sphericalMercator: true}', 1, 5),
(3, 'ggl_hybrd', 'Google', 'Google Hybrid', '', '{type: google.maps.MapTypeId.HYBRID, sphericalMercator: true}', 1, 6),
(4, 'bng_rds', 'VirtualEarth', 'Bing Roads', '', '{\'type\': VEMapStyle.Road, sphericalMercator: true}', 3, 7),
(5, 'bng_arl', 'VirtualEarth', 'Bing Aerial', '', '{\'type\': VEMapStyle.Aerial, sphericalMercator: true}', 3, 8),
(6, 'bng_hybrd', 'VirtualEarth', 'Bing Hybrid', '', '{\'type\': VEMapStyle.Hybrid, sphericalMercator: true}', 3, 9),
(10, 'ggl_phys', 'Google', 'Google Physics', '', '{type: google.maps.MapTypeId.TERRAIN, sphericalMercator: true}', 1, 3),
(11, 'mpbx_trrn', 'XYZ', 'Mapbox Terrain', '[\n \"http://a.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png\",\n \"http://b.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png\",\n \"http://c.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png\",\n \"http://d.tiles.mapbox.com/v3/muratkendir.map-phz9f7yb/${z}/${x}/${y}.png\"\n ]', '{attribution: \"Tiles &copy; <a href=\'http://mapbox.com/\'>MapBox</a>\",sphericalMercator: true, wrapDateLine: true }', 0, 15),
(12, 'osm_smpl', 'OSM', 'Open Street Map', '', '', 0, 1),
(13, 'esr_cch', 'XYZ', 'Esri Cache', '\"http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/${z}/${y}/${x}\"', '{sphericalMercator: true}', 0, 16),
(14, 'osm_aerl', 'OSM', 'OSM Aerial', '[\"http://otile1.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg\",  \"http://otile2.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg\",  \"http://otile3.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg\",  \"http://otile4.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.jpg\"]', '{sphericalMercator: true}', 0, 2),
(16, 'mpbx_strt', 'XYZ', 'Mapbox Street', '[  \"http://a.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png\",  \"http://b.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png\",  \"http://c.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png\",  \"http://d.tiles.mapbox.com/v3/muratkendir.map-qiy5bqhn/${z}/${x}/${y}.png\"  ]', '{attribution: \"&copy; 2013 Nokia</span>&nbsp;<a href=\'http://maps.nokia.com/services/terms\' target=\'_blank\' title=\'Terms of Use\' style=\'color:#333;text-decoration: underline;\'>Terms of Use</a></div> <img src=\'http://api.maps.nokia.com/2.2.4/assets/ovi/mapsapi/by_here.png\' border=\'0\'>\",transitionEffect: \"resize\"}', 0, 14),
(17, 'nk_nrml_dy', 'XYZ', 'Here Normal Day', '[\"http://2.maps.nlp.nokia.com/maptile/2.1/maptile/newest/normal.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g\"]', '{sphericalMercator: true}', 0, 10),
(18, 'nk_trrn_mp', 'XYZ', 'Here Terrain Map', '[\"http://1.maps.nlp.nokia.com/maptile/2.1/maptile/newest/terrain.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g\"]', '{sphericalMercator: true}', 0, 11),
(19, 'nk_stllt_dy', 'XYZ', 'Here Satellite Day', '[\"http://2.maps.nlp.nokia.com/maptile/2.1/maptile/newest/satellite.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g\"]', '{sphericalMercator: true}', 0, 12),
(20, 'nk_hybrd', 'XYZ', 'Here Hybrid Map', '[\"http://2.maps.nlp.nokia.com/maptile/2.1/maptile/newest/hybrid.day/${z}/${x}/${y}/256/png8?app_id=50iChTSpEBhx1zVgh7EW&app_code=cCHC_ox3_X0dETWlWY1S6g\"]', '{sphericalMercator: true}', 0, 13),
(21, 'esr_img', 'XYZ', 'Esri World Imagery Map', '\"http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/${z}/${y}/${x}\"', '{sphericalMercator: true}', 0, 17),
(22, 'esr_shd', 'XYZ', 'Esri World Shaded Relief', '\"http://server.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/${z}/${y}/${x}\"', '{sphericalMercator: true}', 0, 18),
(23, 'esr_ocn', 'XYZ', 'Esri World Ocean Basemap', '\"http://server.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer/tile/${z}/${y}/${x}\"', '{sphericalMercator: true}', 0, 19),
(24, 'esr_gry', 'XYZ', 'Esri World Light Gray Reference', '\"http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/${z}/${y}/${x}\"', '{sphericalMercator: true}', 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `0__wms_layer_scripts`
--

CREATE TABLE `0__wms_layer_scripts` (
  `id` int(3) NOT NULL,
  `title` varchar(50) NOT NULL,
  `source` varchar(200) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `0__wms_layer_scripts`
--

INSERT INTO `0__wms_layer_scripts` (`id`, `title`, `source`) VALUES
(1, 'Google', 'http://maps.googleapis.com/maps/api/js?sensor=false&v=3.6'),
(2, 'Yahoo', 'http://api.maps.yahoo.com/ajaxymap?v=3.0&appid=euzuro-openlayers'),
(3, 'Bing', 'http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1');

-- --------------------------------------------------------

--
-- Table structure for table `1__aynalar`
--

CREATE TABLE `1__aynalar` (
  `id` int(9) NOT NULL,
  `Baslik` text NOT NULL,
  `Sayfa` int(11) NOT NULL,
  `Alinti` text NOT NULL,
  `point` text NOT NULL,
  `URL` text NOT NULL,
  `imageURL` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1__aynalar`
--

INSERT INTO `1__aynalar` (`id`, `Baslik`, `Sayfa`, `Alinti`, `point`, `URL`, `imageURL`) VALUES
(1, 'OrtalÄ±ÄŸÄ± karÄ±ÅŸtÄ±ran', 10, 'Yer ve gÃ¶k, kÃ¶tÃ¼ ve iyi, doÄŸum ve Ã¶lÃ¼m biribirinden ayrÄ±lmÄ±ÅŸtÄ±', 'PNT_137/235', 'https://en.wikipedia.org/wiki/Quimbanda', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Obatala_Priester_im_Tempel.jpg/200px-Obatala_Priester_im_Tempel.jpg'),
(2, 'Sahra\'nÄ±n YeÅŸillikleri', 11, 'SanatÄ±n burada bize anlattÄ±ÄŸÄ±, Ã§Ã¶lÃ¼n o zamanlar Ã§Ã¶l olmadÄ±ÄŸÄ±', 'PNT_137/236', 'https://tr.wikipedia.org/wiki/Tassili_n%27Ajjer', 'https://upload.wikimedia.org/wikipedia/commons/d/dd/African_cave_paintings.jpg'),
(3, 'Dedeler', 13, 'Bizim Ã§ocuklarÄ±mÄ±zÄ±n bir sÃ¼rÃ¼ anasÄ± ve babasÄ± vardÄ±r. Ne kadar isterlerse o kadar.', 'PNT_137/237', 'https://en.wikipedia.org/wiki/Dagaaba_people', 'https://3.bp.blogspot.com/-jZdqh0-2frE/T5xXimDh57I/AAAAAAAAAmM/lXRJ7UYv8nc/s640/Bong+Ngo+Festival+026.JPG'),
(4, 'YazÄ±nÄ±n bulunuÅŸu', 17, 'Biz tozdan ve hiÃ§likteniz. BÃ¼tÃ¼n yaptÄ±ÄŸÄ±mÄ±z bir rÃ¼zgardan baÅŸka bir ÅŸey deÄŸil.', 'PNT_137/238', 'https://en.wikipedia.org/wiki/En%C3%BBma_Eli%C5%A1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Chaos_Monster_and_Sun_God.png/250px-Chaos_Monster_and_Sun_God.png'),
(5, 'Masa Ayinleri', 19, 'IrakÄ±n Asur Ã¼lkesi olduÄŸu dÃ¶nemde, bir kral Nemrut ÅŸehrindeki sarayÄ±nda bir ziyafet verdi', 'PNT_137/239', 'https://en.wikipedia.org/wiki/Mount_Nemrut', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Mount_Nemrut.jpg/150px-Mount_Nemrut.jpg'),
(6, 'BiranÄ±n KÄ±sa Tarihi', 20, 'BiranÄ±n hiÃ§bir suÃ§u yoktur. BÃ¼tÃ¼n suÃ§ yoldadÄ±r.', 'PNT_137/240', 'https://en.wikipedia.org/wiki/History_of_beer', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Alulu_Beer_Receipt.jpg/220px-Alulu_Beer_Receipt.jpg'),
(7, 'ÅarabÄ±n kÄ±sa tarihi', 21, 'Pers KralÄ± Kiros\'un kudretini simgeleyen amblem bir asma aÄŸacÄ±ydÄ±.', 'PNT_137/241', 'https://tr.wikipedia.org/wiki/II._Kiros', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Olympic_Park_Cyrus.jpg/220px-Olympic_Park_Cyrus.jpg'),
(8, 'Sonsuza dek yaÅŸamak isteyen kral', 21, 'DÃ¼n, zaman bizi emzirdi, ama yarÄ±n bizi yiyecek.', 'PNT_137/242', 'https://tr.wikipedia.org/wiki/G%C4%B1lgam%C4%B1%C5%9F', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/H%C3%A9rosma%C3%AEtrisantunlion.jpg/200px-H%C3%A9rosma%C3%AEtrisantunlion.jpg'),
(9, 'DiÄŸer bir Ã¶lÃ¼msÃ¼zlÃ¼k macerasÄ±', 22, 'Ã–lÃ¼m tanrÄ±Ã§asÄ± Hime\'yi aramak iÃ§in yeraltÄ± dÃ¼nyasÄ±na bir yolculuk yaptÄ±', 'PNT_137/243', 'https://en.wikipedia.org/wiki/M%C4%81ui_(mythology)', 'https://www.tourmaui.com/wp-content/uploads/Demigod-Maui-Snaring-the-Sun-by-Paul-Rockwood-1951-National-Park-Service.jpg'),
(10, 'TaÅŸÄ±n sÃ¶ylediÄŸi', 24, 'Heredot, Strabon, Diodoro ve Horapollo uydurduklarÄ± ÅŸekilde tercÃ¼me ederken Cizvit rahip Athanasius Kircher saÃ§malÄ±klarla dolu dÃ¶rt cilt yayÄ±nlamÄ±ÅŸtÄ±.', 'PNT_137/244', 'https://tr.wikipedia.org/wiki/Rosetta_Ta%C5%9F%C4%B1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Rosetta_Stone.JPG/270px-Rosetta_Stone.JPG'),
(11, 'TavuÄŸun ortaya Ã§Ä±kÄ±ÅŸÄ±', 27, 'Bu kuÅŸ gÃ¼zel deÄŸil. ÅakÄ±mayÄ± da bilmez. KÄ±sa bir gagasÄ±, aptal bir ibiÄŸi, salakÃ§a bakan gÃ¶zleri var. Ama her gÃ¼n bir yavru verir.', 'PNT_137/245', 'https://en.wikipedia.org/wiki/Thutmose_III', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/A_fragment_of_a_wall_block._The_hieroglyphs_Son_of_Ra_were_inscribed_over_the_cartouche_of_the_birth-name_of_Thutmos_III._18th_Dynasty._From_Egypt._The_Petrie_Museum_of_Egyptian_Archaeology%2C_London.jpg/220px-thumbnail.jpg'),
(12, 'HatÅŸepsut', 28, 'Benim ÅŸahinim hÃ¼kÃ¼mdarlÄ±k bayraklarÄ±nÄ±n dalgalandÄ±ÄŸÄ± yerlerin Ã§ok Ã¶tesine, sonsuzluÄŸa doÄŸru uÃ§ar.', 'PNT_137/246', 'https://tr.wikipedia.org/wiki/Hat%C5%9Fepsut', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Hatshepsut.jpg/220px-Hatshepsut.jpg'),
(13, 'SavaÅŸ Tiyatrosu', 30, 'KadÄ±n gibi giyinip, kadÄ±n gibi taranÄ±p, kadÄ±n gibi makyaj yaparak isyanÄ±n liderlerini baÅŸtan Ã§Ä±kardÄ± ve bir eÄŸlence sÄ±rasÄ±nda kÄ±lÄ±cÄ±yla hepsini kavun gibi ikiye bÃ¶ldÃ¼.', 'PNT_137/247', 'https://en.wikipedia.org/wiki/Yamato_Takeru', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg/220px-Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg'),
(14, 'SavaÅŸ sanatÄ±', 31, 'DÃ¼ÅŸmanÄ± tanÄ±mak iÃ§in Ã¶nce kendini tanÄ±', 'PNT_137/248', 'https://tr.wikipedia.org/wiki/Sun_Tzu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Enchoen27n3200.jpg/200px-Enchoen27n3200.jpg'),
(15, 'SavaÅŸÄ±n dehÅŸeti', 31, 'OrdularÄ±n kamp yaptÄ±klarÄ± yerlerde sadece bÃ¶ÄŸÃ¼rtlen ve diken biter.', 'PNT_137/249', 'https://tr.wikipedia.org/wiki/Laozi', 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Laozi.jpg'),
(16, 'Ã‡in kitabÄ±nÄ±n ortaya Ã§Ä±kÄ±ÅŸÄ±', 33, 'Cang Jie\'nin icadÄ± olan ideogramlar, erkeklerin sekiz asÄ±rdan fazla yaÅŸadÄ±ÄŸÄ± ve kadÄ±nlarÄ±n gÃ¼neÅŸ yedikleri iÃ§in Ä±ÅŸÄ±k renginde olduklarÄ± bir krallÄ±ÄŸÄ±n hikayesini anlatÄ±r.', 'PNT_137/250', 'https://en.wikipedia.org/wiki/Cangjie', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Cangjie2.jpg/180px-Cangjie2.jpg'),
(17, 'SÃ¶zcÃ¼k kaÃ§akÃ§Ä±larÄ±', 38, 'Ã‡inli kadÄ±nlarÄ±n gizli lisanÄ± Nushu\'yu bilen son kiÅŸidi.', 'PNT_137/251', 'https://en.wikipedia.org/wiki/Yang_Huanyi', 'http://www.racematters.org/assets/YangHuanyi.jpg'),
(18, 'RomalÄ± kadÄ±nlar', 43, 'Cicero, akÄ±l dÃ¼zeylerinin dÃ¼ÅŸÃ¼klÃ¼ÄŸÃ¼nden Ã¶tÃ¼rÃ¼ kadÄ±nlarÄ±n mutlaka erkek bir koruyucunun tahakkÃ¼mÃ¼ altÄ±nda olmalarÄ± gerektiÄŸini buyurmuÅŸtu.', 'PNT_137/252', 'https://tr.wikipedia.org/wiki/Marcus_Tullius_Cicero', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Cicero_-_Musei_Capitolini.JPG/220px-Cicero_-_Musei_Capitolini.JPG'),
(19, 'Amazonlar', 44, 'Amerika kÄ±tasÄ±nÄ± boydan boya geÃ§en bÃ¼yÃ¼k nehre amazon adÄ±nÄ± veren kiÅŸi ispanyol konkistador Francisco de OrellanadÄ±r.', 'PNT_137/253', 'https://tr.wikipedia.org/wiki/Amazonlar', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Amazone_Staatliche_Antikensammlungen_8953.jpg/220px-Amazone_Staatliche_Antikensammlungen_8953.jpg'),
(20, 'Thales', 48, 'MÄ±sÄ±r\'da dÃ¼ÅŸÃ¼nmeyi Ã¶ÄŸrenmiÅŸ olan Thales, tutulmalarÄ±n ne zaman gerÃ§ekleÅŸeceÄŸini hiÃ§ hatasÄ±z Ã¶nceden bilirdi.', 'PNT_137/254', 'https://tr.wikipedia.org/wiki/Thales', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Thales.jpg/220px-Thales.jpg'),
(21, 'IrkÃ§Ä±lÄ±ÄŸÄ±n bilimsel olarak ortaya Ã§Ä±kÄ±ÅŸÄ±', 51, 'Ä°nsan Ä±rklarÄ± arasÄ±ndaki hiyerarÅŸinin en tepe noktasÄ±nÄ± iÅŸgal eden beyaz azÄ±nlÄ±k hala Kafkas Ä±rkÄ± diye anÄ±lÄ±yor.', 'PNT_137/255', 'https://en.wikipedia.org/wiki/Johann_Friedrich_Blumenbach', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Johann_Friedrich_Blumenbach.jpeg/220px-Johann_Friedrich_Blumenbach.jpeg'),
(22, 'Ä°skender', 53, 'Efestion Ã¶lÃ¼nce, daha Ã¶nce paylaÅŸmÄ±ÅŸ olduklarÄ± ÅŸarabÄ± tek baÅŸÄ±na iÃ§ti, imparatorluk topraklarÄ± Ã¼zerinde mÃ¼ziÄŸi yasakladÄ±.', 'PNT_137/256', 'https://tr.wikipedia.org/wiki/%C4%B0skender', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Alexander_the_Great_mosaic.jpg/270px-Alexander_the_Great_mosaic.jpg'),
(23, 'Homeros', 54, 'Ancak kÃ¶r ozan artÄ±k orada bulunmayan bÃ¼tÃ¼k ÅŸehri gÃ¶rmeyi baÅŸardÄ±.', 'PNT_137/257', 'https://tr.wikipedia.org/wiki/Homeros', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Homer_British_Museum.jpg/220px-Homer_British_Museum.jpg'),
(24, 'Hipokrat', 62, 'Herkesin kan dolaÅŸÄ±mÄ± aynÄ±dÄ±r, nefes alÄ±ÅŸÄ± aynÄ±dÄ±r. Her ÅŸey her ÅŸeyle baÄŸlantÄ±lÄ±dÄ±r.', 'PNT_137/258', 'https://tr.wikipedia.org/wiki/Hipokrat', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Hippocrates_rubens.jpg/220px-Hippocrates_rubens.jpg'),
(25, 'Aspasia', 63, 'Bu kadÄ±n hangi becerisi ya da kudreti sayesinde en Ã¼st dÃ¼zey politikacÄ±lara hÃ¼kmediyor ve filozoflara ilham kaynaÄŸÄ± oluyordu? -Plutarkhos', 'PNT_137/259', 'https://tr.wikipedia.org/wiki/Miletli_Aspasia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Aspasie_Pio-Clementino_Inv272.jpg/220px-Aspasie_Pio-Clementino_Inv272.jpg'),
(26, 'Sapfo', 63, 'Ä°ki bin altÄ± yÃ¼z Ã¶nce Lesbos AdasÄ±nda doÄŸduÄŸu ve Lezbiyen teriminin de oradan geldiÄŸi sÃ¶yleniyor.', 'PNT_137/260', 'https://tr.wikipedia.org/wiki/Sapfo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Herkulaneischer_Meister_002b.jpg/250px-Herkulaneischer_Meister_002b.jpg'),
(27, 'Kral Antiokus (Eunus)', 66, 'Bir kaÃ§ gÃ¼n sonra kÃ¶le  kral oldu. AÄŸzÄ±ndan alevler Ã§Ä±kararak sahibinin kafasÄ±nÄ± kopardÄ± ve bÃ¼yÃ¼k bir ayaklanma Ã§Ä±kardÄ±.', 'PNT_137/261', 'https://en.wikipedia.org/wiki/Eunus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Euno22009si.jpg/220px-Euno22009si.jpg'),
(28, 'SpartakÃ¼s', 67, 'Ä°sa\'dan 72 yÄ±l Ã¶nce, marangozlar, Capua\'dan Roma\'ya kadar bÃ¼tÃ¼n Appia yolu boyunca yeni haÃ§lar diktiler.', 'PNT_137/262', 'https://tr.wikipedia.org/wiki/Spartak%C3%BCs', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Tod_des_Spartacus_by_Hermann_Vogel.jpg/220px-Tod_des_Spartacus_by_Hermann_Vogel.jpg'),
(29, 'Bir imparatorluÄŸun tuzu', 69, 'Ä°mparator Augustus kamuoyu nezdinde gÃ¼cÃ¼nÃ¼ saÄŸlamlaÅŸtÄ±rmak iÃ§in halka rÃ¼ÅŸvet olarak tuz daÄŸÄ±ttÄ±.', 'PNT_137/263', 'https://en.wikipedia.org/wiki/Augustus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Statue-Augustus.jpg/220px-Statue-Augustus.jpg'),
(30, 'Kleopatra', 70, 'Son firavun, sÃ¶ylenenlere bakÄ±lÄ±rsa, o kadar gÃ¼zel olmayan, bir Ã§ok dil konuÅŸan, ekonomiden ve diÄŸer erkek gizemlerinden anlayan, Jul Sezar ve Marcus Antonius\'la yataÄŸÄ± ve gÃ¼cÃ¼ pauylaÅŸan kadÄ±n...', 'PNT_137/264', 'https://tr.wikipedia.org/wiki/VII._Kleopatra', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kleopatra-VII.-Altes-Museum-Berlin1.jpg/220px-Kleopatra-VII.-Altes-Museum-Berlin1.jpg'),
(31, 'OÄŸul', 78, 'Nenizili Aziz Gregor 379 yÄ±lÄ±nda ona doÄŸum sertifikasÄ±nÄ± verene kadar Ä°sa, hiÃ§ doÄŸum gÃ¼nÃ¼ kutlamadan neredeyse dÃ¶rt asÄ±r geÃ§irmiÅŸti.', 'PNT_137/265', 'https://tr.wikipedia.org/wiki/Nenizili_Gregorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Gregor-Chora.jpg/230px-Gregor-Chora.jpg'),
(32, 'Ä°sa\'nÄ±n diriliÅŸi', 79, 'MazatekolarÄ±n sÃ¶ylediÄŸine gÃ¶re Ä°sa Oaxacada Ã§armÄ±ha gerilmiÅŸ, Ã§Ã¼nkÃ¼ yoksullarÄ± ve aÄŸaÃ§larÄ± konuÅŸturuyormuÅŸ.', 'PNT_137/266', 'https://en.wikipedia.org/wiki/Mazatec', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Huautla_de_Jimenez.jpg/249px-Huautla_de_Jimenez.jpg'),
(33, 'Aziz Klaus\'un ortaya Ã§Ä±kÄ±ÅŸÄ±', 81, 'Aziz Klaus, 1863 yÄ±lÄ±nda New Yorktaki Harpers dergisinde yayÄ±nlanan ilk resminde bir bacadan girmeye Ã§alÄ±ÅŸan ÅŸiÅŸko bir cÃ¼ceydi.', 'PNT_137/267', 'https://en.wikipedia.org/wiki/Santa_Claus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Santa_Claus_1863_Harpers.png/395px-Santa_Claus_1863_Harpers.png'),
(34, 'Hypatia', 83, 'DÃ¼ÅŸÃ¼nme hakkÄ±nÄ± koru, YanÄ±larak dÃ¼ÅŸÃ¼nmek hiÃ§ dÃ¼ÅŸÃ¼nmemekten daha iyidir.', 'PNT_137/268', 'https://en.wikipedia.org/wiki/Hypatia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Mort_de_la_philosophe_Hypatie.jpg/400px-Mort_de_la_philosophe_Hypatie.jpg'),
(35, 'AyÅŸe', 85, 'DÃ¶kÃ¼len bu kan SÃ¼nnilerle Åiiler arasÄ±nda bugÃ¼n hala kurban almaya devam eden nefretin baÅŸlangÄ±cÄ±nÄ± oluÅŸturdu.', 'PNT_137/269', 'https://tr.wikipedia.org/wiki/Ai%C5%9Fe', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Mohammed_and_his_wife_Aisha_freeing_the_daughter_of_a_tribal_chief._From_the_Siyer-i_Nebi.jpg/220px-Mohammed_and_his_wife_Aisha_freeing_the_daughter_of_a_tribal_chief._From_the_Siyer-i_Nebi.jpg'),
(36, 'BaÄŸdat', 88, 'Algoritma ve guarismo sÃ¶zcÃ¼klerinin kÃ¶keniyse, Muhammed el-Harezminin soyadÄ±ndan gelir.', 'PNT_137/270', 'https://tr.wikipedia.org/wiki/H%C3%A2rizm%C3%AE', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/1983_CPA_5426_%281%29.png/220px-1983_CPA_5426_%281%29.png'),
(37, 'HaÃ§lÄ± Seferleri', 89, 'PapanÄ±n delegesi baÅŸrahip Arnaud Amaury ÅŸÃ¶yle buyuruyordu: Siz hepsini Ã¶ldÃ¼rÃ¼n. TanrÄ± kendinden olanlarÄ± ayÄ±rt etmesini bilecektir.', 'PNT_137/271', 'https://nl.wikipedia.org/wiki/Arnaud_Amaury', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/NKP_XXIII_F_144_0_04v.jpg/220px-NKP_XXIII_F_144_0_04v.jpg'),
(38, 'Åair Peygamber', 91, 'Kader bizi camdanmÄ±ÅŸÄ±z gibi kÄ±rÄ±yor ve bu parÃ§alar bir daha asla yapÄ±ÅŸmÄ±yor.', 'PNT_137/272', 'https://en.wikipedia.org/wiki/Al-Ma%CA%BFarri', 'https://upload.wikimedia.org/wikipedia/en/9/99/Al-Ma%CA%BFarri_bust2.jpg'),
(39, 'Ä°nsan yiyen dev bir tatar', 104, 'Ne var ki Cengiz HanÄ±n yeÄŸeni Kubilay Han zaman zaman Pekindeki sarayÄ±na ulaÅŸan AvrupalÄ± seyyahlarÄ± Ã§iÄŸ Ã§iÄŸ yemiyordu. Marco Polo onun iÃ§in Ã§alÄ±ÅŸtÄ±.', 'PNT_137/273', 'https://en.wikipedia.org/wiki/Kublai_Khan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/YuanEmperorAlbumKhubilaiPortrait.jpg/220px-YuanEmperorAlbumKhubilaiPortrait.jpg'),
(40, 'Marco Polo', 104, 'Yanan yaÄŸlar petroldÃ¼, yanan kayalar kÃ¶mÃ¼rdÃ¼, kÄŸÄ±t beÅŸ yÃ¼zyÄ±ldÄ±r kullanÄ±lÄ±yordu, AvrupalÄ±larÄ±n gemilerinden beÅŸ kat bÃ¼yÃ¼k gemilerde sebze bahÃ§eleri vardÄ±, tek boynuzlu at gergedandÄ± ve ateÅŸe dayanaklÄ± kumaÅŸ amyanttÄ±.', 'PNT_137/274', 'https://en.wikipedia.org/wiki/Marco_Polo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Marco_Polo_-_costume_tartare.jpg/250px-Marco_Polo_-_costume_tartare.jpg'),
(41, 'SavaÅŸÃ§Ä± Azize', 112, 'Onu odun ateÅŸinde kÄ±zartmÄ±ÅŸ olan vatanÄ± ve kilisesi daha sonra fikir deÄŸiÅŸtirdiler.', 'PNT_137/275', 'https://en.wikipedia.org/wiki/Joan_of_Arc', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Joan_of_Arc_miniature_graded.jpg/200px-Joan_of_Arc_miniature_graded.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `1__banane`
--

CREATE TABLE `1__banane` (
  `id` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__camiler`
--

CREATE TABLE `1__camiler` (
  `id` int(9) NOT NULL,
  `camiadi` text NOT NULL,
  `kapasite` int(11) NOT NULL,
  `imageURL` text NOT NULL,
  `point` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1__camiler`
--

INSERT INTO `1__camiler` (`id`, `camiadi`, `kapasite`, `imageURL`, `point`) VALUES
(1, 'Sultan Ahmet', 1300, 'http://gezilecekyerler.com/wp-content/uploads/2017/03/Sultan-Ahmet-Camii-Muhte%C5%9Fem-Manzaras%C4%B1.jpg', 'PNT_138/276');

-- --------------------------------------------------------

--
-- Table structure for table `1__deprem`
--

CREATE TABLE `1__deprem` (
  `id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__depremler`
--

CREATE TABLE `1__depremler` (
  `id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__ed50_3_derece`
--

CREATE TABLE `1__ed50_3_derece` (
  `id` int(9) NOT NULL,
  `DatumAdi` text NOT NULL,
  `EPSGKodu` int(11) NOT NULL,
  `URL` text NOT NULL,
  `DilimOrtaMeridyeni` int(11) NOT NULL,
  `KapsananIller` text NOT NULL,
  `polygon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1__ed50_3_derece`
--

INSERT INTO `1__ed50_3_derece` (`id`, `DatumAdi`, `EPSGKodu`, `URL`, `DilimOrtaMeridyeni`, `KapsananIller`, `polygon`) VALUES
(1, 'ED50 TM27 (Zone 9)', 2319, 'http://spatialreference.org/ref/epsg/2319/', 27, 'KÄ±rklareli, Edirne, TekirdaÄŸ, Ä°stanbul, Ã‡anakkale, BalÄ±kesir, Bursa, Ä°zmir; Manisa, AydÄ±n, MuÄŸla', 'PLY_102/40'),
(2, 'ED50 TM30 (Zone 10)', 2320, 'http://spatialreference.org/ref/epsg/2320/', 30, 'Ä°stanbul, Kocaeli, AdapazarÄ±, DÃ¼zce, Bolu, Zonguldak, Yalova, BalÄ±kesir, Bursa, Bilecik, EskiÅŸehir, Ankara, KÃ¼tahya, Manisa, UÅŸak, Afyonkarahisar, AydÄ±n, Denizli, Burdur, Isparta, MuÄŸla, Antalya, Konya', 'PLY_102/42'),
(3, 'ED50 TM33 (Zone 11)', 2321, 'http://spatialreference.org/ref/epsg/2321/', 33, 'Zonguldak, BartÄ±n, Kastamonu, Bolu, KarabÃ¼k, Ã‡orum, Sinop, EskiÅŸehir, Ankara, Ã‡ankÄ±rÄ±, Ã‡orum, KÄ±rÄ±kkale, KÄ±rÅŸehir, Yozgat, NevÅŸehir, Aksaray, Antalya, NiÄŸde, Karaman, Mersin', 'PLY_102/43'),
(4, 'ED50 TM36 (Zone 12)', 2322, 'http://spatialreference.org/ref/epsg/2322/', 36, 'Sinop, Samsun, Ordu, Ã‡orum, Amasya, Tokat, Yozgat, Sivas, NevÅŸehir, Kayseri, NiÄŸde, KahramanmaraÅŸ, Malatya, Mersin, Adana, Osmaniye, Gaziantep, AdÄ±yaman, Hatay, Kilis', 'PLY_102/44'),
(5, 'ED50 TM39 (Zone 13)', 2323, 'http://spatialreference.org/ref/epsg/2323/', 39, 'Ordu, Tokat, Giresun, Trabzon, Rize, GÃ¼mÃ¼ÅŸhane, Bayburt, Sivas, Erzincan, Tunceli, BingÃ¶l, Malatya, ElazÄ±ÄŸ, BingÃ¶l, KahramanmaraÅŸ, AdÄ±yaman, DiyarbakÄ±r, Gazientep, ÅanlÄ±urfa, Mardin', 'PLY_102/45'),
(6, 'ED50 TM42 (Zone 14)', 2324, 'http://spatialreference.org/ref/epsg/2324/', 42, 'Rize, Artvin, Ardahan, Erzincan, Erzurum, Kars, BingÃ¶l, MuÅŸ, AÄŸrÄ±, IÄŸdÄ±r, Bitlis, Van, DiyarbakÄ±r, Mardin, Batman, Siirt, ÅÄ±rnak, Hakkari', 'PLY_102/46'),
(7, 'ED50 TM45 (Zone 15)', 2325, 'http://spatialreference.org/ref/epsg/2325/', 45, 'Kars, AÄŸrÄ±, IÄŸdÄ±r, Van, Hakkari', 'PLY_102/47');

-- --------------------------------------------------------

--
-- Table structure for table `1__eminonumuseums`
--

CREATE TABLE `1__eminonumuseums` (
  `id` int(9) NOT NULL,
  `MuseumName` text NOT NULL,
  `Wherefrom` text NOT NULL,
  `Distance` int(11) NOT NULL,
  `video` text NOT NULL,
  `linestring` text NOT NULL,
  `point` text NOT NULL,
  `iframe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1__eminonumuseums`
--

INSERT INTO `1__eminonumuseums` (`id`, `MuseumName`, `Wherefrom`, `Distance`, `video`, `linestring`, `point`, `iframe`) VALUES
(2, 'BasÄ±n MÃ¼zesi', 'Ã‡emberlitaÅŸ', 83, 'http://www.youtube.com/watch?v=Q3UPA-KJYEQ', 'LNS_97/48', 'PNT_97/145', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5525&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5525&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(4, 'Saray Mozaikleri MÃ¼zesi', 'BasÄ±n MÃ¼zesi', 652, 'http://www.youtube.com/watch?v=d_Mf8LYIMX8', 'LNS_97/49', 'PNT_97/147', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5533&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5533&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(5, 'Sultanahmet ParkÄ±', 'Mozaik MÃ¼zesi', 380, 'http://www.youtube.com/watch?v=JCh20vH0CEE', 'LNS_97/50', 'PNT_97/151', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5537&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5537&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(6, 'PadiÅŸah TÃ¼rbeleri', 'DikilitaÅŸ', 40, 'http://www.youtube.com/watch?v=NIt_n6O7v1k', 'LNS_97/51', 'PNT_97/148', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5534&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5534&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(7, 'TopkapÄ± SarayÄ±', 'TÃ¼rbe MÃ¼zesi', 200, 'http://www.youtube.com/watch?v=HxsPTSNiO8M', 'LNS_97/52', 'PNT_97/149', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5535&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5535&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(8, 'Arkeoloji MÃ¼zesi', 'TopkapÄ± SarayÄ±', 120, 'http://www.youtube.com/watch?v=iZKi19bVj8w', 'LNS_97/55', 'PNT_97/150', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5536&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5536&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(9, 'Ayasofya MÃ¼zesi', 'Sultanahmet MeydanÄ±', 40, 'http://www.youtube.com/watch?v=SW3dK_U2Vbo', 'LNS_97/53', 'PNT_97/153', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5539&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5539&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(10, 'Yerebatan SarnÄ±cÄ±', 'Ayasofya', 60, 'http://www.youtube.com/watch?v=HWDH4tL5k7M', 'LNS_97/54', 'PNT_97/152', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5538&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5538&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>');

-- --------------------------------------------------------

--
-- Table structure for table `1__ionia`
--

CREATE TABLE `1__ionia` (
  `id` int(9) NOT NULL,
  `City_Name` text NOT NULL,
  `FirstSettlement` text NOT NULL,
  `alsoknownas` text NOT NULL,
  `imagedescription` text NOT NULL,
  `imageURL` text NOT NULL,
  `point` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1__ionia`
--

INSERT INTO `1__ionia` (`id`, `City_Name`, `FirstSettlement`, `alsoknownas`, `imagedescription`, `imageURL`, `point`) VALUES
(2, 'Miletus', '1000 BC', 'Milet', 'The theater of Miletus', 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/72/The_theater_of_Miletus.jpg/800px-The_theater_of_Miletus.jpg', 'PNT_95/123'),
(3, 'Myus', 'unknown', 'Myous, Myos', 'Votive gift to Apollo with dedicatory inscription found Myus, Century sixth century BC, Antikensammlung Berlin / Altes Museum', 'http://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Weihgeschenk_des_Hermonax.JPG/800px-Weihgeschenk_des_Hermonax.JPG', 'PNT_95/124'),
(4, 'Priene', '1000 BC', 'Prien, Sampson', 'Bouleuterion', 'http://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Priene_Bouleuterion_2009_04_28.jpg/800px-Priene_Bouleuterion_2009_04_28.jpg', 'PNT_95/125'),
(5, 'Ephesus', '1000 BC', 'Ephesos, Efes', 'Site of the Temple of Artemis in the town of SelÃ§uk, near Ephesus.', 'http://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Ac_artemisephesus.jpg/800px-Ac_artemisephesus.jpg', 'PNT_95/126'),
(6, 'Colophon', 'unknown', '-', 'Colophon is located to the right of the center on this map of ancient Ionia.', 'http://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Ionia%2C_Asia_Minor_Map%2C_Classical_Atlas%2C_1886%2C_Keith_Johnston.jpg/493px-Ionia%2C_Asia_Minor_Map%2C_Classical_Atlas%2C_1886%2C_Keith_Johnston.jpg', 'PNT_95/127'),
(7, 'Lebedus', 'unknown', 'Lebedos', 'Lebedos was located on and around the KÄ±sÄ±k Peninsula.', 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Kisik_or_Lebedos_Peninsula_Urkmez_Seferihisar_Izmir_Turkey.JPG/800px-Kisik_or_Lebedos_Peninsula_Urkmez_Seferihisar_Izmir_Turkey.JPG', 'PNT_95/128'),
(8, 'Teos', '540 BC', '-', 'Ruins of the theatre in Teos', 'http://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Theater_teos.JPG/800px-Theater_teos.JPG', 'PNT_95/129'),
(9, 'Erythrae', '700 BC', 'Erythrai, Litri', 'Ruins of the amphitheatre at Erythrae', 'http://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Erythrai_amphitheatre.jpg/800px-Erythrai_amphitheatre.jpg', 'PNT_95/130'),
(10, 'Klazomenai', '600 BC', 'Clazomenae', 'Coin from Klazomenai depicting a winged boar, 499 BC', 'http://upload.wikimedia.org/wikipedia/commons/e/e8/Ionia499bc.jpg', 'PNT_95/131'),
(11, 'Phocaea', '900 BC', 'Phokaia, FoÃ§a', 'Electrum coinage of Phocaea, 340-335 BC.', 'http://upload.wikimedia.org/wikipedia/en/9/9b/Phocaea_coinage2.jpg', 'PNT_95/132'),
(12, 'Samos', '700 BC', '-', 'Kouros of Samos, the largest surviving Kouros in Greece (Archaeological Museum of Samos)', 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Samoskouros.JPG/327px-Samoskouros.JPG', 'PNT_95/134'),
(13, 'Chios', '1100 BC', 'SakÄ±z', '16th-century map of Chios by Piri Reis', 'http://upload.wikimedia.org/wikipedia/en/thumb/9/93/Chios_by_Piri_Reis_Rotated.jpg/441px-Chios_by_Piri_Reis_Rotated.jpg', 'PNT_95/133'),
(14, 'Smyrna', '1100 BC', 'Ä°zmir', 'BayraklÄ± archeological site', 'http://bayraklikultur.com/Images/galeri/IzmirSmyrnaAgora20004.jpg', 'PNT_95/136');

-- --------------------------------------------------------

--
-- Table structure for table `1__istanbulcbs`
--

CREATE TABLE `1__istanbulcbs` (
  `id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__istcbs`
--

CREATE TABLE `1__istcbs` (
  `id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__musterilerim`
--

CREATE TABLE `1__musterilerim` (
  `id` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__occupygezisolidaritymap`
--

CREATE TABLE `1__occupygezisolidaritymap` (
  `id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__tablo1`
--

CREATE TABLE `1__tablo1` (
  `id` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__test`
--

CREATE TABLE `1__test` (
  `id` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__test34`
--

CREATE TABLE `1__test34` (
  `id` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `1__turkishinstruments`
--

CREATE TABLE `1__turkishinstruments` (
  `id` int(9) NOT NULL,
  `Name` text NOT NULL,
  `Inventor` text NOT NULL,
  `iframe` text NOT NULL,
  `point` text NOT NULL,
  `imageURL` text NOT NULL,
  `Classification` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1__turkishinstruments`
--

INSERT INTO `1__turkishinstruments` (`id`, `Name`, `Inventor`, `iframe`, `point`, `imageURL`, `Classification`) VALUES
(1, 'Ahenk', 'Suleymen Suat Sezgin', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104822593\"></iframe>', 'PNT_96/137', 'http://www.habermonitor.com/img/630x345/turk-musikisinin-ahenki-ses-vermeyi-bekliyor.jpg', 'String instrument'),
(2, 'Ã‡Ä±ÄŸÄ±rtma', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104827819\"></iframe>', 'PNT_96/138', 'http://www.karamanlihaber.com/resim/haber/2012/10/kmm_cigirtma_1.jpg', 'Wind Type'),
(3, 'Classical Kemece', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104829333\"></iframe>', 'PNT_96/139', 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Kemence_Sezgin_%281%29.jpg/800px-Kemence_Sezgin_%281%29.jpg', 'String instrument'),
(4, 'Cumbus', 'Zeynel Abidin CÃ¼mbÃ¼ÅŸ', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104831550\"></iframe>', 'PNT_96/140', 'http://upload.wikimedia.org/wikipedia/en/2/23/Zeynel_Abidin_C%C3%BCmb%C3%BC%C5%9F.png', 'Plucked string instrument'),
(5, 'Tulum (Dankiyo)', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104833547\"></iframe>', 'PNT_96/141', 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Touloum.JPG/300px-Touloum.JPG', 'bagpipe'),
(6, 'BulgarÄ±', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104868074\"></iframe>', 'PNT_96/142', 'https://i1.ytimg.com/vi/8aqTahk7_CQ/mqdefault.jpg', 'String instrument'),
(7, 'Sipsi', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104870035\"></iframe>', 'PNT_96/143', 'http://farm6.staticflickr.com/5289/5271236465_f71160db89.jpg', 'single-reed aerophone');

-- --------------------------------------------------------

--
-- Table structure for table `16__campus_area`
--

CREATE TABLE `16__campus_area` (
  `id` int(9) NOT NULL,
  `ConstructionName` text NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Height` int(11) NOT NULL,
  `Color` text NOT NULL,
  `point` text NOT NULL,
  `video` text NOT NULL,
  `kat_sayisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `16__campus_area`
--

INSERT INTO `16__campus_area` (`id`, `ConstructionName`, `Capacity`, `Height`, `Color`, `point`, `video`, `kat_sayisi`) VALUES
(1, 'My Faculty', 2500, 18, 'gray', 'PNT_92/86', 'https://www.youtube.com/watch?v=0DCL6yEXQgs', 3),
(2, 'Stadium', 4000, 28, 'White', 'PNT_92/88', 'https://www.youtube.com/watch?v=s4yBHRRg0uI', 5),
(3, 'Dormitory', 1500, 8, 'Red', 'PNT_92/87', 'https://www.youtube.com/watch?v=gLR_LgxL1zo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `16__fakulteler`
--

CREATE TABLE `16__fakulteler` (
  `id` int(9) NOT NULL,
  `fakulte_adi` text NOT NULL,
  `ogrenci_sayisi` int(11) NOT NULL,
  `ogretim_gor` int(11) NOT NULL,
  `point` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `16__fakulteler`
--

INSERT INTO `16__fakulteler` (`id`, `fakulte_adi`, `ogrenci_sayisi`, `ogretim_gor`, `point`) VALUES
(2, 'Fen Edebiyat FakÃ¼ltesi', 630, 62, 'PNT_84/49'),
(4, 'Ä°ÅŸletme BÃ¶lÃ¼mÃ¼', 462, 35, 'PNT_85/51'),
(5, 'Makina FakÃ¼ltesi', 999, 65, 'PNT_86/50');

-- --------------------------------------------------------

--
-- Table structure for table `16__test45`
--

CREATE TABLE `16__test45` (
  `id` int(9) NOT NULL,
  `adi` text NOT NULL,
  `kodu` text NOT NULL,
  `URL` text NOT NULL,
  `video` text NOT NULL,
  `point` text NOT NULL,
  `linestring` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `16__test45`
--

INSERT INTO `16__test45` (`id`, `adi`, `kodu`, `URL`, `video`, `point`, `linestring`) VALUES
(1, 'Osman', '34', 'https://kandahardannotlar.blogspot.com/', 'https://www.youtube.com/watch?v=vA3l94FTBZM&t=65s', 'PNT_135/233', 'LNS_135/57'),
(2, 'Remzi', '34', 'https://kandahardannotlar.blogspot.com/2018/11/omur-uzatan-komutlarda-bu-hafta.html', 'https://www.youtube.com/watch?v=vA3l94FTBZM&t=65s', 'PNT_135/234', 'LNS_135/57');

-- --------------------------------------------------------

--
-- Table structure for table `27__oturdugum_evler`
--

CREATE TABLE `27__oturdugum_evler` (
  `id` int(9) NOT NULL,
  `Nurtepe_1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `27__oturdugum_evler`
--

INSERT INTO `27__oturdugum_evler` (`id`, `Nurtepe_1`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `32__kuscami`
--

CREATE TABLE `32__kuscami` (
  `id` int(9) NOT NULL,
  `BOLGE` text NOT NULL,
  `MADEN` text NOT NULL,
  `RUHSAT_TARIH` date NOT NULL,
  `linestring` text NOT NULL,
  `video` text NOT NULL,
  `imageURL` text NOT NULL,
  `point` text NOT NULL,
  `iframe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `32__kuscami`
--

INSERT INTO `32__kuscami` (`id`, `BOLGE`, `MADEN`, `RUHSAT_TARIH`, `linestring`, `video`, `imageURL`, `point`, `iframe`) VALUES
(2, 'MÄ°LAS', 'FELDÄ°SPAT', '0000-00-00', 'LNS_107/56', 'http://www.youtube.com/watch?v=1L3AUclDbqU', 'http://j1310.hizliresim.com/1g/n/trh1p.jpg', 'PNT_107/166', '<iframe width=\"560\" height=\"350\" src=\"http://www.panomonkey.com/image/iframe/50913/imag3074\" frameborder=\"0\" allowfullscreen></iframe>');

-- --------------------------------------------------------

--
-- Table structure for table `32__kuscami_ocagi`
--

CREATE TABLE `32__kuscami_ocagi` (
  `id` int(9) NOT NULL,
  `BOLGE` text NOT NULL,
  `MADEN` text NOT NULL,
  `RUHSAT_TARIHI` text NOT NULL,
  `OLCUM_TARIHI` text NOT NULL,
  `KUBAJ_MIKTARI` text NOT NULL,
  `imageURL` text NOT NULL,
  `video` text NOT NULL,
  `iframe` text NOT NULL,
  `point` text NOT NULL,
  `linestring` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `32__kuscami_ocagi`
--

INSERT INTO `32__kuscami_ocagi` (`id`, `BOLGE`, `MADEN`, `RUHSAT_TARIHI`, `OLCUM_TARIHI`, `KUBAJ_MIKTARI`, `imageURL`, `video`, `iframe`, `point`, `linestring`) VALUES
(1, 'MÄ°LAS_KUSCAMI', 'FELDÄ°SPAT', '08.08.2006', '29.09.2013', '120 m3', 'http://j1310.hizliresim.com/1g/n/trh1p.jpg', 'http://www.youtube.com/watch?v=1L3AUclDbqU', '<iframe width=\"560\" height=\"350\" src=\"http://www.panomonkey.com/image/iframe/50913/imag3074\" frameborder=\"0\" allowfullscreen></iframe>', 'PNT_107/166', 'LNS_107/56');

-- --------------------------------------------------------

--
-- Table structure for table `33__cbs_kurumlar`
--

CREATE TABLE `33__cbs_kurumlar` (
  `id` int(9) NOT NULL,
  `kurum_adi` text NOT NULL,
  `telefon` text NOT NULL,
  `ilgili_kisi` text NOT NULL,
  `point` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `33__cbs_kurumlar`
--

INSERT INTO `33__cbs_kurumlar` (`id`, `kurum_adi`, `telefon`, `ilgili_kisi`, `point`) VALUES
(1, 'Ä°BB ÃœstyapÄ± Projeler', '535 562 81 03', 'Cemal Ã–zgÃ¼r KÄ±vÄ±lcÄ±m', 'PNT_110/169'),
(2, 'Ä°SKÄ° KaÄŸÄ±thane Gen. MÃ¼d.', '212 321 00 00', 'Ãœnal Kartal CBS Åb. MÃ¼d.', 'PNT_110/171'),
(3, 'Ä°GDAÅ', '0 533 558 21 66', 'GÃ¶nÃ¼l YÄ±ldÄ±z', 'PNT_110/172'),
(4, 'Ã‡evre ve Åehircilik Ä°stanbul Ä°l MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', '0 212 318 41 00 ', 'Cihangir TopÃ§u', 'PNT_110/173'),
(20, 'MuÄŸla Ä°l Ã–zel Ä°daresi', '0 252 214 14 28 / 120', 'Ã–zlem Ã‡erÃ§i ve Sadullah Durgut', 'PNT_113/175'),
(21, 'MuÄŸla KÃ¼ltÃ¼r VarlÄ±klarÄ±nÄ± Koruma Kurulu', '0252 213 0151 / 113, 114', 'Fikret GÃ¼rbÃ¼zler', 'PNT_113/176'),
(22, 'MuÄŸla Ã‡ÅB Ä°l MÃ¼d.', '0252. 2141258/4092 ', 'Mehmet Ayhan ve AyÅŸe KargÄ±n', 'PNT_113/177'),
(23, 'AydÄ±n Ä°l Ã–zel Ä°daresi', '0 256 212 72 00 / 8121', 'Ramazan SarÄ±sakal', 'PNT_113/178'),
(24, 'AydÄ±n Ã‡ÅB Ä°l MÃ¼d.', '0256 219 57 70 / 409', 'Fatma Baysal ve Ãœmit GÃ¶Ã§', 'PNT_113/179'),
(25, 'Ä°zmir Orman ve SuiÅŸleri BÃ¶lge MÃ¼d.', '0 232 369 80 06', 'HÃ¼seyin DoÄŸan ve Latif Bozan', 'PNT_113/180'),
(26, 'Ä°zmir Ã‡ÅB Ä°l MÃ¼d.', '232 3416800 / 1437 ', 'Hayri LaledaÄŸÄ±', 'PNT_113/181'),
(27, 'Ä°zmir BB', '232 293 13 22', 'Mustafa Kubilay YÄ±ldÄ±rÄ±m', 'PNT_113/182'),
(28, 'Ä°ZSU', ' 232 293 2580', 'Ã¶zgÃ¼r ÅŸenim', 'PNT_113/183'),
(29, 'Gediz / TeiaÅŸ', '0232 477 26 00 / 2125', 'Emel Tetik', 'PNT_113/184'),
(30, 'DEU CBS Ana Bilim DalÄ±', '+90 (232) 301 70 26', 'Okan FÄ±stÄ±koÄŸlu, DEU DOÃ‡ DR ', 'PNT_113/185'),
(31, 'VakÄ±flar Genel MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', '(0232) 441 5292', 'Utku Deniz, VGM Ä°zmir bÃ¶lge MÃ¼d.', 'PNT_113/186'),
(32, 'Ä°zmirGaz', '232 449 3939', 'GÃ¶kÃ§en Bilgen', 'PNT_113/187'),
(33, 'MuÄŸla Belediyesi', '444 48 01 / 230', 'ÃœstÃ¼n GenÃ§er', 'PNT_113/188'),
(34, 'MuÄŸla Ãœniveristei CBS', '0 252 211 5585', 'Ceyhun Ã–zÃ§elik', 'PNT_113/192'),
(35, 'MuÄŸla Orman BÃ¶lge MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', '', '', 'PNT_113/191'),
(36, 'MuÄŸla KarayollarÄ± 26. BÃ¶lge MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', '', '', 'PNT_113/190'),
(37, 'MuÄŸla TarÄ±m ve KÃ¶yiÅŸleri BakanlÄ±ÄŸÄ±', ' 0252 214 1250', 'Mehmet Gencer veya Ramazan Demir', 'PNT_113/189'),
(38, 'MuÄŸla Ä°l Afet ve Acil Durum MÃ¼d', '', '', 'PNT_113/193'),
(39, 'AydÄ±n DSÄ°', '', '', 'PNT_115/194'),
(40, 'AydÄ±n KarayollarÄ±', '', '', 'PNT_115/195'),
(41, 'AydÄ±n Orman Genel MÃ¼d.', '', '', 'PNT_115/196'),
(42, 'AydÄ±n KÃ¼ltÃ¼r ve Turizm Ä°l MÃ¼d.', '', '', 'PNT_115/197'),
(43, 'UTAEM Menemen ', '', 'Nejat Ã–zden', 'PNT_113/198'),
(44, 'MuÄŸla BESOT', '0252 214 18 46 / 254', 'Baki Ãœlgen', 'PNT_114/199'),
(45, 'MuÄŸla DSÄ°', '0252 214 1137', 'Metin GÃ¼l', 'PNT_114/200'),
(46, 'AydÄ±n Belediyesi', '', 'Halil DoÄŸan', 'PNT_115/201'),
(47, 'AydÄ±n Milli Emlak Genel MÃ¼d.', '506 854 92 72', 'Ferhat Ã‡Ä±tak', 'PNT_115/202'),
(48, 'AydÄ±n TarÄ±m ve KÃ¶yiÅŸleri BakanlÄ±ÄŸÄ± Ä°l MÃ¼d.', '', 'Emre Durukal ve Olcay AtatanÄ±r', 'PNT_115/203'),
(49, 'Ä°zmir BB CBS Åb. MÃ¼d.', '', 'Zafer Beydilli', 'PNT_113/204'),
(50, 'Ä°ZSU', '', 'Ã–zgÃ¼r Åenim', 'PNT_113/205'),
(51, 'Ä°zmir Turizm ve KÃ¼ltÃ¼r BakanlÄ±ÄŸÄ± Ä°l MÃ¼dÃ¼rlÃ¼ÄŸÃ¼', '', 'Selda TaÅŸÃ§Ä±', 'PNT_113/206'),
(52, 'Ä°zmir BB Kentsel DÃ¶nÃ¼ÅŸÃ¼m Åb. MÃ¼d.', '232 293 45 17', 'Serhat FÄ±ndÄ±kÃ§Ä± ve Rabia Kocakaya', 'PNT_113/207'),
(53, 'Trabzon Ä°l Ã–zel Ä°daresi', '', 'Ä°lhan Bey ve Ä°smail Ã‡iftÃ§i', 'PNT_110/208'),
(54, 'Trabzon DSÄ°', '541 280 0000', 'Orhan Akdeniz', 'PNT_110/209'),
(55, 'Sakarya SEDAÅ', '264 295 85 00', 'AyÅŸegÃ¼l Kaya', 'PNT_110/210'),
(56, 'Samsun Ä°l Ã–zel Ä°daresi', '', 'Ali YÄ±lmaz', 'PNT_110/211'),
(57, 'Ordu Ä°l Ã–zel Ä°daresi', '452 233 2558', 'Murat AygÃ¼n', 'PNT_110/212'),
(58, 'Giresun Ä°l Ã–zel Ä°daresi', '532 644 9505', 'Murat Ã‡iÃ§ek', 'PNT_110/213'),
(59, 'Artvin Ä°l Ã–zel Ä°daresi', '536 669 0247', 'Mustafa Bilgin', 'PNT_110/214'),
(60, 'Sivas Belediyesi', '544 661 00 27', 'Ahmet Turan Altun', 'PNT_110/215'),
(61, 'Zonguldak Kozlu TTK', '1', 'Serkan SargÄ±noÄŸlu', 'PNT_110/216'),
(62, 'Orman', '', '', 'PNT_110/169'),
(63, 'Ankara Orman ve SuiÅŸleri BakanlÄ±ÄŸÄ±', '', 'Etem AkgÃ¼ndÃ¼z', 'PNT_110/217');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `0__comment`
--
ALTER TABLE `0__comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__frame`
--
ALTER TABLE `0__frame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__line`
--
ALTER TABLE `0__line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__membership`
--
ALTER TABLE `0__membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__point`
--
ALTER TABLE `0__point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__polygon`
--
ALTER TABLE `0__polygon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__wms_layer`
--
ALTER TABLE `0__wms_layer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `0__wms_layer_scripts`
--
ALTER TABLE `0__wms_layer_scripts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__aynalar`
--
ALTER TABLE `1__aynalar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__banane`
--
ALTER TABLE `1__banane`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__camiler`
--
ALTER TABLE `1__camiler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__deprem`
--
ALTER TABLE `1__deprem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__depremler`
--
ALTER TABLE `1__depremler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__ed50_3_derece`
--
ALTER TABLE `1__ed50_3_derece`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__eminonumuseums`
--
ALTER TABLE `1__eminonumuseums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__ionia`
--
ALTER TABLE `1__ionia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__istanbulcbs`
--
ALTER TABLE `1__istanbulcbs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__istcbs`
--
ALTER TABLE `1__istcbs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__musterilerim`
--
ALTER TABLE `1__musterilerim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__occupygezisolidaritymap`
--
ALTER TABLE `1__occupygezisolidaritymap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__tablo1`
--
ALTER TABLE `1__tablo1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__test`
--
ALTER TABLE `1__test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__test34`
--
ALTER TABLE `1__test34`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `1__turkishinstruments`
--
ALTER TABLE `1__turkishinstruments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `16__campus_area`
--
ALTER TABLE `16__campus_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `16__fakulteler`
--
ALTER TABLE `16__fakulteler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `16__test45`
--
ALTER TABLE `16__test45`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `27__oturdugum_evler`
--
ALTER TABLE `27__oturdugum_evler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `32__kuscami`
--
ALTER TABLE `32__kuscami`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `32__kuscami_ocagi`
--
ALTER TABLE `32__kuscami_ocagi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `33__cbs_kurumlar`
--
ALTER TABLE `33__cbs_kurumlar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `0__comment`
--
ALTER TABLE `0__comment`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `0__frame`
--
ALTER TABLE `0__frame`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `0__line`
--
ALTER TABLE `0__line`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `0__membership`
--
ALTER TABLE `0__membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `0__point`
--
ALTER TABLE `0__point`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `0__polygon`
--
ALTER TABLE `0__polygon`
  MODIFY `id` int(24) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `0__wms_layer`
--
ALTER TABLE `0__wms_layer`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `0__wms_layer_scripts`
--
ALTER TABLE `0__wms_layer_scripts`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `1__aynalar`
--
ALTER TABLE `1__aynalar`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `1__banane`
--
ALTER TABLE `1__banane`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__camiler`
--
ALTER TABLE `1__camiler`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `1__deprem`
--
ALTER TABLE `1__deprem`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__depremler`
--
ALTER TABLE `1__depremler`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__ed50_3_derece`
--
ALTER TABLE `1__ed50_3_derece`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `1__eminonumuseums`
--
ALTER TABLE `1__eminonumuseums`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `1__ionia`
--
ALTER TABLE `1__ionia`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `1__istanbulcbs`
--
ALTER TABLE `1__istanbulcbs`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__istcbs`
--
ALTER TABLE `1__istcbs`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__musterilerim`
--
ALTER TABLE `1__musterilerim`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__occupygezisolidaritymap`
--
ALTER TABLE `1__occupygezisolidaritymap`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__tablo1`
--
ALTER TABLE `1__tablo1`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__test`
--
ALTER TABLE `1__test`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__test34`
--
ALTER TABLE `1__test34`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `1__turkishinstruments`
--
ALTER TABLE `1__turkishinstruments`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `16__campus_area`
--
ALTER TABLE `16__campus_area`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `16__fakulteler`
--
ALTER TABLE `16__fakulteler`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `16__test45`
--
ALTER TABLE `16__test45`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `27__oturdugum_evler`
--
ALTER TABLE `27__oturdugum_evler`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `32__kuscami`
--
ALTER TABLE `32__kuscami`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `32__kuscami_ocagi`
--
ALTER TABLE `32__kuscami_ocagi`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `33__cbs_kurumlar`
--
ALTER TABLE `33__cbs_kurumlar`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
