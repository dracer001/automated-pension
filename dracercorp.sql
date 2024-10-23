-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3309
-- Generation Time: Oct 23, 2024 at 02:58 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dracercorp`
--
DROP DATABASE IF EXISTS `dracercorp`;

CREATE DATABASE IF NOT EXISTS `dracercorp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dracercorp`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `role` enum('super_admin','admin') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'IT'),
(6, 'Administration'),
(7, 'Public Relations'),
(8, 'Operations'),
(9, 'Legal'),
(10, 'Research and Development'),
(11, 'Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `address` tinytext NOT NULL,
  `employment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `terminated_date` timestamp NULL DEFAULT NULL,
  `employment_status` enum('employed','sacked','retired') NOT NULL DEFAULT 'employed',
  `account_number` int(11) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `postal_code` int(7) DEFAULT NULL,
  `sex` enum('male','female') NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `firstname`, `lastname`, `email`, `password`, `address`, `employment_date`, `terminated_date`, `employment_status`, `account_number`, `bank`, `postal_code`, `sex`) VALUES
(1, 'Adam', 'Watkins', 'adam.watkins.1@dracercorp.org', 'cdV3k3y@@0', '377 Russo Drive Colonton, UT 46937', '2015-04-08 12:19:07', '2017-11-01 18:45:01', 'sacked', 838517270, 'Standard IBTC', 632881, 'male'),
(2, 'Crystal', 'Robles', 'crystal.robles.2@dracercorp.org', '5490AAWzx_', '428 Decker Stravenue Suite 231 Wilkinsmouth, PR 94929', '2014-12-02 08:10:49', '2023-04-23 10:16:08', 'retired', 723387919, 'Standard IBTC', 615688, 'female'),
(3, 'Joseph', 'Mckee', 'joseph.mckee.3@dracercorp.org', '5Q2Dxqwa$#', '99600 Maddox Street Apt. 327 New Courtneyshire, SD 58461', '2020-10-12 01:48:32', '2023-06-10 02:20:23', 'sacked', 862179007, 'Polaris Bank', 251398, 'female'),
(4, 'Angela', 'Bullock', 'angela.bullock.4@dracercorp.org', '%8&ByX3GH4', '529 Aaron Ford Apt. 819 Pamelaborough, MS 11961', '2022-09-15 23:34:03', NULL, 'employed', 714788869, 'Zenith Bank', 688062, 'male'),
(5, 'Sarah', 'Franklin', 'sarah.franklin.5@dracercorp.org', 'yt80C#ha*#', '63653 Warner Ranch Suite 632 South Brianhaven, CO 49191', '2019-05-20 18:37:39', NULL, 'employed', 712200451, 'UBA', 979713, 'female'),
(6, 'Katherine', 'Franklin', 'katherine.franklin.6@dracercorp.org', '(Q3YkGaNm^', '725 Robert Flat West Amanda, MI 94968', '2015-07-14 10:21:44', NULL, 'employed', 724538976, 'Standard IBTC', 830482, 'male'),
(7, 'Robert', 'Williams', 'robert.williams.7@dracercorp.org', '$2ec*Ylj(2', '408 Scott Rue Walkerfurt, GA 87619', '2024-08-31 19:36:13', '2024-09-13 02:42:22', 'sacked', 353399178, 'Standard IBTC', 945832, 'male'),
(8, 'Timothy', 'Cross', 'timothy.cross.8@dracercorp.org', '7r(K17Fd!G', '9641 Timothy Wall West Kyle, FM 51143', '2021-08-24 01:27:59', '2021-11-26 01:41:38', 'sacked', 711621492, 'UBA', 892876, 'male'),
(9, 'Jennifer', 'Scott', 'jennifer.scott.9@dracercorp.org', '2e!WQQjB)5', '89435 Lopez Row Apt. 904 Dominguezton, ME 29064', '2019-02-15 12:01:31', NULL, 'employed', 767015177, 'Zenith Bank', 201526, 'female'),
(10, 'Martin', 'Tapia', 'martin.tapia.10@dracercorp.org', 'iLk7z7Lq&#', '959 Blair Burgs Apt. 817 Kimberlyside, NM 07883', '2018-10-31 05:10:24', '2023-01-15 23:43:33', 'sacked', 203647653, 'Access Bank', 912237, 'male'),
(11, 'Matthew', 'Mccall', 'matthew.mccall.11@dracercorp.org', '%R^*2qSu&n', '13735 Carter Harbors South Adam, MT 08935', '2022-11-16 23:40:56', NULL, 'employed', 143181695, 'UBA', 796666, 'female'),
(12, 'Megan', 'Ellis', 'megan.ellis.12@dracercorp.org', '8H@PS(g*)m', '7887 Jones Drives Morrisonfurt, MD 15340', '2016-11-21 10:25:26', '2017-04-07 21:09:44', 'retired', 279779162, 'Zenith Bank', 391261, 'female'),
(13, 'Samantha', 'Craig', 'samantha.craig.13@dracercorp.org', '%&)j0nQbua', '0488 Kimberly Key Charleshaven, OK 07484', '2022-06-26 03:34:32', '2024-01-26 04:29:12', 'sacked', 482378683, 'Union Bank', 407617, 'male'),
(14, 'Dennis', 'Graham', 'dennis.graham.14@dracercorp.org', '6F+PzrKn#F', 'USCGC Edwards FPO AP 65599', '2022-08-28 00:33:28', '2024-06-30 21:12:57', 'retired', 524464970, 'Union Bank', 670975, 'male'),
(15, 'Matthew', 'Conner', 'matthew.conner.15@dracercorp.org', 'k_Gy29PsYQ', '8249 Wiley Green Austinville, NM 86640', '2016-08-08 14:44:14', '2020-05-10 08:45:31', 'sacked', 279194644, 'Standard IBTC', 104346, 'male'),
(16, 'William', 'Robinson', 'william.robinson.16@dracercorp.org', 'P%4)Cz1mfG', '3481 Marissa Forge Kiaraburgh, OK 30938', '2023-05-10 18:54:05', NULL, 'employed', 566868008, 'Zenith Bank', 472054, 'male'),
(17, 'Kyle', 'Alvarez', 'kyle.alvarez.17@dracercorp.org', '!4Z0GDHr(M', '11933 Smith Court New James, LA 79954', '2017-03-08 10:43:13', '2020-12-21 18:50:17', 'retired', 903251750, 'Polaris Bank', 896313, 'male'),
(18, 'Shannon', 'Williams', 'shannon.williams.18@dracercorp.org', 'Mjb43iGr$X', '216 Deborah Ford North Danielshire, DE 86992', '2016-07-15 12:55:32', '2024-06-20 22:25:30', 'retired', 251745304, 'Polaris Bank', 115095, 'male'),
(19, 'Annette', 'Shepard', 'annette.shepard.19@dracercorp.org', '+wh4uMSv4U', '763 Perez Ports Pamelaton, RI 76313', '2017-12-03 07:18:08', NULL, 'employed', 645012685, 'Union Bank', 165112, 'male'),
(20, 'Andrea', 'Jackson', 'andrea.jackson.20@dracercorp.org', '%5kTS)$g#j', '6248 Turner Plain Suite 230 New Jenniferburgh, NM 75776', '2015-11-22 15:39:34', '2018-11-20 20:41:59', 'retired', 655056086, 'Standard IBTC', 773527, 'female'),
(21, 'Scott', 'Wilson', 'scott.wilson.21@dracercorp.org', '&yfFQILqA1', '463 French Road Davistown, GA 37478', '2021-07-10 08:20:33', '2021-12-17 11:54:39', 'sacked', 845663660, 'UBA', 878376, 'female'),
(22, 'Jennifer', 'Fleming', 'jennifer.fleming.22@dracercorp.org', '$lHWQxvv59', '3266 Amanda Track Lake Ronaldfort, RI 19275', '2023-03-08 18:12:02', NULL, 'employed', 385379104, 'UBA', 834955, 'male'),
(23, 'Jennifer', 'Williams', 'jennifer.williams.23@dracercorp.org', 'Bn66Ul!xG*', '108 Lisa Lodge Lake Amberstad, CA 36666', '2018-09-09 07:42:05', NULL, 'employed', 691062506, 'Zenith Bank', 523537, 'female'),
(24, 'Ashley', 'Williams', 'ashley.williams.24@dracercorp.org', 'd1OIxqNW_v', '088 Payne Prairie Jameston, CT 70294', '2024-10-14 00:37:38', '2024-10-19 07:52:43', 'retired', 534935153, 'Standard IBTC', 105118, 'male'),
(25, 'Carl', 'Simpson', 'carl.simpson.25@dracercorp.org', '@6HVq#Dp#H', '4612 Savannah Walk Laurenchester, NH 48976', '2023-12-02 03:37:09', '2024-08-31 20:27:29', 'retired', 716302111, 'Polaris Bank', 813363, 'male'),
(26, 'Lucas', 'Gillespie', 'lucas.gillespie.26@dracercorp.org', '^uTR(Y!zo1', '931 Sandra Plain Suite 320 Laurenton, UT 02955', '2017-10-14 23:32:35', NULL, 'employed', 960725450, 'Access Bank', 707685, 'female'),
(27, 'Stephanie', 'Mitchell', 'stephanie.mitchell.27@dracercorp.org', '*^IZ5Rxr%*', '98183 Corey Lake North Michael, LA 87306', '2018-03-27 06:37:09', '2020-09-02 20:04:51', 'retired', 529024856, 'Zenith Bank', 534276, 'female'),
(28, 'Jared', 'Thompson', 'jared.thompson.28@dracercorp.org', '@yBz3Pahr6', '268 Michael Dam Lopezside, MN 68566', '2023-08-29 19:30:08', '2023-12-14 09:12:40', 'sacked', 230823665, 'Standard IBTC', 827024, 'male'),
(29, 'Jason', 'Collins', 'jason.collins.29@dracercorp.org', 'B%J4As&DR@', '160 Megan Ranch Apt. 801 Port Matthewfurt, VA 22438', '2017-05-17 21:57:01', '2022-04-24 16:00:51', 'retired', 678829149, 'Polaris Bank', 236518, 'male'),
(30, 'Kelly', 'Chavez', 'kelly.chavez.30@dracercorp.org', '#t2$gLUq0p', '623 Nathan Trail Apt. 711 East Brandon, NY 09650', '2024-06-26 17:38:01', '2024-10-20 17:15:41', 'sacked', 659392774, 'Polaris Bank', 893668, 'female'),
(31, 'William', 'Nash', 'william.nash.31@dracercorp.org', '9NAiQz%L#J', '05543 Jeremiah Streets Suite 413 Vargasville, TN 02359', '2021-03-09 11:37:57', NULL, 'employed', 278059135, 'Union Bank', 272533, 'male'),
(32, 'Jose', 'Wagner', 'jose.wagner.32@dracercorp.org', 'Z#25sBl@yi', '601 Perez Locks Port Raymond, SC 21575', '2015-06-16 04:32:09', NULL, 'employed', 412409257, 'Polaris Bank', 482520, 'female'),
(33, 'Andrew', 'Petty', 'andrew.petty.33@dracercorp.org', 'nB1BrMic1$', '0094 Wheeler Plain Downsland, SD 29669', '2019-08-24 08:58:02', '2024-07-06 23:41:55', 'sacked', 885966933, 'Access Bank', 542518, 'female'),
(34, 'Louis', 'Butler', 'louis.butler.34@dracercorp.org', '_B23hmKt++', '785 Rachel Knoll Apt. 928 New Michaelmouth, RI 99812', '2017-08-22 07:35:02', '2018-01-04 13:15:35', 'sacked', 549619786, 'Polaris Bank', 109740, 'male'),
(35, 'Tonya', 'Price', 'tonya.price.35@dracercorp.org', '@6GlY1ew#s', '025 Wilson Orchard Apt. 894 North Christian, AS 37545', '2019-09-27 22:41:47', NULL, 'employed', 448365497, 'Union Bank', 877341, 'male'),
(36, 'Jennifer', 'Young', 'jennifer.young.36@dracercorp.org', '06LiU7rd+$', 'USS Fisher FPO AE 27026', '2022-12-05 07:22:31', '2023-01-18 08:47:21', 'retired', 562743536, 'UBA', 730062, 'male'),
(37, 'Kyle', 'Johnson', 'kyle.johnson.37@dracercorp.org', 'qXQRywD4)6', 'USNS Collins FPO AA 20489', '2016-08-30 18:22:19', NULL, 'employed', 973196009, 'Standard IBTC', 921740, 'female'),
(38, 'George', 'Bowen', 'george.bowen.38@dracercorp.org', 'HA6Qk(Xb$A', '0654 Mark Port Suite 890 North Timothymouth, WA 58869', '2016-01-18 11:08:32', '2024-10-08 15:13:21', 'sacked', 211325413, 'UBA', 703859, 'female'),
(39, 'Nancy', 'Noble', 'nancy.noble.39@dracercorp.org', 'C_W5P6Bp8%', '5284 Reed Rapids Paultown, PR 93945', '2019-10-24 08:49:57', NULL, 'employed', 265837261, 'Polaris Bank', 957922, 'female'),
(40, 'John', 'Kaiser', 'john.kaiser.40@dracercorp.org', 'l+7$kFth0G', '82610 Stephen Vista Apt. 171 New Angela, AR 43785', '2020-10-20 03:50:04', '2024-01-11 16:00:18', 'retired', 770281818, 'UBA', 847450, 'female'),
(41, 'Catherine', 'Gould', 'catherine.gould.41@dracercorp.org', 'I)8C*PoD3q', '653 William Turnpike East Heathertown, MS 94124', '2016-10-18 20:45:08', '2018-03-21 13:03:46', 'sacked', 415361987, 'UBA', 309513, 'female'),
(42, 'Keith', 'Hill', 'keith.hill.42@dracercorp.org', 'SJL&8pGg55', '82829 Shelby Circle Suite 764 North Carolshire, MI 18195', '2023-09-02 00:03:05', '2023-12-06 15:57:29', 'retired', 104865881, 'Standard IBTC', 589918, 'male'),
(43, 'Andrew', 'Sweeney', 'andrew.sweeney.43@dracercorp.org', 'T7S*gwxr_l', '4033 Russell Park Suite 349 Sharonberg, PW 24862', '2016-03-13 17:40:39', NULL, 'employed', 454131013, 'Union Bank', 810732, 'female'),
(44, 'William', 'Long', 'william.long.44@dracercorp.org', '0JHM%fUK^7', '376 William Points North Sean, AL 43979', '2020-01-25 10:15:59', NULL, 'employed', 129282874, 'Standard IBTC', 759124, 'female'),
(45, 'Andre', 'Green', 'andre.green.45@dracercorp.org', '$8q+OlvPs^', '45773 Scott Drive Suite 474 Graychester, OR 79930', '2015-11-20 22:48:49', '2024-04-27 14:41:54', 'sacked', 649505817, 'Standard IBTC', 319570, 'male'),
(46, 'Emily', 'Lewis', 'emily.lewis.46@dracercorp.org', '9Z&)4(Qf09', '97012 Garza Well Suite 134 Port Vickifort, MP 54060', '2016-09-15 19:09:08', '2019-08-24 12:15:11', 'sacked', 419443535, 'UBA', 878355, 'female'),
(47, 'Alyssa', 'Martinez', 'alyssa.martinez.47@dracercorp.org', '(7L!i3d5pH', '910 Phillips Walk Martinezberg, MS 12655', '2016-09-09 22:07:00', '2021-05-12 04:30:53', 'retired', 699536889, 'Zenith Bank', 505327, 'male'),
(48, 'Jeffrey', 'Wood', 'jeffrey.wood.48@dracercorp.org', 'G4QN0s8y^Z', 'Unit 6644 Box 4063 DPO AE 37754', '2017-09-18 17:19:10', '2023-04-26 14:32:39', 'retired', 845835995, 'Union Bank', 595248, 'male'),
(49, 'Miguel', 'Trujillo', 'miguel.trujillo.49@dracercorp.org', '_G4BQi$X!9', '85436 Wiggins Hills Suite 960 New Amanda, KS 88951', '2022-07-28 08:20:23', NULL, 'employed', 702458694, 'Standard IBTC', 195088, 'male'),
(50, 'Diana', 'Hart', 'diana.hart.50@dracercorp.org', 'cb8nREba&q', '618 Craig Ranch Suite 415 Port Tonyhaven, ID 56022', '2019-06-28 13:52:56', NULL, 'employed', 438571219, 'Union Bank', 731806, 'male'),
(51, 'Amanda', 'Mccann', 'amanda.mccann.51@dracercorp.org', '4x3rFQsVn%', '7743 Reyes Rue Apt. 801 Monicaville, AK 11069', '2018-05-29 18:23:03', '2024-05-06 13:46:37', 'sacked', 890021182, 'Polaris Bank', 643068, 'male'),
(52, 'Sharon', 'Cervantes', 'sharon.cervantes.52@dracercorp.org', '#L5JUqQH^C', '8247 Oliver Skyway East Jenniferton, CO 95910', '2020-06-25 03:41:11', NULL, 'employed', 976186733, 'Standard IBTC', 210725, 'male'),
(53, 'Benjamin', 'Jenkins', 'benjamin.jenkins.53@dracercorp.org', 'G$xT6Evww#', '97264 Dakota Square Sierramouth, AS 85780', '2018-10-31 06:55:43', '2022-10-06 12:15:26', 'retired', 321430524, 'Union Bank', 119742, 'female'),
(54, 'Pam', 'Richardson', 'pam.richardson.54@dracercorp.org', 'LbFAbx#d$3', '38356 Mccarty Road Apt. 221 West Kevin, DE 67348', '2018-05-15 21:03:22', '2023-04-28 12:19:39', 'retired', 120637150, 'Standard IBTC', 206617, 'female'),
(55, 'Robert', 'Lee', 'robert.lee.55@dracercorp.org', 'sq4fUNs6$%', '4431 Ashley Plains West Stephanie, MP 90853', '2024-03-18 23:26:14', '2024-10-08 17:08:00', 'retired', 489693826, 'Access Bank', 742009, 'male'),
(56, 'Edward', 'Jones', 'edward.jones.56@dracercorp.org', 'L72kFazE)K', '823 Gina Camp Sarahaven, SC 78459', '2016-05-21 13:49:21', '2023-04-11 17:34:35', 'sacked', 670886676, 'Zenith Bank', 133553, 'female'),
(57, 'Jessica', 'Brown', 'jessica.brown.57@dracercorp.org', '_9NYfB4v_$', '165 Cheryl Road Apt. 588 Hutchinsonmouth, CO 58081', '2023-03-21 05:52:50', NULL, 'employed', 950529452, 'Standard IBTC', 914058, 'female'),
(58, 'Regina', 'Bishop', 'regina.bishop.58@dracercorp.org', '7m6SG&x$@w', '09998 Nicholas Forks Suite 290 Santiagoview, GA 40439', '2022-02-14 11:43:50', NULL, 'employed', 768951942, 'Access Bank', 635756, 'female'),
(59, 'Timothy', 'Schmidt', 'timothy.schmidt.59@dracercorp.org', '+)Qd3ywtJ0', '5146 Pamela Course Apt. 300 Morriston, FM 93987', '2018-04-11 10:43:39', '2023-06-15 20:08:03', 'retired', 149580777, 'Polaris Bank', 143886, 'male'),
(60, 'David', 'Davis', 'david.davis.60@dracercorp.org', '6&)C3OVu@k', '9555 Robert Parkways Gonzalesfort, LA 18713', '2020-10-05 08:39:18', '2021-11-09 20:45:44', 'sacked', 927282024, 'Polaris Bank', 243726, 'male'),
(61, 'Teresa', 'Brown', 'teresa.brown.61@dracercorp.org', '(d0nwKznQ#', '27256 Marilyn Crossroad Suite 476 Leechester, ID 05711', '2020-02-13 07:05:56', NULL, 'employed', 263404046, 'UBA', 951234, 'female'),
(62, 'Mary', 'Clark', 'mary.clark.62@dracercorp.org', '+F%0(8TmN5', '547 Griffin Highway Duffyton, VA 97128', '2022-01-12 23:21:57', '2023-04-27 01:32:18', 'sacked', 752842843, 'Standard IBTC', 858425, 'female'),
(63, 'Christopher', 'Cobb', 'christopher.cobb.63@dracercorp.org', 't^58&Vs8)+', '4538 Holmes Shoal Apt. 446 Kennethside, LA 51841', '2024-01-08 17:58:10', '2024-09-04 22:35:14', 'retired', 932510757, 'Zenith Bank', 116908, 'male'),
(64, 'Yolanda', 'Price', 'yolanda.price.64@dracercorp.org', '+)7McZfbbB', 'PSC 2811, Box 5242 APO AA 79266', '2020-01-07 06:02:50', '2023-05-20 17:23:47', 'retired', 717373832, 'UBA', 895112, 'male'),
(65, 'Megan', 'Garcia', 'megan.garcia.65@dracercorp.org', '&z4V1JzJ%P', '1912 Bradley Mountain Apt. 681 Lake Kellyfurt, MT 10536', '2022-12-26 14:17:59', '2024-07-19 12:12:15', 'sacked', 181168580, 'Union Bank', 621280, 'male'),
(66, 'Sean', 'Thomas', 'sean.thomas.66@dracercorp.org', '9(Tz+TQF&f', '26445 Clark Loop Apt. 998 Lake Joseph, MP 01350', '2023-05-18 15:25:40', '2023-05-30 19:10:00', 'retired', 241625159, 'Zenith Bank', 376085, 'male'),
(67, 'Michael', 'Flores', 'michael.flores.67@dracercorp.org', '1@4Ok2GCYh', '155 Shea Villages Lake Justin, NV 12033', '2024-02-03 23:54:53', '2024-03-01 07:17:32', 'retired', 272606602, 'Union Bank', 887561, 'female'),
(68, 'Jennifer', 'Hodges', 'jennifer.hodges.68@dracercorp.org', '*0K9MlFdO$', '0056 Kaitlin Villages Apt. 971 Crystalburgh, RI 13283', '2024-07-18 01:06:44', NULL, 'employed', 311456678, 'UBA', 468117, 'female'),
(69, 'Nathaniel', 'Horton', 'nathaniel.horton.69@dracercorp.org', '^uR1WukYo(', '766 Cruz Glens Apt. 491 Royberg, PR 16141', '2022-11-13 15:44:24', '2023-07-24 23:50:12', 'sacked', 840169605, 'UBA', 798052, 'male'),
(70, 'Zachary', 'Webb', 'zachary.webb.70@dracercorp.org', '%4X6Zl6p0n', '3503 Jacobson Station Apt. 689 Port David, NE 01555', '2023-09-18 04:26:12', NULL, 'employed', 367011521, 'Standard IBTC', 168188, 'male'),
(71, 'April', 'Mccarthy', 'april.mccarthy.71@dracercorp.org', 'jAh)4RMh^g', '7756 Smith Station Apt. 027 Patrickton, HI 99494', '2019-07-24 02:33:23', NULL, 'employed', 661951328, 'Polaris Bank', 510608, 'female'),
(72, 'Thomas', 'Mendez', 'thomas.mendez.72@dracercorp.org', '+1rRgF_pIK', '70885 Jordan Inlet Apt. 776 Summersberg, VT 87194', '2017-12-09 03:23:34', NULL, 'employed', 485937940, 'Access Bank', 332863, 'female'),
(73, 'James', 'Rodriguez', 'james.rodriguez.73@dracercorp.org', 'X6I$6ffe*m', '3044 Petersen Inlet Apt. 467 East Sierramouth, NH 62614', '2021-03-23 03:08:15', '2021-07-27 01:27:06', 'retired', 804531369, 'Polaris Bank', 773069, 'female'),
(74, 'Shawn', 'Davis', 'shawn.davis.74@dracercorp.org', 'oIc5AWgo2^', '3090 Briggs Prairie New Julianmouth, AS 36561', '2022-02-19 07:16:37', '2024-05-15 14:26:27', 'sacked', 323652163, 'Standard IBTC', 460344, 'female'),
(75, 'Dean', 'Wilson', 'dean.wilson.75@dracercorp.org', 'p6#9k&AxG_', '4778 Kevin Stravenue Brentbury, KS 36586', '2021-01-25 22:16:51', '2021-02-13 23:42:12', 'sacked', 992357533, 'Access Bank', 357232, 'male'),
(76, 'John', 'Wallace', 'john.wallace.76@dracercorp.org', '4Q2xAGPl(m', '230 Rachel Route Warrentown, AS 88506', '2020-01-10 14:35:06', '2020-10-20 16:01:44', 'sacked', 657581232, 'Zenith Bank', 777878, 'male'),
(77, 'Brandi', 'Gray', 'brandi.gray.77@dracercorp.org', '#3oxs^Rv$z', '6640 Jimenez Summit Hughesside, RI 17333', '2023-01-01 01:50:52', NULL, 'employed', 815138167, 'Zenith Bank', 295154, 'female'),
(78, 'Cynthia', 'Johnson', 'cynthia.johnson.78@dracercorp.org', '(c4mNey(#8', '157 Juan Harbors Brianchester, MS 69827', '2016-01-01 19:46:14', NULL, 'employed', 769193296, 'Polaris Bank', 600549, 'female'),
(79, 'James', 'Hendrix', 'james.hendrix.79@dracercorp.org', '9kQWXpYP&N', '779 Scott Hill Apt. 321 North Alexander, DC 93211', '2016-04-23 22:37:36', '2016-12-27 09:49:05', 'sacked', 759355312, 'Polaris Bank', 536384, 'male'),
(80, 'Raven', 'Walker', 'raven.walker.80@dracercorp.org', '@#2OIzKujH', '11009 Garcia Square Jacquelinestad, NE 83457', '2016-01-24 06:51:50', NULL, 'employed', 465285556, 'Standard IBTC', 491367, 'male'),
(81, 'Stephen', 'Hall', 'stephen.hall.81@dracercorp.org', '$)3M1xK05z', '5415 Eric Crossroad Suite 053 North Veronica, SC 69440', '2016-02-14 14:27:10', '2018-07-01 08:26:15', 'retired', 947642152, 'Zenith Bank', 228952, 'male'),
(82, 'Susan', 'Acevedo', 'susan.acevedo.82@dracercorp.org', 'I0vA+Aeg^X', '74429 Melissa Plain Apt. 483 Lake Theodorestad, VA 03468', '2021-06-18 00:18:44', '2022-09-01 05:10:16', 'retired', 503196857, 'UBA', 710508, 'male'),
(83, 'Lawrence', 'Ortiz', 'lawrence.ortiz.83@dracercorp.org', '@x3rK&mo@J', '04020 Smith Way Port Larryton, NJ 18825', '2021-02-05 22:07:35', '2021-11-21 11:14:17', 'retired', 473912481, 'Zenith Bank', 838537, 'male'),
(84, 'Jennifer', 'Berger', 'jennifer.berger.84@dracercorp.org', 'ygT1Tu6o+9', '78774 Craig Hill Fitzgeraldfurt, IL 58932', '2018-11-25 14:58:50', NULL, 'employed', 588344415, 'Standard IBTC', 612846, 'male'),
(85, 'Lindsey', 'Frank', 'lindsey.frank.85@dracercorp.org', 'DM^2T6olEk', '253 Joseph Street Suite 325 Perezburgh, WA 15307', '2020-04-25 15:44:40', NULL, 'employed', 614296697, 'Access Bank', 222633, 'male'),
(86, 'Scott', 'Hart', 'scott.hart.86@dracercorp.org', '#7ZIw4G2Wf', '747 Keith Rapids North Dawnton, NY 84593', '2022-04-16 08:17:01', '2024-07-25 04:11:47', 'retired', 739247300, 'Zenith Bank', 526029, 'female'),
(87, 'Mary', 'Vasquez', 'mary.vasquez.87@dracercorp.org', 'p4Jmj^h*@e', '165 Pierce Mountains Apt. 185 Sherrimouth, RI 73394', '2024-07-31 01:00:55', '2024-10-12 23:40:17', 'retired', 202356934, 'Standard IBTC', 635593, 'male'),
(88, 'Benjamin', 'Anderson', 'benjamin.anderson.88@dracercorp.org', 'gfu63REk@%', '44936 Brian Coves Port Aliciaborough, FL 46866', '2018-10-11 02:40:44', NULL, 'employed', 177327626, 'Polaris Bank', 289776, 'female'),
(89, 'Linda', 'Adams', 'linda.adams.89@dracercorp.org', '&o6fWyaf4G', '0424 Robinson Lane Bradleyberg, KY 22472', '2021-08-31 09:55:27', NULL, 'employed', 692405910, 'Zenith Bank', 137454, 'female'),
(90, 'Andrew', 'Hines', 'andrew.hines.90@dracercorp.org', 'E)0Xvlmx^D', '42335 Baker Common Andersonport, KY 22872', '2019-11-14 08:53:35', '2020-08-18 20:35:37', 'retired', 493390583, 'Union Bank', 136891, 'male'),
(91, 'Alicia', 'Smith', 'alicia.smith.91@dracercorp.org', 'W^xU4IN*br', '385 Nguyen Harbor Apt. 793 Michaeltown, WI 50623', '2017-06-16 21:47:25', '2018-12-23 13:04:19', 'sacked', 238479190, 'Union Bank', 585432, 'female'),
(92, 'Samantha', 'Schroeder', 'samantha.schroeder.92@dracercorp.org', '&CM07POr_t', '7229 Melissa Wall Lake Jillland, OH 80872', '2019-11-27 21:59:17', '2023-07-21 22:14:27', 'retired', 992327863, 'Union Bank', 747284, 'male'),
(93, 'Matthew', 'Hernandez', 'matthew.hernandez.93@dracercorp.org', '9z$N10Yev$', '4083 Deborah Manors Martinezborough, LA 65455', '2022-07-27 22:12:01', '2022-12-21 10:45:56', 'sacked', 764755943, 'UBA', 836887, 'female'),
(94, 'Denise', 'Montes', 'denise.montes.94@dracercorp.org', 'e6jSYxoa@j', '410 Zachary Expressway Michellefort, NM 13367', '2022-11-19 16:29:12', '2022-12-16 04:15:00', 'sacked', 183713452, 'Polaris Bank', 326969, 'male'),
(95, 'Jessica', 'Walker', 'jessica.walker.95@dracercorp.org', '&g*IT0zxo1', '379 Nathaniel Roads Apt. 183 Morrisberg, AL 91427', '2021-05-06 00:42:33', '2024-02-18 04:53:41', 'retired', 460386437, 'Standard IBTC', 231798, 'female'),
(96, 'Angelica', 'Atkinson', 'angelica.atkinson.96@dracercorp.org', '$U3wLsTl0N', '4654 Bradley Trail South Victoria, IL 85952', '2020-12-30 03:18:53', NULL, 'employed', 665648232, 'Union Bank', 195121, 'female'),
(97, 'Allison', 'Jackson', 'allison.jackson.97@dracercorp.org', 'B48jKG3u$%', '10673 Katherine Gardens Suite 064 North Patrickstad, MA 49117', '2021-03-14 07:28:22', '2021-11-28 22:06:54', 'sacked', 881649877, 'Standard IBTC', 956209, 'female'),
(98, 'Jesus', 'Morales', 'jesus.morales.98@dracercorp.org', '+cUJzGdc@8', '45964 Adkins Passage Suite 939 Lopezport, MT 05141', '2016-11-14 09:04:47', NULL, 'employed', 929704902, 'Polaris Bank', 968587, 'female'),
(99, 'Wendy', 'Hayden', 'wendy.hayden.99@dracercorp.org', 'y*7AUyd$k+', 'USCGC Holder FPO AP 27148', '2024-04-02 15:49:26', '2024-05-20 15:46:21', 'retired', 914090041, 'Polaris Bank', 755817, 'male'),
(100, 'Steven', 'Hughes', 'steven.hughes.100@dracercorp.org', '+##7KOi!+#', '427 Young Walk South Teresa, KY 58667', '2022-08-03 01:31:27', NULL, 'employed', 813563072, 'Polaris Bank', 397275, 'male');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `salary` float NOT NULL,
  `pension_percentage` float NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `employeejob` (`employee_id`),
  KEY `departmentjob` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `employee_id`, `department_id`, `job_title`, `start_date`, `end_date`, `salary`, `pension_percentage`) VALUES
