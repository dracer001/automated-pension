-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3309
-- Generation Time: Oct 17, 2024 at 04:07 AM
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

--
-- Truncate table before insert `admin`
--

TRUNCATE TABLE `admin`;
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
-- Truncate table before insert `department`
--

TRUNCATE TABLE `department`;
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
-- Truncate table before insert `employee`
--

TRUNCATE TABLE `employee`;
--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`firstname`, `lastname`, `email`, `password`, `address`, `employment_date`, `terminated_date`, `employment_status`, `account_number`, `bank`, `postal_code`, `sex`)
VALUES
('Adam', 'Watkins', 'adam.watkins.1@dracercorp.org', 'cdV3k3y@@0', '377 Russo Drive Colonton, UT 46937', '2015-04-08 12:19:07', '2017-11-01 18:45:01', 'sacked', 838517270, 'Standard IBTC', 632881, 'male'),
('Crystal', 'Robles', 'crystal.robles.2@dracercorp.org', '5490AAWzx_', '428 Decker Stravenue Suite 231 Wilkinsmouth, PR 94929', '2014-12-02 08:10:49', '2023-04-23 10:16:08', 'retired', 723387919, 'Standard IBTC', 615688, 'female'),
('Joseph', 'Mckee', 'joseph.mckee.3@dracercorp.org', '5Q2Dxqwa$#', '99600 Maddox Street Apt. 327 New Courtneyshire, SD 58461', '2020-10-12 01:48:32', '2023-06-10 02:20:23', 'sacked', 862179007, 'Polaris Bank', 251398, 'female'),
('Angela', 'Bullock', 'angela.bullock.4@dracercorp.org', '%8&ByX3GH4', '529 Aaron Ford Apt. 819 Pamelaborough, MS 11961', '2022-09-15 23:34:03', NULL, 'employed', 714788869, 'Zenith Bank', 688062, 'male'),
('Sarah', 'Franklin', 'sarah.franklin.5@dracercorp.org', 'yt80C#ha*#', '63653 Warner Ranch Suite 632 South Brianhaven, CO 49191', '2019-05-20 18:37:39', NULL, 'employed', 712200451, 'UBA', 979713, 'female'),
('Katherine', 'Franklin', 'katherine.franklin.6@dracercorp.org', '(Q3YkGaNm^', '725 Robert Flat West Amanda, MI 94968', '2015-07-14 10:21:44', NULL, 'employed', 724538976, 'Standard IBTC', 830482, 'male'),
('Robert', 'Williams', 'robert.williams.7@dracercorp.org', '$2ec*Ylj(2', '408 Scott Rue Walkerfurt, GA 87619', '2024-08-31 19:36:13', '2024-09-13 02:42:22', 'sacked', 353399178, 'Standard IBTC', 945832, 'male'),
('Timothy', 'Cross', 'timothy.cross.8@dracercorp.org', '7r(K17Fd!G', '9641 Timothy Wall West Kyle, FM 51143', '2021-08-24 01:27:59', '2021-11-26 01:41:38', 'sacked', 711621492, 'UBA', 892876, 'male'),
('Jennifer', 'Scott', 'jennifer.scott.9@dracercorp.org', '2e!WQQjB)5', '89435 Lopez Row Apt. 904 Dominguezton, ME 29064', '2019-02-15 12:01:31', NULL, 'employed', 767015177, 'Zenith Bank', 201526, 'female'),
('Martin', 'Tapia', 'martin.tapia.10@dracercorp.org', 'iLk7z7Lq&#', '959 Blair Burgs Apt. 817 Kimberlyside, NM 07883', '2018-10-31 05:10:24', '2023-01-15 23:43:33', 'sacked', 203647653, 'Access Bank', 912237, 'male'),
('Matthew', 'Mccall', 'matthew.mccall.11@dracercorp.org', '%R^*2qSu&n', '13735 Carter Harbors South Adam, MT 08935', '2022-11-16 23:40:56', NULL, 'employed', 143181695, 'UBA', 796666, 'female'),
('Megan', 'Ellis', 'megan.ellis.12@dracercorp.org', '8H@PS(g*)m', '7887 Jones Drives Morrisonfurt, MD 15340', '2016-11-21 10:25:26', '2017-04-07 21:09:44', 'retired', 279779162, 'Zenith Bank', 391261, 'female'),
('Samantha', 'Craig', 'samantha.craig.13@dracercorp.org', '%&)j0nQbua', '0488 Kimberly Key Charleshaven, OK 07484', '2022-06-26 03:34:32', '2024-01-26 04:29:12', 'sacked', 482378683, 'Union Bank', 407617, 'male'),
('Dennis', 'Graham', 'dennis.graham.14@dracercorp.org', '6F+PzrKn#F', 'USCGC Edwards FPO AP 65599', '2022-08-28 00:33:28', '2024-06-30 21:12:57', 'retired', 524464970, 'Union Bank', 670975, 'male'),
('Matthew', 'Conner', 'matthew.conner.15@dracercorp.org', 'k_Gy29PsYQ', '8249 Wiley Green Austinville, NM 86640', '2016-08-08 14:44:14', '2020-05-10 08:45:31', 'sacked', 279194644, 'Standard IBTC', 104346, 'male'),
('William', 'Robinson', 'william.robinson.16@dracercorp.org', 'P%4)Cz1mfG', '3481 Marissa Forge Kiaraburgh, OK 30938', '2023-05-10 18:54:05', NULL, 'employed', 566868008, 'Zenith Bank', 472054, 'male'),
('Kyle', 'Alvarez', 'kyle.alvarez.17@dracercorp.org', '!4Z0GDHr(M', '11933 Smith Court New James, LA 79954', '2017-03-08 10:43:13', '2020-12-21 18:50:17', 'retired', 903251750, 'Polaris Bank', 896313, 'male'),
('Shannon', 'Williams', 'shannon.williams.18@dracercorp.org', 'Mjb43iGr$X', '216 Deborah Ford North Danielshire, DE 86992', '2016-07-15 12:55:32', '2024-06-20 22:25:30', 'retired', 251745304, 'Polaris Bank', 115095, 'male'),
('Annette', 'Shepard', 'annette.shepard.19@dracercorp.org', '+wh4uMSv4U', '763 Perez Ports Pamelaton, RI 76313', '2017-12-03 07:18:08', NULL, 'employed', 645012685, 'Union Bank', 165112, 'male'),
('Andrea', 'Jackson', 'andrea.jackson.20@dracercorp.org', '%5kTS)$g#j', '6248 Turner Plain Suite 230 New Jenniferburgh, NM 75776', '2015-11-22 15:39:34', '2018-11-20 20:41:59', 'retired', 655056086, 'Standard IBTC', 773527, 'female'),
('Scott', 'Wilson', 'scott.wilson.21@dracercorp.org', '&yfFQILqA1', '463 French Road Davistown, GA 37478', '2021-07-10 08:20:33', '2021-12-17 11:54:39', 'sacked', 845663660, 'UBA', 878376, 'female'),
('Jennifer', 'Fleming', 'jennifer.fleming.22@dracercorp.org', '$lHWQxvv59', '3266 Amanda Track Lake Ronaldfort, RI 19275', '2023-03-08 18:12:02', NULL, 'employed', 385379104, 'UBA', 834955, 'male'),
('Jennifer', 'Williams', 'jennifer.williams.23@dracercorp.org', 'Bn66Ul!xG*', '108 Lisa Lodge Lake Amberstad, CA 36666', '2018-09-09 07:42:05', NULL, 'employed', 691062506, 'Zenith Bank', 523537, 'female'),
('Ashley', 'Williams', 'ashley.williams.24@dracercorp.org', 'd1OIxqNW_v', '088 Payne Prairie Jameston, CT 70294', '2024-10-14 00:37:38', '2024-10-19 07:52:43', 'retired', 534935153, 'Standard IBTC', 105118, 'male'),
('Carl', 'Simpson', 'carl.simpson.25@dracercorp.org', '@6HVq#Dp#H', '4612 Savannah Walk Laurenchester, NH 48976', '2023-12-02 03:37:09', '2024-08-31 20:27:29', 'retired', 716302111, 'Polaris Bank', 813363, 'male'),
('Lucas', 'Gillespie', 'lucas.gillespie.26@dracercorp.org', '^uTR(Y!zo1', '931 Sandra Plain Suite 320 Laurenton, UT 02955', '2017-10-14 23:32:35', NULL, 'employed', 960725450, 'Access Bank', 707685, 'female'),
('Stephanie', 'Mitchell', 'stephanie.mitchell.27@dracercorp.org', '*^IZ5Rxr%*', '98183 Corey Lake North Michael, LA 87306', '2018-03-27 06:37:09', '2020-09-02 20:04:51', 'retired', 529024856, 'Zenith Bank', 534276, 'female'),
('Jared', 'Thompson', 'jared.thompson.28@dracercorp.org', '@yBz3Pahr6', '268 Michael Dam Lopezside, MN 68566', '2023-08-29 19:30:08', '2023-12-14 09:12:40', 'sacked', 230823665, 'Standard IBTC', 827024, 'male'),
('Jason', 'Collins', 'jason.collins.29@dracercorp.org', 'B%J4As&DR@', '160 Megan Ranch Apt. 801 Port Matthewfurt, VA 22438', '2017-05-17 21:57:01', '2022-04-24 16:00:51', 'retired', 678829149, 'Polaris Bank', 236518, 'male'),
('Kelly', 'Chavez', 'kelly.chavez.30@dracercorp.org', '#t2$gLUq0p', '623 Nathan Trail Apt. 711 East Brandon, NY 09650', '2024-06-26 17:38:01', '2024-10-20 17:15:41', 'sacked', 659392774, 'Polaris Bank', 893668, 'female'),
('William', 'Nash', 'william.nash.31@dracercorp.org', '9NAiQz%L#J', '05543 Jeremiah Streets Suite 413 Vargasville, TN 02359', '2021-03-09 11:37:57', NULL, 'employed', 278059135, 'Union Bank', 272533, 'male'),
('Jose', 'Wagner', 'jose.wagner.32@dracercorp.org', 'Z#25sBl@yi', '601 Perez Locks Port Raymond, SC 21575', '2015-06-16 04:32:09', NULL, 'employed', 412409257, 'Polaris Bank', 482520, 'female'),
('Andrew', 'Petty', 'andrew.petty.33@dracercorp.org', 'nB1BrMic1$', '0094 Wheeler Plain Downsland, SD 29669', '2019-08-24 08:58:02', '2024-07-06 23:41:55', 'sacked', 885966933, 'Access Bank', 542518, 'female'),
('Louis', 'Butler', 'louis.butler.34@dracercorp.org', '_B23hmKt++', '785 Rachel Knoll Apt. 928 New Michaelmouth, RI 99812', '2017-08-22 07:35:02', '2018-01-04 13:15:35', 'sacked', 549619786, 'Polaris Bank', 109740, 'male'),
('Tonya', 'Price', 'tonya.price.35@dracercorp.org', '@6GlY1ew#s', '025 Wilson Orchard Apt. 894 North Christian, AS 37545', '2019-09-27 22:41:47', NULL, 'employed', 448365497, 'Union Bank', 877341, 'male'),
('Jennifer', 'Young', 'jennifer.young.36@dracercorp.org', '06LiU7rd+$', 'USS Fisher FPO AE 27026', '2022-12-05 07:22:31', '2023-01-18 08:47:21', 'retired', 562743536, 'UBA', 730062, 'male'),
('Kyle', 'Johnson', 'kyle.johnson.37@dracercorp.org', 'qXQRywD4)6', 'USNS Collins FPO AA 20489', '2016-08-30 18:22:19', NULL, 'employed', 973196009, 'Standard IBTC', 921740, 'female'),
('George', 'Bowen', 'george.bowen.38@dracercorp.org', 'HA6Qk(Xb$A', '0654 Mark Port Suite 890 North Timothymouth, WA 58869', '2016-01-18 11:08:32', '2024-10-08 15:13:21', 'sacked', 211325413, 'UBA', 703859, 'female'),
('Nancy', 'Noble', 'nancy.noble.39@dracercorp.org', 'C_W5P6Bp8%', '5284 Reed Rapids Paultown, PR 93945', '2019-10-24 08:49:57', NULL, 'employed', 265837261, 'Polaris Bank', 957922, 'female'),
('John', 'Kaiser', 'john.kaiser.40@dracercorp.org', 'l+7$kFth0G', '82610 Stephen Vista Apt. 171 New Angela, AR 43785', '2020-10-20 03:50:04', '2024-01-11 16:00:18', 'retired', 770281818, 'UBA', 847450, 'female'),
('Catherine', 'Gould', 'catherine.gould.41@dracercorp.org', 'I)8C*PoD3q', '653 William Turnpike East Heathertown, MS 94124', '2016-10-18 20:45:08', '2018-03-21 13:03:46', 'sacked', 415361987, 'UBA', 309513, 'female'),
('Keith', 'Hill', 'keith.hill.42@dracercorp.org', 'SJL&8pGg55', '82829 Shelby Circle Suite 764 North Carolshire, MI 18195', '2023-09-02 00:03:05', '2023-12-06 15:57:29', 'retired', 104865881, 'Standard IBTC', 589918, 'male'),
('Andrew', 'Sweeney', 'andrew.sweeney.43@dracercorp.org', 'T7S*gwxr_l', '4033 Russell Park Suite 349 Sharonberg, PW 24862', '2016-03-13 17:40:39', NULL, 'employed', 454131013, 'Union Bank', 810732, 'female'),
('William', 'Long', 'william.long.44@dracercorp.org', '0JHM%fUK^7', '376 William Points North Sean, AL 43979', '2020-01-25 10:15:59', NULL, 'employed', 129282874, 'Standard IBTC', 759124, 'female'),
('Andre', 'Green', 'andre.green.45@dracercorp.org', '$8q+OlvPs^', '45773 Scott Drive Suite 474 Graychester, OR 79930', '2015-11-20 22:48:49', '2024-04-27 14:41:54', 'sacked', 649505817, 'Standard IBTC', 319570, 'male'),
('Emily', 'Lewis', 'emily.lewis.46@dracercorp.org', '9Z&)4(Qf09', '97012 Garza Well Suite 134 Port Vickifort, MP 54060', '2016-09-15 19:09:08', '2019-08-24 12:15:11', 'sacked', 419443535, 'UBA', 878355, 'female'),
('Alyssa', 'Martinez', 'alyssa.martinez.47@dracercorp.org', '(7L!i3d5pH', '910 Phillips Walk Martinezberg, MS 12655', '2016-09-09 22:07:00', '2021-05-12 04:30:53', 'retired', 699536889, 'Zenith Bank', 505327, 'male'),
('Jeffrey', 'Wood', 'jeffrey.wood.48@dracercorp.org', 'G4QN0s8y^Z', 'Unit 6644 Box 4063 DPO AE 37754', '2017-09-18 17:19:10', '2023-04-26 14:32:39', 'retired', 845835995, 'Union Bank', 595248, 'male'),
('Miguel', 'Trujillo', 'miguel.trujillo.49@dracercorp.org', '_G4BQi$X!9', '85436 Wiggins Hills Suite 960 New Amanda, KS 88951', '2022-07-28 08:20:23', NULL, 'employed', 702458694, 'Standard IBTC', 195088, 'male'),
('Diana', 'Hart', 'diana.hart.50@dracercorp.org', 'cb8nREba&q', '618 Craig Ranch Suite 415 Port Tonyhaven, ID 56022', '2019-06-28 13:52:56', NULL, 'employed', 438571219, 'Union Bank', 731806, 'male'),
('Amanda', 'Mccann', 'amanda.mccann.51@dracercorp.org', '4x3rFQsVn%', '7743 Reyes Rue Apt. 801 Monicaville, AK 11069', '2018-05-29 18:23:03', '2024-05-06 13:46:37', 'sacked', 890021182, 'Polaris Bank', 643068, 'male'),
('Sharon', 'Cervantes', 'sharon.cervantes.52@dracercorp.org', '#L5JUqQH^C', '8247 Oliver Skyway East Jenniferton, CO 95910', '2020-06-25 03:41:11', NULL, 'employed', 976186733, 'Standard IBTC', 210725, 'male'),
('Benjamin', 'Jenkins', 'benjamin.jenkins.53@dracercorp.org', 'G$xT6Evww#', '97264 Dakota Square Sierramouth, AS 85780', '2018-10-31 06:55:43', '2022-10-06 12:15:26', 'retired', 321430524, 'Union Bank', 119742, 'female'),
('Pam', 'Richardson', 'pam.richardson.54@dracercorp.org', 'LbFAbx#d$3', '38356 Mccarty Road Apt. 221 West Kevin, DE 67348', '2018-05-15 21:03:22', '2023-04-28 12:19:39', 'retired', 120637150, 'Standard IBTC', 206617, 'female'),
('Robert', 'Lee', 'robert.lee.55@dracercorp.org', 'sq4fUNs6$%', '4431 Ashley Plains West Stephanie, MP 90853', '2024-03-18 23:26:14', '2024-10-08 17:08:00', 'retired', 489693826, 'Access Bank', 742009, 'male'),
('Edward', 'Jones', 'edward.jones.56@dracercorp.org', 'L72kFazE)K', '823 Gina Camp Sarahaven, SC 78459', '2016-05-21 13:49:21', '2023-04-11 17:34:35', 'sacked', 670886676, 'Zenith Bank', 133553, 'female'),
('Jessica', 'Brown', 'jessica.brown.57@dracercorp.org', '_9NYfB4v_$', '165 Cheryl Road Apt. 588 Hutchinsonmouth, CO 58081', '2023-03-21 05:52:50', NULL, 'employed', 950529452, 'Standard IBTC', 914058, 'female'),
('Regina', 'Bishop', 'regina.bishop.58@dracercorp.org', '7m6SG&x$@w', '09998 Nicholas Forks Suite 290 Santiagoview, GA 40439', '2022-02-14 11:43:50', NULL, 'employed', 768951942, 'Access Bank', 635756, 'female'),
('Timothy', 'Schmidt', 'timothy.schmidt.59@dracercorp.org', '+)Qd3ywtJ0', '5146 Pamela Course Apt. 300 Morriston, FM 93987', '2018-04-11 10:43:39', '2023-06-15 20:08:03', 'retired', 149580777, 'Polaris Bank', 143886, 'male'),
('David', 'Davis', 'david.davis.60@dracercorp.org', '6&)C3OVu@k', '9555 Robert Parkways Gonzalesfort, LA 18713', '2020-10-05 08:39:18', '2021-11-09 20:45:44', 'sacked', 927282024, 'Polaris Bank', 243726, 'male'),
('Teresa', 'Brown', 'teresa.brown.61@dracercorp.org', '(d0nwKznQ#', '27256 Marilyn Crossroad Suite 476 Leechester, ID 05711', '2020-02-13 07:05:56', NULL, 'employed', 263404046, 'UBA', 951234, 'female'),
('Mary', 'Clark', 'mary.clark.62@dracercorp.org', '+F%0(8TmN5', '547 Griffin Highway Duffyton, VA 97128', '2022-01-12 23:21:57', '2023-04-27 01:32:18', 'sacked', 752842843, 'Standard IBTC', 858425, 'female'),
('Christopher', 'Cobb', 'christopher.cobb.63@dracercorp.org', 't^58&Vs8)+', '4538 Holmes Shoal Apt. 446 Kennethside, LA 51841', '2024-01-08 17:58:10', '2024-09-04 22:35:14', 'retired', 932510757, 'Zenith Bank', 116908, 'male'),
('Yolanda', 'Price', 'yolanda.price.64@dracercorp.org', '+)7McZfbbB', 'PSC 2811, Box 5242 APO AA 79266', '2020-01-07 06:02:50', '2023-05-20 17:23:47', 'retired', 717373832, 'UBA', 895112, 'male'),
('Megan', 'Garcia', 'megan.garcia.65@dracercorp.org', '&z4V1JzJ%P', '1912 Bradley Mountain Apt. 681 Lake Kellyfurt, MT 10536', '2022-12-26 14:17:59', '2024-07-19 12:12:15', 'sacked', 181168580, 'Union Bank', 621280, 'male'),
('Sean', 'Thomas', 'sean.thomas.66@dracercorp.org', '9(Tz+TQF&f', '26445 Clark Loop Apt. 998 Lake Joseph, MP 01350', '2023-05-18 15:25:40', '2023-05-30 19:10:00', 'retired', 241625159, 'Zenith Bank', 376085, 'male'),
('Michael', 'Flores', 'michael.flores.67@dracercorp.org', '1@4Ok2GCYh', '155 Shea Villages Lake Justin, NV 12033', '2024-02-03 23:54:53', '2024-03-01 07:17:32', 'retired', 272606602, 'Union Bank', 887561, 'female'),
('Jennifer', 'Hodges', 'jennifer.hodges.68@dracercorp.org', '*0K9MlFdO$', '0056 Kaitlin Villages Apt. 971 Crystalburgh, RI 13283', '2024-07-18 01:06:44', NULL, 'employed', 311456678, 'UBA', 468117, 'female'),
('Nathaniel', 'Horton', 'nathaniel.horton.69@dracercorp.org', '^uR1WukYo(', '766 Cruz Glens Apt. 491 Royberg, PR 16141', '2022-11-13 15:44:24', '2023-07-24 23:50:12', 'sacked', 840169605, 'UBA', 798052, 'male'),
('Zachary', 'Webb', 'zachary.webb.70@dracercorp.org', '%4X6Zl6p0n', '3503 Jacobson Station Apt. 689 Port David, NE 01555', '2023-09-18 04:26:12', NULL, 'employed', 367011521, 'Standard IBTC', 168188, 'male'),
('April', 'Mccarthy', 'april.mccarthy.71@dracercorp.org', 'jAh)4RMh^g', '7756 Smith Station Apt. 027 Patrickton, HI 99494', '2019-07-24 02:33:23', NULL, 'employed', 661951328, 'Polaris Bank', 510608, 'female'),
('Thomas', 'Mendez', 'thomas.mendez.72@dracercorp.org', '+1rRgF_pIK', '70885 Jordan Inlet Apt. 776 Summersberg, VT 87194', '2017-12-09 03:23:34', NULL, 'employed', 485937940, 'Access Bank', 332863, 'female'),
('James', 'Rodriguez', 'james.rodriguez.73@dracercorp.org', 'X6I$6ffe*m', '3044 Petersen Inlet Apt. 467 East Sierramouth, NH 62614', '2021-03-23 03:08:15', '2021-07-27 01:27:06', 'retired', 804531369, 'Polaris Bank', 773069, 'female'),
('Shawn', 'Davis', 'shawn.davis.74@dracercorp.org', 'oIc5AWgo2^', '3090 Briggs Prairie New Julianmouth, AS 36561', '2022-02-19 07:16:37', '2024-05-15 14:26:27', 'sacked', 323652163, 'Standard IBTC', 460344, 'female'),
('Dean', 'Wilson', 'dean.wilson.75@dracercorp.org', 'p6#9k&AxG_', '4778 Kevin Stravenue Brentbury, KS 36586', '2021-01-25 22:16:51', '2021-02-13 23:42:12', 'sacked', 992357533, 'Access Bank', 357232, 'male'),
('John', 'Wallace', 'john.wallace.76@dracercorp.org', '4Q2xAGPl(m', '230 Rachel Route Warrentown, AS 88506', '2020-01-10 14:35:06', '2020-10-20 16:01:44', 'sacked', 657581232, 'Zenith Bank', 777878, 'male'),
('Brandi', 'Gray', 'brandi.gray.77@dracercorp.org', '#3oxs^Rv$z', '6640 Jimenez Summit Hughesside, RI 17333', '2023-01-01 01:50:52', NULL, 'employed', 815138167, 'Zenith Bank', 295154, 'female'),
('Cynthia', 'Johnson', 'cynthia.johnson.78@dracercorp.org', '(c4mNey(#8', '157 Juan Harbors Brianchester, MS 69827', '2016-01-01 19:46:14', NULL, 'employed', 769193296, 'Polaris Bank', 600549, 'female'),
('James', 'Hendrix', 'james.hendrix.79@dracercorp.org', '9kQWXpYP&N', '779 Scott Hill Apt. 321 North Alexander, DC 93211', '2016-04-23 22:37:36', '2016-12-27 09:49:05', 'sacked', 759355312, 'Polaris Bank', 536384, 'male'),
('Raven', 'Walker', 'raven.walker.80@dracercorp.org', '@#2OIzKujH', '11009 Garcia Square Jacquelinestad, NE 83457', '2016-01-24 06:51:50', NULL, 'employed', 465285556, 'Standard IBTC', 491367, 'male'),
('Stephen', 'Hall', 'stephen.hall.81@dracercorp.org', '$)3M1xK05z', '5415 Eric Crossroad Suite 053 North Veronica, SC 69440', '2016-02-14 14:27:10', '2018-07-01 08:26:15', 'retired', 947642152, 'Zenith Bank', 228952, 'male'),
('Susan', 'Acevedo', 'susan.acevedo.82@dracercorp.org', 'I0vA+Aeg^X', '74429 Melissa Plain Apt. 483 Lake Theodorestad, VA 03468', '2021-06-18 00:18:44', '2022-09-01 05:10:16', 'retired', 503196857, 'UBA', 710508, 'male'),
('Lawrence', 'Ortiz', 'lawrence.ortiz.83@dracercorp.org', '@x3rK&mo@J', '04020 Smith Way Port Larryton, NJ 18825', '2021-02-05 22:07:35', '2021-11-21 11:14:17', 'retired', 473912481, 'Zenith Bank', 838537, 'male'),
('Jennifer', 'Berger', 'jennifer.berger.84@dracercorp.org', 'ygT1Tu6o+9', '78774 Craig Hill Fitzgeraldfurt, IL 58932', '2018-11-25 14:58:50', NULL, 'employed', 588344415, 'Standard IBTC', 612846, 'male'),
('Lindsey', 'Frank', 'lindsey.frank.85@dracercorp.org', 'DM^2T6olEk', '253 Joseph Street Suite 325 Perezburgh, WA 15307', '2020-04-25 15:44:40', NULL, 'employed', 614296697, 'Access Bank', 222633, 'male'),
('Scott', 'Hart', 'scott.hart.86@dracercorp.org', '#7ZIw4G2Wf', '747 Keith Rapids North Dawnton, NY 84593', '2022-04-16 08:17:01', '2024-07-25 04:11:47', 'retired', 739247300, 'Zenith Bank', 526029, 'female'),
('Mary', 'Vasquez', 'mary.vasquez.87@dracercorp.org', 'p4Jmj^h*@e', '165 Pierce Mountains Apt. 185 Sherrimouth, RI 73394', '2024-07-31 01:00:55', '2024-10-12 23:40:17', 'retired', 202356934, 'Standard IBTC', 635593, 'male'),
('Benjamin', 'Anderson', 'benjamin.anderson.88@dracercorp.org', 'gfu63REk@%', '44936 Brian Coves Port Aliciaborough, FL 46866', '2018-10-11 02:40:44', NULL, 'employed', 177327626, 'Polaris Bank', 289776, 'female'),
('Linda', 'Adams', 'linda.adams.89@dracercorp.org', '&o6fWyaf4G', '0424 Robinson Lane Bradleyberg, KY 22472', '2021-08-31 09:55:27', NULL, 'employed', 692405910, 'Zenith Bank', 137454, 'female'),
('Andrew', 'Hines', 'andrew.hines.90@dracercorp.org', 'E)0Xvlmx^D', '42335 Baker Common Andersonport, KY 22872', '2019-11-14 08:53:35', '2020-08-18 20:35:37', 'retired', 493390583, 'Union Bank', 136891, 'male'),
('Alicia', 'Smith', 'alicia.smith.91@dracercorp.org', 'W^xU4IN*br', '385 Nguyen Harbor Apt. 793 Michaeltown, WI 50623', '2017-06-16 21:47:25', '2018-12-23 13:04:19', 'sacked', 238479190, 'Union Bank', 585432, 'female'),
('Samantha', 'Schroeder', 'samantha.schroeder.92@dracercorp.org', '&CM07POr_t', '7229 Melissa Wall Lake Jillland, OH 80872', '2019-11-27 21:59:17', '2023-07-21 22:14:27', 'retired', 992327863, 'Union Bank', 747284, 'male'),
('Matthew', 'Hernandez', 'matthew.hernandez.93@dracercorp.org', '9z$N10Yev$', '4083 Deborah Manors Martinezborough, LA 65455', '2022-07-27 22:12:01', '2022-12-21 10:45:56', 'sacked', 764755943, 'UBA', 836887, 'female'),
('Denise', 'Montes', 'denise.montes.94@dracercorp.org', 'e6jSYxoa@j', '410 Zachary Expressway Michellefort, NM 13367', '2022-11-19 16:29:12', '2022-12-16 04:15:00', 'sacked', 183713452, 'Polaris Bank', 326969, 'male'),
('Jessica', 'Walker', 'jessica.walker.95@dracercorp.org', '&g*IT0zxo1', '379 Nathaniel Roads Apt. 183 Morrisberg, AL 91427', '2021-05-06 00:42:33', '2024-02-18 04:53:41', 'retired', 460386437, 'Standard IBTC', 231798, 'female'),
('Angelica', 'Atkinson', 'angelica.atkinson.96@dracercorp.org', '$U3wLsTl0N', '4654 Bradley Trail South Victoria, IL 85952', '2020-12-30 03:18:53', NULL, 'employed', 665648232, 'Union Bank', 195121, 'female'),
('Allison', 'Jackson', 'allison.jackson.97@dracercorp.org', 'B48jKG3u$%', '10673 Katherine Gardens Suite 064 North Patrickstad, MA 49117', '2021-03-14 07:28:22', '2021-11-28 22:06:54', 'sacked', 881649877, 'Standard IBTC', 956209, 'female'),
('Jesus', 'Morales', 'jesus.morales.98@dracercorp.org', '+cUJzGdc@8', '45964 Adkins Passage Suite 939 Lopezport, MT 05141', '2016-11-14 09:04:47', NULL, 'employed', 929704902, 'Polaris Bank', 968587, 'female'),
('Wendy', 'Hayden', 'wendy.hayden.99@dracercorp.org', 'y*7AUyd$k+', 'USCGC Holder FPO AP 27148', '2024-04-02 15:49:26', '2024-05-20 15:46:21', 'retired', 914090041, 'Polaris Bank', 755817, 'male'),
('Steven', 'Hughes', 'steven.hughes.100@dracercorp.org', '+##7KOi!+#', '427 Young Walk South Teresa, KY 58667', '2022-08-03 01:31:27', NULL, 'employed', 813563072, 'Polaris Bank', 397275, 'male');

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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `jobs`
--

