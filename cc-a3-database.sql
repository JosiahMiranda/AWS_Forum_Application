-- CREATE DATABASE `cc_a3_database`;
USE `cc_a3_database`;

DROP TABLE IF EXISTS `post_reply`;
DROP TABLE IF EXISTS `forum_post`;
DROP TABLE IF EXISTS `game`;
DROP TABLE IF EXISTS `user`;

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(100),
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
  
--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `name` varchar(45),
  `type` varchar(45) DEFAULT NULL,
  `img_url` varchar(250),
  PRIMARY KEY (`name`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
  
--
-- Table structure for table `forum_post`
--

CREATE TABLE `forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `post` varchar(250) DEFAULT NULL,
  `game_name` varchar(45) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `datetime` datetime,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_post` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_post_game` FOREIGN KEY (`game_name`) REFERENCES `game` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Table structure for table `post_reply`
--

CREATE TABLE `post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `reply` varchar(250) DEFAULT NULL,
  `datetime` datetime,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_post_reply` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_post_reply` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO `user` VALUES
	('test', 'test', 'test'),
    ('admin', 'admin', 'admin');