(1, 1, 2, 'Specialist', '2017-04-18 02:20:21', '2021-11-06 19:05:43', 4998.82, 8.22),
(2, 1, 2, 'Consultant', '2020-03-09 16:02:08', NULL, 10367.7, 7.08),
(3, 1, 3, 'Specialist', '2017-07-12 16:40:40', '2019-01-21 12:09:23', 8450.43, 8.28),
(4, 2, 11, 'Developer', '2023-05-01 07:49:36', NULL, 4234.32, 13.27),
(5, 3, 11, 'Advisor', '2016-11-22 14:28:32', NULL, 3407.69, 9.7),
(6, 3, 4, 'Supervisor', '2021-02-27 09:19:14', '2014-12-11 05:22:51', 11778.4, 11.7),
(7, 4, 1, 'Developer', '2015-04-12 07:12:18', NULL, 11008.4, 12.96),
(8, 4, 6, 'Specialist', '2017-07-17 22:50:17', '2021-02-11 06:46:11', 9062.88, 7.36),
(9, 4, 2, 'Coordinator', '2018-09-01 04:18:53', '2018-01-18 16:51:11', 14513.5, 12.36),
(10, 5, 11, 'Advisor', '2019-07-09 23:16:11', NULL, 9076.23, 9.15),
(11, 5, 9, 'Director', '2015-05-29 07:41:40', '2014-12-08 17:35:40', 13815.3, 12.52),
(12, 5, 10, 'Manager', '2018-03-21 16:59:57', NULL, 12091.9, 9.22),
(13, 6, 10, 'Manager', '2017-12-28 04:19:34', '2015-08-26 14:59:34', 4263.37, 6.52),
(14, 6, 1, 'Administrator', '2014-12-01 03:36:39', '2021-10-22 16:13:19', 2967.14, 10.32),
(15, 7, 7, 'Officer', '2023-08-12 21:46:24', NULL, 7445.05, 13.9),
(16, 8, 8, 'Officer', '2016-02-06 14:28:22', '2015-10-23 01:39:29', 6420, 8.7),
(17, 8, 1, 'Technician', '2024-03-08 02:35:14', NULL, 6552.07, 13.82),
(18, 9, 9, 'Executive', '2019-11-07 23:58:26', NULL, 10683.5, 12.43),
(19, 10, 5, 'Technician', '2015-01-15 00:47:52', NULL, 6988.79, 11.82),
(20, 11, 4, 'Director', '2017-09-21 04:45:10', '2016-01-01 18:45:05', 5352.64, 11.84),
(21, 12, 11, 'Director', '2018-08-26 09:28:27', '2015-09-29 18:32:06', 2801.53, 11.99),
(22, 12, 9, 'Advisor', '2022-07-13 16:28:59', NULL, 12772.2, 11.08),
(23, 13, 5, 'Advisor', '2015-05-30 08:21:37', NULL, 4302.8, 14.01),
(24, 13, 8, 'Manager', '2022-12-29 19:45:00', NULL, 13762.3, 10.4),
(25, 14, 5, 'Manager', '2018-07-24 09:36:05', '2017-09-12 22:19:06', 5665.78, 13.48),
(26, 14, 7, 'Assistant Manager', '2020-03-29 04:33:22', NULL, 5918.41, 8.72),
(27, 14, 4, 'Director', '2021-08-25 23:27:01', NULL, 14450.5, 9.73),
(28, 15, 7, 'Technician', '2018-11-27 03:27:41', '2017-06-28 17:19:33', 10118.2, 7.11),
(29, 15, 7, 'Officer', '2015-08-15 05:12:16', NULL, 13858.4, 8.79),
(30, 16, 11, 'Advisor', '2020-12-29 06:53:51', '2021-04-14 01:08:08', 5246.64, 10.17),
(31, 16, 3, 'Assistant Manager', '2017-10-16 17:27:56', NULL, 14016.7, 9.99),
(32, 17, 7, 'Assistant Manager', '2019-11-28 02:38:32', '2022-08-01 12:53:53', 6508.29, 11.35),
(33, 17, 10, 'Assistant Manager', '2016-06-13 12:38:03', '2021-04-23 15:37:54', 12033.7, 10.97),
(34, 17, 11, 'Manager', '2019-02-16 03:45:02', NULL, 10638.1, 5.96),
(35, 18, 11, 'Consultant', '2020-05-01 18:56:55', NULL, 8611.21, 14.91),
(36, 19, 8, 'Engineer', '2016-05-14 14:46:30', '2020-09-14 05:57:53', 6718.86, 12.29),
(37, 19, 10, 'Director', '2016-10-04 07:39:42', '2020-05-24 20:29:42', 2573.42, 8.38),
(38, 19, 6, 'Coordinator', '2024-10-17 14:46:44', '2015-08-04 22:44:01', 7749.58, 13.65),
(39, 20, 7, 'Supervisor', '2024-03-15 08:33:01', '2018-08-27 11:33:28', 6332.38, 7.97),
(40, 21, 4, 'Officer', '2022-01-21 03:36:18', NULL, 10131.9, 10.7),
(41, 21, 10, 'Developer', '2024-05-25 17:32:07', NULL, 12019.3, 14.99),
(42, 22, 10, 'Supervisor', '2018-12-17 17:47:37', '2019-12-01 19:30:02', 12350, 14.77),
(43, 23, 4, 'Advisor', '2018-10-24 02:32:09', '2023-09-08 19:44:40', 10409.6, 13.17),
(44, 23, 9, 'Director', '2023-12-28 17:17:30', NULL, 5940.63, 5.16),
(45, 23, 7, 'Engineer', '2020-02-19 01:07:00', '2021-01-14 00:51:27', 6961.3, 10.04),
(46, 24, 5, 'Supervisor', '2018-02-22 13:29:15', NULL, 14670.3, 7.66),
(47, 24, 7, 'Consultant', '2020-05-20 04:16:52', NULL, 3605.38, 14.35),
(48, 25, 4, 'Executive', '2023-10-17 03:29:28', '2017-10-17 18:19:20', 13462.9, 12.62),
(49, 25, 5, 'Assistant Manager', '2018-09-05 18:13:49', NULL, 6444.92, 11.9),
(50, 25, 10, 'Consultant', '2022-02-28 10:36:18', NULL, 14032.5, 9.37),
(51, 26, 9, 'Coordinator', '2021-08-27 03:04:33', '2016-04-29 06:07:54', 5232.8, 6.82),
(52, 26, 1, 'Officer', '2022-11-25 07:30:03', NULL, 12428.8, 9.51),
(53, 26, 6, 'Officer', '2022-08-12 21:59:17', NULL, 12317.5, 10.49),
(54, 27, 8, 'Specialist', '2015-02-02 16:02:09', '2020-12-16 14:23:57', 11963.6, 13.41),
(55, 27, 10, 'Coordinator', '2015-04-21 04:35:27', NULL, 14139.4, 9.57),
(56, 28, 10, 'Analyst', '2023-05-11 19:41:38', '2019-02-27 03:43:23', 3616.76, 9.63),
(57, 29, 7, 'Engineer', '2017-08-03 10:17:49', '2015-08-01 11:23:08', 10885.6, 13.74),
(58, 30, 1, 'Officer', '2018-05-12 04:53:45', '2015-08-25 03:34:01', 5318.01, 12.09),
(59, 31, 6, 'Advisor', '2018-05-24 14:37:14', '2020-07-08 05:53:13', 8932.13, 8.71),
(60, 32, 11, 'Specialist', '2018-02-27 09:25:05', NULL, 7720.9, 8.98),
(61, 32, 10, 'Officer', '2017-01-27 20:11:31', '2018-06-14 00:13:07', 3640.93, 10.21),
(62, 33, 11, 'Manager', '2023-05-04 09:46:08', '2019-05-11 13:15:02', 13812, 11.07),
(63, 33, 7, 'Coordinator', '2017-06-07 21:23:02', '2018-02-17 19:19:59', 11443.8, 5.21),
(64, 33, 9, 'Administrator', '2020-01-28 16:19:36', '2024-04-16 06:29:36', 7349.09, 12.15),
(65, 34, 2, 'Assistant Manager', '2024-05-22 17:38:58', '2017-10-11 13:58:43', 8576.91, 14.18),
(66, 34, 1, 'Executive', '2020-10-20 14:27:40', '2016-07-21 11:59:39', 5451.99, 8.97),
(67, 35, 10, 'Administrator', '2018-11-13 15:36:08', NULL, 6569.87, 11.91),
(68, 35, 3, 'Assistant Manager', '2021-08-14 17:55:21', NULL, 12880.1, 11.07),
(69, 35, 2, 'Specialist', '2022-01-11 12:45:23', NULL, 8614.77, 13.76),
(70, 36, 8, 'Analyst', '2017-12-18 10:38:47', '2018-07-31 01:41:23', 10890, 6.43),
(71, 37, 2, 'Administrator', '2016-07-05 11:14:01', NULL, 7424.56, 6.63),
(72, 37, 10, 'Coordinator', '2021-11-22 06:37:05', NULL, 5843.16, 10.81),
(73, 38, 6, 'Developer', '2021-02-06 20:03:17', NULL, 3159.23, 6.05),
(74, 38, 5, 'Coordinator', '2019-01-01 18:22:52', NULL, 14269, 5.58),
(75, 38, 8, 'Manager', '2020-01-01 01:08:34', '2016-06-20 07:54:08', 4674, 13.04),
(76, 39, 6, 'Director', '2021-09-03 15:21:49', '2019-01-12 19:02:16', 6483.55, 14.21),
(77, 40, 3, 'Director', '2015-04-06 00:10:04', NULL, 11549.6, 10.64),
(78, 40, 2, 'Coordinator', '2023-01-17 17:38:18', '2020-03-04 09:47:06', 12602.4, 6.35),
(79, 40, 7, 'Consultant', '2019-08-23 08:50:48', '2023-12-21 19:10:39', 8540.34, 7.05),
(80, 41, 3, 'Coordinator', '2021-11-14 18:19:41', '2018-06-02 20:47:40', 5446.72, 11.21),
(81, 41, 3, 'Technician', '2020-06-17 23:42:36', NULL, 10861.7, 6.75),
(82, 42, 9, 'Analyst', '2020-10-25 20:04:50', NULL, 2877.83, 13.06),
(83, 43, 6, 'Developer', '2018-03-05 20:10:42', '2019-03-01 10:19:19', 3241.72, 11.82),
(84, 44, 1, 'Technician', '2017-09-10 13:03:29', '2021-12-25 08:03:55', 5009.84, 14.8),
(85, 44, 11, 'Assistant Manager', '2021-01-03 17:17:08', '2017-12-15 17:12:56', 13189.9, 11.68),
(86, 45, 6, 'Supervisor', '2016-10-24 17:04:14', '2022-05-28 13:15:07', 8226.3, 8.31),
(87, 46, 11, 'Officer', '2020-11-23 02:27:20', NULL, 2799.64, 9.47),
(88, 46, 10, 'Executive', '2021-08-29 08:20:08', NULL, 8552.31, 13.07),
(89, 47, 9, 'Executive', '2022-09-08 18:18:11', '2016-02-18 05:08:51', 11287.2, 13.23),
(90, 48, 6, 'Analyst', '2015-08-25 14:22:03', NULL, 8445.31, 6.32),
(91, 49, 2, 'Supervisor', '2020-01-12 11:55:30', '2021-02-22 20:46:52', 12271, 12.76),
(92, 49, 5, 'Coordinator', '2019-09-14 14:59:53', NULL, 4948.02, 5.32),
(93, 50, 1, 'Developer', '2017-10-27 20:32:30', NULL, 6377.5, 7.64),
(94, 51, 5, 'Executive', '2017-09-14 05:40:18', '2018-06-09 20:52:01', 11448.5, 13.47),
(95, 52, 2, 'Assistant Manager', '2023-07-05 06:32:57', '2020-04-03 20:26:43', 11693, 11.79),
(96, 52, 10, 'Coordinator', '2015-10-29 11:35:09', '2018-04-06 02:35:16', 6737.27, 11.93),
(97, 52, 3, 'Coordinator', '2021-12-05 03:35:47', NULL, 3005.9, 13.44),
(98, 53, 8, 'Analyst', '2017-01-13 02:54:00', NULL, 5374.4, 5.01),
(99, 53, 9, 'Consultant', '2015-03-27 01:28:20', '2017-10-18 11:52:30', 12073.6, 5.62),
(100, 53, 8, 'Assistant Manager', '2016-03-29 03:34:53', '2018-08-16 13:25:07', 9951.13, 11.79),
(101, 54, 5, 'Administrator', '2018-08-30 09:57:51', NULL, 11074.9, 14.8),
(102, 55, 5, 'Consultant', '2021-12-10 04:10:40', '2024-10-15 04:25:31', 10331.4, 7.28),
(103, 55, 3, 'Administrator', '2017-02-28 18:07:55', NULL, 9426.73, 7.46),
(104, 56, 5, 'Administrator', '2021-05-30 07:30:04', NULL, 13094.8, 11.11),
(105, 56, 9, 'Executive', '2015-02-20 12:15:59', '2020-05-25 15:58:41', 13119, 12.9),
(106, 56, 6, 'Director', '2020-09-05 04:45:59', '2018-11-17 12:20:26', 2579.03, 10.58),
(107, 57, 8, 'Coordinator', '2018-12-01 03:49:38', '2020-12-30 13:17:53', 3804.81, 9.99),
(108, 58, 1, 'Developer', '2017-06-15 22:06:38', '2023-09-07 19:54:34', 7069.41, 12.85),
(109, 58, 7, 'Engineer', '2022-07-21 10:59:51', NULL, 9093.08, 12.26),
(110, 59, 4, 'Coordinator', '2017-09-18 16:10:45', '2016-04-06 14:14:18', 8310.34, 13.75),
(111, 59, 7, 'Manager', '2018-01-11 20:58:14', '2021-02-16 18:25:13', 8800.42, 7.84),
(112, 60, 1, 'Assistant Manager', '2022-05-22 02:03:15', '2016-10-24 04:58:04', 13085.4, 8.24),
(113, 60, 6, 'Developer', '2017-08-17 13:35:58', NULL, 11240.2, 13.44),
(114, 60, 9, 'Advisor', '2016-09-13 08:28:52', '2016-10-10 23:22:02', 4860.73, 5.06),
(115, 61, 6, 'Officer', '2014-12-09 23:32:56', NULL, 10037.8, 6.57),
(116, 61, 1, 'Administrator', '2016-01-05 10:24:07', '2015-06-15 09:42:39', 5792.27, 10.21),
(117, 61, 6, 'Analyst', '2019-06-07 09:26:09', '2017-04-30 03:42:17', 10218.4, 11.06),
(118, 62, 3, 'Administrator', '2023-11-29 13:07:49', NULL, 13017.6, 9.97),
(119, 62, 4, 'Officer', '2022-03-12 04:44:02', NULL, 2973.1, 11.16),
(120, 62, 2, 'Manager', '2016-10-21 18:26:45', NULL, 10963.9, 9.23),
(121, 63, 9, 'Executive', '2022-05-07 14:47:12', '2021-12-05 19:55:03', 8040.15, 11.99),
(122, 63, 7, 'Analyst', '2021-07-11 15:45:22', '2021-09-17 02:50:02', 14397.7, 6.45),
(123, 64, 4, 'Advisor', '2020-02-18 17:42:14', '2023-01-07 13:14:22', 6991.84, 9.58),
(124, 64, 10, 'Developer', '2024-05-08 03:23:52', '2016-08-05 05:40:48', 5589.65, 7.14),
(125, 65, 3, 'Advisor', '2016-04-20 05:29:45', '2018-06-24 18:19:04', 4512.02, 8.93),
(126, 65, 5, 'Consultant', '2024-10-03 08:42:41', NULL, 4897.21, 13.25),
(127, 66, 2, 'Advisor', '2016-01-28 09:08:59', '2022-04-24 05:39:40', 8408.37, 12.65),
(128, 67, 5, 'Supervisor', '2023-05-20 17:53:32', NULL, 5247.2, 13.63),
(129, 67, 10, 'Executive', '2017-05-25 11:03:02', '2022-09-13 18:49:18', 14042, 11.2),
(130, 67, 4, 'Coordinator', '2022-05-18 05:50:55', NULL, 5197.13, 5.91),
(131, 68, 10, 'Assistant Manager', '2019-01-13 09:12:59', NULL, 7684.1, 8.65),
(132, 68, 4, 'Executive', '2016-04-23 17:17:05', NULL, 2531.69, 14.86),
(133, 69, 8, 'Assistant Manager', '2021-07-07 04:56:54', '2021-06-02 21:57:34', 14228.6, 9.81),
(134, 69, 4, 'Administrator', '2019-12-23 05:53:23', NULL, 10419.6, 12.03),
(135, 69, 3, 'Developer', '2020-06-27 02:19:46', NULL, 5897.18, 9.09),
(136, 70, 6, 'Coordinator', '2016-09-24 09:39:07', NULL, 12108, 12.06),
(137, 70, 7, 'Supervisor', '2016-07-11 01:51:35', '2020-12-01 10:16:55', 6946.88, 6.06),
(138, 70, 8, 'Coordinator', '2018-09-22 11:18:17', '2021-09-09 00:47:37', 12213.6, 7.32),
(139, 71, 6, 'Officer', '2017-05-19 23:03:11', '2021-11-27 20:01:36', 8227.21, 12.5),
(140, 71, 8, 'Executive', '2020-05-03 06:47:43', '2016-11-21 08:19:32', 7447.53, 12.12),
(141, 72, 11, 'Officer', '2016-03-02 20:37:26', NULL, 3048.25, 12.71),
(142, 72, 6, 'Officer', '2022-09-29 09:54:19', NULL, 13405, 11.21),
(143, 72, 11, 'Specialist', '2022-06-26 14:39:59', '2021-06-25 16:48:22', 11800, 13.08),
(144, 73, 4, 'Coordinator', '2023-03-31 09:39:36', '2015-12-05 22:48:40', 12138.6, 9.69),
(145, 73, 3, 'Manager', '2018-09-20 04:22:00', '2023-07-01 16:18:14', 8838.76, 11.24),
(146, 73, 8, 'Advisor', '2017-04-09 03:03:13', '2017-05-03 14:58:12', 3394.32, 8.42),
(147, 74, 10, 'Executive', '2020-04-28 04:56:59', NULL, 11390.5, 6.53),
(148, 75, 9, 'Coordinator', '2021-12-12 01:11:54', '2016-04-13 21:07:34', 12189.9, 7.81),
(149, 75, 6, 'Supervisor', '2019-06-02 01:05:12', NULL, 14599.2, 14.45),
(150, 76, 3, 'Administrator', '2017-02-20 01:08:58', '2019-05-13 23:18:38', 12090.6, 14.46),
(151, 77, 9, 'Specialist', '2021-10-15 08:51:23', NULL, 10637.3, 5.86),
(152, 77, 3, 'Advisor', '2021-08-14 13:17:20', '2015-05-05 14:06:41', 6814.11, 12.85),
(153, 77, 9, 'Specialist', '2022-02-21 09:56:29', '2023-01-11 23:52:19', 12640.8, 6.37),
(154, 78, 3, 'Consultant', '2020-06-22 21:47:03', '2019-12-28 05:27:34', 8246.6, 14.11),
(155, 79, 7, 'Administrator', '2014-11-22 07:33:30', NULL, 7317.71, 5.49),
(156, 79, 5, 'Officer', '2015-06-02 13:55:11', NULL, 8264.87, 11.7),
(157, 79, 1, 'Manager', '2015-10-01 22:45:58', NULL, 6767.28, 10.07),
(158, 80, 4, 'Officer', '2021-02-04 22:10:14', '2015-03-17 10:45:02', 10232.6, 8),
(159, 80, 4, 'Technician', '2019-11-17 03:18:45', NULL, 3450.19, 14.69),
(160, 81, 5, 'Executive', '2022-12-28 23:05:01', NULL, 13997, 9.02),
(161, 82, 6, 'Analyst', '2016-03-13 04:45:16', '2020-10-08 00:09:20', 6192.18, 7.88),
(162, 82, 11, 'Technician', '2022-01-25 22:22:02', NULL, 11660.1, 9.05),
(163, 83, 7, 'Supervisor', '2016-09-05 03:50:00', NULL, 10852.9, 7.3),
(164, 83, 2, 'Developer', '2022-09-23 10:12:49', '2017-12-05 15:26:15', 2886.69, 14.72),
(165, 84, 9, 'Analyst', '2019-12-27 07:59:34', '2015-07-23 10:05:34', 3820.28, 6.2),
(166, 85, 3, 'Specialist', '2016-11-05 05:35:33', '2021-08-17 02:10:07', 6251.22, 10.87),
(167, 86, 2, 'Supervisor', '2014-11-15 02:26:40', NULL, 9832.48, 13.45),
(168, 87, 3, 'Developer', '2016-03-22 03:13:36', NULL, 5678.71, 10.25),
(169, 87, 4, 'Executive', '2015-11-17 17:04:25', '2020-05-14 20:00:31', 10680.6, 6.05),
(170, 87, 11, 'Director', '2024-03-06 09:03:52', NULL, 11480.2, 5.76),
(171, 88, 3, 'Developer', '2024-03-09 22:50:48', '2021-06-06 16:35:37', 13762.8, 8.28),
(172, 88, 2, 'Specialist', '2018-03-10 20:48:10', '2021-12-14 20:23:49', 7475.6, 10.89),
(173, 89, 1, 'Consultant', '2020-05-24 14:43:10', NULL, 13075.9, 9.3),
(174, 90, 11, 'Specialist', '2020-06-19 02:23:02', NULL, 5098.15, 12.3),
(175, 90, 1, 'Administrator', '2021-05-29 08:21:33', '2016-04-06 18:49:39', 5940.76, 8.77),
(176, 91, 7, 'Specialist', '2020-12-21 05:15:53', '2019-09-30 09:15:27', 6799.65, 10.23),
(177, 91, 9, 'Administrator', '2020-03-16 16:56:49', NULL, 13972.2, 12.1),
(178, 91, 9, 'Manager', '2020-02-01 04:18:57', NULL, 10042.9, 5.77),
(179, 92, 2, 'Manager', '2016-02-14 18:01:31', NULL, 14003.2, 11.9),
(180, 92, 9, 'Technician', '2019-11-12 13:23:12', NULL, 11133.4, 14.8),
(181, 92, 6, 'Administrator', '2016-04-04 05:21:20', '2021-04-26 13:05:58', 3768.09, 9.96),
(182, 93, 3, 'Supervisor', '2019-10-02 01:55:31', NULL, 9958.38, 13.93),
(183, 93, 4, 'Developer', '2017-03-10 13:09:08', '2018-02-04 09:39:58', 10692.8, 9.87),
(184, 93, 3, 'Advisor', '2022-05-23 05:42:41', '2017-10-07 05:05:56', 10848.7, 7.19),
(185, 94, 7, 'Technician', '2016-12-28 02:38:58', NULL, 11909.4, 12.94),
(186, 94, 11, 'Manager', '2017-07-25 14:23:28', '2015-07-31 13:38:38', 14944.3, 10.46),
(187, 94, 11, 'Technician', '2023-10-04 00:20:43', NULL, 6351.5, 10.16),
(188, 95, 2, 'Technician', '2024-04-27 03:08:57', '2018-10-25 18:42:56', 11310.7, 10.03),
(189, 95, 3, 'Analyst', '2018-09-23 12:14:26', '2019-11-05 04:54:01', 2690.63, 5.75),
(190, 96, 10, 'Developer', '2019-10-09 16:53:56', '2018-09-20 18:17:00', 13528.2, 9.42),
(191, 96, 2, 'Analyst', '2019-05-04 19:41:44', NULL, 10283.2, 10.06),
(192, 97, 1, 'Analyst', '2020-08-01 00:15:55', '2023-09-01 05:56:45', 6261.78, 5.26),
(193, 97, 9, 'Developer', '2017-06-16 11:09:51', NULL, 7344.77, 5.29),
(194, 98, 4, 'Advisor', '2016-05-15 08:29:27', '2023-03-23 14:04:59', 12696.4, 8.31),
(195, 99, 8, 'Technician', '2020-05-21 14:51:29', '2018-04-15 13:29:32', 13982, 8.8),
(196, 99, 6, 'Executive', '2018-01-12 02:59:27', NULL, 7251.52, 14.92),
(197, 100, 8, 'Advisor', '2023-02-18 01:01:14', '2021-06-18 20:54:01', 2563.91, 7.04),
(198, 100, 11, 'Coordinator', '2015-04-20 01:16:10', NULL, 5770.98, 6.95);