TRUNCATE TABLE `jobs`;
--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`employee_id`, `department_id`, `job_title`, `start_date`, `end_date`, `salary`, `pension_percentage`)
VALUES
(1, 2, 'Specialist', '2017-04-18 02:20:21', '2021-11-06 19:05:43', 4998.82, 8.22),
(1, 2, 'Consultant', '2020-03-09 16:02:08', NULL, 10367.67, 7.08),
(1, 3, 'Specialist', '2017-07-12 16:40:40', '2019-01-21 12:09:23', 8450.43, 8.28),
(2, 11, 'Developer', '2023-05-01 07:49:36', NULL, 4234.32, 13.27),
(3, 11, 'Advisor', '2016-11-22 14:28:32', NULL, 3407.69, 9.7),
(3, 4, 'Supervisor', '2021-02-27 09:19:14', '2014-12-11 05:22:51', 11778.37, 11.7),
(4, 1, 'Developer', '2015-04-12 07:12:18', NULL, 11008.39, 12.96),
(4, 6, 'Specialist', '2017-07-17 22:50:17', '2021-02-11 06:46:11', 9062.88, 7.36),
(4, 2, 'Coordinator', '2018-09-01 04:18:53', '2018-01-18 16:51:11', 14513.52, 12.36),
(5, 11, 'Advisor', '2019-07-09 23:16:11', NULL, 9076.23, 9.15),
(5, 9, 'Director', '2015-05-29 07:41:40', '2014-12-08 17:35:40', 13815.33, 12.52),
(5, 10, 'Manager', '2018-03-21 16:59:57', NULL, 12091.9, 9.22),
(6, 10, 'Manager', '2017-12-28 04:19:34', '2015-08-26 14:59:34', 4263.37, 6.52),
(6, 1, 'Administrator', '2014-12-01 03:36:39', '2021-10-22 16:13:19', 2967.14, 10.32),
(7, 7, 'Officer', '2023-08-12 21:46:24', NULL, 7445.05, 13.9),
(8, 8, 'Officer', '2016-02-06 14:28:22', '2015-10-23 01:39:29', 6420.0, 8.7),
(8, 1, 'Technician', '2024-03-08 02:35:14', NULL, 6552.07, 13.82),
(9, 9, 'Executive', '2019-11-07 23:58:26', NULL, 10683.51, 12.43),
(10, 5, 'Technician', '2015-01-15 00:47:52', NULL, 6988.79, 11.82),
(11, 4, 'Director', '2017-09-21 04:45:10', '2016-01-01 18:45:05', 5352.64, 11.84),
(12, 11, 'Director', '2018-08-26 09:28:27', '2015-09-29 18:32:06', 2801.53, 11.99),
(12, 9, 'Advisor', '2022-07-13 16:28:59', NULL, 12772.21, 11.08),
(13, 5, 'Advisor', '2015-05-30 08:21:37', NULL, 4302.8, 14.01),
(13, 8, 'Manager', '2022-12-29 19:45:00', NULL, 13762.28, 10.4),
(14, 5, 'Manager', '2018-07-24 09:36:05', '2017-09-12 22:19:06', 5665.78, 13.48),
(14, 7, 'Assistant Manager', '2020-03-29 04:33:22', NULL, 5918.41, 8.72),
(14, 4, 'Director', '2021-08-25 23:27:01', NULL, 14450.45, 9.73),
(15, 7, 'Technician', '2018-11-27 03:27:41', '2017-06-28 17:19:33', 10118.25, 7.11),
(15, 7, 'Officer', '2015-08-15 05:12:16', NULL, 13858.41, 8.79),
(16, 11, 'Advisor', '2020-12-29 06:53:51', '2021-04-14 01:08:08', 5246.64, 10.17),
(16, 3, 'Assistant Manager', '2017-10-16 17:27:56', NULL, 14016.71, 9.99),
(17, 7, 'Assistant Manager', '2019-11-28 02:38:32', '2022-08-01 12:53:53', 6508.29, 11.35),
(17, 10, 'Assistant Manager', '2016-06-13 12:38:03', '2021-04-23 15:37:54', 12033.68, 10.97),
(17, 11, 'Manager', '2019-02-16 03:45:02', NULL, 10638.14, 5.96),
(18, 11, 'Consultant', '2020-05-01 18:56:55', NULL, 8611.21, 14.91),
(19, 8, 'Engineer', '2016-05-14 14:46:30', '2020-09-14 05:57:53', 6718.86, 12.29),
(19, 10, 'Director', '2016-10-04 07:39:42', '2020-05-24 20:29:42', 2573.42, 8.38),
(19, 6, 'Coordinator', '2024-10-17 14:46:44', '2015-08-04 22:44:01', 7749.58, 13.65),
(20, 7, 'Supervisor', '2024-03-15 08:33:01', '2018-08-27 11:33:28', 6332.38, 7.97),
(21, 4, 'Officer', '2022-01-21 03:36:18', NULL, 10131.94, 10.7),
(21, 10, 'Developer', '2024-05-25 17:32:07', NULL, 12019.27, 14.99),
(22, 10, 'Supervisor', '2018-12-17 17:47:37', '2019-12-01 19:30:02', 12350.05, 14.77),
(23, 4, 'Advisor', '2018-10-24 02:32:09', '2023-09-08 19:44:40', 10409.58, 13.17),
(23, 9, 'Director', '2023-12-28 17:17:30', NULL, 5940.63, 5.16),
(23, 7, 'Engineer', '2020-02-19 01:07:00', '2021-01-14 00:51:27', 6961.3, 10.04),
(24, 5, 'Supervisor', '2018-02-22 13:29:15', NULL, 14670.31, 7.66),
(24, 7, 'Consultant', '2020-05-20 04:16:52', NULL, 3605.38, 14.35),
(25, 4, 'Executive', '2023-10-17 03:29:28', '2017-10-17 18:19:20', 13462.93, 12.62),
(25, 5, 'Assistant Manager', '2018-09-05 18:13:49', NULL, 6444.92, 11.9),
(25, 10, 'Consultant', '2022-02-28 10:36:18', NULL, 14032.54, 9.37),
(26, 9, 'Coordinator', '2021-08-27 03:04:33', '2016-04-29 06:07:54', 5232.8, 6.82),
(26, 1, 'Officer', '2022-11-25 07:30:03', NULL, 12428.84, 9.51),
(26, 6, 'Officer', '2022-08-12 21:59:17', NULL, 12317.48, 10.49),
(27, 8, 'Specialist', '2015-02-02 16:02:09', '2020-12-16 14:23:57', 11963.56, 13.41),
(27, 10, 'Coordinator', '2015-04-21 04:35:27', NULL, 14139.44, 9.57),
(28, 10, 'Analyst', '2023-05-11 19:41:38', '2019-02-27 03:43:23', 3616.76, 9.63),
(29, 7, 'Engineer', '2017-08-03 10:17:49', '2015-08-01 11:23:08', 10885.64, 13.74),
(30, 1, 'Officer', '2018-05-12 04:53:45', '2015-08-25 03:34:01', 5318.01, 12.09),
(31, 6, 'Advisor', '2018-05-24 14:37:14', '2020-07-08 05:53:13', 8932.13, 8.71),
(32, 11, 'Specialist', '2018-02-27 09:25:05', NULL, 7720.9, 8.98),
(32, 10, 'Officer', '2017-01-27 20:11:31', '2018-06-14 00:13:07', 3640.93, 10.21),
(33, 11, 'Manager', '2023-05-04 09:46:08', '2019-05-11 13:15:02', 13811.96, 11.07),
(33, 7, 'Coordinator', '2017-06-07 21:23:02', '2018-02-17 19:19:59', 11443.77, 5.21),
(33, 9, 'Administrator', '2020-01-28 16:19:36', '2024-04-16 06:29:36', 7349.09, 12.15),
(34, 2, 'Assistant Manager', '2024-05-22 17:38:58', '2017-10-11 13:58:43', 8576.91, 14.18),
(34, 1, 'Executive', '2020-10-20 14:27:40', '2016-07-21 11:59:39', 5451.99, 8.97),
(35, 10, 'Administrator', '2018-11-13 15:36:08', NULL, 6569.87, 11.91),
(35, 3, 'Assistant Manager', '2021-08-14 17:55:21', NULL, 12880.08, 11.07),
(35, 2, 'Specialist', '2022-01-11 12:45:23', NULL, 8614.77, 13.76),
(36, 8, 'Analyst', '2017-12-18 10:38:47', '2018-07-31 01:41:23', 10890.02, 6.43),
(37, 2, 'Administrator', '2016-07-05 11:14:01', NULL, 7424.56, 6.63),
(37, 10, 'Coordinator', '2021-11-22 06:37:05', NULL, 5843.16, 10.81),
(38, 6, 'Developer', '2021-02-06 20:03:17', NULL, 3159.23, 6.05),
(38, 5, 'Coordinator', '2019-01-01 18:22:52', NULL, 14268.98, 5.58),
(38, 8, 'Manager', '2020-01-01 01:08:34', '2016-06-20 07:54:08', 4674.0, 13.04),
(39, 6, 'Director', '2021-09-03 15:21:49', '2019-01-12 19:02:16', 6483.55, 14.21),
(40, 3, 'Director', '2015-04-06 00:10:04', NULL, 11549.57, 10.64),
(40, 2, 'Coordinator', '2023-01-17 17:38:18', '2020-03-04 09:47:06', 12602.41, 6.35),
(40, 7, 'Consultant', '2019-08-23 08:50:48', '2023-12-21 19:10:39', 8540.34, 7.05),
(41, 3, 'Coordinator', '2021-11-14 18:19:41', '2018-06-02 20:47:40', 5446.72, 11.21),
(41, 3, 'Technician', '2020-06-17 23:42:36', NULL, 10861.73, 6.75),
(42, 9, 'Analyst', '2020-10-25 20:04:50', NULL, 2877.83, 13.06),
(43, 6, 'Developer', '2018-03-05 20:10:42', '2019-03-01 10:19:19', 3241.72, 11.82),
(44, 1, 'Technician', '2017-09-10 13:03:29', '2021-12-25 08:03:55', 5009.84, 14.8),
(44, 11, 'Assistant Manager', '2021-01-03 17:17:08', '2017-12-15 17:12:56', 13189.87, 11.68),
(45, 6, 'Supervisor', '2016-10-24 17:04:14', '2022-05-28 13:15:07', 8226.3, 8.31),
(46, 11, 'Officer', '2020-11-23 02:27:20', NULL, 2799.64, 9.47),
(46, 10, 'Executive', '2021-08-29 08:20:08', NULL, 8552.31, 13.07),
(47, 9, 'Executive', '2022-09-08 18:18:11', '2016-02-18 05:08:51', 11287.15, 13.23),
(48, 6, 'Analyst', '2015-08-25 14:22:03', NULL, 8445.31, 6.32),
(49, 2, 'Supervisor', '2020-01-12 11:55:30', '2021-02-22 20:46:52', 12271.03, 12.76),
(49, 5, 'Coordinator', '2019-09-14 14:59:53', NULL, 4948.02, 5.32),
(50, 1, 'Developer', '2017-10-27 20:32:30', NULL, 6377.5, 7.64),
(51, 5, 'Executive', '2017-09-14 05:40:18', '2018-06-09 20:52:01', 11448.48, 13.47),
(52, 2, 'Assistant Manager', '2023-07-05 06:32:57', '2020-04-03 20:26:43', 11693.03, 11.79),
(52, 10, 'Coordinator', '2015-10-29 11:35:09', '2018-04-06 02:35:16', 6737.27, 11.93),
(52, 3, 'Coordinator', '2021-12-05 03:35:47', NULL, 3005.9, 13.44),
(53, 8, 'Analyst', '2017-01-13 02:54:00', NULL, 5374.4, 5.01),
(53, 9, 'Consultant', '2015-03-27 01:28:20', '2017-10-18 11:52:30', 12073.62, 5.62),
(53, 8, 'Assistant Manager', '2016-03-29 03:34:53', '2018-08-16 13:25:07', 9951.13, 11.79),
(54, 5, 'Administrator', '2018-08-30 09:57:51', NULL, 11074.88, 14.8),
(55, 5, 'Consultant', '2021-12-10 04:10:40', '2024-10-15 04:25:31', 10331.37, 7.28),
(55, 3, 'Administrator', '2017-02-28 18:07:55', NULL, 9426.73, 7.46),
(56, 5, 'Administrator', '2021-05-30 07:30:04', NULL, 13094.76, 11.11),
(56, 9, 'Executive', '2015-02-20 12:15:59', '2020-05-25 15:58:41', 13119.01, 12.9),
(56, 6, 'Director', '2020-09-05 04:45:59', '2018-11-17 12:20:26', 2579.03, 10.58),
(57, 8, 'Coordinator', '2018-12-01 03:49:38', '2020-12-30 13:17:53', 3804.81, 9.99),
(58, 1, 'Developer', '2017-06-15 22:06:38', '2023-09-07 19:54:34', 7069.41, 12.85),
(58, 7, 'Engineer', '2022-07-21 10:59:51', NULL, 9093.08, 12.26),
(59, 4, 'Coordinator', '2017-09-18 16:10:45', '2016-04-06 14:14:18', 8310.34, 13.75),
(59, 7, 'Manager', '2018-01-11 20:58:14', '2021-02-16 18:25:13', 8800.42, 7.84),
(60, 1, 'Assistant Manager', '2022-05-22 02:03:15', '2016-10-24 04:58:04', 13085.42, 8.24),
(60, 6, 'Developer', '2017-08-17 13:35:58', NULL, 11240.19, 13.44),
(60, 9, 'Advisor', '2016-09-13 08:28:52', '2016-10-10 23:22:02', 4860.73, 5.06),
(61, 6, 'Officer', '2014-12-09 23:32:56', NULL, 10037.8, 6.57),
(61, 1, 'Administrator', '2016-01-05 10:24:07', '2015-06-15 09:42:39', 5792.27, 10.21),
(61, 6, 'Analyst', '2019-06-07 09:26:09', '2017-04-30 03:42:17', 10218.42, 11.06),
(62, 3, 'Administrator', '2023-11-29 13:07:49', NULL, 13017.59, 9.97),
(62, 4, 'Officer', '2022-03-12 04:44:02', NULL, 2973.1, 11.16),
(62, 2, 'Manager', '2016-10-21 18:26:45', NULL, 10963.91, 9.23),
(63, 9, 'Executive', '2022-05-07 14:47:12', '2021-12-05 19:55:03', 8040.15, 11.99),
(63, 7, 'Analyst', '2021-07-11 15:45:22', '2021-09-17 02:50:02', 14397.65, 6.45),
(64, 4, 'Advisor', '2020-02-18 17:42:14', '2023-01-07 13:14:22', 6991.84, 9.58),
(64, 10, 'Developer', '2024-05-08 03:23:52', '2016-08-05 05:40:48', 5589.65, 7.14),
(65, 3, 'Advisor', '2016-04-20 05:29:45', '2018-06-24 18:19:04', 4512.02, 8.93),
(65, 5, 'Consultant', '2024-10-03 08:42:41', NULL, 4897.21, 13.25),
(66, 2, 'Advisor', '2016-01-28 09:08:59', '2022-04-24 05:39:40', 8408.37, 12.65),
(67, 5, 'Supervisor', '2023-05-20 17:53:32', NULL, 5247.2, 13.63),
(67, 10, 'Executive', '2017-05-25 11:03:02', '2022-09-13 18:49:18', 14042.03, 11.2),
(67, 4, 'Coordinator', '2022-05-18 05:50:55', NULL, 5197.13, 5.91),
(68, 10, 'Assistant Manager', '2019-01-13 09:12:59', NULL, 7684.1, 8.65),
(68, 4, 'Executive', '2016-04-23 17:17:05', NULL, 2531.69, 14.86),
(69, 8, 'Assistant Manager', '2021-07-07 04:56:54', '2021-06-02 21:57:34', 14228.61, 9.81),
(69, 4, 'Administrator', '2019-12-23 05:53:23', NULL, 10419.6, 12.03),
(69, 3, 'Developer', '2020-06-27 02:19:46', NULL, 5897.18, 9.09),
(70, 6, 'Coordinator', '2016-09-24 09:39:07', NULL, 12108.0, 12.06),
(70, 7, 'Supervisor', '2016-07-11 01:51:35', '2020-12-01 10:16:55', 6946.88, 6.06),
(70, 8, 'Coordinator', '2018-09-22 11:18:17', '2021-09-09 00:47:37', 12213.64, 7.32),
(71, 6, 'Officer', '2017-05-19 23:03:11', '2021-11-27 20:01:36', 8227.21, 12.5),
(71, 8, 'Executive', '2020-05-03 06:47:43', '2016-11-21 08:19:32', 7447.53, 12.12),
(72, 11, 'Officer', '2016-03-02 20:37:26', NULL, 3048.25, 12.71),
(72, 6, 'Officer', '2022-09-29 09:54:19', NULL, 13404.96, 11.21),
(72, 11, 'Specialist', '2022-06-26 14:39:59', '2021-06-25 16:48:22', 11800.0, 13.08),
(73, 4, 'Coordinator', '2023-03-31 09:39:36', '2015-12-05 22:48:40', 12138.63, 9.69),
(73, 3, 'Manager', '2018-09-20 04:22:00', '2023-07-01 16:18:14', 8838.76, 11.24),
(73, 8, 'Advisor', '2017-04-09 03:03:13', '2017-05-03 14:58:12', 3394.32, 8.42),
(74, 10, 'Executive', '2020-04-28 04:56:59', NULL, 11390.49, 6.53),
(75, 9, 'Coordinator', '2021-12-12 01:11:54', '2016-04-13 21:07:34', 12189.89, 7.81),
(75, 6, 'Supervisor', '2019-06-02 01:05:12', NULL, 14599.18, 14.45),
(76, 3, 'Administrator', '2017-02-20 01:08:58', '2019-05-13 23:18:38', 12090.62, 14.46),
(77, 9, 'Specialist', '2021-10-15 08:51:23', NULL, 10637.31, 5.86),
(77, 3, 'Advisor', '2021-08-14 13:17:20', '2015-05-05 14:06:41', 6814.11, 12.85),
(77, 9, 'Specialist', '2022-02-21 09:56:29', '2023-01-11 23:52:19', 12640.83, 6.37),
(78, 3, 'Consultant', '2020-06-22 21:47:03', '2019-12-28 05:27:34', 8246.6, 14.11),
(79, 7, 'Administrator', '2014-11-22 07:33:30', NULL, 7317.71, 5.49),
(79, 5, 'Officer', '2015-06-02 13:55:11', NULL, 8264.87, 11.7),
(79, 1, 'Manager', '2015-10-01 22:45:58', NULL, 6767.28, 10.07),
(80, 4, 'Officer', '2021-02-04 22:10:14', '2015-03-17 10:45:02', 10232.64, 8.0),
(80, 4, 'Technician', '2019-11-17 03:18:45', NULL, 3450.19, 14.69),
(81, 5, 'Executive', '2022-12-28 23:05:01', NULL, 13997.03, 9.02),
(82, 6, 'Analyst', '2016-03-13 04:45:16', '2020-10-08 00:09:20', 6192.18, 7.88),
(82, 11, 'Technician', '2022-01-25 22:22:02', NULL, 11660.14, 9.05),
(83, 7, 'Supervisor', '2016-09-05 03:50:00', NULL, 10852.94, 7.3),
(83, 2, 'Developer', '2022-09-23 10:12:49', '2017-12-05 15:26:15', 2886.69, 14.72),
(84, 9, 'Analyst', '2019-12-27 07:59:34', '2015-07-23 10:05:34', 3820.28, 6.2),
(85, 3, 'Specialist', '2016-11-05 05:35:33', '2021-08-17 02:10:07', 6251.22, 10.87),
(86, 2, 'Supervisor', '2014-11-15 02:26:40', NULL, 9832.48, 13.45),
(87, 3, 'Developer', '2016-03-22 03:13:36', NULL, 5678.71, 10.25),
(87, 4, 'Executive', '2015-11-17 17:04:25', '2020-05-14 20:00:31', 10680.6, 6.05),
(87, 11, 'Director', '2024-03-06 09:03:52', NULL, 11480.18, 5.76),
(88, 3, 'Developer', '2024-03-09 22:50:48', '2021-06-06 16:35:37', 13762.79, 8.28),
(88, 2, 'Specialist', '2018-03-10 20:48:10', '2021-12-14 20:23:49', 7475.6, 10.89),
(89, 1, 'Consultant', '2020-05-24 14:43:10', NULL, 13075.86, 9.3),
(90, 11, 'Specialist', '2020-06-19 02:23:02', NULL, 5098.15, 12.3),
(90, 1, 'Administrator', '2021-05-29 08:21:33', '2016-04-06 18:49:39', 5940.76, 8.77),
(91, 7, 'Specialist', '2020-12-21 05:15:53', '2019-09-30 09:15:27', 6799.65, 10.23),
(91, 9, 'Administrator', '2020-03-16 16:56:49', NULL, 13972.2, 12.1),
(91, 9, 'Manager', '2020-02-01 04:18:57', NULL, 10042.92, 5.77),
(92, 2, 'Manager', '2016-02-14 18:01:31', NULL, 14003.15, 11.9),
(92, 9, 'Technician', '2019-11-12 13:23:12', NULL, 11133.37, 14.8),
(92, 6, 'Administrator', '2016-04-04 05:21:20', '2021-04-26 13:05:58', 3768.09, 9.96),
(93, 3, 'Supervisor', '2019-10-02 01:55:31', NULL, 9958.38, 13.93),
(93, 4, 'Developer', '2017-03-10 13:09:08', '2018-02-04 09:39:58', 10692.8, 9.87),
(93, 3, 'Advisor', '2022-05-23 05:42:41', '2017-10-07 05:05:56', 10848.69, 7.19),
(94, 7, 'Technician', '2016-12-28 02:38:58', NULL, 11909.39, 12.94),
(94, 11, 'Manager', '2017-07-25 14:23:28', '2015-07-31 13:38:38', 14944.32, 10.46),
(94, 11, 'Technician', '2023-10-04 00:20:43', NULL, 6351.5, 10.16),
(95, 2, 'Technician', '2024-04-27 03:08:57', '2018-10-25 18:42:56', 11310.71, 10.03),
(95, 3, 'Analyst', '2018-09-23 12:14:26', '2019-11-05 04:54:01', 2690.63, 5.75),
(96, 10, 'Developer', '2019-10-09 16:53:56', '2018-09-20 18:17:00', 13528.22, 9.42),
(96, 2, 'Analyst', '2019-05-04 19:41:44', NULL, 10283.23, 10.06),
(97, 1, 'Analyst', '2020-08-01 00:15:55', '2023-09-01 05:56:45', 6261.78, 5.26),
(97, 9, 'Developer', '2017-06-16 11:09:51', NULL, 7344.77, 5.29),
(98, 4, 'Advisor', '2016-05-15 08:29:27', '2023-03-23 14:04:59', 12696.41, 8.31),
(99, 8, 'Technician', '2020-05-21 14:51:29', '2018-04-15 13:29:32', 13982.05, 8.8),
(99, 6, 'Executive', '2018-01-12 02:59:27', NULL, 7251.52, 14.92),
(100, 8, 'Advisor', '2023-02-18 01:01:14', '2021-06-18 20:54:01', 2563.91, 7.04),
(100, 11, 'Coordinator', '2015-04-20 01:16:10', NULL, 5770.98, 6.95);
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
-- Truncate table before insert `pensioneer`
--

