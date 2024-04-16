SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `lootledgerDB`;
USE `lootledgerDB`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_firstname` varchar(45) NOT NULL,
  `u_lastname` varchar(45) NOT NULL,
  `u_role` varchar(10) NOT NULL,
  `u_pw` varchar(61) DEFAULT NULL,
  `u_status` tinyint(4) DEFAULT NULL,
  `u_email` varchar(45) DEFAULT NULL,
  `u_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_email` (`u_email`),
  UNIQUE KEY `u_username` (`u_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `user` (`u_id`, `u_firstname`, `u_lastname`, `u_role`, `u_pw`, `u_status`, `u_email`, `u_username`) VALUES
(1, 'admin', 'admin', 'admin', '$2y$10$oKGo5XN3i68qI77iQ3xZM.3alePgCmiuZN4NFOQAg9HOzEPf5COGK', 1, 'admin@admin.com', 'admin'),
(2, 'user', 'user', 'user', '$2y$10$zFhc0qlyE66r7CSu1fwU7.VgEBA8r8xewniiDlMzfNH3kNveJz122', 1, 'user@user.com', 'user'),
(3, 'Sonja', 'Lechner', 'user', '$2y$10$nJhz03QirtTwrha93d1ZjOSWiVXqUgBphWyJK3kTx4AcMDvu0QIaK', 1, 'sonja-lechner@gmail.com', 'nomoresonja'),
(8, 'Niklas', 'Brandtner', 'user', '$2y$10$qDkJ2MJbIi4nvdNTmnetSeUWzfMAMdWYcSTsjRj5KmSWbZNziz.iG', 1, 'nbrandtner@gmx.at', 'Yukii');

DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `strength` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`u_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;