
CREATE TABLE `wt16_en` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_en_allow` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_en_allow_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_deny` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_en_deny_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_digest` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_en_digest_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_digest_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_digest_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_mod` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_en_mod_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_en_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_allow` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_allow_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_deny` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_deny_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_digest` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_digest_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_digest_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_digest_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_mod` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_mod_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16_ru_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_allow` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_allow_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_deny` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_deny_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_digest` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_digest_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_digest_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_digest_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_mod` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_mod_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16e_reg_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_allow` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_allow_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_deny` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_deny_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_digest` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_digest_cookie` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `cookie` char(20) NOT NULL default '',
  `chunk` tinyint(3) unsigned NOT NULL default '0',
  `bodysize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgnum`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_digest_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_digest_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_mlog` (
  `msgnum` int(10) unsigned NOT NULL default '0',
  `listno` int(10) unsigned NOT NULL default '0',
  `tai` timestamp(14) NOT NULL,
  `subs` int(10) unsigned NOT NULL default '0',
  `done` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`listno`,`msgnum`,`done`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_mod` (
  `hash` tinyint(3) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  KEY `h` (`hash`),
  KEY `a` (`address`(12))
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_mod_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;

CREATE TABLE `wt16r_reg_slog` (
  `tai` timestamp(14) NOT NULL,
  `address` varchar(255) NOT NULL default '',
  `fromline` varchar(255) NOT NULL default '',
  `edir` char(1) NOT NULL default '',
  `etype` char(1) NOT NULL default '',
  KEY `tai` (`tai`)
) TYPE=MyISAM;