-- --------------------------------------------------------

--
-- Table structure for table `pensioneer`
--

DROP TABLE IF EXISTS `pensioneer`;
CREATE TABLE IF NOT EXISTS `pensioneer` (
  `pensioneer_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `pension_status` enum('eligible','not eligible') NOT NULL DEFAULT 'not eligible',
  `last_paid_date` timestamp NULL DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `stop_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pensioneer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pensioneer`
--

INSERT INTO `pensioneer` (`pensioneer_id`, `employee_id`, `pension_status`, `last_paid_date`, `start_date`, `stop_date`) VALUES
(1, 1, 'not eligible', NULL, NULL, NULL),
(2, 2, 'eligible', NULL, '2020-05-23 21:22:02', NULL),
(3, 3, 'not eligible', NULL, NULL, NULL),
(4, 4, 'eligible', NULL, NULL, NULL),
(5, 5, 'eligible', NULL, '2021-07-15 05:00:10', NULL),
(6, 6, 'eligible', NULL, NULL, NULL),
(7, 7, 'not eligible', '2020-06-07 14:41:21', '2016-05-19 21:28:54', '2016-11-15 18:31:25'),
(8, 8, 'not eligible', NULL, '2017-06-04 04:45:58', NULL),
(9, 9, 'not eligible', '2024-10-08 13:29:02', '2024-10-08 04:51:39', '2024-10-08 10:34:53'),
(10, 10, 'not eligible', NULL, NULL, NULL),
(11, 11, 'not eligible', NULL, NULL, NULL),
(12, 12, 'eligible', NULL, '2022-07-10 07:04:30', NULL),
(13, 13, 'not eligible', NULL, '2017-08-21 05:38:18', NULL),
(14, 14, 'eligible', NULL, '2015-08-06 14:22:09', NULL),
(15, 15, 'not eligible', NULL, NULL, NULL),
(16, 16, 'not eligible', '2017-02-11 23:38:03', '2017-01-12 06:19:20', '2022-02-25 14:31:36'),
(17, 17, 'not eligible', NULL, NULL, NULL),
(18, 18, 'not eligible', NULL, NULL, NULL),
(19, 19, 'eligible', NULL, '2023-10-06 04:33:11', NULL),
(20, 20, 'eligible', NULL, NULL, NULL),
(21, 21, 'not eligible', NULL, NULL, NULL),
(22, 22, 'not eligible', '2023-12-16 08:54:33', '2021-09-23 03:17:17', '2024-07-15 04:40:23'),
(23, 23, 'eligible', NULL, '2014-11-29 01:22:53', NULL),
(24, 24, 'eligible', NULL, NULL, NULL),
(25, 25, 'eligible', NULL, '2017-11-23 14:44:15', NULL),
(26, 26, 'eligible', NULL, NULL, NULL),
(27, 27, 'not eligible', '2024-04-10 17:02:55', '2018-06-17 07:14:07', '2022-07-16 13:07:59'),
(28, 28, 'not eligible', NULL, NULL, NULL),
(29, 29, 'eligible', NULL, '2014-12-30 07:04:14', NULL),
(30, 30, 'not eligible', NULL, NULL, NULL),
(31, 31, 'not eligible', '2024-05-02 06:46:57', '2023-08-13 10:46:02', '2023-10-07 19:43:43'),
(32, 32, 'not eligible', '2022-11-07 09:27:10', '2021-10-22 14:45:02', '2023-09-07 12:10:59'),
(33, 33, 'not eligible', NULL, '2020-01-23 04:44:16', NULL),
(34, 34, 'not eligible', NULL, NULL, NULL),
(35, 35, 'eligible', NULL, NULL, NULL),
(36, 36, 'eligible', NULL, '2020-08-16 14:07:44', NULL),
(37, 37, 'not eligible', '2023-01-24 14:22:40', '2019-03-12 18:20:11', '2019-06-13 15:39:42'),
(38, 38, 'not eligible', NULL, NULL, NULL),
(39, 39, 'eligible', NULL, NULL, NULL),
(40, 40, 'eligible', NULL, '2018-06-03 15:03:33', NULL),
(41, 41, 'not eligible', NULL, NULL, NULL),
(42, 42, 'eligible', NULL, NULL, NULL),
(43, 43, 'not eligible', '2023-10-31 04:42:36', '2015-05-08 03:24:25', '2022-04-13 02:21:26'),
(44, 44, 'eligible', NULL, NULL, NULL),
(45, 45, 'not eligible', '2023-03-12 13:33:12', '2020-05-12 13:25:40', '2023-09-02 14:27:12'),
(46, 46, 'not eligible', '2017-03-08 18:31:31', '2016-10-20 04:43:13', '2018-02-08 13:05:04'),
(47, 47, 'eligible', NULL, NULL, NULL),
(48, 48, 'not eligible', NULL, NULL, NULL),
(49, 49, 'not eligible', '2019-04-24 03:19:56', '2016-01-12 05:06:01', '2016-09-24 12:08:39'),
(50, 50, 'eligible', NULL, '2016-08-09 08:34:24', NULL),
(51, 51, 'not eligible', NULL, NULL, NULL),
(52, 52, 'eligible', NULL, NULL, NULL),
(53, 53, 'not eligible', NULL, NULL, NULL),
(54, 54, 'not eligible', NULL, NULL, NULL),
(55, 55, 'not eligible', '2018-01-31 07:47:28', '2017-05-03 02:47:37', '2017-08-01 23:13:01'),
(56, 56, 'not eligible', NULL, NULL, NULL),
(57, 57, 'eligible', NULL, '2017-08-02 22:45:27', NULL),
(58, 58, 'eligible', NULL, NULL, NULL),
(59, 59, 'not eligible', NULL, NULL, NULL),
(60, 60, 'not eligible', '2024-02-12 14:11:53', '2023-09-01 19:16:30', '2023-10-06 21:38:04'),
(61, 61, 'eligible', NULL, '2024-10-19 20:30:46', NULL),
(62, 62, 'not eligible', NULL, NULL, NULL),
(63, 63, 'not eligible', NULL, NULL, NULL),
(64, 64, 'eligible', NULL, NULL, NULL),
(65, 65, 'not eligible', NULL, NULL, NULL),
(66, 66, 'eligible', NULL, NULL, NULL),
(67, 67, 'not eligible', '2022-02-25 09:24:11', '2017-02-17 08:22:14', '2017-03-23 11:32:39'),
(68, 68, 'not eligible', '2023-07-24 23:32:23', '2022-12-18 06:09:05', '2024-05-07 14:17:23'),
(69, 69, 'not eligible', NULL, '2023-02-16 11:58:29', NULL),
(70, 70, 'not eligible', '2024-03-13 17:23:16', '2015-07-08 23:59:05', '2024-10-09 19:13:49'),
(71, 71, 'not eligible', '2019-03-11 20:49:47', '2015-07-03 04:52:04', '2020-07-04 02:23:33'),
(72, 72, 'eligible', NULL, NULL, NULL),
(73, 73, 'not eligible', '2017-10-17 22:53:22', '2014-11-09 20:49:39', '2021-12-28 08:30:54'),
(74, 74, 'not eligible', NULL, NULL, NULL),
(75, 75, 'not eligible', NULL, NULL, NULL),
(76, 76, 'not eligible', NULL, '2020-09-22 14:24:43', NULL),
(77, 77, 'not eligible', NULL, NULL, NULL),
(78, 78, 'eligible', NULL, NULL, NULL),
(79, 79, 'not eligible', '2015-09-01 20:01:25', '2015-04-04 09:20:24', '2016-12-19 13:22:31'),
(80, 80, 'eligible', NULL, '2021-05-29 13:33:22', NULL),
(81, 81, 'not eligible', NULL, NULL, NULL),
(82, 82, 'eligible', NULL, NULL, NULL),
(83, 83, 'eligible', NULL, '2016-03-16 19:07:42', NULL),
(84, 84, 'not eligible', NULL, NULL, NULL),
(85, 85, 'not eligible', NULL, NULL, NULL),
(86, 86, 'not eligible', NULL, NULL, NULL),
(87, 87, 'eligible', NULL, '2015-07-22 19:05:09', NULL),
(88, 88, 'eligible', NULL, '2014-10-26 19:02:02', NULL),
(89, 89, 'not eligible', '2024-07-31 11:25:11', '2022-10-02 23:16:36', '2023-02-10 16:22:56'),
(90, 90, 'eligible', NULL, '2016-05-05 01:20:40', NULL),
(91, 91, 'not eligible', NULL, '2018-02-23 04:24:56', NULL),
(92, 92, 'not eligible', '2024-01-02 20:55:05', '2015-01-23 19:03:16', '2023-03-24 20:10:12'),
(93, 93, 'not eligible', NULL, '2020-11-11 17:34:24', NULL),
(94, 94, 'not eligible', NULL, NULL, NULL),
(95, 95, 'not eligible', NULL, NULL, NULL),
(96, 96, 'not eligible', '2019-12-14 05:47:33', '2017-04-22 05:25:40', '2023-04-30 06:35:05'),
(97, 97, 'not eligible', NULL, NULL, NULL),
(98, 98, 'not eligible', NULL, NULL, NULL),
(99, 99, 'eligible', NULL, NULL, NULL),
(100, 100, 'eligible', NULL, '2019-02-08 06:23:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pension_settings`
--

DROP TABLE IF EXISTS `pension_settings`;
CREATE TABLE IF NOT EXISTS `pension_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_percentage` float NOT NULL DEFAULT '10',
  `payment_date` int(11) NOT NULL DEFAULT '28',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pension_settings`
--

INSERT INTO `pension_settings` (`id`, `payment_percentage`, `payment_date`) VALUES
(1, 10, 28);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `departmentjob` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `employeejob` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pensioneer`
--
ALTER TABLE `pensioneer`
  ADD CONSTRAINT `pensioneer_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