TRUNCATE TABLE `pensioneer`;
--
-- Dumping data for table `pensioneer`
--
INSERT INTO `pensioneer` (`employee_id`, `pension_status`, `start_date`, `stop_date`, `last_paid_date`)
VALUES
('1', 'not eligible', NULL, NULL, NULL),
('2', 'eligible', '2020-05-23 21:22:02', NULL, NULL),
('3', 'not eligible', NULL, NULL, NULL),
('4', 'eligible', NULL, NULL, NULL),
('5', 'eligible', '2021-07-15 05:00:10', NULL, NULL),
('6', 'eligible', NULL, NULL, NULL),
('7', 'not eligible', '2016-05-19 21:28:54', '2016-11-15 18:31:25', '2020-06-07 14:41:21'),
('8', 'eligible', '2017-06-04 04:45:58', NULL, NULL),
('9', 'not eligible', '2024-10-08 04:51:39', '2024-10-08 10:34:53', '2024-10-08 13:29:02'),
('10', 'not eligible', NULL, NULL, NULL),
('11', 'not eligible', NULL, NULL, NULL),
('12', 'eligible', '2022-07-10 07:04:30', NULL, NULL),
('13', 'eligible', '2017-08-21 05:38:18', NULL, NULL),
('14', 'eligible', '2015-08-06 14:22:09', NULL, NULL),
('15', 'not eligible', NULL, NULL, NULL),
('16', 'not eligible', '2017-01-12 06:19:20', '2022-02-25 14:31:36', '2017-02-11 23:38:03'),
('17', 'not eligible', NULL, NULL, NULL),
('18', 'not eligible', NULL, NULL, NULL),
('19', 'eligible', '2023-10-06 04:33:11', NULL, NULL),
('20', 'eligible', NULL, NULL, NULL),
('21', 'eligible', NULL, NULL, NULL),
('22', 'not eligible', '2021-09-23 03:17:17', '2024-07-15 04:40:23', '2023-12-16 08:54:33'),
('23', 'eligible', '2014-11-29 01:22:53', NULL, NULL),
('24', 'eligible', NULL, NULL, NULL),
('25', 'eligible', '2017-11-23 14:44:15', NULL, NULL),
('26', 'eligible', NULL, NULL, NULL),
('27', 'not eligible', '2018-06-17 07:14:07', '2022-07-16 13:07:59', '2024-04-10 17:02:55'),
('28', 'not eligible', NULL, NULL, NULL),
('29', 'eligible', '2014-12-30 07:04:14', NULL, NULL),
('30', 'eligible', NULL, NULL, NULL),
('31', 'not eligible', '2023-08-13 10:46:02', '2023-10-07 19:43:43', '2024-05-02 06:46:57'),
('32', 'not eligible', '2021-10-22 14:45:02', '2023-09-07 12:10:59', '2022-11-07 09:27:10'),
('33', 'eligible', '2020-01-23 04:44:16', NULL, NULL),
('34', 'not eligible', NULL, NULL, NULL),
('35', 'eligible', NULL, NULL, NULL),
('36', 'eligible', '2020-08-16 14:07:44', NULL, NULL),
('37', 'not eligible', '2019-03-12 18:20:11', '2019-06-13 15:39:42', '2023-01-24 14:22:40'),
('38', 'not eligible', NULL, NULL, NULL),
('39', 'eligible', NULL, NULL, NULL),
('40', 'eligible', '2018-06-03 15:03:33', NULL, NULL),
('41', 'eligible', NULL, NULL, NULL),
('42', 'eligible', NULL, NULL, NULL),
('43', 'not eligible', '2015-05-08 03:24:25', '2022-04-13 02:21:26', '2023-10-31 04:42:36'),
('44', 'eligible', NULL, NULL, NULL),
('45', 'not eligible', '2020-05-12 13:25:40', '2023-09-02 14:27:12', '2023-03-12 13:33:12'),
('46', 'not eligible', '2016-10-20 04:43:13', '2018-02-08 13:05:04', '2017-03-08 18:31:31'),
('47', 'eligible', NULL, NULL, NULL),
('48', 'not eligible', NULL, NULL, NULL),
('49', 'not eligible', '2016-01-12 05:06:01', '2016-09-24 12:08:39', '2019-04-24 03:19:56'),
('50', 'eligible', '2016-08-09 08:34:24', NULL, NULL),
('51', 'not eligible', NULL, NULL, NULL),
('52', 'eligible', NULL, NULL, NULL),
('53', 'not eligible', NULL, NULL, NULL),
('54', 'not eligible', NULL, NULL, NULL),
('55', 'not eligible', '2017-05-03 02:47:37', '2017-08-01 23:13:01', '2018-01-31 07:47:28'),
('56', 'not eligible', NULL, NULL, NULL),
('57', 'eligible', '2017-08-02 22:45:27', NULL, NULL),
('58', 'eligible', NULL, NULL, NULL),
('59', 'not eligible', NULL, NULL, NULL),
('60', 'not eligible', '2023-09-01 19:16:30', '2023-10-06 21:38:04', '2024-02-12 14:11:53'),
('61', 'eligible', '2024-10-19 20:30:46', NULL, NULL),
('62', 'eligible', NULL, NULL, NULL),
('63', 'not eligible', NULL, NULL, NULL),
('64', 'eligible', NULL, NULL, NULL),
('65', 'eligible', NULL, NULL, NULL),
('66', 'eligible', NULL, NULL, NULL),
('67', 'not eligible', '2017-02-17 08:22:14', '2017-03-23 11:32:39', '2022-02-25 09:24:11'),
('68', 'not eligible', '2022-12-18 06:09:05', '2024-05-07 14:17:23', '2023-07-24 23:32:23'),
('69', 'eligible', '2023-02-16 11:58:29', NULL, NULL),
('70', 'not eligible', '2015-07-08 23:59:05', '2024-10-09 19:13:49', '2024-03-13 17:23:16'),
('71', 'not eligible', '2015-07-03 04:52:04', '2020-07-04 02:23:33', '2019-03-11 20:49:47'),
('72', 'eligible', NULL, NULL, NULL),
('73', 'not eligible', '2014-11-09 20:49:39', '2021-12-28 08:30:54', '2017-10-17 22:53:22'),
('74', 'not eligible', NULL, NULL, NULL),
('75', 'eligible', NULL, NULL, NULL),
('76', 'eligible', '2020-09-22 14:24:43', NULL, NULL),
('77', 'not eligible', NULL, NULL, NULL),
('78', 'eligible', NULL, NULL, NULL),
('79', 'not eligible', '2015-04-04 09:20:24', '2016-12-19 13:22:31', '2015-09-01 20:01:25'),
('80', 'eligible', '2021-05-29 13:33:22', NULL, NULL),
('81', 'not eligible', NULL, NULL, NULL),
('82', 'eligible', NULL, NULL, NULL),
('83', 'eligible', '2016-03-16 19:07:42', NULL, NULL),
('84', 'not eligible', NULL, NULL, NULL),
('85', 'not eligible', NULL, NULL, NULL),
('86', 'not eligible', NULL, NULL, NULL),
('87', 'eligible', '2015-07-22 19:05:09', NULL, NULL),
('88', 'eligible', '2014-10-26 19:02:02', NULL, NULL),
('89', 'not eligible', '2022-10-02 23:16:36', '2023-02-10 16:22:56', '2024-07-31 11:25:11'),
('90', 'eligible', '2016-05-05 01:20:40', NULL, NULL),
('91', 'eligible', '2018-02-23 04:24:56', NULL, NULL),
('92', 'not eligible', '2015-01-23 19:03:16', '2023-03-24 20:10:12', '2024-01-02 20:55:05'),
('93', 'eligible', '2020-11-11 17:34:24', NULL, NULL),
('94', 'not eligible', NULL, NULL, NULL),
('95', 'not eligible', NULL, NULL, NULL),
('96', 'not eligible', '2017-04-22 05:25:40', '2023-04-30 06:35:05', '2019-12-14 05:47:33'),
('97', 'eligible', NULL, NULL, NULL),
('98', 'not eligible', NULL, NULL, NULL),
('99', 'eligible', NULL, NULL, NULL),
('100', 'eligible', '2019-02-08 06:23:59', NULL, NULL);
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

--
-- Table for `pension setting`
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

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
