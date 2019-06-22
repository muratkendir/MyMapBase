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
(38, 'osman', 'ısman', 'osman@osman.com', 'Ne gerek', 'Ne gerek vardı şimdi böle saçma sapan şeylerle uğraşmaya?', 16, '2013-01-27 11:28:12'),
(39, 'hasan', 'hasan', 'hasan@hasan.com', 'osmana', 'akıllı ol osman! mahalleni biliyorum!', 16, '2013-01-27 11:29:23');

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
(79, 'İTÜ Ayazağa Kampüsü', '12,10,1,2,3,4,5,6,11,13', 1, 800, 600, '41.1057316', '29.0229759', 15, '\0\0\0\0\0\0\0����=@�򜈍D@', 1),
(52, 'osman deneme', '2,5,8', 1, 800, 400, '41.0000000', '29.0000000', 11, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 2),
(83, 'İTÜ Kampüsleri', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 800, 600, '41.0754415', '29.0161309', 12, '\0\0\0\0\0\0\0~��\'!=@n�+��D@', 16),
(84, 'İTÜ Ayazağa Kampüsü', '12,1,2', 1, 800, 600, '41.1047385', '29.0231781', 15, '\0\0\0\0\0\0\0�{���=@�8h�D@', 16),
(85, 'İTÜ Maçka Kampüsü', '1,2', 1, 800, 600, '41.0455679', '28.9954325', 16, '\0\0\0\0\0\0\0\"����<@�@+ՅD@', 16),
(86, 'İTÜ Gümüşsuyu Kampüsü', '12,1,2', 1, 800, 600, '41.0377805', '28.9916813', 16, '\0\0\0\0\0\0\0�_���<@����ՄD@', 16),
(80, 'İTÜ Makine Fakültesi', '1,4', 0, 600, 400, '41.0381648', '28.9913113', 17, '\0\0\0\0\0\0\0��͓��<@�틕�D@', 1),
(138, 'istanbuldacamiler', '12', 1, 600, 400, '41.0000000', '29.0000000', 9, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 1),
(87, 'Aktogay Copper Mine Project', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 800, 600, '46.9462969', '79.9621590', 12, '\0\0\0\0\0\0\0U�W��S@1�A yG@', 16),
(89, 'sevdugum', '12,10,1,2,3,4,5,6,13', 0, 800, 600, '41.1824286', '41.8192065', 14, '\0\0\0\0\0\0\0�3���D@sm�Y�D@', 21),
(92, 'ITU Campus Area', '12,2,5,19,13', 1, 800, 600, '41.1049532', '29.0228502', 15, '\0\0\0\0\0\0\0����=@&�@o�D@', 16),
(95, 'Ionia Cities', '12,14,2,5,19,16,11', 1, 800, 600, '37.8921883', '25.8618256', 9, '\0\0\0\0\0\0\0fffff�:@�����C@', 1),
(96, 'Turkey Map', '12', 1, 900, 450, '39.0000000', '35.0000000', 6, '\0\0\0\0\0\0\0\0\0\0\0\0�A@\0\0\0\0\0�C@', 1),
(97, 'Eminönü', '1,17,19,16', 1, 800, 600, '41.0081274', '28.9755606', 15, '\0\0\0\0\0\0\0\"D�V��<@˙�Q\n�D@', 1),
(98, 'RNC_Frame01', '1', 0, 1000, 1000, '41.0000000', '29.0000000', 2, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 28),
(101, 'İstanbul', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 1200, 600, '41.0000000', '29.0000000', 12, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 32),
(102, 'Türkiye Projeksiyonu', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 800, 600, '39.3682673', '35.0244293', 5, '\0\0\0\0\0\0\07H� �A@��b#�C@', 1),
(107, 'KUSCAMİ_OCAGİ', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 1200, 600, '37.0000000', '27.0000000', 9, '\0\0\0\0\0\0\0\0\0\0\0\0\0<@\0\0\0\0\0�B@', 32),
(108, 'ankara', '12', 1, 800, 600, '39.2000000', '32.7000000', 14, '\0\0\0\0\0\0\0�����Y@@fffff�C@', 16),
(110, 'istanbul', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13', 1, 960, 720, '41.0000000', '29.0000000', 12, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 33),
(111, 'üsküdar', '2,5,19', 1, 600, 600, '41.0213241', '29.0067078', 17, '\0\0\0\0\0\0\0����=@�����D@', 1),
(113, 'Muğla-Aydın-İzmir', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 800, 600, '37.8314681', '27.7514801', 7, '\0\0\0\0\0\0\0E��`�;@i��m�B@', 33),
(114, 'Muğla Şehir Merkezi', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 1000, 800, '37.2150677', '28.3638054', 14, '\0\0\0\0\0\0\0��Y\"]<@���V��B@', 33),
(115, 'Aydın', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 960, 750, '37.8421710', '27.8398949', 14, '\0\0\0\0\0\0\0Ó\'Z�;@�QcB��B@', 33),
(134, 'prova', '3', 1, 400, 400, '41.0000000', '12.0000000', 12, '\0\0\0\0\0\0\0\0\0\0\0\0�D@\0\0\0\0\0\0(@', 16),
(119, 'egebolgesi', '12,1,2,5,16,13', 1, 960, 480, '37.4900000', '27.2600000', 6, '\0\0\0\0\0\0\0��(\\�B;@��Q��B@', 16),
(120, 'demo', '1', 0, 800, 800, '30.0000000', '30.0000000', 10, '\0\0\0\0\0\0\0\0\0\0\0\0\0>@\0\0\0\0\0\0>@', 16),
(124, 'Ege Bölgesi', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 800, 600, '38.5000000', '27.0000000', 7, '\0\0\0\0\0\0\0\0\0\0\0\0\0;@\0\0\0\0\0@C@', 1),
(125, 'Türkiye', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 0, 800, 600, '39.0000000', '34.0000000', 6, '\0\0\0\0\0\0\0\0\0\0\0\0\0A@\0\0\0\0\0�C@', 38),
(129, 'Test', '12,1,2,20', 0, 800, 600, '41.1049532', '29.0228502', 15, '\0\0\0\0\0\0\0����=@&�@o�D@', 40),
(133, 'turkiyegenel', '12,14,10,1,2,3,4,5,6,17,18,19,20,16,11,13,21,22,23,24', 1, 1024, 768, '41.0000000', '29.0000000', 6, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 16),
(135, 'test45', '21', 1, 600, 400, '41.0000000', '29.0000000', 10, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 16),
(136, 'geomsan', '12', 1, 800, 500, '3.1547830', '36.7250560', 4, '\0\0\0\0\0\0\0lЗ��<	@a⏢�\\B@', 16),
(137, 'Aynalar', '12,24', 1, 1200, 800, '41.0000000', '29.0000000', 2, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 1);

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
(40, 'Kütüphaneden İnşaat Faültesine', 79, 0, '\0\0\0\0\0\0\0\0\0\0�5�z=@�X�rG�D@�R�{=@��$a�D@��H�=@ѝr[�D@ �C=@k��u�D@)��M=@��7�{�D@�\'X�=@:|-Cw�D@XU/��=@Ko$u�D@', 1),
(21, 'osman line 1', 52, 0, '\0\0\0\0\0\0\0\0\0\0\nףp=\n=@fffff�D@��Q�=@\nףp=�D@', 2),
(41, 'Rektörlükten İnşaat Fakültesine', 79, 0, '\0\0\0\0\0\0\0\0\0\0\n:Hx=@��c���D@���y=@�&(���D@�[��=@��w��D@��j�=@��F+��D@�t�ۉ=@�N�.��D@�[��=@g(�x��D@�7BP=@���D@5!Rxu=@{Ic���D@��5;=@�򜈍D@��<*=@��2���D@��+�!=@�e�u��D@)��M=@��7�{�D@�\'X�=@:|-Cw�D@XU/��=@Ko$u�D@', 1),
(43, 'FEB-İnşaat yaya yolu', 84, 0, '\0\0\0\0\0\0\0\0\0\0�WAg-=@\0I\"E��D@ $��=@@)����D@�\ZӸ�=@���j�D@n�w=@�!dj\\�D@q��0=@�.4|�D@^�B��=@xԘs�D@', 16),
(45, 'Prf. Dr. Bedri Karafakioglu Caddesi', 84, 1, '\0\0\0\0\0\0\0\0\0\0�{�[g=@�\ni	;�D@�{�s=@�;�I�D@|�;�=@�c��W�D@|�#=@I �Z�D@', 16),
(46, 'mecburiyetimiz', 89, 1, '\0\0\0\0\0\0\0\0\0\0�3��D@m[�!�D@3��D@��^A\"�D@', 21),
(47, 'Stadium to Faculty', 92, 1, '\0\0\0\0\0\0\0\0\0\0���v�=@C\'6)��D@w���=@��a�D@\"��^=@�ǇY�D@X��N=@����{�D@����=@��)�w�D@', 16),
(48, 'Çemberlitaş -> Basın Müzesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0{D肓�<@ph@��D@&D���<@;Z_7�D@', 1),
(49, 'Basın Müzesi -> Mozaik Müzesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0&D���<@ީI{�D@xC����<@����D@�C�B��<@j[��D@<D�/�<@h�齀D@0D膎�<@|�*=��D@oD誗�<@w�~\\��D@�C�V��<@��v��D@mC���<@�,��D@/D���<@�n1�}�D@�C����<@LʹD@jD��<@��$ʇ�D@ED�\Z\'�<@߄�D@8C�Z2�<@LʹD@�D�\\�<@� 9���D@', 1),
(50, 'Mozaik Müzesi -> Dikilitaş', 97, 1, '\0\0\0\0\0\0\0\0\0\0�C�>]�<@� 9���D@�B�\"��<@.�eB��D@�B�V��<@\"����D@|C����<@A�GрD@%C�.��<@��\'W߀D@�C���<@�����D@', 1),
(51, 'Dikilitaş -> Türbe Müzesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0�C���<@0�f�D@�C�*��<@��u���D@�C���<@Ǔs��D@', 1),
(52, 'Türbe Müzesi -> Topkapı Müzesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0��]��<@Ǔs��D@��5��<@xH���D@���O�<@M\nF\"!�D@�EX�<@�<G�<�D@GB蒞�<@�[��i�D@', 1),
(53, 'Dikilitaş -> Ayasofya', 97, 1, '\0\0\0\0\0\0\0\0\0\0�C���<@�0�f�D@�C���<@��za�D@�C�N��<@����\0�D@', 1),
(54, 'Ayasofya -> Yerebatan Sarnıcı', 97, 1, '\0\0\0\0\0\0\0\0\0\0�C���<@����\0�D@�C�rt�<@�e&��D@�C�}�<@4�p\"�D@D�z{�<@x���D@', 1),
(55, 'Topkapı -> Arkeoloji Müzesi', 97, 1, '\0\0\0\0\0\0\0\0\0\0PC�F��<@�nZj�D@�B�F�<@~%G�X�D@BC����<@R+Un�D@', 1),
(56, 'RUHSAT_IZIN', 107, 1, '\0\0\0\0\0\0\0\0\0\0�\0��;@edz�+�B@�\0g�;@�q	v��B@�\0�B�;@xm�BֻB@�\0g�;@�D���B@`\0�?�;@f��v�B@g\0L��;@7P�a��B@�\0\\�;@�\\�V�B@�\0L&�;@�{�/�B@', 32),
(57, 'test45_1_l', 135, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@333333=@\0\0\0\0\0�D@', 16);

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
(1, 'murat Fıstıkçı', 'kendir Şahap', '', 'muratkendir', '252aea65536ae7423623ca54488c9bdc', 'muratkendir@gmail.com', 15, 1, '1__ionia,1__turkishinstruments,1__eminonumuseums,1__ed50_3_derece,1__aynalar,1__camiler'),
(2, 'osman', 'kenevir', '', 'osmankenevir', '252aea65536ae7423623ca54488c9bdc', 'osmankenevir@hatmeyil.com', 2, 0, ''),
(16, 'demo', 'demo', '', 'demo', 'e10adc3949ba59abbe56e057f20f883e', 'demo@demo.com', 3, 1, '16__fakulteler,16__campus_area,16__test45'),
(25, 'burcu', 'celebi', 'Survey Engineer/Geomatics', 'B', 'd1c9a3b47be1ed2599196a8a5fd4ec45', 'burcelebi@gmail.com', 2, 1, ''),
(24, 'M Ozan', 'Karaman', 'Survey Engineer/Geomatics', 'ozan0104', '3fc669818dd2b2482ffcc2ef69d1e978', 'ozan0104@gmail.com', 2, 1, ''),
(23, 'Behzat', 'Ulucan', 'Survey Engineer/Geomatics', 'behzatulucan', '196757b7487eb46b34c09e057ac32e3f', 'behzatulucan@gmail.com', 2, 1, ''),
(21, 'esra', 'elacmaz', 'City Planner', 'esracmaz', '848cd2309b325a6af2155e1f64010599', 'esracmaz@hotmail.com', 2, 1, ''),
(26, 'Hüseyin', 'Kurt', 'Survey Engineer/Geomatics', 'pgss21', 'eadeb7960f3b32172dca166a1522a5f3', 'hsyn.kurt21@gmail.com', 2, 1, ''),
(22, 'deneme3', 'osman', 'Survey Engineer/Geomatics', 'deneme45', '252aea65536ae7423623ca54488c9bdc', 'deneme5@hatmayil.com', 2, 1, ''),
(27, 'Önder', 'Özütemiz', 'Survey Engineer/Geomatics', 'korsaatci', '5399ca5342cc745d97983d7038ab565d', 'o_ozutemiz@yahoo.com', 2, 1, '27__oturdugum_evler'),
(28, 'Rahmi Nurhan', 'Çelik', 'Survey Engineer/Geomatics', 'celikn', 'd9c48329a448adc1aeb7819ce39bc5d9', 'celikn@itu.edu.tr', 2, 1, ''),
(29, 'mehmet sinan', 'bilgiç', 'Survey Engineer/Geomatics', 'mesib', 'b29f57edfe9da908b94f66ea6b31baef', 'puhten@hotmail.com', 2, 1, ''),
(30, 'Walter', 'Andreeff', 'Survey Engineer/Geomatics', 'wandreef@gmail.com', '0d0138424a2f50c471a52fdfa3201e02', 'wandreef@gmail.com', 2, 1, ''),
(31, 'Çiğdem', 'Türen', 'Survey Engineer/Geomatics', 'goolem', '9bda59bb217175557f30f4f51c7a41fe', 'turencigdem@gmail.com', 2, 1, ''),
(32, 'Çağdaş', 'Korkmaz', 'Survey Engineer/Geomatics', 'cagdaskorkmaz', 'f1d657c72dc01d9db88f932cf40c841f', 'cgdskrkmz@hotmail.com', 2, 1, '32__kuscami,32__kuscami_ocagi'),
(33, 'Sistem', 'Murat', 'Survey Engineer/Geomatics', 'muratsistem', '252aea65536ae7423623ca54488c9bdc', 'deneme@sharklasers.com', 2, 1, '33__cbs_kurumlar'),
(34, 'Matthieu', 'Molinier', 'Survey Engineer/Geomatics', 'MatthieuM', '23ae4d0e70450ab64a2647d010a77350', 'matthieu.molinier @vtt.fi', 2, 1, ''),
(35, 'deneme', 'deneme34', 'Survey Engineer/Geomatics', 'zencefil', '00001926', 'zencefil@operamail.com', 2, 1, ''),
(36, 'esra', 'elaçmaz', 'Survey Engineer/Geomatics', 'esraelacmaz', 'zbambam08', 'esraelacmaz@gmail.com', 2, 1, ''),
(38, 'SistemAS', 'HiTarget', 'Survey Engineer/Geomatics', 'sistemas', '9c59fa943aa39f1cd3c820128b591cb4', 'muratkendir@sistemas.com.tr', 2, 1, ''),
(37, 'Ozan', 'Tan', 'Database Operator', 'ozantan', 'e10adc3949ba59abbe56e057f20f883e', 'ozantan@gmail.com', 2, 1, ''),
(39, 'Zeynel', 'Aydın', 'Survey Engineer/Geomatics', 'aydinzey', '9f28452a2bc39d52486eeb8338dd867a', 'zafenapena@gmail.com', 2, 1, ''),
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
(40, 'Elektrik/Elektronik Fakültesi Girişi', 79, 0, '\0\0\0\0\0\0\0����W=@�w4�g�D@', 1),
(38, 'İnşaat Fakültesi Girişi', 79, 0, '\0\0\0\0\0\0\0XU/��=@Ko$u�D@', 1),
(39, 'Yeni Rektörlük Binası Girişi', 79, 0, '\0\0\0\0\0\0\0\n:Hx=@��c���D@', 1),
(23, 'osman nokta 1', 52, 0, '\0\0\0\0\0\0\0�����=@fffff�D@', 2),
(41, 'Maden Fakültesi A Girişi', 79, 0, '\0\0\0\0\0\0\0&~�F�=@��j�D@', 1),
(42, 'Maden Fakültesi B Girişi', 79, 0, '\0\0\0\0\0\0\0\\�D��=@����m�D@', 1),
(43, 'Mustafa İnan Kütüphanesi Girişi', 79, 0, '\0\0\0\0\0\0\0�5�z=@�X�rG�D@', 1),
(51, 'İTÜ İşletme Mühendisliği Girişi', 85, 0, '\0\0\0\0\0\0\0���A-�<@�d󂙅D@', 16),
(48, 'İTÜ İnşaat Fakültesi Girişi', 84, 0, '\0\0\0\0\0\0\0^�B��=@xԘs�D@', 16),
(49, 'İTÜ FEB Girişi', 84, 0, '\0\0\0\0\0\0\0�WAg-=@\0I\"E��D@', 16),
(50, 'İTÜ Makina Fakültesi Girişi', 86, 0, '\0\0\0\0\0\0\0Ƃg���<@���%ƄD@', 16),
(273, '104_beijing', 137, 1, '\0\0\0\0\0\0\0��\"��]@E)!XU�C@', 1),
(46, 'macka guney-dogu', 82, 0, '\0\0\0\0\0\0\0V],���<@V��5��D@', 1),
(47, 'macka kuzey-batı', 82, 0, '\0\0\0\0\0\0\0�;��<@��/�ƅD@', 1),
(52, 'İTÜ Yabancı Diller Kampüsü Girişi', 85, 0, '\0\0\0\0\0\0\04�+(��<@�i,��D@', 16),
(53, 'İBB Stadı', 84, 0, '\0\0\0\0\0\0\0	}���=@.�v�D@', 16),
(55, 'Bilisim Enstitusu', 84, 0, '\0\0\0\0\0\0\0�|��4=@N��KF�D@', 16),
(56, 'Vadi Yurtlari', 84, 0, '\0\0\0\0\0\0\0|��A=@.$�9�D@', 16),
(57, 'Vadsi', 83, 0, '\0\0\0\0\0\0\0��\'K=@��֌D@', 16),
(58, 'deneme', 84, 1, '\0\0\0\0\0\0\0��\'K=@��֌D@', 16),
(59, 'Leach Pad Phase 1 - 8', 87, 1, '\0\0\0\0\0\0\0NCT���S@�\Z.rOyG@', 16),
(60, 'Leach Pad Phase 1 - 7', 87, 1, '\0\0\0\0\0\0\0��+�z�S@40�&zG@', 16),
(61, 'Leach Pad Phase 1 - 4', 87, 1, '\0\0\0\0\0\0\0+�ƈ\0T@\0\0\0\0\0zG@', 16),
(62, 'Leach Pad Phase 1 - 5', 87, 1, '\0\0\0\0\0\0\0-��b\0T@4��E`zG@', 16),
(63, 'Leach Pad Phase 1 - 6', 87, 1, '\0\0\0\0\0\0\0���\0T@Ό~4�zG@', 16),
(64, 'Koldar', 88, 1, '\0\0\0\0\0\0\0�Y��I�S@��W�{G@', 1),
(65, 'Krayniy', 88, 1, '\0\0\0\0\0\0\07o�l�S@z��#�}G@', 1),
(66, 'Kyryk', 88, 1, '\0\0\0\0\0\0\0\ry��N�S@�P�amzG@', 1),
(67, 'Lager', 88, 1, '\0\0\0\0\0\0\0H��3�S@n.�{G@', 1),
(68, 'Saryzhal', 88, 1, '\0\0\0\0\0\0\0G�7\'��S@��X-{G@', 1),
(69, 'Shygys', 88, 1, '\0\0\0\0\0\0\0���(�S@��fQ�vG@', 1),
(70, 'Kiak', 88, 1, '\0\0\0\0\0\0\0�.z��S@ՎꍽpG@', 1),
(71, 'Trig_x', 88, 1, '\0\0\0\0\0\0\0��DI��S@���~*yG@', 1),
(72, 'Tumek', 88, 1, '\0\0\0\0\0\0\0&�s���S@��ⱸvG@', 1),
(73, 'Mys Koldara', 88, 1, '\0\0\0\0\0\0\0Z��f�S@�d��\ruG@', 1),
(74, 'TBM-1', 88, 1, '\0\0\0\0\0\0\0�����S@w�J>�{G@', 1),
(75, 'TBM-2', 88, 1, '\0\0\0\0\0\0\0)F3���S@ȩ��IyG@', 1),
(76, 'TBM-3', 88, 1, '\0\0\0\0\0\0\0^��e�S@Y��QyG@', 1),
(77, 'TBM-4', 88, 1, '\0\0\0\0\0\0\0rE1�`�S@)�M�zG@', 1),
(78, 'sevdugumun evi', 89, 0, '\0\0\0\0\0\0\0�3�?�D@�ЀlؗD@', 21),
(79, 'sevdugumun isi', 89, 0, '\0\0\0\0\0\0\0S3�X�D@|���D@', 21),
(80, 'Kyryk (P.106)', 90, 1, '\0\0\0\0\0\0\0(�c�N�S@�B��%yG@', 1),
(81, 'Koldar (P.108)', 90, 1, '\0\0\0\0\0\0\0ȩ��I�S@zW��{G@', 1),
(82, 'TBM-1 (P. 110)', 90, 1, '\0\0\0\0\0\0\0�O���S@$\0�>�{G@', 1),
(83, 'TBM-2 (P. 111)', 90, 1, '\0\0\0\0\0\0\0C�����S@u��IyG@', 1),
(84, 'TBM-3 (P.112)', 90, 1, '\0\0\0\0\0\0\0y׏e�S@w�I�QyG@', 1),
(85, 'TBM-4 (P.113)', 90, 1, '\0\0\0\0\0\0\0�`�S@�_�M�zG@', 1),
(86, 'My Faculty', 92, 1, '\0\0\0\0\0\0\0촽��=@nJ��p�D@', 16),
(87, 'My Dormitory', 92, 0, '\0\0\0\0\0\0\0H��8O=@G�2�\"�D@', 16),
(88, 'Stadium', 92, 1, '\0\0\0\0\0\0\0�����=@�G�L�D@', 16),
(123, 'miletus', 95, 1, '\0\0\0\0\0\0\0�e��@G;@��E&��B@', 1),
(124, 'myus', 95, 1, '\0\0\0\0\0\0\0�v�\n�m;@�w�-;�B@', 1),
(125, 'priene', 95, 1, '\0\0\0\0\0\0\0�w�-;L;@�9?�q�B@', 1),
(126, 'ephesus', 95, 1, '\0\0\0\0\0\0\0=Y��W;@�sCSv�B@', 1),
(127, 'colophon', 95, 1, '\0\0\0\0\0\0\0%��ID$;@s�\"�\rC@', 1),
(128, 'lebedos', 95, 1, '\0\0\0\0\0\0\0Q�_��:@נ/��	C@', 1),
(129, 'teos', 95, 1, '\0\0\0\0\0\0\0)\\����:@��5�C@', 1),
(130, 'erythrae', 95, 1, '\0\0\0\0\0\0\0k��{:@lЗ��0C@', 1),
(131, 'klazomenai', 95, 1, '\0\0\0\0\0\0\0/��Q��:@���j�-C@', 1),
(132, 'phocaea', 95, 1, '\0\0\0\0\0\0\0]�@��:@=\nףpUC@', 1),
(133, 'chios', 95, 1, '\0\0\0\0\0\0\0%��ID:@333333C@', 1),
(134, 'samos', 95, 1, '\0\0\0\0\0\0\0u��OU�:@\0\0\0\0\0�B@', 1),
(136, 'smyrna', 95, 1, '\0\0\0\0\0\0\0��>F�+;@����i;C@', 1),
(137, 'Eskişehir', 96, 1, '\0\0\0\0\0\0\0��s(C�>@�p�i�C@', 1),
(138, 'Elazığ', 96, 1, '\0\0\0\0\0\0\0�����C@K\0�)WC@', 1),
(139, 'izmir', 96, 1, '\0\0\0\0\0\0\0TW>�� ;@��u��5C@', 1),
(140, 'Beyazıt Istanbul', 96, 1, '\0\0\0\0\0\0\0=֌r�<@W�/�\'�D@', 1),
(141, 'trabzon', 96, 1, '\0\0\0\0\0\0\0Έ����C@#J{�/�D@', 1),
(142, 'Kayseri', 96, 1, '\0\0\0\0\0\0\0�R��F�A@/�]C@', 1),
(143, 'Burdur', 96, 1, '\0\0\0\0\0\0\0)^emS@>@+1�J�B@', 1),
(144, 'Çemberlitaş', 97, 1, '\0\0\0\0\0\0\0I���<@$I��D@', 1),
(145, 'Basın Müzesi', 97, 1, '\0\0\0\0\0\0\0�V�!��<@���_�D@', 1),
(148, 'Padişah Türbeleri Müzesi', 97, 1, '\0\0\0\0\0\0\0���?��<@�����D@', 1),
(147, 'Mozaik Müzesi', 97, 1, '\0\0\0\0\0\0\0�@�_\\�<@5�����D@', 1),
(149, 'Topkapı Saray Müzesi', 97, 1, '\0\0\0\0\0\0\0������<@���i�D@', 1),
(150, 'İstanbul Arkeoloji Müzesi', 97, 1, '\0\0\0\0\0\0\0�����<@���n�D@', 1),
(151, 'Dikilitaş', 97, 1, '\0\0\0\0\0\0\0en���<@8���D@', 1),
(152, 'Yerebatan Sarnıcı', 97, 1, '\0\0\0\0\0\0\0���z�<@\":��D@', 1),
(153, 'Ayasofya Müzesi', 97, 1, '\0\0\0\0\0\0\0�R�?��<@�!<V\0�D@', 1),
(156, 'KİRACI MURAT KENDİR', 101, 1, '\0\0\0\0\0\0\0\n\0\0=@�P��D@', 32),
(155, 'KİRACI ÇAĞDAŞ KORMAZ', 101, 1, '\0\0\0\0\0\0\0���4=@VЊSv�D@', 32),
(160, 'F2220435', 104, 1, '\0\0\0\0\0\0\06++%A=@4��}�D@', 1),
(159, 'beylerbeyi polis karakolu', 79, 1, '\0\0\0\0\0\0\0�h�N�\n=@����D@', 1),
(169, 'İBB Merter Ek Hizmet Binası', 110, 1, '\0\0\0\0\0\0\0\0\0\0���<@��q1�D@', 33),
(162, 'KN1', 105, 1, '\0\0\0\0\0\0\0\"��W�r@@L�T�C@', 1),
(163, 'KN2', 105, 1, '\0\0\0\0\0\0\0�(�8s@@�k�T�C@', 1),
(164, 'KN3', 105, 1, '\0\0\0\0\0\0\0�d�r�t@@���C@', 1),
(165, 'kn1', 106, 1, '\0\0\0\0\0\0\0��1l��C@�K���fD@', 1),
(166, 'KUSCAMI', 107, 1, '\0\0\0\0\0\0\08��_m�;@�j��M�B@', 32),
(168, 'silence_stand', 109, 1, '\0\0\0\0\0\0\0���\'\"=@V&���}D@', 16),
(170, 'İBB CBS Gen. Müd. Saraçhane', 110, 1, '\0\0\0\0\0\0\0\0\0\0�|�<@cXo���D@', 33),
(171, 'İSKİ Kağıthane', 110, 1, '\0\0\0\0\0\0\0�jׄ��<@\'ݖ��D@', 33),
(172, 'igdaş kavacık hizmet binası', 110, 1, '\0\0\0\0\0\0\0����t=@\\��oˋD@', 33),
(173, 'Çevre ve Şehircilik İstanbul İl Müdürlüğü', 110, 1, '\0\0\0\0\0\0\0���{r=@U?l�P�D@', 33),
(174, 'üsküdar pilye', 111, 1, '\0\0\0\0\0\0\0����=@�����D@', 1),
(175, 'Muğla İl Özel İdaresi', 113, 1, '\0\0\0\0\0\0\0�,��^<@(�x�ߚB@', 33),
(176, 'Muğla Kültür Varlıklarını Kor. Böl. Kur.', 113, 1, '\0\0\0\0\0\0\0���\\<@L�����B@', 33),
(177, 'Muğla ÇŞB İl Müd.', 113, 1, '\0\0\0\0\0\0\0d�3�%[<@�j���B@', 33),
(178, 'Aydın İl Özel İdaresi', 113, 1, '\0\0\0\0\0\0\0��M+��;@Lb�G�B@', 33),
(179, 'Aydın ÇŞB İl Müd.', 113, 1, '\0\0\0\0\0\0\0�=�Ӟ�;@�fI-�B@', 33),
(180, 'İzmir Orman İl Gen. Müd.', 113, 1, '\0\0\0\0\0\0\0\r�-��;@�B=}:C@', 33),
(181, 'İzmir ÇŞB İl Müd.', 113, 1, '\0\0\0\0\0\0\0JF�*;@�a��:C@', 33),
(182, 'İzmir BB', 113, 1, '\0\0\0\0\0\0\0:�6U� ;@����5C@', 33),
(183, 'İZSU', 113, 1, '\0\0\0\0\0\0\0\r\Z�\'� ;@vöE5C@', 33),
(184, 'Gediz Elektrik', 113, 1, '\0\0\0\0\0\0\0�\r�D0;@��8d9C@', 33),
(185, 'DEU Mühendislik Fak.', 113, 1, '\0\0\0\0\0\0\0��!�5;@1]��/C@', 33),
(186, 'VGM İzmir', 113, 1, '\0\0\0\0\0\0\0�V$&�!;@�l�/6C@', 33),
(187, 'İzmirGaz', 113, 1, '\0\0\0\0\0\0\0\0\0\0`�+;@r\'�MY7C@', 33),
(188, 'Muğla Belediyesi', 113, 1, '\0\0\0\0\0\0\0H�?�]<@��ΛB@', 33),
(189, 'Tarım ve Köyişleri Müd.', 113, 1, '\0\0\0\0\0\0\0���Od[<@��+(��B@', 33),
(190, 'Karayolları 26. Şube Müd.', 113, 1, '\0\0\0\0\0\0\0=�K�]<@CX6���B@', 33),
(191, 'Orman Bölge Müdürlüğü', 113, 1, '\0\0\0\0\0\0\0��\'}]<@J��3�B@', 33),
(192, 'Muğla Üniversitesi CBS', 113, 1, '\0\0\0\0\0\0\0����_<@�C�5�B@', 33),
(193, 'Muğla İl Afet ve Acil Durum', 113, 1, '\0\0\0\0\0\0\0]���^<@��m�B@', 33),
(194, 'Aydın DSİ', 115, 1, '\0\0\0\0\0\0\0�\'\n	�;@6f��B@', 33),
(195, 'Aydın Karayolları', 115, 1, '\0\0\0\0\0\0\0 �\'�q�;@��-�Q�B@', 33),
(196, 'Aydın Orman Genel Müd.', 115, 1, '\0\0\0\0\0\0\0ғ\'���;@�N5��B@', 33),
(197, 'Aydın Kültür Turizm', 115, 1, '\0\0\0\0\0\0\0IZ���;@�4�($�B@', 33),
(198, 'UTAEM', 113, 1, '\0\0\0\0\0\0\0[]N	�\r;@$c��SC@', 33),
(199, 'Muğla BESOT', 114, 1, '\0\0\0\0\0\0\0�ǥ^<@R��ʛB@', 33),
(200, 'Muğla DSİ', 114, 1, '\0\0\0\0\0\0\0�\ZǝU^<@6����B@', 33),
(201, 'Aydın Belediyesi', 115, 1, '\0\0\0\0\0\0\0b�\'���;@?A��q�B@', 33),
(202, 'Aydın Defterdarlık', 115, 1, '\0\0\0\0\0\0\0��\'�Z�;@U�����B@', 33),
(203, 'Aydın Tarım ve Köyişleri İl Müd.', 115, 1, '\0\0\0\0\0\0\0^�\'���;@�PdT@�B@', 33),
(204, 'İzmir BB CSB Şb Müd.', 113, 1, '\0\0\0\0\0\0\0����!;@�p1=�5C@', 33),
(205, 'İZSU', 113, 1, '\0\0\0\0\0\0\0z��4!;@Q�?��5C@', 33),
(206, 'İzmir Turizm ve Kültür Bakanlığı İl Müd.', 113, 1, '\0\0\0\0\0\0\0��[�!;@Eo��J6C@', 33),
(207, 'İzmir BB Kentsel Dönüşüm Hizm.', 113, 1, '\0\0\0\0\0\0\0��3�!;@[���\06C@', 33),
(208, 'Trabzon İl Özel İdare', 110, 1, '\0\0\0\0\0\0\0\0��C@CX��~D@', 33),
(209, 'Trabzon DSİ', 110, 1, '\0\0\0\0\0\0\0����j�C@��TU�}D@', 33),
(210, 'SEDAŞ', 110, 1, '\0\0\0\0\0\0\0���G�b>@k��_D@', 33),
(211, 'Samsun İl Özel İdaresi', 110, 1, '\0\0\0\0\0\0\04\0\0��\'B@�L˘�D@', 33),
(212, 'Ordu İl Özel İdaresi', 110, 1, '\0\0\0\0\0\0\0o\0\0�\n�B@c��}D@', 33),
(213, 'Giresun İl Özel İdaresi', 110, 1, '\0\0\0\0\0\0\0����g+C@Lt->�tD@', 33),
(214, 'Artvin İl Özel İdaresi', 110, 1, '\0\0\0\0\0\0\0���ٵ�D@�tHc�D@', 33),
(215, 'Sivas Belediyesi', 110, 1, '\0\0\0\0\0\0\06����B@�2�\Z�C@', 33),
(216, 'Zonguldak TTK', 110, 1, '\0\0\0\0\0\0\0Z�����?@���~�D@', 33),
(217, 'Ankara Orman ve Suişleri Bakanlığı', 110, 1, '\0\0\0\0\0\0\0���Ռf@@���z�C@', 33),
(218, 'beylerbeyi', 83, 1, '\0\0\0\0\0\0\0e�53\r=@�,m�D@', 16),
(219, 'Gökçeada deprem', 117, 1, '\0\0\0\0\0\0\0����s9@��Mb(D@', 1),
(220, 'ozan', 119, 1, '\0\0\0\0\0\0\0�e6�:@�9$�P-C@', 16),
(221, 'Müşteri1', 124, 1, '\0\0\0\0\0\0\0\0\0\0\0�2;@?Y�d9C@', 1),
(222, 'Müşteri2', 124, 1, '\0\0\0\0\0\0\0\0\0\0\0��;@ZG2.XC@', 1),
(223, '183_4', 121, 1, '\0\0\0\0\0\0\0h�	�m�:@]�.{\"C@', 16),
(274, '104_cenova', 137, 1, '\0\0\0\0\0\0\0I����!@OI�4F@', 1),
(275, '112_rouen', 137, 1, '\0\0\0\0\0\0\0�������?���Q�H@', 1),
(276, 'sultanahmet', 138, 1, '\0\0\0\0\0\0\0:���	�<@�=�ů�D@', 1),
(229, 'Nokta1', 130, 1, '\0\0\0\0\0\0\0���{e@@�!��C@', 16),
(230, 'Nokta2', 130, 1, '\0\0\0\0\0\0\0��\0j0;@	\'Ü:C@', 16),
(231, '1', 133, 1, '\0\0\0\0\0\0\0\0\0\0\0@e=@��\n�m�C@', 16),
(232, '_2', 133, 1, '\0\0\0\0\0\0\0�\0\0\0�\"B@:�t�B@', 16),
(233, 'test45_1', 135, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0=@\0\0\0\0\0�D@', 16),
(234, 'test45_2', 135, 1, '\0\0\0\0\0\0\0333333=@\0\0\0\0\0�D@', 16),
(235, '10-exu', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0@\nH������1/�', 1),
(236, '11-tassiliki', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\"@\0\0\0\0\0�9@', 1),
(237, '13-dagara', 137, 1, '\0\0\0\0\0\0\0 �������+j0\r�@', 1),
(238, '17-y azi', 137, 1, '\0\0\0\0\0\0\0�\0\0\0$�E@#b���@@', 1),
(239, '19-masa_ayinleri', 137, 1, '\0\0\0\0\0\0\0Yک��^C@�G�C��B@', 1),
(240, '20-bira', 137, 1, '\0\0\0\0\0\0\0��	�y�F@���	�?@', 1),
(241, '21-sarap', 137, 1, '\0\0\0\0\0\0\0��24J@CqǛ�>@', 1),
(242, '21-gilgamis', 137, 1, '\0\0\0\0\0\0\0W%�}��F@CqǛ�R?@', 1),
(243, '22-maui', 137, 1, '\0\0\0\0\0\0\0������c�������4@', 1),
(244, '24-rosetta', 137, 1, '\0\0\0\0\0\0\0��k�6@?@36t�?�=@', 1),
(245, '27-tavuk', 137, 1, '\0\0\0\0\0\0\0BwI�M@@-�B;��9@', 1),
(246, '28-hatsepsut', 137, 1, '\0\0\0\0\0\0\0�{*�=M@@�\"�4�9@', 1),
(247, '30-savas_tiyatrosu', 137, 1, '\0\0\0\0\0\0\0]��$��`@G仔�DA@', 1),
(248, '31-savas_sanati', 137, 1, '\0\0\0\0\0\0\033333�]@TR\'��hB@', 1),
(249, '31-lao-tse', 137, 1, '\0\0\0\0\0\0\0��C�l�[@�l����@@', 1),
(250, '33-cin_kitabi', 137, 1, '\0\0\0\0\0\0\0��Io\\@=\r$}2A@', 1),
(251, '38-yang_huanyi', 137, 1, '\0\0\0\0\0\0\0ˡE���[@���S�E9@', 1),
(252, '43-cicero', 137, 1, '\0\0\0\0\0\0\0�Mc{-8+@���c��D@', 1),
(253, '44_terme', 137, 1, '\0\0\0\0\0\0\0TpxAD�B@������D@', 1),
(254, '48-milet', 137, 1, '\0\0\0\0\0\0\0�e��@G;@��E&��B@', 1),
(255, '51-gottingen', 137, 1, '\0\0\0\0\0\0\05\'/2�#@�X�yV�I@', 1),
(256, '53-pella', 137, 1, '\0\0\0\0\0\0\0u��OU6@E)!XUuD@', 1),
(257, '54-truva', 137, 1, '\0\0\0\0\0\0\0�_Z�\'=:@��(\\��C@', 1),
(258, '62-istankoy', 137, 1, '\0\0\0\0\0\0\0{�G�:;@�����lB@', 1),
(259, '63-miletus', 137, 1, '\0\0\0\0\0\0\0�e��@G;@��E&��B@', 1),
(260, '63-midilli', 137, 1, '\0\0\0\0\0\0\0����̌:@����̌C@', 1),
(261, '66_sicilya_enna', 137, 1, '\0\0\0\0\0\0\0�!�k^�,@��K�B@', 1),
(262, '67_capua', 137, 1, '\0\0\0\0\0\0\0���ۂm,@���ۂ�D@', 1),
(263, '69_rome', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0)@33333�D@', 1),
(264, '70_iskenderiye', 137, 1, '\0\0\0\0\0\0\0�\"��~�=@333333?@', 1),
(265, '78_kapadokya', 137, 1, '\0\0\0\0\0\0\0�p�ikA@{m��UC@', 1),
(266, '79_oaxaca', 137, 1, '\0\0\0\0\0\0\0��v��\ZX�fffff�0@', 1),
(267, '81_new_york', 137, 1, '\0\0\0\0\0\0\0\0\0\0\0\0�R������YD@', 1),
(268, '83_iskendireye', 137, 1, '\0\0\0\0\0\0\0�Q���=@333333?@', 1),
(269, '85_basra', 137, 1, '\0\0\0\0\0\0\0y\\T���G@\0\0\0\0\0�>@', 1),
(270, '88_bagdat', 137, 1, '\0\0\0\0\0\0\0!=E1F@��ާ��@@', 1),
(271, '89_beziers', 137, 1, '\0\0\0\0\0\0\0��n��	@x$(~�E@', 1),
(272, '91_maarat', 137, 1, '\0\0\0\0\0\0\0�f+/�UB@��W��A@', 1);

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
(20, 'Mustafa İnan Kütüphanesi', 79, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\04�\0�H=@���}J�D@�<e5]=@V�*�K�D@kN�u=@��K�D@u�ޒw=@�.G�D@��~=@�X�rG�D@�k��}=@]RJ�D@��_��=@���nI�D@�@lD�=@;�bF�D@���P�=@�]afD�D@1N2(�=@ѿn\"D�D@<�W��=@]~p>�D@�0_^�=@I�5C�D@�@�9w=@�#�B�D@�G�+v=@���]?�D@�1�>D=@�3�<�D@ �JA=@��?�D@����E=@�H<�@�D@4�\0�H=@���}J�D@', 1),
(5, 'osman polygon 1', 52, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0��(\\�=@�z�G�D@\nףp=\n=@��(\\��D@���(\\=@fffff�D@��(\\�=@�z�G�D@', 2),
(21, 'İnşaat Fakültesi', 79, 0, '\0\0\0\0\0\0\0\0\0\0	\0\0\0��ŉ�=@=\nףp�D@w��=@���Uv�D@���?=@�%��^�D@�}�=@]�%�U�D@=�\"8�=@S\\U�]�D@�Gi��=@�\\�wb�D@M\nJ�=@�a��j�D@	��g�=@SK)�i�D@��ŉ�=@=\nףp�D@\0\0\0?*�=@FM�l�D@�mߣ�=@VȦ�n�D@�x׏=@�td�D@~5�=@�KR�b�D@?*�=@FM�l�D@', 1),
(25, 'İnşaat Fakültesi Parseli', 84, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0iC�=@Fr�Vv�D@�z*L�=@o���l�D@緞׎=@���U�D@_�;�=@^2�J_�D@iC�=@Fr�Vv�D@', 16),
(26, 'FEB Fakülte Parseli', 84, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0yt#,*=@���㹍D@v�Ms<=@���]��D@�,��=@�4bf��D@a�dK�=@\ZM.���D@yt#,*=@���㹍D@', 16),
(22, 'Yeni Rektörlük Binası', 79, 0, '\0\0\0\0\0\0\0\0\0\0\n\0\0\0D:�=d=@���͍D@�y��g=@�x[鵍D@6U�t=@0�����D@kN�u=@�rV���D@O�\rY�=@g�=D@��ǎ=@\\+��̍D@\\s=@�%E\ZˍD@�I�#o=@V@F�ˍD@-w�n=@F�Z͍D@D:�=d=@���͍D@', 1),
(23, 'Maden Fakültesi', 79, 0, '\0\0\0\0\0\0\0\0\0\0\r\0\0\0Z �~=@k��i�D@T	[�=@�d�p�D@Tպ��=@���j�D@��4ӽ=@��5�h�D@����=@k�G:^�D@��F�=@�+Y`�D@g�&��=@g}�1Y�D@��^��=@�m��V�D@@��=@I�5C�D@����=@P0�A�D@�m4��=@EW3|U�D@�{O�=@4�g�S�D@Z �~=@k��i�D@\0\0\0d!:�=@\n�e�D@�%O��=@��m�[�D@\'�\'�=@��Fo]�D@�/�=@x�i�f�D@d!:�=@\n�e�D@', 1),
(28, 'Tenis Kortları', 84, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0�|�_b=@�1��D@�}�/e=@>P�L�D@�|���=@����D@H}�ϗ=@)�_|�D@�|�_b=@�1��D@', 16),
(29, 'Kimya Fakültesi', 84, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0�}��!=@���b�D@r}�\\\'=@��^�D@	~��,=@��A�T�D@�}��$=@&���S�D@~}\'=@����N�D@�}�2$=@+&�N�D@�}�m%=@#��J�D@E}-�)=@���J�D@$}],=@���_F�D@�}��0=@�C}G�D@�}}4=@�&�@�D@}�:+=@�:��?�D@�}��-=@.$�9�D@}�\' =@�\r�8�D@�|�� =@*��S7�D@�|���=@���4�D@/|�G�=@�M6^�D@�}��!=@���b�D@', 16),
(30, 'Open Pit Area', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\00�W���S@�X�W}G@3�Wk��S@�r��{G@�WV�S@���e{G@>�WS��S@��C�{G@�W#E�S@$xpV\\{G@J�W�.�S@QF.�|G@*�Ws��S@3	�s4}G@G�WKZ�S@j��.}G@c�W3�S@�R��o}G@T�W��S@��Xl}G@0�W���S@�X�W}G@', 16),
(31, 'Leach Pad Phase 2 (approximately)', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0~�W+��S@X�$A�yG@g�W{e�S@,*��\"xG@=�W�m\0T@�0R7	yG@i�W���S@�u��yzG@~�W+��S@X�$A�yG@', 16),
(32, 'Leach Pad Phase 1 (approx.)', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0�W��S@��@�{zG@�WCo\0T@7�e\ryG@\"�W�(T@��(j�yG@��W��\0T@�C�zG@�W�\0T@yB�zG@�W��S@���M�zG@�W��S@��@�{zG@', 16),
(33, 'deneme', 87, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0�W�\0T@Ҡ2e|G@�W���S@^���|{G@B�W�\0T@�$.F�{G@�W�\0T@Ҡ2e|G@', 16),
(34, 'Proje Sorumluluk Alanı', 88, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0Zh	�3\0T@R�c(n{G@yh	\rzT@D-�xG@�h	\rE�S@Ә�kxwG@�h	��S@��){G@Zh	�3\0T@R�c(n{G@', 1),
(35, 'sevdugumun poligonu', 89, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0�3j��D@N\"u�D@+3z��D@�t��?�D@�3J��D@<ʲ蚗D@�3���D@��\n���D@�3j��D@N\"u�D@', 21),
(36, 'Stadium-Dorm-Faculty Triangulation', 92, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0��bR=@y�I�#�D@�����=@�\"��D@/����=@`3�gt�D@��bR=@y�I�#�D@', 16),
(37, 'KİRACI ÇAĞDAŞ KORKMAZ', 101, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0m\0-=@�	��x�D@�\0=@�4�2u�D@H\0�=@�`��s�D@\r\0�\Z=@^�w�D@m\0-=@�	��x�D@', 32),
(38, 'KİRACI MURAT KENDİR', 101, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0I\0��=@�!8	��D@�\0��=@�y!��D@��\r=@!<���D@^\0�m=@�{�~��D@I\0��=@�!8	��D@', 32),
(40, 'epsg2319', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0ףp=\n�9@\0\0\0\0\0@B@ףp=\n�9@�����E@\0\0\0\0\0�<@�����E@\0\0\0\0\0�<@\0\0\0\0\0@B@ףp=\n�9@\0\0\0\0\0@B@', 1),
(42, 'epsg2320', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�<@fffffB@\0\0\0\0\0�<@�����E@\0\0\0\0\0�?@�����E@\0\0\0\0\0�?@fffffB@\0\0\0\0\0�<@fffffB@', 1),
(43, 'epsg2321', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�?@33333�A@\0\0\0\0\0�?@�����E@\0\0\0\0\0@A@�����E@\0\0\0\0\0@A@33333�A@\0\0\0\0\0�?@33333�A@', 1),
(44, 'epsg2322', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@A@������A@\0\0\0\0\0@A@�����E@\0\0\0\0\0�B@�����E@\0\0\0\0\0�B@������A@\0\0\0\0\0@A@������A@', 1),
(45, 'epsg2323', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�B@�����LB@\0\0\0\0\0�B@33333�D@\0\0\0\0\0@D@33333�D@\0\0\0\0\0@D@�����LB@\0\0\0\0\0�B@�����LB@', 1),
(46, 'epsg2324', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@D@\0\0\0\0\0�B@\0\0\0\0\0@D@������D@\0\0\0\0\0�E@������D@\0\0\0\0\0�E@\0\0\0\0\0�B@\0\0\0\0\0@D@\0\0\0\0\0�B@', 1),
(47, 'epsg2325', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�E@33333sB@\0\0\0\0\0�E@\0\0\0\0\0�D@�����lF@\0\0\0\0\0�D@�����lF@33333sB@\0\0\0\0\0�E@33333sB@', 1),
(48, 'EPSG:23035', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08@\0\0\0\0\0`A@\0\0\0\0\0\08@33333T@\0\0\0\0\0\0>@33333T@\0\0\0\0\0\0>@\0\0\0\0\0`A@\0\0\0\0\0\08@\0\0\0\0\0`A@', 1),
(49, 'EPSG:23036', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>@\0\0\0\0\0\0?@\0\0\0\0\0\0>@fffff�E@\0\0\0\0\0\0B@fffff�E@\0\0\0\0\0\0B@\0\0\0\0\0\0?@\0\0\0\0\0\0>@\0\0\0\0\0\0?@', 1),
(50, 'EPSG:23037', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B@\nףp=�A@\0\0\0\0\0\0B@fffff�E@\0\0\0\0\0\0E@fffff�E@\0\0\0\0\0\0E@\nףp=�A@\0\0\0\0\0\0B@\nףp=�A@', 1),
(51, 'EPSG:23038', 102, 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E@\0\0\0\0\0�B@\0\0\0\0\0\0E@33333�D@\0\0\0\0\0\0H@33333�D@\0\0\0\0\0\0H@\0\0\0\0\0�B@\0\0\0\0\0\0E@\0\0\0\0\0�B@', 1),
(52, '1', 132, 0, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ҹ=@}9����D@�\0\0\0��=@6�K���D@`\0\0|�=@�K\"L8�D@�\0\0��=@ʖ�[u�D@\0\0Ҹ=@}9����D@', 1);

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
(0, 'Şantiye', 1, 'santiye', 16),
(1, 'Fakülteler', 1, 'fakulteler', 16),
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
(0, 'Oturduğum Evler', 0, 'oturdugum_evler', 27),
(0, 'MALİK OSMAN GÜNDÜZ', 1, 'malik_osman_gunduz', 32),
(0, 'ED50_3_derece_dilimler', 1, 'ed50_3_derece_dilimler', 1),
(0, 'ED50_3_derece', 1, 'ed50_3_derece', 1),
(0, 'ed50_6_derece', 1, 'ed50_6_derece', 1),
(0, 'ed50_6_der', 1, 'ed50_6_der', 1),
(0, 'ED50UTM', 1, 'ed50utm', 1),
(0, '6derecelikUTM', 1, '6derecelikutm', 1),
(0, 'ed50utm', 1, 'ed50utm', 1),
(0, 'turkiyeutm', 1, 'turkiyeutm', 1),
(0, 'ed50_6_derece', 1, 'ed50_6_derece', 1),
(0, 'KUSÇAMI', 1, 'kuscami', 32),
(0, 'KUSCAMİ', 1, 'kuscami', 32),
(0, 'KUSCAMİ', 1, 'kuscami', 32),
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
(1, 'Ortalığı karıştıran', 10, 'Yer ve gök, kötü ve iyi, doğum ve ölüm biribirinden ayrılmıştı', 'PNT_137/235', 'https://en.wikipedia.org/wiki/Quimbanda', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Obatala_Priester_im_Tempel.jpg/200px-Obatala_Priester_im_Tempel.jpg'),
(2, 'Sahra\'nın Yeşillikleri', 11, 'Sanatın burada bize anlattığı, çölün o zamanlar çöl olmadığı', 'PNT_137/236', 'https://tr.wikipedia.org/wiki/Tassili_n%27Ajjer', 'https://upload.wikimedia.org/wikipedia/commons/d/dd/African_cave_paintings.jpg'),
(3, 'Dedeler', 13, 'Bizim çocuklarımızın bir sürü anası ve babası vardır. Ne kadar isterlerse o kadar.', 'PNT_137/237', 'https://en.wikipedia.org/wiki/Dagaaba_people', 'https://3.bp.blogspot.com/-jZdqh0-2frE/T5xXimDh57I/AAAAAAAAAmM/lXRJ7UYv8nc/s640/Bong+Ngo+Festival+026.JPG'),
(4, 'Yazının bulunuşu', 17, 'Biz tozdan ve hiçlikteniz. Bütün yaptığımız bir rüzgardan başka bir şey değil.', 'PNT_137/238', 'https://en.wikipedia.org/wiki/En%C3%BBma_Eli%C5%A1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Chaos_Monster_and_Sun_God.png/250px-Chaos_Monster_and_Sun_God.png'),
(5, 'Masa Ayinleri', 19, 'Irakın Asur ülkesi olduğu dönemde, bir kral Nemrut şehrindeki sarayında bir ziyafet verdi', 'PNT_137/239', 'https://en.wikipedia.org/wiki/Mount_Nemrut', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Mount_Nemrut.jpg/150px-Mount_Nemrut.jpg'),
(6, 'Biranın Kısa Tarihi', 20, 'Biranın hiçbir suçu yoktur. Bütün suç yoldadır.', 'PNT_137/240', 'https://en.wikipedia.org/wiki/History_of_beer', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Alulu_Beer_Receipt.jpg/220px-Alulu_Beer_Receipt.jpg'),
(7, 'Şarabın kısa tarihi', 21, 'Pers Kralı Kiros\'un kudretini simgeleyen amblem bir asma ağacıydı.', 'PNT_137/241', 'https://tr.wikipedia.org/wiki/II._Kiros', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Olympic_Park_Cyrus.jpg/220px-Olympic_Park_Cyrus.jpg'),
(8, 'Sonsuza dek yaşamak isteyen kral', 21, 'Dün, zaman bizi emzirdi, ama yarın bizi yiyecek.', 'PNT_137/242', 'https://tr.wikipedia.org/wiki/G%C4%B1lgam%C4%B1%C5%9F', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/H%C3%A9rosma%C3%AEtrisantunlion.jpg/200px-H%C3%A9rosma%C3%AEtrisantunlion.jpg'),
(9, 'Diğer bir ölümsüzlük macerası', 22, 'Ölüm tanrıçası Hime\'yi aramak için yeraltı dünyasına bir yolculuk yaptı', 'PNT_137/243', 'https://en.wikipedia.org/wiki/M%C4%81ui_(mythology)', 'https://www.tourmaui.com/wp-content/uploads/Demigod-Maui-Snaring-the-Sun-by-Paul-Rockwood-1951-National-Park-Service.jpg'),
(10, 'Taşın söylediği', 24, 'Heredot, Strabon, Diodoro ve Horapollo uydurdukları şekilde tercüme ederken Cizvit rahip Athanasius Kircher saçmalıklarla dolu dört cilt yayınlamıştı.', 'PNT_137/244', 'https://tr.wikipedia.org/wiki/Rosetta_Ta%C5%9F%C4%B1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Rosetta_Stone.JPG/270px-Rosetta_Stone.JPG'),
(11, 'Tavuğun ortaya çıkışı', 27, 'Bu kuş güzel değil. Şakımayı da bilmez. Kısa bir gagası, aptal bir ibiği, salakça bakan gözleri var. Ama her gün bir yavru verir.', 'PNT_137/245', 'https://en.wikipedia.org/wiki/Thutmose_III', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/A_fragment_of_a_wall_block._The_hieroglyphs_Son_of_Ra_were_inscribed_over_the_cartouche_of_the_birth-name_of_Thutmos_III._18th_Dynasty._From_Egypt._The_Petrie_Museum_of_Egyptian_Archaeology%2C_London.jpg/220px-thumbnail.jpg'),
(12, 'Hatşepsut', 28, 'Benim şahinim hükümdarlık bayraklarının dalgalandığı yerlerin çok ötesine, sonsuzluğa doğru uçar.', 'PNT_137/246', 'https://tr.wikipedia.org/wiki/Hat%C5%9Fepsut', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Hatshepsut.jpg/220px-Hatshepsut.jpg'),
(13, 'Savaş Tiyatrosu', 30, 'Kadın gibi giyinip, kadın gibi taranıp, kadın gibi makyaj yaparak isyanın liderlerini baştan çıkardı ve bir eğlence sırasında kılıcıyla hepsini kavun gibi ikiye böldü.', 'PNT_137/247', 'https://en.wikipedia.org/wiki/Yamato_Takeru', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg/220px-Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg'),
(14, 'Savaş sanatı', 31, 'Düşmanı tanımak için önce kendini tanı', 'PNT_137/248', 'https://tr.wikipedia.org/wiki/Sun_Tzu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Enchoen27n3200.jpg/200px-Enchoen27n3200.jpg'),
(15, 'Savaşın dehşeti', 31, 'Orduların kamp yaptıkları yerlerde sadece böğürtlen ve diken biter.', 'PNT_137/249', 'https://tr.wikipedia.org/wiki/Laozi', 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Laozi.jpg'),
(16, 'Çin kitabının ortaya çıkışı', 33, 'Cang Jie\'nin icadı olan ideogramlar, erkeklerin sekiz asırdan fazla yaşadığı ve kadınların güneş yedikleri için ışık renginde oldukları bir krallığın hikayesini anlatır.', 'PNT_137/250', 'https://en.wikipedia.org/wiki/Cangjie', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Cangjie2.jpg/180px-Cangjie2.jpg'),
(17, 'Sözcük kaçakçıları', 38, 'Çinli kadınların gizli lisanı Nushu\'yu bilen son kişidi.', 'PNT_137/251', 'https://en.wikipedia.org/wiki/Yang_Huanyi', 'http://www.racematters.org/assets/YangHuanyi.jpg'),
(18, 'Romalı kadınlar', 43, 'Cicero, akıl düzeylerinin düşüklüğünden ötürü kadınların mutlaka erkek bir koruyucunun tahakkümü altında olmaları gerektiğini buyurmuştu.', 'PNT_137/252', 'https://tr.wikipedia.org/wiki/Marcus_Tullius_Cicero', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Cicero_-_Musei_Capitolini.JPG/220px-Cicero_-_Musei_Capitolini.JPG'),
(19, 'Amazonlar', 44, 'Amerika kıtasını boydan boya geçen büyük nehre amazon adını veren kişi ispanyol konkistador Francisco de Orellanadır.', 'PNT_137/253', 'https://tr.wikipedia.org/wiki/Amazonlar', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Amazone_Staatliche_Antikensammlungen_8953.jpg/220px-Amazone_Staatliche_Antikensammlungen_8953.jpg'),
(20, 'Thales', 48, 'Mısır\'da düşünmeyi öğrenmiş olan Thales, tutulmaların ne zaman gerçekleşeceğini hiç hatasız önceden bilirdi.', 'PNT_137/254', 'https://tr.wikipedia.org/wiki/Thales', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Thales.jpg/220px-Thales.jpg'),
(21, 'Irkçılığın bilimsel olarak ortaya çıkışı', 51, 'İnsan ırkları arasındaki hiyerarşinin en tepe noktasını işgal eden beyaz azınlık hala Kafkas ırkı diye anılıyor.', 'PNT_137/255', 'https://en.wikipedia.org/wiki/Johann_Friedrich_Blumenbach', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Johann_Friedrich_Blumenbach.jpeg/220px-Johann_Friedrich_Blumenbach.jpeg'),
(22, 'İskender', 53, 'Efestion ölünce, daha önce paylaşmış oldukları şarabı tek başına içti, imparatorluk toprakları üzerinde müziği yasakladı.', 'PNT_137/256', 'https://tr.wikipedia.org/wiki/%C4%B0skender', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Alexander_the_Great_mosaic.jpg/270px-Alexander_the_Great_mosaic.jpg'),
(23, 'Homeros', 54, 'Ancak kör ozan artık orada bulunmayan bütük şehri görmeyi başardı.', 'PNT_137/257', 'https://tr.wikipedia.org/wiki/Homeros', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Homer_British_Museum.jpg/220px-Homer_British_Museum.jpg'),
(24, 'Hipokrat', 62, 'Herkesin kan dolaşımı aynıdır, nefes alışı aynıdır. Her şey her şeyle bağlantılıdır.', 'PNT_137/258', 'https://tr.wikipedia.org/wiki/Hipokrat', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Hippocrates_rubens.jpg/220px-Hippocrates_rubens.jpg'),
(25, 'Aspasia', 63, 'Bu kadın hangi becerisi ya da kudreti sayesinde en üst düzey politikacılara hükmediyor ve filozoflara ilham kaynağı oluyordu? -Plutarkhos', 'PNT_137/259', 'https://tr.wikipedia.org/wiki/Miletli_Aspasia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Aspasie_Pio-Clementino_Inv272.jpg/220px-Aspasie_Pio-Clementino_Inv272.jpg'),
(26, 'Sapfo', 63, 'İki bin altı yüz önce Lesbos Adasında doğduğu ve Lezbiyen teriminin de oradan geldiği söyleniyor.', 'PNT_137/260', 'https://tr.wikipedia.org/wiki/Sapfo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Herkulaneischer_Meister_002b.jpg/250px-Herkulaneischer_Meister_002b.jpg'),
(27, 'Kral Antiokus (Eunus)', 66, 'Bir kaç gün sonra köle  kral oldu. Ağzından alevler çıkararak sahibinin kafasını kopardı ve büyük bir ayaklanma çıkardı.', 'PNT_137/261', 'https://en.wikipedia.org/wiki/Eunus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Euno22009si.jpg/220px-Euno22009si.jpg'),
(28, 'Spartaküs', 67, 'İsa\'dan 72 yıl önce, marangozlar, Capua\'dan Roma\'ya kadar bütün Appia yolu boyunca yeni haçlar diktiler.', 'PNT_137/262', 'https://tr.wikipedia.org/wiki/Spartak%C3%BCs', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Tod_des_Spartacus_by_Hermann_Vogel.jpg/220px-Tod_des_Spartacus_by_Hermann_Vogel.jpg'),
(29, 'Bir imparatorluğun tuzu', 69, 'İmparator Augustus kamuoyu nezdinde gücünü sağlamlaştırmak için halka rüşvet olarak tuz dağıttı.', 'PNT_137/263', 'https://en.wikipedia.org/wiki/Augustus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Statue-Augustus.jpg/220px-Statue-Augustus.jpg'),
(30, 'Kleopatra', 70, 'Son firavun, söylenenlere bakılırsa, o kadar güzel olmayan, bir çok dil konuşan, ekonomiden ve diğer erkek gizemlerinden anlayan, Jul Sezar ve Marcus Antonius\'la yatağı ve gücü pauylaşan kadın...', 'PNT_137/264', 'https://tr.wikipedia.org/wiki/VII._Kleopatra', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kleopatra-VII.-Altes-Museum-Berlin1.jpg/220px-Kleopatra-VII.-Altes-Museum-Berlin1.jpg'),
(31, 'Oğul', 78, 'Nenizili Aziz Gregor 379 yılında ona doğum sertifikasını verene kadar İsa, hiç doğum günü kutlamadan neredeyse dört asır geçirmişti.', 'PNT_137/265', 'https://tr.wikipedia.org/wiki/Nenizili_Gregorios', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Gregor-Chora.jpg/230px-Gregor-Chora.jpg'),
(32, 'İsa\'nın dirilişi', 79, 'Mazatekoların söylediğine göre İsa Oaxacada çarmıha gerilmiş, çünkü yoksulları ve ağaçları konuşturuyormuş.', 'PNT_137/266', 'https://en.wikipedia.org/wiki/Mazatec', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Huautla_de_Jimenez.jpg/249px-Huautla_de_Jimenez.jpg'),
(33, 'Aziz Klaus\'un ortaya çıkışı', 81, 'Aziz Klaus, 1863 yılında New Yorktaki Harpers dergisinde yayınlanan ilk resminde bir bacadan girmeye çalışan şişko bir cüceydi.', 'PNT_137/267', 'https://en.wikipedia.org/wiki/Santa_Claus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Santa_Claus_1863_Harpers.png/395px-Santa_Claus_1863_Harpers.png'),
(34, 'Hypatia', 83, 'Düşünme hakkını koru, Yanılarak düşünmek hiç düşünmemekten daha iyidir.', 'PNT_137/268', 'https://en.wikipedia.org/wiki/Hypatia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Mort_de_la_philosophe_Hypatie.jpg/400px-Mort_de_la_philosophe_Hypatie.jpg'),
(35, 'Ayşe', 85, 'Dökülen bu kan Sünnilerle Şiiler arasında bugün hala kurban almaya devam eden nefretin başlangıcını oluşturdu.', 'PNT_137/269', 'https://tr.wikipedia.org/wiki/Ai%C5%9Fe', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Mohammed_and_his_wife_Aisha_freeing_the_daughter_of_a_tribal_chief._From_the_Siyer-i_Nebi.jpg/220px-Mohammed_and_his_wife_Aisha_freeing_the_daughter_of_a_tribal_chief._From_the_Siyer-i_Nebi.jpg'),
(36, 'Bağdat', 88, 'Algoritma ve guarismo sözcüklerinin kökeniyse, Muhammed el-Harezminin soyadından gelir.', 'PNT_137/270', 'https://tr.wikipedia.org/wiki/H%C3%A2rizm%C3%AE', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/1983_CPA_5426_%281%29.png/220px-1983_CPA_5426_%281%29.png'),
(37, 'Haçlı Seferleri', 89, 'Papanın delegesi başrahip Arnaud Amaury şöyle buyuruyordu: Siz hepsini öldürün. Tanrı kendinden olanları ayırt etmesini bilecektir.', 'PNT_137/271', 'https://nl.wikipedia.org/wiki/Arnaud_Amaury', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/NKP_XXIII_F_144_0_04v.jpg/220px-NKP_XXIII_F_144_0_04v.jpg'),
(38, 'Şair Peygamber', 91, 'Kader bizi camdanmışız gibi kırıyor ve bu parçalar bir daha asla yapışmıyor.', 'PNT_137/272', 'https://en.wikipedia.org/wiki/Al-Ma%CA%BFarri', 'https://upload.wikimedia.org/wikipedia/en/9/99/Al-Ma%CA%BFarri_bust2.jpg'),
(39, 'İnsan yiyen dev bir tatar', 104, 'Ne var ki Cengiz Hanın yeğeni Kubilay Han zaman zaman Pekindeki sarayına ulaşan Avrupalı seyyahları çiğ çiğ yemiyordu. Marco Polo onun için çalıştı.', 'PNT_137/273', 'https://en.wikipedia.org/wiki/Kublai_Khan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/YuanEmperorAlbumKhubilaiPortrait.jpg/220px-YuanEmperorAlbumKhubilaiPortrait.jpg'),
(40, 'Marco Polo', 104, 'Yanan yağlar petroldü, yanan kayalar kömürdü, kğıt beş yüzyıldır kullanılıyordu, Avrupalıların gemilerinden beş kat büyük gemilerde sebze bahçeleri vardı, tek boynuzlu at gergedandı ve ateşe dayanaklı kumaş amyanttı.', 'PNT_137/274', 'https://en.wikipedia.org/wiki/Marco_Polo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Marco_Polo_-_costume_tartare.jpg/250px-Marco_Polo_-_costume_tartare.jpg'),
(41, 'Savaşçı Azize', 112, 'Onu odun ateşinde kızartmış olan vatanı ve kilisesi daha sonra fikir değiştirdiler.', 'PNT_137/275', 'https://en.wikipedia.org/wiki/Joan_of_Arc', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Joan_of_Arc_miniature_graded.jpg/200px-Joan_of_Arc_miniature_graded.jpg');

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
(1, 'ED50 TM27 (Zone 9)', 2319, 'http://spatialreference.org/ref/epsg/2319/', 27, 'Kırklareli, Edirne, Tekirdağ, İstanbul, Çanakkale, Balıkesir, Bursa, İzmir; Manisa, Aydın, Muğla', 'PLY_102/40'),
(2, 'ED50 TM30 (Zone 10)', 2320, 'http://spatialreference.org/ref/epsg/2320/', 30, 'İstanbul, Kocaeli, Adapazarı, Düzce, Bolu, Zonguldak, Yalova, Balıkesir, Bursa, Bilecik, Eskişehir, Ankara, Kütahya, Manisa, Uşak, Afyonkarahisar, Aydın, Denizli, Burdur, Isparta, Muğla, Antalya, Konya', 'PLY_102/42'),
(3, 'ED50 TM33 (Zone 11)', 2321, 'http://spatialreference.org/ref/epsg/2321/', 33, 'Zonguldak, Bartın, Kastamonu, Bolu, Karabük, Çorum, Sinop, Eskişehir, Ankara, Çankırı, Çorum, Kırıkkale, Kırşehir, Yozgat, Nevşehir, Aksaray, Antalya, Niğde, Karaman, Mersin', 'PLY_102/43'),
(4, 'ED50 TM36 (Zone 12)', 2322, 'http://spatialreference.org/ref/epsg/2322/', 36, 'Sinop, Samsun, Ordu, Çorum, Amasya, Tokat, Yozgat, Sivas, Nevşehir, Kayseri, Niğde, Kahramanmaraş, Malatya, Mersin, Adana, Osmaniye, Gaziantep, Adıyaman, Hatay, Kilis', 'PLY_102/44'),
(5, 'ED50 TM39 (Zone 13)', 2323, 'http://spatialreference.org/ref/epsg/2323/', 39, 'Ordu, Tokat, Giresun, Trabzon, Rize, Gümüşhane, Bayburt, Sivas, Erzincan, Tunceli, Bingöl, Malatya, Elazığ, Bingöl, Kahramanmaraş, Adıyaman, Diyarbakır, Gazientep, Şanlıurfa, Mardin', 'PLY_102/45'),
(6, 'ED50 TM42 (Zone 14)', 2324, 'http://spatialreference.org/ref/epsg/2324/', 42, 'Rize, Artvin, Ardahan, Erzincan, Erzurum, Kars, Bingöl, Muş, Ağrı, Iğdır, Bitlis, Van, Diyarbakır, Mardin, Batman, Siirt, Şırnak, Hakkari', 'PLY_102/46'),
(7, 'ED50 TM45 (Zone 15)', 2325, 'http://spatialreference.org/ref/epsg/2325/', 45, 'Kars, Ağrı, Iğdır, Van, Hakkari', 'PLY_102/47');

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
(2, 'Basın Müzesi', 'Çemberlitaş', 83, 'http://www.youtube.com/watch?v=Q3UPA-KJYEQ', 'LNS_97/48', 'PNT_97/145', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5525&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5525&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(4, 'Saray Mozaikleri Müzesi', 'Basın Müzesi', 652, 'http://www.youtube.com/watch?v=d_Mf8LYIMX8', 'LNS_97/49', 'PNT_97/147', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5533&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5533&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(5, 'Sultanahmet Parkı', 'Mozaik Müzesi', 380, 'http://www.youtube.com/watch?v=JCh20vH0CEE', 'LNS_97/50', 'PNT_97/151', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5537&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5537&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(6, 'Padişah Türbeleri', 'Dikilitaş', 40, 'http://www.youtube.com/watch?v=NIt_n6O7v1k', 'LNS_97/51', 'PNT_97/148', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5534&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5534&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(7, 'Topkapı Sarayı', 'Türbe Müzesi', 200, 'http://www.youtube.com/watch?v=HxsPTSNiO8M', 'LNS_97/52', 'PNT_97/149', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5535&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5535&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(8, 'Arkeoloji Müzesi', 'Topkapı Sarayı', 120, 'http://www.youtube.com/watch?v=iZKi19bVj8w', 'LNS_97/55', 'PNT_97/150', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5536&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5536&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(9, 'Ayasofya Müzesi', 'Sultanahmet Meydanı', 40, 'http://www.youtube.com/watch?v=SW3dK_U2Vbo', 'LNS_97/53', 'PNT_97/153', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5539&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5539&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>'),
(10, 'Yerebatan Sarnıcı', 'Ayasofya', 60, 'http://www.youtube.com/watch?v=HWDH4tL5k7M', 'LNS_97/54', 'PNT_97/152', '<object width=\"340\" height=\"255\"><param name=\"movie\" value=\"http://pan0.net/v/up-5538&hiq=1\"><param name=\"allowScriptAccess\" value=\"always\"><param name=\"allowFullScreen\" value=\"true\"><embed src=\"http://pan0.net/v/up-5538&hiq=1\" type=\"application/x-shockwave-flash\" width=\"340\" height=\"255\" allowScriptAccess=\"always\" allowFullScreen=\"true\"></embed></object>');

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
(5, 'Ephesus', '1000 BC', 'Ephesos, Efes', 'Site of the Temple of Artemis in the town of Selçuk, near Ephesus.', 'http://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Ac_artemisephesus.jpg/800px-Ac_artemisephesus.jpg', 'PNT_95/126'),
(6, 'Colophon', 'unknown', '-', 'Colophon is located to the right of the center on this map of ancient Ionia.', 'http://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Ionia%2C_Asia_Minor_Map%2C_Classical_Atlas%2C_1886%2C_Keith_Johnston.jpg/493px-Ionia%2C_Asia_Minor_Map%2C_Classical_Atlas%2C_1886%2C_Keith_Johnston.jpg', 'PNT_95/127'),
(7, 'Lebedus', 'unknown', 'Lebedos', 'Lebedos was located on and around the Kısık Peninsula.', 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Kisik_or_Lebedos_Peninsula_Urkmez_Seferihisar_Izmir_Turkey.JPG/800px-Kisik_or_Lebedos_Peninsula_Urkmez_Seferihisar_Izmir_Turkey.JPG', 'PNT_95/128'),
(8, 'Teos', '540 BC', '-', 'Ruins of the theatre in Teos', 'http://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Theater_teos.JPG/800px-Theater_teos.JPG', 'PNT_95/129'),
(9, 'Erythrae', '700 BC', 'Erythrai, Litri', 'Ruins of the amphitheatre at Erythrae', 'http://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Erythrai_amphitheatre.jpg/800px-Erythrai_amphitheatre.jpg', 'PNT_95/130'),
(10, 'Klazomenai', '600 BC', 'Clazomenae', 'Coin from Klazomenai depicting a winged boar, 499 BC', 'http://upload.wikimedia.org/wikipedia/commons/e/e8/Ionia499bc.jpg', 'PNT_95/131'),
(11, 'Phocaea', '900 BC', 'Phokaia, Foça', 'Electrum coinage of Phocaea, 340-335 BC.', 'http://upload.wikimedia.org/wikipedia/en/9/9b/Phocaea_coinage2.jpg', 'PNT_95/132'),
(12, 'Samos', '700 BC', '-', 'Kouros of Samos, the largest surviving Kouros in Greece (Archaeological Museum of Samos)', 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Samoskouros.JPG/327px-Samoskouros.JPG', 'PNT_95/134'),
(13, 'Chios', '1100 BC', 'Sakız', '16th-century map of Chios by Piri Reis', 'http://upload.wikimedia.org/wikipedia/en/thumb/9/93/Chios_by_Piri_Reis_Rotated.jpg/441px-Chios_by_Piri_Reis_Rotated.jpg', 'PNT_95/133'),
(14, 'Smyrna', '1100 BC', 'İzmir', 'Bayraklı archeological site', 'http://bayraklikultur.com/Images/galeri/IzmirSmyrnaAgora20004.jpg', 'PNT_95/136');

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
(2, 'Çığırtma', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104827819\"></iframe>', 'PNT_96/138', 'http://www.karamanlihaber.com/resim/haber/2012/10/kmm_cigirtma_1.jpg', 'Wind Type'),
(3, 'Classical Kemece', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104829333\"></iframe>', 'PNT_96/139', 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Kemence_Sezgin_%281%29.jpg/800px-Kemence_Sezgin_%281%29.jpg', 'String instrument'),
(4, 'Cumbus', 'Zeynel Abidin Cümbüş', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104831550\"></iframe>', 'PNT_96/140', 'http://upload.wikimedia.org/wikipedia/en/2/23/Zeynel_Abidin_C%C3%BCmb%C3%BC%C5%9F.png', 'Plucked string instrument'),
(5, 'Tulum (Dankiyo)', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104833547\"></iframe>', 'PNT_96/141', 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Touloum.JPG/300px-Touloum.JPG', 'bagpipe'),
(6, 'Bulgarı', 'anonym', '<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F104868074\"></iframe>', 'PNT_96/142', 'https://i1.ytimg.com/vi/8aqTahk7_CQ/mqdefault.jpg', 'String instrument'),
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
(2, 'Fen Edebiyat Fakültesi', 630, 62, 'PNT_84/49'),
(4, 'İşletme Bölümü', 462, 35, 'PNT_85/51'),
(5, 'Makina Fakültesi', 999, 65, 'PNT_86/50');

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
(2, 'MİLAS', 'FELDİSPAT', '0000-00-00', 'LNS_107/56', 'http://www.youtube.com/watch?v=1L3AUclDbqU', 'http://j1310.hizliresim.com/1g/n/trh1p.jpg', 'PNT_107/166', '<iframe width=\"560\" height=\"350\" src=\"http://www.panomonkey.com/image/iframe/50913/imag3074\" frameborder=\"0\" allowfullscreen></iframe>');

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
(1, 'MİLAS_KUSCAMI', 'FELDİSPAT', '08.08.2006', '29.09.2013', '120 m3', 'http://j1310.hizliresim.com/1g/n/trh1p.jpg', 'http://www.youtube.com/watch?v=1L3AUclDbqU', '<iframe width=\"560\" height=\"350\" src=\"http://www.panomonkey.com/image/iframe/50913/imag3074\" frameborder=\"0\" allowfullscreen></iframe>', 'PNT_107/166', 'LNS_107/56');

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
(1, 'İBB Üstyapı Projeler', '535 562 81 03', 'Cemal Özgür Kıvılcım', 'PNT_110/169'),
(2, 'İSKİ Kağıthane Gen. Müd.', '212 321 00 00', 'Ünal Kartal CBS Şb. Müd.', 'PNT_110/171'),
(3, 'İGDAŞ', '0 533 558 21 66', 'Gönül Yıldız', 'PNT_110/172'),
(4, 'Çevre ve Şehircilik İstanbul İl Müdürlüğü', '0 212 318 41 00 ', 'Cihangir Topçu', 'PNT_110/173'),
(20, 'Muğla İl Özel İdaresi', '0 252 214 14 28 / 120', 'Özlem Çerçi ve Sadullah Durgut', 'PNT_113/175'),
(21, 'Muğla Kültür Varlıklarını Koruma Kurulu', '0252 213 0151 / 113, 114', 'Fikret Gürbüzler', 'PNT_113/176'),
(22, 'Muğla ÇŞB İl Müd.', '0252. 2141258/4092 ', 'Mehmet Ayhan ve Ayşe Kargın', 'PNT_113/177'),
(23, 'Aydın İl Özel İdaresi', '0 256 212 72 00 / 8121', 'Ramazan Sarısakal', 'PNT_113/178'),
(24, 'Aydın ÇŞB İl Müd.', '0256 219 57 70 / 409', 'Fatma Baysal ve Ümit Göç', 'PNT_113/179'),
(25, 'İzmir Orman ve Suişleri Bölge Müd.', '0 232 369 80 06', 'Hüseyin Doğan ve Latif Bozan', 'PNT_113/180'),
(26, 'İzmir ÇŞB İl Müd.', '232 3416800 / 1437 ', 'Hayri Laledağı', 'PNT_113/181'),
(27, 'İzmir BB', '232 293 13 22', 'Mustafa Kubilay Yıldırım', 'PNT_113/182'),
(28, 'İZSU', ' 232 293 2580', 'özgür şenim', 'PNT_113/183'),
(29, 'Gediz / Teiaş', '0232 477 26 00 / 2125', 'Emel Tetik', 'PNT_113/184'),
(30, 'DEU CBS Ana Bilim Dalı', '+90 (232) 301 70 26', 'Okan Fıstıkoğlu, DEU DOÇ DR ', 'PNT_113/185'),
(31, 'Vakıflar Genel Müdürlüğü', '(0232) 441 5292', 'Utku Deniz, VGM İzmir bölge Müd.', 'PNT_113/186'),
(32, 'İzmirGaz', '232 449 3939', 'Gökçen Bilgen', 'PNT_113/187'),
(33, 'Muğla Belediyesi', '444 48 01 / 230', 'Üstün Gençer', 'PNT_113/188'),
(34, 'Muğla Üniveristei CBS', '0 252 211 5585', 'Ceyhun Özçelik', 'PNT_113/192'),
(35, 'Muğla Orman Bölge Müdürlüğü', '', '', 'PNT_113/191'),
(36, 'Muğla Karayolları 26. Bölge Müdürlüğü', '', '', 'PNT_113/190'),
(37, 'Muğla Tarım ve Köyişleri Bakanlığı', ' 0252 214 1250', 'Mehmet Gencer veya Ramazan Demir', 'PNT_113/189'),
(38, 'Muğla İl Afet ve Acil Durum Müd', '', '', 'PNT_113/193'),
(39, 'Aydın DSİ', '', '', 'PNT_115/194'),
(40, 'Aydın Karayolları', '', '', 'PNT_115/195'),
(41, 'Aydın Orman Genel Müd.', '', '', 'PNT_115/196'),
(42, 'Aydın Kültür ve Turizm İl Müd.', '', '', 'PNT_115/197'),
(43, 'UTAEM Menemen ', '', 'Nejat Özden', 'PNT_113/198'),
(44, 'Muğla BESOT', '0252 214 18 46 / 254', 'Baki Ülgen', 'PNT_114/199'),
(45, 'Muğla DSİ', '0252 214 1137', 'Metin Gül', 'PNT_114/200'),
(46, 'Aydın Belediyesi', '', 'Halil Doğan', 'PNT_115/201'),
(47, 'Aydın Milli Emlak Genel Müd.', '506 854 92 72', 'Ferhat Çıtak', 'PNT_115/202'),
(48, 'Aydın Tarım ve Köyişleri Bakanlığı İl Müd.', '', 'Emre Durukal ve Olcay Atatanır', 'PNT_115/203'),
(49, 'İzmir BB CBS Şb. Müd.', '', 'Zafer Beydilli', 'PNT_113/204'),
(50, 'İZSU', '', 'Özgür Şenim', 'PNT_113/205'),
(51, 'İzmir Turizm ve Kültür Bakanlığı İl Müdürlüğü', '', 'Selda Taşçı', 'PNT_113/206'),
(52, 'İzmir BB Kentsel Dönüşüm Şb. Müd.', '232 293 45 17', 'Serhat Fındıkçı ve Rabia Kocakaya', 'PNT_113/207'),
(53, 'Trabzon İl Özel İdaresi', '', 'İlhan Bey ve İsmail Çiftçi', 'PNT_110/208'),
(54, 'Trabzon DSİ', '541 280 0000', 'Orhan Akdeniz', 'PNT_110/209'),
(55, 'Sakarya SEDAŞ', '264 295 85 00', 'Ayşegül Kaya', 'PNT_110/210'),
(56, 'Samsun İl Özel İdaresi', '', 'Ali Yılmaz', 'PNT_110/211'),
(57, 'Ordu İl Özel İdaresi', '452 233 2558', 'Murat Aygün', 'PNT_110/212'),
(58, 'Giresun İl Özel İdaresi', '532 644 9505', 'Murat Çiçek', 'PNT_110/213'),
(59, 'Artvin İl Özel İdaresi', '536 669 0247', 'Mustafa Bilgin', 'PNT_110/214'),
(60, 'Sivas Belediyesi', '544 661 00 27', 'Ahmet Turan Altun', 'PNT_110/215'),
(61, 'Zonguldak Kozlu TTK', '1', 'Serkan Sargınoğlu', 'PNT_110/216'),
(62, 'Orman', '', '', 'PNT_110/169'),
(63, 'Ankara Orman ve Suişleri Bakanlığı', '', 'Etem Akgündüz', 'PNT_110/217');

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
