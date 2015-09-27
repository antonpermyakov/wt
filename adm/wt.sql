-- phpMyAdmin SQL Dump
-- version 3.4.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Сен 22 2011 г., 19:39
-- Версия сервера: 5.0.51
-- Версия PHP: 5.2.4-2ubuntu5.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `dwbru`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wt_2014`
--

DROP TABLE IF EXISTS `wt_2014`;
CREATE TABLE IF NOT EXISTS `wt_2014` (
  `wt_2014_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `midname` varchar(255) NOT NULL default '',
  `lastname` varchar(255) NOT NULL default '',
  `initials` varchar(5) NOT NULL default '',
  `center` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `birthdate` date NOT NULL default '0000-00-00',
  `phone_m` varchar(255) NOT NULL default '',
  `phone_h` varchar(255) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `town` varchar(255) NOT NULL default '',
  `country` varchar(255) NOT NULL default 'Russia',
  `citizenship` varchar(255) default NULL,
  `passport_type` enum('RF','ZGP','nonRF','other') NOT NULL default 'nonRF',
  `passport` varchar(255) NOT NULL default '',
  `passport_date` date default NULL,
  `passport_organ` varchar(255) NOT NULL default '',
  `passport_place` varchar(255) NOT NULL default '',
  `passport_expire` varchar(255) NOT NULL default '',
  `visa` varchar(255) NOT NULL default '',
  `visa_date` date NOT NULL default '0000-00-00',
  `visa_end_date` date NOT NULL default '0000-00-00',
  `get_visa_country` varchar(255) NOT NULL default '',
  `get_visa_city` varchar(255) NOT NULL default '',
  `eng` enum('1','0') NOT NULL default '0',
  `sex` enum('M','F') NOT NULL default 'M',
  `nation` varchar(255) NOT NULL default '',
  `birth_country` varchar(255) NOT NULL default '',
  `birth_place` varchar(255) NOT NULL default '',
  `work_place` varchar(255) NOT NULL default '',
  `work_position` varchar(255) NOT NULL default '',
  `work_address` varchar(255) NOT NULL default '',
  `accomp_children` int(11) NOT NULL default '0',
  `entry_in_russia` date NOT NULL default '2006-02-12',
  `period` enum('30','90-s','90-m','365') NOT NULL default '30',
  `visit_1` enum('1','0') NOT NULL default '0',
  `visit_2` enum('1','0') NOT NULL default '0',
  `visit_3` enum('1','0') NOT NULL default '0',
  `visit_4` enum('1','0') NOT NULL default '0',
  `payment_select` enum('sberbank','impex','okazia','banktrans','western','other') NOT NULL default 'sberbank',
  `payment` text NOT NULL,
  `comments` text NOT NULL,
  `org_paid` enum('1','0') NOT NULL default '0',
  `org_paid_date` date NOT NULL default '0000-00-00',
  `org_comments` text NOT NULL,
  `org_exchanged` enum('1','0') NOT NULL default '0',
  `org_exchanged_id` int(11) NOT NULL default '0',
  `org_exchanged_date` date NOT NULL default '0000-00-00',
  `img_passport_scan` varchar(255) NOT NULL default '',
  `total_sum` int(11) NOT NULL default '0',
  `ning_profile` varchar(255) NOT NULL default '',
  `mark_del` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`wt_2014_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
