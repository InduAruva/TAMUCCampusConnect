CREATE DATABASE  IF NOT EXISTS `tamuc_cc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tamuc_cc`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: tamuc_cc
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_cd` varchar(45) NOT NULL,
  `description` varchar(450) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_cd`),
  KEY `category_username_fk_idx` (`created_by`),
  CONSTRAINT `category_username_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('C1','General2','2016-08-04',NULL,'Y','General'),('C2','All the discussion regarding will be part of this category.','2016-08-06','ABC@BAC.COM','Y','Research'),('C3','All the discussion regarding Internships','2016-08-06','ABC@BAC.COM','Y','Internships, OPT/CPT');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) DEFAULT NULL,
  `commented_by` varchar(45) DEFAULT NULL,
  `comment_Dt` date DEFAULT NULL,
  `no_of_likes` int(11) DEFAULT NULL,
  `image` longblob,
  `video` varchar(450) DEFAULT NULL,
  `text` varchar(4500) DEFAULT NULL,
  `deprecated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_username_fk_idx` (`commented_by`),
  KEY `comments_discussionId_fk_idx` (`discussion_id`),
  CONSTRAINT `comments_discussionId_fk` FOREIGN KEY (`discussion_id`) REFERENCES `discussion` (`discussion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comments_username_fk` FOREIGN KEY (`commented_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion` (
  `discussion_id` int(11) NOT NULL AUTO_INCREMENT,
  `started_dt` date DEFAULT NULL,
  `started_by` varchar(45) DEFAULT NULL,
  `active` varchar(2) DEFAULT NULL,
  `message` varchar(4500) DEFAULT NULL,
  `accepted_comment_id` int(11) DEFAULT NULL,
  `accepted_dt` date DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`discussion_id`),
  KEY `discussion_username_fk_idx` (`started_by`),
  KEY `discussion_commentId_fk_idx` (`accepted_comment_id`),
  KEY `discussion_threadId_fk_idx` (`thread_id`),
  CONSTRAINT `discussion_commentId_fk` FOREIGN KEY (`accepted_comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `discussion_threadId_fk` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`thread_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `discussion_username_fk` FOREIGN KEY (`started_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
INSERT INTO `discussion` VALUES (2,'2016-08-07','ABC@BAC.COM','O','How can we get internship?',NULL,NULL,1),(3,'2016-08-07','ABC@BAC.COM','I','How can we get internship in campus?',NULL,NULL,1),(4,'2016-08-07','ABC@BAC.COM','C','All the General Topics',NULL,NULL,3),(5,'2016-08-07','ABC@BAC.COM','O','Important announcement for 2016 Batch Students',NULL,NULL,3),(6,'2016-08-07','ABC@BAC.COM','O','New Discussion',NULL,NULL,3);
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_all_ref`
--

DROP TABLE IF EXISTS `rt_all_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_all_ref` (
  `table_name` varchar(45) NOT NULL,
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_all_ref`
--

LOCK TABLES `rt_all_ref` WRITE;
/*!40000 ALTER TABLE `rt_all_ref` DISABLE KEYS */;
INSERT INTO `rt_all_ref` VALUES ('rt_department'),('rt_security_questions');
/*!40000 ALTER TABLE `rt_all_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_department`
--

DROP TABLE IF EXISTS `rt_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_department` (
  `CODE` varchar(5) NOT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_department`
--

LOCK TABLES `rt_department` WRITE;
/*!40000 ALTER TABLE `rt_department` DISABLE KEYS */;
INSERT INTO `rt_department` VALUES ('COMP','Computers'),('EXTC','Electronics'),('IT','Information Technology');
/*!40000 ALTER TABLE `rt_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_security_questions`
--

DROP TABLE IF EXISTS `rt_security_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_security_questions` (
  `CODE` varchar(5) NOT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_security_questions`
--

LOCK TABLES `rt_security_questions` WRITE;
/*!40000 ALTER TABLE `rt_security_questions` DISABLE KEYS */;
INSERT INTO `rt_security_questions` VALUES ('FSH','What is the name of your first school?'),('MN','What is your maiden name?'),('PET','What is your favourite pet?');
/*!40000 ALTER TABLE `rt_security_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(450) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `category_cd` varchar(45) DEFAULT NULL,
  `started_by` varchar(45) DEFAULT NULL,
  `start_dt` date DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`thread_id`),
  KEY `thread_username_fk_idx` (`started_by`),
  KEY `thread_categoryCd_fk_idx` (`category_cd`),
  CONSTRAINT `thread_categoryCd_fk` FOREIGN KEY (`category_cd`) REFERENCES `category` (`category_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `thread_username_fk` FOREIGN KEY (`started_by`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (1,'On Campus Internship','Thread for all the queries on the On Campus Internship','C3','ABC@BAC.COM','2016-08-06','Y'),(2,'Off Campus Internship','Thread for all the queries on the off Campus Internship.','C3','ABC@BAC.COM','2016-08-06','Y'),(3,'General Thread','This thread is for all the general discussion','C2','ABC@BAC.COM','2016-08-06','Y');
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `security_question` varchar(45) DEFAULT NULL,
  `security_answer` varchar(45) DEFAULT NULL,
  `role_cd` varchar(2) DEFAULT NULL,
  `registration_dt` date DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `profile_pic` longblob,
  `full_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ABC@BAC.COM','123456','abc@bac.com','FSH','12345','A','2016-07-30','COMP','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0	\Z!\Z\"$\"$ÿÛ\0CÿÀ\0mÖ\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0I\0\0!1AQa\"q2‘¡#BRÁÑ3br±áğ$‚¢²ñ4’%CScÂ\'DdÒâÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\03\0\0\0\0\0!1AQ\"2aBq‘3R#¡±$4bÑğÿÚ\0\0\0?\0ÉˆiB&ïš’úSª€ùW½Øãù!ì¡´zTïzRL#Óó¡HTCÛC(ÃíIğ‡¡©X†G°HíKûPÙÂ‚À®Æ”¤úÒphÆqQiØà#‚@§\'rF–‡cIÀjcÛ#ô¤l_*Î9¥©õ¨êKd$\'¥<št-)T“H—Ds\Zçµ$Ä{S¶‚sŠ3Ú–Áä‚È¥ŠğZe£aRé‘v€®}h™¹ïDPô6š5A»h²höã½\0(¤Í4<èèÔ6\n†=¨ÅÑĞ…f•ÂÅŸz<{Ñâ•„=(Å(ñ@\0QçXÉ¢Å=…o¡âR¢Çz5Â¼CJWç½3šCbPp(÷ZŸ|Ñ‚{æ–£Ü[\"‹\"›Sš]*ÂƒãÎœYGcLh±JlJŞ¥ŒÔq¸Rƒ\ZZbBšy\0=ûÔTztHAàTZ\ZdÔdQ|RE-_ß5^¤öp[ÏÉˆîÉlÒ¼_Z#\'ê…co&£Ë#€*C¸Å2NjhL‡%¾y\"£½¿5>B}qLµX›+tBğE\nG4*{2ŒR‚S¸èR#c[Ozv¥ĞÛíRÃei%iı´6Ğ„Æ6\n-Õ#m\r´ìBô:mFö;{w–yÎ!ÚqÈîxÇ#éøÕ¿^tÜ½²^j–\r<ªVHc	Áü«Œ|Mê\rkJê(m¬d{•Z\'Sş¼û+>§®õ7U$7S\\ŞLø!X’OŸÓëå^Ô¹<Üü©B2¨§Òÿ\0÷Ùè8±ãâÄ¤Õ¶ñY]e<ƒJÙíJ°¶û5Œå·Ğ)>¤\n`¯u†RÑoæ»ş§ilõğGŠ<Sû=¨lö«,ˆĞÏ•8ùÑì>”{\rØc‘N)8¤>”´Sä*-RAœqN˜÷Z(ÖE\\ªÑ4­ØÕuôNÀñBJÔicB~DÅ<[w0=E5hWd\'BjNÚšè\r ÄOb\rvûQmö©%\0ó¤•$ÄÆ6Ñí§vĞÛLV5ƒG­9¶†ÚÆÇ¯4t½§Ò†ßoÆ•Â¨èñíCÒ“CØ.=EŠ<PÇµ	 f’E9Š-¦öÅS›}¨Âùb˜¬omZ^ÚP¬’bùÒóJÚOÁQˆ£¥mö¢+J‚Â¡G·Ú•éHv7Å(9½¥Ñé@X„RÒ_|SeG¥µÃûÉÍsëM(}ijd:\"F)Öpí@XÛ)¼sNçúQš’b*\nsh¡OaŠ<{RöÑíö©”ì#h¡³ÔSª¾Ô°´€`FqÚ”#5!R–Rl’\"ˆóTú¶¹mc©E§ˆf¸¸~êƒAìI8­iB¯¥s_ˆı_c¥ëŸc’ÑYíÑIy˜ $üÃh\0“+7‘,8ö’ÈCf¬}Fá!¸–ÎÚ	`‘•$,\\8ÁÇşµ[£ÅqkÕp]<ûÖ7!‘œ©À>§Ê©n¾(«¸@T~[by?R*|HrsEôÍ·oıF¼Ü³Éæ÷~M\nª£¦ÚuC%í½«¥ÜØÏpÇiáÑF@#I*9\0r+P×Ò~ ‰ºŠÆk›¸+:àÂìN\rw™èø™g‹ÛàÏ–\Z‘ÂÑ„ÿ\0‡åF\"\'œVâ¡¢€J•»¿\0T¨ì@\\·4œ’\ZM•¢?AR €ã\'R$eC´%4îÌ0+l—HLÏ³åV¨Årsšt©Í\r•$¨‹v0PÑ5#a¡áÓ±qŠ\")ó½‡LûM\r†¤øt<:67‡CeIğÏµ†sš,Dr”{)ÿ\0ĞğÏ­.Æ6ĞÛOøgÒ‹a§aØÎ=…\r¢Øhl4Åc;}¨m§¶PÚ}(\r˜ÎÚ-¢ŸØ}(l>”ÆÑãÔğB<¨lò¥Ğl3·Ú”ğÏ¥-b=ù¨±Œ¥m§¼?jj‰.ÆqCoµ;²€SÜP	x~Ô[*FÜŠ{Î£dÈû¥Ê{mÚv3³Ş†ßjx/Ò‹i¡lö¤•>”şßj)‘±íDG*VÁæ3CÂ°¤;ì‡Í/ÂF,yR\"í4*O‡ŸJ‡·Ú†Êe\r•}™F6R‚úSÛ}¨l¦c#¸¥K	íG·Ú“%°N+5×}#¡õ%™›TµfÚ61MmÎÜùcëÆ+Q·ÚnG5Nlk$XÖGháığÓ@ÖVæv:ãG!™QbA˜÷lsTıcÑú%®¥…¶£òÈ¨zË¸“1ç]›F¸µĞî/†•¡êfµÌÍ(Ì§ÇÕSxè×vº‡öa·’­ê%ÀyT/‘=¸lãÚ¼T\ZYu“êÍ+,îÛÒº_§®ã½†îï#;£–åó°ú€\0_Ò¶›)6SCyi\rÔ\rº)P:PEITìñBãø.Š%9IşCKMHj&œÚ†3R}‚•\n3÷F)§’Fıâ){}¨lÊ„’&ÈÅI946ÔŸ‹Ã=ˆöGÛCm?áŸ­ÃéE‹±¦†Ú{a¢ØiØ­Œâ†ßj{gµ\rœv¢Ç°ÎÑE¶ŸÙCeíö¡·ÚÛCe3¶†Ú{eÃæ)Xí6N„çÎn)6;Ùè(ŠSáM¾Ô[>Áè(mö©(¶J[0Cm?³Ú†Ïj[1Œí¢ÛOö£Ú}é©\0È^{Qóô§¶åCÃöBìgi¢ØjG‡E³Ú¡v3´Qm§öJ-¾´t1­¾ô[=éí¾ÔA=©R\rÆvš)í”\n@l1´úPÓÛhÂùEa”{)ìJIò¨¶;úÛCÿ\0†GîšwÚil‡L·Öˆ­I1Ûi>¦¤…Ùm\n|ÇÏj+AØa\r+gµHğé^·éNÊH»(öT’”6\ZV:#ì6T‡EŠˆâ?j1JH‹0U&§Ác(yX;¨Ë\"D£\reÔ—êš¥Í€êÖGû¶IoâÃ¶9¬¼ú„ï­éºg‰ÂÓç{BÑ>â¤É>Ÿ­tıOxº–+û|\\IDe¸ägò5Ì~(Os¦uŸq9+¶}Ãö•çù×ŒÏ³I?³LWÁĞ~\ZÂdĞn-‹ålï%…rsÇ?÷V‘íĞn¬ÁÕ’^kçc‹ÛÉfô ÿ\0Ù[”\nõG%†6ş\nåú†|šP·R8¥ø€y\ZPpjı„¢7à`â‡„E;â1J\'l\Z7£!=¨ŒDùT€ñŸ,PÊ:7\rHÆ2846sR†ßZ_z7\rYÃö¢1óS©ó¥xCÔQ¸š ˜½¨såS„@ö\"ÀòÈ§¸µ x#Ò‹Âö«\0ÒLL;\n7\rHµ\rœTãªÑxcÒÁDoµL(=(¶AFÂ\"lö¡áûT½‚‡‡Ÿ*[’H‰²†ÁR¼#Ô<ô¥¹*\"”çµSéR¼*#Nìoµ\r§Ò¤øF€ŒÑ`FÙG´Sş¸¥cÚ•+hô¥O•ÓèiY!!F{R„`“Á£Áô£Qê)6Æ\'Ã”^Î1Oàúf‡ì´oADVŠ‡„jP\\ö9¢ÙåOİ#í¦Fğ|Í)cNŞtñŒæ‘·olRy,’‚B$… cUûÄQ<¹¦\\±ìio&5‡›ÁHñ€\0TfßëIÃR¦ü±ôNëhÁ§ÚõY†£ê:İ–&å;beCû¢¡\rÄÓÊûÇkA± Iì£4*)Œù0üèQBØ³ŸJX‹Š’SÒˆ¡«¶³5ü/ö¢Ô¸ wóQõ¥wÒ–á©ÁçŠ“mdŒ…¤b=©øáMßô©bX\"]»3P–Gá„ÛmãXÀ>¾tÜû…\'ŠvyÃ®\0¨àùQI¾Ù7$ºEf»qsk-k2HÒíÌ„€Ÿ)çõÄ~5İİşÉo’İHmğËdıyÅw¤¶{«LQ‹pÀày£âEóêZÉ‹Á!VE’Bß8ãÎ¼ÿ\0?ÿ\0sı‰bVìï?mü?‡Ú ­Uÿ\0û¾oçZWUÇ­g~¸¹øq¢H9Å¿‡ÿ\0ÚJÿ\0*ÕˆMzOğ}Ë©2îRvF|ÍYø\nFf’m£ò©Y4@ÚƒÒ§›q\rÛ°=éØ¬¯hhÄoœâ¬|ñPğ1çJlÈ>Qm`y©ŞÒ‹Â&ŠBÙÏ4 GjOÙÏ|Q‹|wZMØaYBğÄRwÈ9ÍJÃø)_fÈÆÚC»#,Ì|¨Ä£=ªIµÇîšI€zP&ÆƒdqI,s‚)ÿ\0Ih2x©\nĞ„ŒI(<ÅHÃŒPØO§b¢>Ê5CœÓâ.hü/J‹VI1¥Œg4âF}iA¥ªÕn%‘cOxæ™hÎ{U‰@ë‚qQŞİÁçšq›B”lŒ\"$g’Tz\ny r1šeâdâ¥»#¨–OAHƒŞ‰·ùÑn\"˜P¢ª;ÒXc÷h¥ gì\r1¦8¢ÜsRVÙÏzZÚzš,d&-ëIÃc8«%¶^ÄŠWÙĞsŠ,H«Ãf€ßœóVFÏjT¬;+X·rM6Û¼ªÉâJi T\\À“’(m8íS~ÎO\"‡€Ã‚¿1Y!ô£({TÃÔ“<\ZV2!N;Qıªg‚„phŒ$væ„Ã² \\yQ*Q¨x&£.(TÕP<¨Qc-ŠÑ„ö§‚dàTˆàP2Ô9$V‘(²|ÅK`>bI¥ˆsÛI–2Aªå+,J†ç 3¨L¼óRš6=ù¤ø9©AÑ\\»#m£ÛR<CÂ«6+¢\rÒn1©$dßJâzQ¤ÕînàÂ¬„³†Á®ñ*ì–<óÍa:Æ7—kƒÈ¿®¥yP—ş¥²ø:#ÓõÈ“¢æ°?zÊñÓŠØaú“]`>uÈ>Üı—¬uÍ-XVeåbşúìMq´ŒÇjŒN+·ÄÉ¶ŠkòÊI³ÃSIñ$Ñ:ÉÊÈrõœÛëZ,IŒ¹TdŸACåÚÈÕ7Ä;Ó¦ôn¥p­µÚ/	>®vÿ\0<Õä\nD	Çîô¨¬—-B„¨F)‡‡íK1‚s·š)f-‚GU.ÛTì}­Kj‘>øhı±R4dSØ*È¦6AMI*\rÚ{	¦2ïN)Å(­åIö4è%”*pæ´¡´ÒÙÆ(xu,ÇqGµ}(Ø5D/Œ%K*¾bˆªúQ°è‹´yŠ<(ò§YG¥6F<©l0)?/|Q(ˆô¢ÅlP4¼ñMÆŒTY$Ãu¦˜1O(™3Ú…!ÑH”ÔËÀ3SJRLf¥±·©P(A‚(¡ô£ÁÎ1E‡Dú\nsKP•,b™!‚ˆ¨õ§ÎÚIQŞ‹b±’)$\ny‡Ñé@ö*(ˆÅ(ƒŞ“ƒGa`Æ<©G¥/–Z°Ó¨4ÑZxƒM° 6Š1Ÿ*<RÀ¨Œm³E‚iÒ1å@(>TŒøgÖ…HÛB¤-‹Âã?*(ü)ÈÕeš£˜I<`~4 ²/ïñõªl™%Šòœ\nAÁíÍ7Éî2(p?xŠWCò_JN§ïD\nŸ:6\"õL–)İƒÒ‰”Z‰Q_¨dÙÛ$}+Õª¢íØd™\"İù÷­½‘¦É\"Z2Àóúf³\ZÅ”—¶Âdqò¡ïèqı+…ê*³_Ú!TÎwğÚSÆ(PıÅ´ÑŸÀnÿ\0ø×v{uaÛ¸‡,\ZWÅ­êææ8#ÌÈÏ#…Q˜˜“õ®á­g:æ\rBÒQş	”ÿ\0¡®‡_ô©–JŒ¿5÷Dj¢şyô¹3<#½´‡»/³wÇ®{VÇN¼‚şÊ;»IÖhd\\£¯cP:óL\Z%ßöÅÕºØxgÆ28Úr­3­ÚÀË¢ôMˆ‘¢¸‹íSŞ¾DàŸ5ÎÜ`wóÊ÷¥—“ìN¼¯üI·Ò5ng}\ZÆÆÙü[ğ3…Qçø·é]8XÔv¯>ê]W×íw7šò#6²m$XaU@ßïUV“ñ;ª¡Ó£:Òİ$°Ï,ì§Ãh£VØàrÄñøŠÏuNRkÉ?nGuê­†Êít.í^C„Ë»Ÿ!Sô-6kqöİNçíš”£ç“²F?‚1ä¿©ó¬\'Â=C§ÿ\0²\'š\'Hul^‚A@ç°ş}ëKsÖ]?o7€º’ÜLNvÊÒ±>ƒh5»ÓJs—ö+¿ØÕ“Ç‚\\õIeªê7¸ht‹‹xïŞ8Œ‘ì£s~{jÖ7}¿>	ö«ã-‡CÃ4±»9 Ó^\'µ-fãÔ¬h}pÍ/ÃZmeŒôìSÆO=¾µäI(ºªñšH^{Ô·ğYwe:aY’BĞ¦Äâ‚	ŠX{—éhv9úT\\™$G,0Ô(ô§Ä\"Ã^ÿ\0Î£¹*C%Tşí6cZ•á®sÏáDæîÔlÂ‘	âTÄˆELycÎüiÑµMIiì­ÔY#½Xx*y4M‘Á©)¡jÈŠAâ–=©ÃjŞXö¤ø2¯î“E¦*h,\Z”ìhx\ZpÂ§M-¨’Dq´yR•TV­éK¬<©l‚†|$\'µ€¸ïN4n¾T’¯œglşÇªúh6hx@ôr$ŞC4†Y”g½IIı‘Õ}\r¼dSnœfİ+¤2äm Ô”Èj†\0R3šI\\RİvŸ»ŠA<ÓØT$‘œQFp{ŠIÏ‘¦¤F‚*M!úR™œRw5JÈü•\"ˆ\Zs$Ô~>T‰!\0Òõ bo*-¬<¨±Á¶… dyP¢ÈÑtc-ÙÍ! cûàÓñAƒëJ-æT\n£bÚcI	Q!Ôÿ\0ÔŠV>B$cŞ‡ÈµØàÒ»•4Øv<†¥³·bE&ÇB÷ÁÍ(|é­ÍDõØ/aZLƒ»#ŞÕ6z…º0Å,n§# ÷ã×µkn¦[°ˆ/‹&U7}Õã%Ûü*9ü‡PÛÌæ8NÒÜc>UÅõ‰Í%åm7GëWŠÃ­tÛ«»(¯-Òä¡™GRpAÕÒ.tÏ„,±<ÿ\0`Óæš5•PJÑ8d| ãô¬‡Zh—šÿ\0UCgmÜeÚ}¹®oÒı5«ëÓWM·¸\n¢ËVÈÁß8ú\Z8ùPû$åá›ªbşÑê%éŞ–ñ%³IwÛ}ìË!uãä+ÈŸZé½	ğ{GÑÑ/µËù¤˜[x›j,~))=É^F8œé)zGP×5k¶€Ia3ÅoâŒx˜x?„Œp{ã>AëN¦Ô:F¸ê[é4½00T³¶È–ãÌsßJË‘½š#)×ãO¯ÉÑK¯G¥é]?m©Üx,Çi‘•‚“¸œğsçßó¬¾½ÓªY9‹KşË¹A·ÿ\0Jì!Ãí(|·\0OŸ½mº:ûG+‹=\'DÆaâI¾\"›Ç<äòOÖ¸çXuwöÛ^jXÜ[Ú©u‚ìğX/qÁâ£Ùøe/Aéº§Ä‘¤õmìieà¼‚ÃI›‚	=şbX÷ôUèİ\n‘µ€G¡O¥\"Ÿÿ\0FT$ıNr\ZáŸzkFë]~òn¤ŒÜ˜mA‚#\'ïÍGnã]¢ßá§DD04E?æCÿ\0ò®·ME4‘kìÒ$(ã!ÁúĞû>;\ZaÑ1fÁ­t´ˆ1+ÿ\0Z½†Ş8£Æ0£¶I?ë[”åò-H><¨ŒKéV&!LMQ‘ÍMNÄâE§jP…Æ”¹ò©ÙÅ²÷ßJàùÑijØä\ZcT9¾3N¬°jcÇ#‚ikrµ¤I4IXO`yúÒ\Z\'“M›ŒŒÒ~ÔÙù…F˜öC†6ìÒZ&#æ\0ÒMÊš#>Gz}……öe>T>Î½¸*y¥}«<b›Ø]\0€8&”=y¨ÒÉ“‘Ú$\"¡¹b=(ÆcPVá€æ•öŒÔucØ–áIÍ\ZíìqQRM8Ş•0²|Eq†ëR6ÆËÅU¬¥|éÔ¹ÏIIÍ˜¨ò®Ş0)ápr\Z&!¼èVˆ3K\"Tv¹o5©ÒÆ5\nâ<ªØ´ÈJĞÑ»çîĞûFã’0êAíD1ü5=Q\r‡Õ¼ª4˜İÅ:6çµUÎqOÀ¬`çÒ“À§ÊƒØR3ÿ\0ÍI11¼ƒIqÔàAçš£Ş‘ò2+$RşP1·Ÿ\\ÑcåNÈ¤\0I2=E(\'\"‡†;\nDÄŒÂ…,ÆØ¡JÂÙ5L pOçCs´œÔÆ*Ã,˜¦J 95]Œg-Û4õ1J6\nKª1û»Ej÷4é|‰¡á&üè±‚G(N0ri^˜4q¤·D$ƒî(ó>_­FrÖ-Šé¿n’×§ŞÈÈí-b…Oío$cƒÑr~fôNc¬q’	§\n89•^éùF¹¤ß^»^]Ã »™“%mãÈUDà±\'ÏÕªµÓÒ}oÂ´æÕÔq°Œƒ^S$÷›,¢ù+O†Áï5Aˆät/âã>\nc—úÀõ$T-BÚÖÓ­´T{¡n–Ús‹k=ı‡ï»zö#>O]õíˆ–K)Ş8ì4Ğ·š¬Ûø>c€zò2}ëÎ=m¬ë=C×ßÛÅ4bîoİ9!\0{pÃzÓë$ş‡nË‰z®£Ô]i†›K£I\"»Ï\n1İØ÷ôïî+¦tcÙ‡K«T`Lm\0®=‘v¬‡©tÿ\0B^N÷Ÿf‘¦´¸²Ñpùï/æ)î’ÔŞ\r3M:´â;×·G•˜ııÊï~{ûÔ2JÛd¯nÎÕ]EÓı7dy3ÛZ˜]L†&mÄƒÁ`Ö¸F¥ukÃK6’İ%WF0–0xÿ\06:ëzãiú–ÑÍ{E\"\0Ñ2—Sù2ş¹¯>üLÕm¡ƒûÒ`ş¤*íUà“ŠXûè»¾¿ı0iò\\Ü]kKyá›6kw€&|EuçGé]÷Äö®ÿ\0M’Kk{u§î!ŸBëÈÿ\0Óº»‘Ï•wø”ñô—}¬¸ó§Rr<ê>´y>µ£T-Ë:‘JFF*°3\nPfõ¨è?p™\"#r¦™Û··jm]©AÏ˜©(´Ş‰Ô÷”<Ò´ÅĞÃgÎNjK=Å ¢ùS²,c&†Hã4éŒúQmö¦+c{¥zy ÜifÑ±À¥h,¼{Ğ	§M³œRE»İ 6YH ¡[±§…œ‡¶(¾É/ğÓè6Ø=hŠyTˆídÈÏj-9<Ò°Ø€Æ”ùŒÔ¦¶e<)\"‰-Éò4‰Y{\rnô©‹oë@ÀRè6 o÷§®¿½úÓÍh3œš#d[ÔúÃh8äQ4©fÅÁÉj#j@¢÷p	íH(=)ö„¯4’†˜¶#˜ÍŒ“O`ç¥/â‹…€ãæâ…}iÎI¢*Øİ·Š,,BÀ¿¼ibÖ&îqEƒßE&Àr;Gsšu-!S÷:¹éAäÏ—aĞûÚ@{.?\Z!mıÑÅ3âIÛš3,€R©{ÀˆyP¦®hQLv9¸Ñ0Ï•P¥dlN=¨ûÑhS°ŠI¥š,{Qbl *N˜Ê—Ñ–ìÙN}Æ?GÅ(jŒÖÑhMÚÕµ+˜zŸX´B°Fç\\c\0’³Ç×5‘Õ>#[é}=ı™¥ŞÆu’L·¿,9ä-şîi¯‰ı]iÓÒ·öšê`^ÀÛlÄ§\0c$;JäOÕ\Z|Îî–\"Î#÷mmƒIs9>RL~âŸ5R3^fXÜr4×‚1F¨ÑêMzg‡sÖÚ¼¢WŠ_ş§Xº![Ñs‚W²€3ÍMé	m<(¯õf‹ûQtëÛ ®?üæ’F-!´(QQ4^—[¾´ÓdÕ¦’Çl—1`ÑÇÏà¢ö\n¹P}IÏhÅ¤`\\0OÊ%gŞrÒÊÍûØşêøŒor\'ÈT¿a6’¢ç¨­F£ğïQ¶¸l™tû™Q1`Aõ÷÷¨gGÓuµ†î,K\Z¬^ªqíÚ­ş XOiÑ÷¦#´ÿ\0e˜|„Ò¨ı?ÔÔş—µXzwöˆVF%HÉÃ3dÈcêi?²1t‘ÀºÃ¦u\r1å“N–Y­ÁA‚~q¸Nı«–ë<WŠ%;0Î~µêm{G‘µ;¨#BÑ ‰×ğßık•i?£õ¯Åa¤krÍkjöÒxrDáH1Œ>*ü=º5bf›ş­àº»šYIñ Mğ§$\'ò$~5ÛÄ<à×ø[pzcâ­¶3`‰,fÿ\06â£?\rzY”~UÔâN¡D\Z*–Ô· \Z1fş†­V5>Mô¥øjqZ½ÁjR›Y3÷iÅ]íSÀïEá¨ïBÈ\Z”¢ô4µ·b|êßƒŞ€\nx\rG¸=JÁhÇô§’Ã#%ğjvÁœÒÖ2FinÃRöxÆ|JCÚçï{UŸ†hü1çIH(­Hâ<Ëõ£û27cV>\ZãB5÷’¼šP‰¿ˆşU3b!C`ôÅ-‡©ìã<¨§µI1y¦¤Y@ùphÚÇ¨ƒ	ÏË¶‰£Êi;îG£9àÆ(ì]	!—‚‡ê(·ãºšSI\'c…ö¦ØÈr<QNÅHP•3†µ*pÔVñÇˆM’QÆóGcµôJ`<²)4Á’Näš/oâ4vòriÌ&20*é3hØÊ8ÉäúTˆºø%3F?xSm,^u¬„ö&‰£uûÈEIic\'i³ Æ6TúQ`úQ`!×\'9¢Ê—ƒéCÒ‹$˜@\n>qŒñCo(l¢ÇØ `bˆ­/ccîĞÚG‘“ÖÜŠ2iÀ\"—‘ßÃö?48© ¦9LR±¥°öåB¦mÖ…†¤|\n4àZ0*\'c{I TÓ»\rÓEˆgiô¥(4¼J<\n,Bv/¥TôÅÖŒ.ê,ÿ\0P]IimÔškÛ‚öğ3fQò¹q€éßğÅd~EÎµöñ?F…¯$wLæ!>À@ö÷®÷ñ¢ôş¯ÓŞì˜î Ë[Ì½Ğàú©Àâ°\r¡\r2Ò±…šk‰D·¥G\"0xúŸç\\^l\'³ùåªèºèmòöÆ	ä,·Á¤%xl»ãßhQMê–¶‰ñJèı)ZØËöËöİŸ_-ÇÏnp=şµ¦ÔúNé]æõ½Í¤>\Z¶~X¤l\r£È¿ úÕÀ}:{×ÿ\0¸oÃbá¦ÜıÄóŸüÍÊ²_ÉšRù7ıUc&¡¤x-ÍÅå¢6yÄHûÈü‰Z®½”XXÜ@çhŸ{FGîÃõ^[ÕĞ:*I‚Ã-ô\'?Ö¹ï]¤,¶±©l9^¸úw¢=²Ø/ÅXÒÜ™Ô4‘m€’ÁğØåÜ‚yü}k\'Ô=	Ó©§¦¥wj‹tÑ4¾óµğ¥É9<ÖÃF;Mµ½±TüİÇ>^cëY¾—^¸¸ê9-š[Vqo¦[ä€È–Ç»Œÿ\0|é÷·E´RÅ§Å%ÒIy£Çc4²¡†ï\0º¹åL£\0†óõ½tŞšê8®lmàÔ§·Q²‘CŒ;2¿æî~k3¬ØIuâÙÂÒ5ÌÇ-Ã£wì/ùQúmªs¡´İOíÖW÷vZŒ€L¾øRqÏÊxûÊÜ§£ic±-Ò:à•OsŠÔşõa~kú†­au§k[[RÓœG$¡vøÈ~ë‘äx ûzÙ`ã8®´Z’´OaÜ¨$ƒÉö¤=‰â“øPÁÅH,,Jğ£Áô4`sÍ;JÌ;S‰+\r7Ï¡¡øPÇcâ—‘ÏÖ›%‰ÎãšFyíC#9’ÉûÇó¥à‘ËŸÎ›ŞG•v\"€›\0Ñş´Ÿ˜ò£%¼óNÅbñ\Zo/êiü{Ñf‹‚Z‹.O§Ûc4Ù`xR°\Z9Ï&‹ŸZwh&Ãó§aC?Ó…1E´zŠ,Bx£¶ïÆW¶iXŒ°Ùáí<ÙÏ›$ÇËğ§.2²€qÂ¯ößµ&ù@¹ç?İ§şÑJû\nèH1³Ç cğ4Æ¤mCñ/ú\ZB¬xäP˜42Ç4@1R6\'|QìCåRØ¤|b’WÚ¥ˆã£ğÓÈTw¤<bˆƒSJÆ?†vùbÖE\n|³CkÆ¤åh=h±‘J°ã4aĞÔ€@ãe×Ò‹ÆŞ”lyÅHßä‹qô“xMéBŸc÷hQ`294{IäR¶ÑãÊ•ˆ@ÏjY# \0 (ØA\n=™öúR€š1ŸJNCáŠPŒ<RÁã¥ØRÙ…N$X$hTI*¡(›±¸ãŸ*æ¶K#Ü^Ïé²K!7÷f`Åœj{=« õ>·k hW:½älĞÛ®æ®Xó€\0¯7uwVuG_j‘iznŸ•§M7‡\n,!NŞä“ŒöÉşUÎæ½šDgè—Õ×ÉÖ½[§ôÎ‡8k/!!Ï‡ãÉ$òîFIoşkÑ7moei<ÖÉáÛÄc°´Àãb°BGÕ‹ÀWøOÓğh·²İÚíbwYvıùdc fük¼Kl–Ú~§Ä~Xç‹Ÿ6Û–\'óæ°yğeÈ—„©©4	q+wŸ3ŠÎév—WWWz’ªÂ1–=†Î+Gs§‹ ÊäøJáŸüX9ÇâqU=W©µ²ÅiÍ;H!µ€v!şEîO·Ö¡Ùd{TsˆªuR’ÓÛìöª}±£ûûœn(|²¨7r£ÌVÑ-íúkKaQ`‚$ŠÂíJ¹üHÿ\0Zo¥ºzM3RX^_´É.é¯®rîy\'Ûs~G•4¬½iñ\"\r2 [GĞ¿mrGİ’_Ü_Ã½\\¼ÊT¿bß¡4¶Â_¶÷H×R÷¶ÕnyÎÅık7ñ\ZK}^Óİ<WñèOÓôº¶¸-¬¯;EÙ”z*4h?‚\ZÉ|QÒ>İÖÚ o7ôuş¦¥iã;m±­Ò{º)€±KÈÀìOÜ}kkŠÄ_j‹gñJöÆi6Å¤ÑØˆ##øšÜîÏ®_…â•Ä ¾ô{qÜş”8ô¢f€HíïZ.ßñRvô³øÑ‚qÚ‘<+…)HÏÏÂùšM×cJÂHã*¬ÃØR\náŠwb®ì5{\"’	 ‰pwÙ=†k;5ôõÚÆÌÙ\nW*{m.RµÑ¦|uİm´{G©¥Âh‹„ÖÛ3P\\RNìç4£CCÿ\0) LO#‚(¸îE/ŸCI úS°Ç¥Ëü\"•ø\Z/ÀÓ°BœqCÂÒ†¥zH@;Rğ}(`úQ`#À\'íåyşènæ¥`úT&u]eĞ³nH>tØ~_›Ïz®y#\Z¶O\\®‰‘Åâ8P9ÿ\0J~ù7J’U¢CôùE\r*ş;u[Ï\r$˜¡sÛ½¿KíBøY˜‘Q£M€\0ØaÛ¿éXróµÉ×ƒn.&ĞïÈÚ¡û3¶;:ÿ\0£R6ö©Iö°1ãZ€qœ!ïÿ\0\rQ>©7ÛcI¡T?h–7d9]ªøSŸVã­8z„ —Iy,{P¥4X®Šf.=h¶{š<\Z<úş›TZ-´¼Ğ4ìB\nŠ,R¨±FÀ(b‡>”3E€X£t3C\"•ŒjF…Üâ”G¸§Wk÷ú…ŒæY6ludÜN0Ñ±ÆÒJÀUı?İË-Ö«®ÌDq•ô&¨Ç›ÜM£FN>‹¶lu´‚Êşk3£ê2´NSrxxcí—¤[õÄ2ßZZ>‰©Dn¦#·‡€O™ÃöªnÊDÕ®$v‘|Y\\©#ùï¼{VS­ ¾Óôè¯í®dHƒ<o´ƒ“óšçC›\'•EµVtŸÖÊ.èî;I &‘m$h×ø€ÀûsíTıuuyÒZ]İäÆk‰­‘är\0,HïÅÕdØöÍe0ù$”ëŒwõÿ\0«=K$¡“ù2pq)M¶¼–r-Å´s ;dPÂÅUtÒİè²¢:€¦<62J’	ãéVµ¾n)˜¦ªM!3B“DÑÈ «\ZäKe¨èú®£>¡rÒøVn,wœÄà|Ä‘ş•Ø¹ÿ\0‚³Ÿl¾İÒWQc‘ƒ‘Ü\0ø¬üœjq¿¢¹+E@éqÛtõ”Ò¦<I’Ggh\nƒéÎïÂºU—ÚL7\n fÚqœñ+-Ğ°=ö‰¤™AšCü*U¯é[[»ë{{Vğ¾n6¨_SÀ¹“[d=R7ı•¥¼Á†ù¤ã îÆ Øh¶oq?Q\\,§d&;8Û¼qù¶?‰Ï>¸Àõ©ĞDnäky1°÷äÇ¸è\'ıÍa>#õ®¡ªjKÑ½	û{æl\\Şî­‡™\'¶G¥A/Rr•\"¯­º–æŞHúS@Äúö I¸lå-Tñó‘Ûh­oAh¦z=â´“Æ»»}ş3¯Í#±á·;±ä*“£z>ÓD¾XVV¹¸»B’]IÌ“¹?´r|†ĞÁG—ã]GÀ_#å}•X‰e—Â1×€A×ÖV(ğ¬´ß#ë\"ú%Fê_ˆú@(ØKfÏâëı)Ëek¸×o›‘q[©úvÿ\0Ü)\ZæÛn­MBGTX­	8İçùÓù+KÉÌş\"±®¯5ÂØS~-¶2‚ÉıOå[~×íõ),¥—–¤ÀáÏ/´à0õÊ€MaºïTéş¥–ê6â;›Ë%iãÎ7àœ6@ı*›¤ŞYz¹ì·6Âl`¸ù}»`š¿mrz3¼³Bì@“Oi°¼›%%Üs´İ¶}ê¯¦EÆ¡e—Œ £/ÿ\0˜<‰öÏæ1ëWw—±ÙDÒ8ËşêY—‘·KÁ¹¯¨êiL¢\07\\g€?•DT‘Âr¬}¿1¡öÒ!¤|m_OÊ´ZE¤qÇã²…nÀz:Œ3J(qÊáû+`gÌ:‰$Ïö¦ (/‘Œ,wò¬T—½K«|`¾±Ó›H\Z>f÷w–û³%Äg‡lïíì8ÉÉ;DêFk‹)Ò3ò ‹±bNj¼ü™J¢º;œ<Q”F5·6wkd?{Ë¶3T–™«f™Â¤E1!n7_¯µ[YøCt®pe@¨)ÜÛÁ#‚|üª&±kykP]A<R6©›I\0l\0!>ãwcMœ\\~cÈò&“ğ×hf#Õ˜±ıiZ*êYÌñ¡GŸj,Ó°‚š7+œŒïÉ¢{Y×nbq»Ôy×3·ëıa´ ‘RŞ3gw¼8V2ç$ÿ\0 üÍg[¯ú–ìº¬Ò0ËFò1;<‡İ?ù®Dù|…9(¥Gb2‚rnÎÛs	‰€Îî\'ÈS$VSDëÍF-*MCìéöäÊüª§\rŒdú€?\ZÕ3…>g·‰šY1Ü¼˜yxV)Ô|a®à¬G®)qm—ÁP	9íØÕœpØEi|R\r¬#RB“æÀzûš–~CÆÒH¯?,§Å\n\"ÌnçR¥JáHÆ8£\"¯„ÔãhªpqtÊ½]±Ñlî./]•aÄ ¼9íùVg¦z×Gê^¢¾¼ÓİaX¢L€o˜q‚98©ŸzqõÄHË‚HåÇpÎEct‡7Ú$/©h×\"æW‰ÀŠW\nI1°Àà~ñó¬¦çq³¥ÄP‚R:Z¬JLYßÄŒ	\ZEv6ìvÇ<gÓó§úvàIı£*3Èï8Õ9È‰<sİ_şìÑ ¹Öoì%‘®\"HÜÛ²ìˆ€ª9œ“íéÍh¾Oy/HG5ñ‘ï]ÇŠ&r·„¤äZæåÅ(Cfn„á)R6ørÿ\0&J‚b8ãµV^À¾(@­™Co<6sÀÕ‰Aåca•çó5[tOÚ·¢ªŞRg×<^;VLoòE³ı,³ãÖˆj¯]sKi–!v¦F \nÙ\'ò«^®RV™æ_–\'’øŞ œg8÷§?\n‡|NLŠøğFí¹ïO˜òöoÃ½G6on;2Ì½Éj‰DsÚ‹\0ùÒ³ì)&­¾ŠBÚ(h;8´X¥\Z*,‘ENqéDE(R°(QaG˜uë©#³»OµMÿ\0Õ[GŒgd~5}ğ*ævëÄ‚)¤XLQ[\nø.GµezÂ\\Z^#£ì\Z™S³ƒ…ŒçZ_ú{´·³É#=œŒCò€WßŞ°ñ|QÙä«‹&uoQê×U=²b(yBŒd#9=ûU·ÄØÕ:j¡Æb9íì+­Hóu4¬‘îËH~aë;Zºë‡ÔdÓ§ésŸ\r`Dí‚ËØgÜVD\"³c®»:<YÊXgwàìıEèëéeşÁM	v¦Kd…FŸ\'ÌÎ¼äá\';\Z™¢Æm:7Oˆ‡	el%NÁåì{Õ\rÀ¾·{È–òtçİº5^=Ú¡ÏäãË5¿.xÓ”—’×AÖô–ø[¹¯Cs$my$ å²YÈã#\raõn¾šß\\HšMD 	)KxC\0­äx>ô>&Èëÿ\0Ošj1AeğG–³Ú}…Ş¥Ö÷ö‘—)2î(¾I³úÖ¼Y$¡)bÃ4š:Ô}wÓ—:k½´şF¤Ÿµ@ñ18ã¸æ¹O_õ…Ö¡Ö)c¢jW3G,1¨·¶•¶;F6ùçZ­O¥æ‹O¸yl·ªÄä!?ºO­;ğ[¦mšğu-åœâ@¶Ï°g=ÉÏ¶qùÖxNq“nWûäË0¹(ö¿ît}.ŞM#¥´í)ÕVãÂE—MGáLÍuÿ\0*®‹¸8gûªØå²¯?ˆªıkXÆ®¨§q˜¹À¬âI&¿ªÙ|hAñ/\'\'1Æ€HıâÍ’ñÂ’\\³Ì6MÔµË¾§q£èRÜYèûo5»-Ûw)×Í½ş•¤Ò4};§4‚–ÖñZ©•Oİ™ó>¤òMƒi	”Î±¬v–Ÿ$	ß\'×ßÔŸ3Q:šæ{»è4è½™€ĞŸè9¦­’IE=—sÍªJ\0R|(PFOòü\rk]pš…¢ÚÇie\r¼JDh»GgëOkW\ri¥]\\(ÜÑÆÅø›ÌŠš)nÚ2ZB²Şİq¾âi˜ûÅGş•øs®CÃÄ2Ù>a‘r’r	üV¶(¦°!¶*GŸ\\f²_dõNÄã*éù ¢]–CË8¿T[[ôïYZ2Î=6;ÉD²\"FªNÜyg·\'¡QRÇm<„Â4{3ƒ ÆBÿ\0”€3ëœyÖ‡ã¼’ÚØLˆ¦M:ÌİÌàvÅT¦ïÊ¹Ô7mi®Yß)aâªïe< #Ãb=ğ3õ§K²süãÑê­)Óì”*`íÚ‹SkYHŠXYÙÆÍé÷—\'€çœ~•“éİ^âdW\nªÒ¾Øí˜àª´;İÿ\0¨­e¥å³şÙíšWø»r#Èğ>•´×FUL)àŠÆ-ÊÅø\"2@ùsœ>µ’êqìf·Ô”²xŒøñ¿óÒ¥uv²~Ğ‘Go4Ñm–0rxÀî{sjÄuâéú®—\rÕÕÃ\\Z£	¡u®Æ±ôúÿ\0¥=×ƒf8x²gBÙ¶ÓZş»wp©«êWAº)¾cæŞ¼ºH\\ûb®z^İJjWB6VUB¬§‚±“ë\\ÿ\0áÙ½Ôtë»¡1m5§Àv\0îaşÃê>µĞ:A|\r/XxåTğSpfdùk²ÉçÔö<~>8ğTï·ğ_Bí‹q¹¾ş;ÿ\0…ªëâ3©Zá’¬¿Sÿ\0ˆ=ª†6í\0qıçñcÉ¿:»øŒOöœ†2y?ñyü«Tå«´a‚ÙÑêF(¤Íª¹#÷˜ä}1UOÕQC©ÅbÚN£s#Äe+jªÌ<Èó\"“u9’2‘É‡çñ\nG‘çŞ›ÒÖßRk™&³-^l\rÃ$p_ÉxíÛŒÖ8zXßåfùzv6¯QSâWLÙÎm^ÃZ·¸C‡I–#ƒï‡ãÊ£uUÙOğïRÔ4Ù¼I%°•£E‘VT)¿ì­ééUıo¤èš®ª\\^ØéŞ9MèQQd«K˜åvõˆÑl¢k†Ñ HÒ-F1fûÜá‚© ù~¾µ»ê/^Ì™½9]ÅQ¥Ú{…Ö¦u‘ä–òÌ–nK³Ióæ¡_[ÜÛ‰QâfÆá¹FU±ÆA­î‡ĞñézV³¤\\ß‹¨ŒÖÒG4\\n*“ø©:ïHÚOh#–Ia1¦~GÏ|sP—+\Z›ïä½b’IúwízCã‘ uıÜ‡ç¿•ÇVÉ§À!¿êäIÔü4‘•uô$ã\'ëQ‘¤µÑ´Áe’+6Ûà…“¸ªî¢é{ík©¤™D«‘{Ğ€ø$\0	ãŸ!QÃ•FM7H\\[E:¶u•ë]5ì4½-5+{ıjöíó ßˆağÙ¹$»#¶ŒûVõe“ìZƒUÿ\0bŸtã0öâ¼ÿ\0ÑÚEŞ‹×¶6wÖ\"Úb$tg•ğØnãè*îJéú‘·cìœ}ñ[2ÅA*w}œ¦î~(ƒª×í_˜¥¡{mcj÷7S¬P Ë1òµê‹›ˆõ[O²l.¯½	9Ë|¸ãÒ³]{ªµ¹hõHd¶º—s€Ÿ<`n8£.{,P’|HI9ÍĞïZõ\\Ö×¯q§j,ß²€ÆrsŒæ¬~u^¥­Owk}áìµ‹ÄÈù™¾V8$ŸjåÚÃ@ÚuƒÚÆ‘DblË	’{Ö£á]Â,:¸}ÌXD¼GÈ?6¡­YaßîG\ZQ‰Ñ~!ßF¿ï¦d‘ˆ1°\0/°WÊ›øOp÷;,¨|0Ó1¼(;äÁL|P×“^øu«ÛÇlaeŠ.ÿ\03$Aä8íQ¾©n‘B\n‚²)ÄŒÈºQŒcÖ¹Ü†ÖŸÙ«Vé¯£xÒId³3øƒs˜»Ÿlz©Ôæäip3òº6NÏ55P»–4ŒS¹®òÇãPõÂC°p7“Æ<÷ù×6/³T—âsºƒHøFÄàî3ò€õï]\' ïn5ke¸ñ™¦+Á+´7ú×Ôõ}7Lº†]CJ¶ˆ?Ë˜”<p	íıEu“—Y¼éøçÒ-f{dPàF‡åpaÂ»ÌğÇd¼œYöÍÍÅ¬ğ*´Ñ²8óã5	¬RkKÇ›qÌG\' £ó=ª‡[‡¨lu{;­N;›{Y.UŸº}ôÕçQjËm§†Òî¢û`uÉ»³·cçœV^_.Y1¤üÙÔâq#—o¶‘Qav\0ç¹òïSÔîP@ïÍd´»bëUµŠââ²\\àv³sO:¿×ln¿´-¾Íw,i\0feR	®GµGê¯ûÎş‹9>—´±uöNÈ9”†xÃ`ºƒéš¬K«”»Š7}Á±½‚.ş]ÿ\0JcLénœ’C%Æa4Îá¤y\"V&LO#>~µµú¾Òfô¼‘–²eºÜÀñx±Ï‰ÏÌ¬ı)+p’\0©$JÌŒÀÈØQ‚\'ÿ\00¬H»Ğ4§Õlìm­-ä.Š\"‚<na¸¶{/ÊOŸ¯µj4ÇŠå>x‡†\Z0Fw°o\\òÖ°ò}S4_â©4nãú^&®NËDWğÁ.îÇiÈÏµ.(ÕÉÌ‰?‹<ş@ÓQ¾!Làd¾ìvãéP4sIÕoÖ\r:ú)äE.À+p1ßµnãse>/¸ßäcÏÂŒy:%ø–·P&1—GäŒûP¨Ëyo%Ñ´ƒ<q+°Áû§±äP­ør©ãR~LğÊ\Z^:/K?SuïOË|šyiï%¸e.ŠmÜsòŸÎ¯:3J_‡İcs4×¯«F-¼%hĞ&mo2})1ã“«5ñ,e—~ßÎI?¥gµ‰b}BáÙÈv#Èp?@+™‡<Ô©>¨ïdÁFÙp4.$}z\r^ÖæØíŠQ€$,FJó[İMk®°û]œZ‘÷dPë£‚î2*«ás«|8·µ†eŒÈ\'ÃNÜ¹â¶º&™-´÷2Çö{(’ÚINãâ:€8Ï~õÍægnn7Ú7qã¦>¼4kàˆcETP¸@\0Èíä;Vo«b†+{æHb…¡ÇÈ;oÇ\"¡BŒ°ñG­`ş.u‡[’ø¹·UM½‰\rœ~UÎã©O*KÈçJ6ÌwÄfÂëà¶—¦[Îuk«¿ÚSŞ$+Œr*ÇáÖÃñV“‚Éh=¶\nä]IÔvsè-?,Ï¨¥ÁGOÜTeş&ºı:]&»©_İJ$¸Ú¡Ù#	–Ïüz×‰âÂïìã¹)Ï£«jqø‘İD;µÀ|ÿ\0fF3øÕ1ÕlúwIµĞ­Ü´ÑBçĞš¼ê+¥ÓD×/ ÂZÊqŸ3´Ô×µë‰îf½¹-{3±W#¸úù}+·ts}BİGûš]KXº–îõ­3Êékn¹É2Çå¸“éŠëİÓ±èİ;Ÿl14¸3ÌG.ØÆ~€p®[ğ/F“Xeê¤$#ÈĞní–s—ü~èöSë]£UÔ\r®™,éıëŸ!êİ‡ëÅ4¨åÈl­µ¥ƒ¸` ƒåSäØ\'óÿ\0JÍ|:•õbÿ\0]x·F`·9àcïúÀÔ?‰z¬ºgHÁco!kÍClP¦yù¸Ïãßñ­_ÃÍ:-3¥ílĞçbí>çÌş\'&ı¿I«„Ê°®Ô^|óPú…æû-”+\Z1šu,7c\n¿9=¿Â?:Ÿı‚š«¼s>¨ªOË\r£gØ±\0~ªQ+JŠùÛ³.s ÜA÷¬GÅÓ_Gs±Wì¬wzœúVÖp«c¿v\n8?N{×;¾u–­{ªÀå´+i|8N0.äRrÃü\n2=)×eêÈ–Öëİ3Ôzµäec¸µv°éa±‘üLXµqmJÎt±$¢yƒÿ\0ı+W¦:vİ›¤®àİ³,ÃÏ>uÉ:«G	£Ë©[¡-£Ş²Í~ı¼œƒõ	SD»\'Ï Ö\rg¤,nnaRÒ\rã’e$ä+iŸyogºİ	Qÿ\0|9ÀÏ™úæ±ß	g¢¬å„eÓÓ÷Ím¯§‚ÚÒ[«–XâE/#1à(šÉŠâÚ+›İÙÊ~#kÚÃ#±[«™±Lÿ\0*D¹,Ióí¯ç\\ÃO·—¯ºŠ-#N• éû9–k¦G(˜f`õc“ôäùT¤Ğ:¯âŸRBÊk£;¾Ë‰\\a\"Sœ*ç%¹-ä3ç]g¦º~Ã¥ô?D°±ùYFù›åoÛØÿ\0n)fÌ±.¼¿ûƒÓ½=Í©OÀ“¤éiòE\rµ [o<8£S&1ÏıjÃ¥CÕ‚x*£ìàmç†òÏ·•WàÖ´Ú±¤ˆ¾\Z’\0ÜçÛÍ±J[Ù,4oØÁ0å#kŒ©ç…#»7’©¦ÏC<[ci\Z¥™nì€i;xgÎµİP‘Í«uİŒø‡ŒÍ/§Ò°–w°j7–[«„YŠùòóïZ¾°yÿ\0îa­\Z™—<Yxÿ\0µnYÛg>¦‘êoÙ_ËÕ`£nW»dóçÍUY)[Yüd\n¤¨dåî0>µoÖßÚÓdU…C6üc‚{cÛ¾<Ï¥SÛ%Ì–røjí¾U=…ƒ68ÀşuÊo¶z_íÄ®êUK­€ÿ\0ôìNï¡ííS+$³ñÄPA*2øl#\\çxôíÅ3ªÙÉy$–©46m,Ó7È¬sßÓşzÑİÎ‹3°e@cÉ\rš³ÒE™Rrm‘ô¤ó­îtXM¼Öp[™2„’XwíÆãÆ+[¨ÌûvTp>‡Ò¸ßÀÌ±¹wFf6rmÇ—+]“X	oqr¨ŠÊ995näâXò(/¤qã=ÖÌÁè7¹Ğ\"™HÚ¹O ü²\ZèÑ¼\Z†¡y¤ÚÛ\\^Éf‘³¤S¢x·Ãü§¶xÎ+€tÏY\\µü6í>5´­lûxm¨ü\ZŞ|3Ö4}OV×¯ú­\'ši–ß\0À\07B‘è´gâMIÎ_²ˆ¸%,ØëZ,vİGg«}—PŠxQ£<Ğ•«ğvœyıjûíLšN§,…ğ ‹æŸxïÿ\03YËïûZmVÖ\r.É%‘	ìw.Æãæ8íïVzÛ­´«è¬´;É¦£EybEÊ¾IÉ~?VcœÜRlçæ‚ŞÌXÜ%ÌöÓGŒYwv g¾õMÕV×İ³K\0{…a¶sƒŒÈÀ\'ÌqZ~®²¹‡G‚êâq,\ng…g@#J3¿gJÇêóªtÂ±É\nL9Î>øàc½hã·ïEşä2Sƒ_±ˆ¾·–ÇF±´‘İ%”üØŸSõ¬è²³ÒoæyY„_;Ê\'æ+5Õ2á¸*ç\\÷ıÕ53¦Ú3ÓWk¾ wGİ	#‰?v»™k+ıÌ˜£´hŞÇ7ĞšÔèKFm¥ÁS• 9Ï\\ü‘I,Œ>2ãäÉşê3Y+S¶ÿ\0±u.?šAa3–Æ\0ûmò<Ö›á,ÑÛô’™Y	A,çn1}³\\Sn.şÍØ£T‘¼7SÚ0GìHªK23„l3;ü®6àdà{zgÎ³ıU©ëw÷ÖÖ};soœî˜8}ç¯ €¯95Îúg«u{¯¼ĞõIšãöâ=ÇD±<yyU?Âd/u—áqÍ•b‹ìœú\\i×–1ê6ÑÆšZ´·QHş!ÉDğÇÏu?ïZ¯†}S©ÚkZìv×·µª‹ñX–R{\Z‹­¬sêrÙæ9Î|VRÄ±@B’;qê1Š¨øV^K­^F–@Æày$“)ïV`ËîÆRúIäp×\r¬Iß~N³qÖ—º¾œÚf£l÷6Ó¨•Õ\\·ŞpA÷÷¨aÒ–\'5µ®•w}$7P»0º˜8FFQòàûÿ\0AU$ÎpS÷Oñ\ZÚ|j¹DÕôkgfİ-µÖÌ/IjŒÓtâƒ\nüÑ’é¸q®XûÀ¹p\n~RXw­]j6šmôÒMr‘,Vş+nÇİË¯pezn÷OşŞ±Ty\'Œî’0Şê/Å½*ö{ùõAæ²²Ôîá°‰”¬‹\"àq–VlçíšÅqÈé³|œ îˆ½5¬\\ê}=÷0«]\\Jä³£nó…Ç~ÃşkgÓ·Xxˆ”<2\rgì´™Ì­öH$w‡’‘ÄìUI ß^}KĞ®öÏ4h’\\\\,ŸÜA’\\sò.X}HÇ½W7³z¢SKJlÀôÍä/ñ–¾./dY‹œ<1q]‚ö5±¾Şšc™•	#ï_ùÍq™úväõ¡¨›Kû[=¾Ñ2:ÿ\0u†É-èr9®ñ~ek»§Iw¢>w p9ïøşU¿œÖE„cãEãmKä«BàwİÅs?„¡í5«™öß±;Nq@ó™®‘wp–¶i;©¼‚\0Î3üë’ôU¦¥Óú“\\^4wÜ•ŒÃ_s-ëœù,w¨`šşÆû²Éão5×Toº›U±Ğµ¨OÒ=Âr7‚Â=‡ñ\ZW£¢ú„ÜÃ®ê7vRÚ]ºÀÃ}ÕÉ?+qåø\Z£%Â\n,Çšsv™Í­á·Ñz‚IµI§·mZçö`Ä¡B‡<–,1÷³œWKè”é¶Õ¥¾¨nI<cãø²mnÌ@;@òÈªMg¦º^Õ\"¿Ö5)£X€+\nFÜFK®8#µt}TéİBKM;OğL2”s\Z -’ØÎ|¼ÿ\0Z©æ¤›}—I9:‰húV‰m4:Vµ´3xh«#\02äù“åNj¬ú|ºl&YXäöbc#œ{œæ jÚ¢M;_Æ·*Šä¶Äf rB‚Hçß…N·µ-1o-æRf…dGÁ^àsÏ\"¹y\'\'=¿sdaQH‡¢_ƒq’IÑ¤Y\ra°Œ\r¼==+ÿ\0ÔÌØ¸Òâr0ÑŸÈşµ½‚w³k˜¬.cLf)&—$à¿(¹9#Ú¸êÉ{ñ¯:{BÔ®gŠiZgq´€V#ß\nÃñÓôìu›İø^LÜ§øiòÌéN©¾!ìúwV™Djr–r´qØäsï]“ş4mc§â»şÓÓî,¥œ‡E™\n–\\®8üø÷®æuK¤„Á§ØÆ-#E4¨áq€ÃÓ8¦ïµMvø¼:t\Z\\ãtrøÂIdÉÀ;~é[9¬òÇZ2âáèîÌ¿Ä¿~ŒÕ®&‚X‘téHp¥~|¡óÎq^{øwğ»ªzó}Ş<‰ˆ—Å|·ñ^êM;U¼±A¨Khö1imhU|„å{dy÷äÔ>šÔ­zFÒêÇ§ôkM/Äù¤ı´¡ÖB£w	‘½ªŒ|¤¡_#Ÿ\n•µe÷Âİ^›é]gW¹·ŒG3¡Ègn*EôÂÿ\0_†ÔemíÄôÎ¦éòµ§OC=Ä…¤œ½†	œ+}¬Å¤ô£®Êiu–ü˜ÂËŸÆµ·g’œjm~å;İ§ø¯-Ã\0lt!‹<Cıum)¼e`\\ïá•&—¡C5Ìa¯.Ûíî^C¹Î?øV÷xÇ=¹ú\nhªF’ÙIªhg?e½Ôq¹Ê¯?º€ıÛ©û‹ŸKf\\œ—ÜÕn¾ßbéµ·\'æXHov#ŸÖ¤¼‘+õS/L2;8’x	wƒ–\0œ~u[ofºoJÚØ@\0(ÀÆ1š¸×gX¬\"FD`cğ]©Ÿÿ\0İÈıE;ìšM?ÿ\0„Ì„“–ÏÍ~#k³t¥ÍûCh·R‰c»+ÄyáAÇ¹®‹ÓÄi—<cƒøá`N¶º#>£<yOä’ı,·øYr“h×²G…ŒßHÑ@Á[úª«ãn¼d´µé[Y¶I|ëö§Ò,öüçzÀßüGƒá—P¾…&›-şŸso\rÜs,»\\ŒÆ0FWÖ‘Óz¸ê=bMzGWi®•W9à·aøUN:Ü¾\r,²eø:Î“§ıšÜX[\\Á6¨å\"T° yşY©²3,±\"Íæ?”*öÿ\0Äg\'Ÿjƒ§]4÷,Œ]¼9YÖ\'T\0§q9ÆyíÜvóŸrŠVñÆì[>)ÈÇï\\9ÊÙîã‘Usö³H÷JÈñÈXxxñOüZjü)ĞlÁ2ÑÁØq’Ò÷ãşb˜–G)—¹‹r£®ß£óÜh^Ì« À†C¼Çn~`0ö™#Øœ~^õ4ÇEMC™íaQ¶|ï#;~œV£«&u]šÀ†õ%wâIÏŸ­c´	$6ˆ±ı¨Ã /lö­gWİtûËcIB\r¥	Œ±ÀaÛÎ­¿Å˜´rÌ—îVuÔÂúãíhP|ÉŒ`pN8ú¥TÅr‚ÊFgUˆ¸drpTíã&‘ª_Üêğ}µ¢\ne·\'Ã-“óÜ“œ~8¦YWìR8às÷H? ùJsè+vÎÊ±Iz´„‚b&¸»>nÇw#ı?:—ªÜ?ö4³5Ó	q!aósœñU½]!0KÀÎÔxFïş:©ªÁÓw	!>(ÂğO<jÑÑêW7ùËú_€neëÇÜÆA§±$y|Ñçık²u&YÓçmÊ¹cÁû¦¸§ı=H«5Ã\0éÎ£æ#÷£çŞ»F¾íö™Øv\n¤sû¾µ»Ôr?²9\\náÙÇº#¡æ³Óõk­@£Üˆ\ZçÂ\'‚FCnÄúñ¢ø®é:4úĞÕ¬^è±€&?x_*³Ò$Š>—×Í¼xÄc`\0yúyËš¬ÿ\0¦‹Ş¸·×Ÿ\\û1ˆ¾Ğ€ñ‡õúŠo,²âœ¥ß‚ì¸¡‹$cg¯u‰ªj6öğirÛLÿ\0:³DªU@o0w=¿J;¥‡BÔî’YzF—*ãöƒ<ö§:Æã¦†£fÚJØ=És±bQœm!íLZ\\I&…¨(*¿³S³§çíƒù÷5N)~(Í™?‚ƒXº¼Ùo/\'h\Zs¹Q‰\'å÷î;w÷¬ïTÇu>„ñÇì2)]í‡`qÛÏô>•qÔ2L~ÊdTˆ} ‘ f?»éùš¯Ô$7vñÃ\'‡¾8ßç(h{óØöZã-eà›M+™DújÊ†Oï¤Ÿğã¿áW?ã“ºqã•]‡¾Ğ>ÿ\0ï~\"³¿e»²µÊôÄÏ	‡Ê°\"N@àùV§¦íßşÉ¿Ÿl!\nF˜œ9Ç—zêrrF]¯Ø£\Zé”öıCk£XjËv[}Å”‘B7nùÉO?>3Mé:ıôı?öapÂßÄ³r˜?¥dzÌŸ´B¥X„ıİ£¸ò«.–¸¢ÉòÛø}…_5Ø„ç+£´t4€E£È	,d”1ÉZæ½3.~/_\'ÿ\0çJW­Ç@^!¶ÑÔ‚pòœ÷‚1\\ÖÈ¼?o5H¤e—ûJUN2¤	sæ~õ.L6Á$¾‹=?/µÉSí¶rÛY0‘,qLf-œ¼{I$qíúÕÂ7Q>«ûR€Î1O÷µ6]FÂ×¨\r•Îº–·Ãû2\nÈÃåSëÕáÜïPu\r»KIÖ\ZGxøÇ‘ë\\4\\qÉ?¤u½K$råÚ/«7ö,¸CãIÃ/¯ñ\Zé=o¨=§QhH±ZËâ¼ª|XKà|ƒëøãÚ¹]•çÊ34Deyş&öïı+¡üCÆ· H©ŠÒÈwÀÌÒ³ä•â¿\"‡¨–Å5‰5‚+K‰áHc¥BàíÏ?{=ù¬wÄ³:6M%Åì‹Ã˜òdd÷\0•Ïo:¾ë«©¬tw¼šÒ9V;Gr»x%Bá{öâ´:¤ú¯ t]]Óä¹KæGûD‘´@Œà+ÀçëPÅNjR]\Z¥—ÛÇç±Ÿ‡ğÁ©tôZ“va’úŞ)g2(“‚Û|€ïœ{Õı¶‰µïö½¸°MY¢hÍÚÂ0AÇîïÎ8nòª­2ÇNÑ~%êz~‚;c¥[MáofU&IFyç°ÿ\0ƒú	š:›LŞ¤ƒµËöî8¦ñ=ª(­äm]”oÓ×‘µÖ³wq³\"àÃ	E”wÉaŒ;úR—M[M\nGö«ÂÜÅ‡Àbr;ùR:ÏâgHßè×V6=Ic7E|Û#Œ‘O-ä7]/ºYa]ÊÙ€¹ıEWš3Šº£gjI\'æÎM«uæ©uÖ×İ?&¡§ÙXÆÅ7É!ùAİ¸çvú‘åšêÿ\0t(/Eş«hû\"¶·6¯$€9˜„Ü® ämÃıx®ñ3Fyº…ÒÆÏíW—X¸?fl2*p\'nHaïÆ|ëĞ®]Zh‘Y%•ävf\0$iÃ	JmU3vÀç·òÓÉ52‡×eiÏiG÷0:Íäš”²iĞÌã{«Gœ1†Hò…Zë‘XN—ˆC—RªŒîï’{ğhV8ätNcó\\2\"ƒ>Üß‘Ù‡Ş¬n7\'P¹Ë4v÷Ûn\\œïà\0;òâ=i•6w–ŸmµşÑ’İÆåxäùy*O$ú/êj’^­K\'7^Çau?í.D[’2F@<ıì!#óÅ[4æõ£(8­OLëo`²kİC=…ä€²¢^Mc`0J¡ùüª©úáä:ÛE¥ë·,²È\nböà†=€ Ÿ§zÀu\'KİkZ¬×­¡_ÚFˆìáTI+9pæb¿oçLôÿ\0ÃßÖjm†Hï6ÆXAàƒÀõæµKAlÊÔÛ›’ê‰Vvšœ’ik\rõÄ²·…\'ˆÙQ‚\0\0CéO|ÓumG«.:»Xéû‹F\"CÔ²Äû†ÖÎs’Ù¨ô†«¡İÛÜİ¥Ã‘ÆÜƒÂÄnÎ3ÏŸ¶*çáT½EåÎ—ªEjÚ<	\"²Êø¡‡ËŸ•½|À«¤±ãÀı·O÷#ùO\"Ùtt‹_JÓ­å…õi%gPÎœœ/–8ÿ\0j•göYâ3Ø]Ã:Ü;<e‚ÌTŒäzâ±\Z´:v¡rZXÊ’3&üñùÔ»9¥¶šÉ\"¹•#ñã\n1náÆ=;×M>¾N„¸•L¸Ô­5ë†¸ŠÚŞÒ$Œ±-0,I|;zş_£ôæ®uë˜õ9UáÛÅfb­»Ns<\n—é-Ò\rğå­“÷ĞeÏ¦kaªµ›uü6¢øbçÆyÏnãŠ×Åƒœûğr}G7±‰×—Ò(:òûíi¥Á&ß´n\r·÷cıãùqøÖO¨£mªì:yvJ·7Yí÷Sä~@Õ”º¥½Î£}¨ïÄ‘¼JŞÃæb>§ğ¥t5„Ù¸Õ¯Zƒ‰›ÕcÆ#_Áyú“]+îÏ%ñfJo¤’ğøH²¹(µKçk¸¢²Ä…ÜoòÀÈ¦õû†KqnÁ»ö±U\ZcÊoàŒ±,Y A¢şêmÙİşÇlcošEfíØrÒªúÂâIç‚ĞG³|Àã½\\éàK©ø¾PCŸÄğ?fµ™<~©TÉ+dş&¬ £Ø÷PÚ	Lgqù9ïNßC=½¬×¯…µCò=<ªUŞÃg¥ÍyvûcŠL*Ë»ª£ÜœU¯[ÿ\0·äŒƒ‚€pØòÿ\0z_$×“;Ó7kqjÒ-»„,@\'ûÕwÅkaqÒ—\0ÆÁ•w3Ûš‘Ò#61ÆÕ.xôæ­ú’ÙgÒ\'ƒ;·)ú‚*¸.™äÏ6ÂöË§uLešÍ­˜ÿ\0møı\Z´ÿ\0,¯ôè4»I<8ÔÌ®êGÌy÷òü*ÇE°ƒQµµ´»³ûsÙß«F›IÛ’7¹çÇ5tÖ:“uZß>xâûgŠIR0»óš¯‘•V‡ ôœMÃìmô;‰íÏö¸]~Ã9eğˆÇÈ‡9İî<»~&êÍÊ6wÆí Æ9Rœƒø/*…ó:âQ!*¶“—tûª¦$<sÊœ;{Të«v[‹@ÀŞçÄuÉcœœœÿ\0Íp¤zUä£’i—‡{wQ©eîHtÏXÏëíIÔå+¡@’Î›qk´mÁl¼÷æs,úkÛ­ìr7‚ø6pZpO?Ï#Ò™ÕQ›G‚)f[d\rÛƒò?¿¸?X‘è—Òo+=ª\'€:|å¾lg¶???:Ğõ|ë,©§“eÎİà8Ãù–³1Ã¿ÙÙL‚el€H`#¸¸şµ­ÑZ9ú&Õ¬lŞDT–îdŠ5Ú3»<÷ç¾;ùÕ±§hÃ&ÔöF7RIlÚ;áÔ¬XòNq“ë¸Ÿ,`-\\ÃÒ\ZÜ}µ ‹Ä ”Odå@Ó<df‘ÔútW½CtÑ\\YV¸q‹ôÀŒ07vÛJØèš•­¬VÚn§¨E‘\"æD™]ÈÂ€8\rùŸ^õVL5F¸ò¦ÑÉúŠÍ\'Õ>Á*¯$Hë»ÏqÏ\'ØU•æ.->Ë+\\°|dr3ÛëO-î©ë’Oanê²Ã<ª³©ôÚ;ãÛ·\\NêÂr¡¬™œñ´¼QÑS‹§Ó¿&3á§KÛhİ_Z¥ìr¸û:øÛNcÂ¶áÀî|ı«I¬™„E‰eŞy\0ã:Jid²“Åg}—,«êÁôæ¤k0ı¾$´ghüfh·ñ¹3Æy qõŸ&L‰É‘xáŠŠñen‰—q¡]ÛIªZÂ³#+^2åWdzÏ¥gşü7Óô©/-WÚÒP^Ü\r•âB8ù~¹ö­·ÂÛ;M†.¨d |ìÿ\0eÉ9É?ßÿ\0ÌŠ…ÿ\0h¬Ö¾‡RxÒà	&1ÅåêÛŞ•ÖPœbãÓ8o3”ök³E¤ô›e¯[^kz¥ôÖâ7ğ§¶´ošAòáŠ†ÀÚŞxíßƒOÙØI­î¬¯12\\9çÓÇNG®èº”/s9»Ñ,Ë4Œ6Açor|ğ7cğ«›Ÿˆ=§›sLµ]Ì¢9r¯œ¯8 cÏ9÷úÖl±ÈÕvËñfJ[>éún§­]ÚjvQÜIh¾*rH$ü­Œä6Üşjÿ\0SĞtAÓ3\\A\ZÜDCdŒØ~@äcEd¾ÜCsñß®å·–b0Á±¡ ¡^Ä}+`eÿ\0ú{#ã?4¾XÏíZ–Tâêş‡Óv‘„M+K¶Ôş›–.öâ7FˆLns“—Îî>œ~ş³¦Ò\ZÙ/şÉ*ü¡4Öğ>aïÏ•gµ¾«µµÔaûı”‘Å\n³\0R[{eOÌ1ØqïåRfø‡Úp°mJiÑeVG‘cB\01Åi,­Xœ¢™š¸éK\rSL·‰®ck8$i¶^\\,MómV\'sq£»\nªê_‡ÚOOê–PÙßAx›Çß c0„¹O ç·â¯›WÒ’(H†œ¼s,Š„ õã çËó¬ìR¾µ®5æ­«ÁÌèa¹B±øH2 (\'²ÿ\03¯Î“mÒE…ÍRòi44ÛŞÁV&ÂHÓ|P5âÈ$bH“ç$óø\'\"³Rtí…½ö¿y¨Â±ÛÍ5Ç…–ŞWï€9ÏnkI ±Ş+_Y‰RÙBø«(2LŒypJ­íƒËšŸÔ¯o3]i:d×I¥È¼	,’îæÜÊFãŒR‡#‘úgt[›‚)<tÙqÒ=3¡u-’õw!’ö3-‘(PÚ²°i=±éŠ§²é‰ºWYºo{{äQ-ÀP|O™”ç¶q}JøuÔÖZ-Œ\Z]Ş®–zm¬{ …müFl–ÈÏŞ¹\rƒåVİs­ioe¦K¤ji©(dñ¶Û•hŒç‚FìãğÍcñ1È×ò¿üOeÂ¾F!‹P…Êyx\'9û{óøWDê›;R7R_FVÚbÊb2qÁnTœ)¬¡ÕzU½´š‹ëÖ° İ²&´rÎÙxTä\0,9®3{ñ«[›LŠÊÛM‚\0ŒÍâçswqä<ı<ªÅÅË›Â2Êxáå¿ªoí.ašÓP‰ÛN¬]Úäì)í¸d{ûS~7t¯Oô¤}=zÑ¢Z«[Âñ;·ìÃ0_#ÙHç5çMO­º‡_E°¸qw(-Ù„KÊ`Vuì	xÎŞı«‚±¦²>ÌùsoIx=dÿ\0:*ïâö¤º¬ia&•okª’±–E’Fa´¦F7,W–¥µ‚Şù–é\Z9BÌ®¤Â)‹EY€ò77èhI}hÌò\\Ú^´®0ÌŸ¦ßçZñá6õù ää•-½¤^İ†áåŒWOè.§³³ƒM°»ÔôËKI>Ò]7ËòóŒ.\0<:æz-åˆÕa)°§lÉp¹ã?»şÕ#XÓïo.$¾LéI\r¹\0 İ×Ê–lQÉøÏÁ,9e¸DÖ´{«7jñ¤ÏÃ,°’L¬áI#•U<jô‡Ôv÷Éof³[:’l6J8Áôùryã}J¾ñd†;i­dŒ‡29™­Í‡\\ê¶¾2t¤3¬Qx~|¶\0àgÊ¹ÜÎî Í˜y+ùÆ¾5_^7\\jSÂf6RO‹YBŸ\r”($/8-åëïB¦ésËøZŸNDÀ«L BqŒÇ\0}qíB¶aœá:+É‡I9,M­ö£=†™\r³İÈ–¤ˆáQ€6†<a~™>¹ªôë=.5KYãŸ“À·3´îÜúÖKQÒåšáL=O¨HvæÛ…ÀÇ›wü)ÒztÖñ%Æ¡¨ÊÁpHdP?|ıê1áæ’½_ø3ò¿É¢Ÿ­z‚ú#ö=6ı’L¹ºrT\0y\'¥?kÕ½Uò® QÚÙÒMï\"´xÀeó>CÏJ¤´Ğlc³[Sy©xH¬¢3sòÀnÀÏëŠŠı\'£xÆV3ä‘›“Æ{öZº<<Í¶S.\\ó\r\'â·——Wšµ•™·ecãLcr2XáŞä|ıÍUÉÔ¶‰ªÜjV÷PÛ,LÍ„Êä@$€FşcÒ˜éÎŸèë	eŸV³»ºŒÇ¼À¹9Ï;À\\w­>”ß£àÜtÅêË#laƒcFËß¿`O±gáeŒ©Áÿ\0ƒVZqµ$Hƒ©º+Oÿ\0ZÔ “qA¶È>â0;‡ïPàê™e¶Ùª]M\"]£Ú4q¤`¥œ±ÁùIí	Ïg©?Ã˜ìã]\'OÔaF$IÉµHã÷S*Ù6)’¿¼\\Zéšô,ª6<Oo\ZÃG&³càM¾àÿ\0Á¥óºîh†>\'ôİ¡šRÄK\Z!fÈr98ı9÷§zâ¬ZÌ÷WzD3iÌ`Î²L£rªœÌ§#¿oÂ×õ›5Ót7»VØ\\\\İ,xÇ|¶ƒŒ.pN<Óu^ŸÔ4e·Òº_LÓ¥_â+÷™Ø^0cQÏçÊ¶báeÄöÕÑÍægÇ—Wl—§B¿ØzF˜Ü5Ük%À>H§sõcŠè\Zs±Ür\0\nÕ‰ÑíÚâú{ƒò¬!a_ Ë7êqøV®Ââ4ƒåÆ1üÍ&yæ¸©â.xUÁïëQºp,ºà˜Ÿ–%Æ=ÉÖ­t	Vl€{gƒJĞ7€¢%;æ•@÷ù‡ûÒ\"İ#wd|.âä™ â²Œ×:­ÅÈû­•Së€2kMÔìmô³DÛ>P»½=ë=kMy“‘áfpÌ‘gñ=¾¤Ÿ*°¯ä ê+‡×:ŸI·|:ÒÑ)åùş‹Ø~\'Ò·nh‡‘¹“Øâ²\Z²¯ıÕ¤GØ±O€£€ dbµ?ÆYqœsçQì³å¾ŒCá¬nÊØ$şµ¤¾„=œÊ¨£#{VK¢Ôg78ÉhÈâ¶*‚BºjÂ\'Ó¤}+«5d9$e’VHãPXòq€xìju¾½i¬kéd²]FÂ$eb‘ —#-œ•Q´ü¼N})=K$ºGÅ‹¨ÙUÒXÉí»oó[c¯ë6Ú¼7âŞÑ¶ü²æcs¹{}j¬Üg–¤‘è½—íÂPo«²ıçşÈÛm}xÖ¶²Å¶7C+nÉ/„Ç?7®;ÓA©-´†×şä¹Y÷d·ÀÚy$d`÷ûÃŠÔôïPCy¦Hú†±£èM2•xÓC1“Îì|ûyAQµ«¿‡Òè³$³®£¨&ãòÙ\\„fÇİ#î…>|ãÎ²¾FíEÅÎ‚?%Fõ6šñ7º¤’G/±dŒ\"ºwx\0gÏ{ª|RÑíì¬îa³–ì\\1‘SæGŞ$cßµ`§Ô4ÙÜ5ÇKèòavÿ\0zßÿ\0¿µG–]0m0h0°óYÉãèXŠ”x™›ı&|Ù¡.ÓG]é¯Šß¤†âÓQ0ZKş\Z—·²) ÜçŸ*±¹øÇğêÅ¤·‚çÄ=ÄCmÃü™ÛåÉû¼ù÷®]Ó\ZV®‹§·IX\\O#`L÷Şäöåöã>ÕgÕÕ:ÍqJh	d¿İIöä`á‰ã²=êáKz ³*òtº…ªu…ìvRÚøsÛCà\0‹€Jœñ\"­^[œÇ;w¬	ù™îc³cğ®[.±¬4¶-iı›\râ¾ÿ\0vNí€!òÆ•Yu/Xk*d‹¦ì\"š=Êc{©˜°eqÀÇ sùUŸé™¥Ş¬Œ¹q‹¨É\Z> éÎ¦±×êkkˆ?Ù¼¡•Ô!ÆÀAÉïŸÂ­?²#vİ;í÷wCgíŒb³§â\rÌP0­\'†‹]°ÎO88ü•@è©Õîµˆº–fÒì#\r\"I¬’?Ì¸NÃ²çœsŒcš_OË$¶‚Xùn?¦HÔé\Z2iö—5Ó1yŒ±¸Ú<€\nyöıiZî‰úq³ŠâU¹ Û:à–ƒ‚O`uºêW×¥[+.|5’a¼ŒsÎÀ{ûÕ^²êÉõWa¥\"G·ä‘æ¾8?tùãŠª>œï¨ö\\ùynH™¬ôDš}·‰Ó]1ì‘ÿ\0¥TÛØ,,“I¡yù¦fÚ#÷c·ã¿­j4\rsP¸Ò$ƒ¨¡·iYŠ©HÔ.8nä¶ïniSÇ£Iesl¶øs¢+¢ÚGm¤êsŒ*ŒcÊ¶Ë%õ£ÿ\0XdÆ¼ÉøúÖh´÷Óáêùí­æM\ZS!ÙÆN1‘Á8µÊúÏA»»Ô#½¶Õ-u8n#vy£v€e”€G¯¦1]HèzZ¥ª·MÇ= u30˜c9`7)óö­§tF•4×vİ<ÒNÀìYÒU	doœùr¸«aF/ÒˆÎX§ò¿ÉCÿ\0KEzVÿ\0UºêâÓí®mmå‚¬»Y‰ÚO|å]U»ƒ¨¾\\tæ‰©[Ë©]#¶MÁ#3±# |¹Ç5CÕZ…¯¬V×ı#\rÔP)Øé$Qsòå@`£#€yÇHê\rkF¶è­;HéŞŸ¶±¸…#K”d÷Û<n7rO5‡.Ù2{-?è_ŒuµşNQmğ\\wHÅ„IÆç.NÑŸLsÇ=ê²‡ZÉÕŸH•mRùbñB¬ÊC!8È?Èâ½%¤Ÿíİ\rXiÒéë>í°$ÌÜwíúÔİ¡tk¨µ8„÷73!.ög c¸“ÇµYünui¿=¼vº<µ/ÃÛ˜ä)nmÃ Œ¼9ì3ıÿ\0*rßá±$*ö»$D¥&Œ†ôä¿nşµééÍâ,º<#¶÷?g²Ö§_h==§¶Ó9Y/‡nÀs· ù›ò4¿Ô2ı¡û1ú<¿Ãn©a‘c.2qºxy_âşó£¶ø{ÔW6ë=½ƒÍä2Ë8ş?ùŠô´İ9§]3¤°*ã\ròùñJFŸ£t¥u)Ñº–ËS’Ût¶×aÌGœ\0œgsèjÅÎÈĞ½¨wo…]X¶_n—OÁÎ7]D\0ÁóåŞb©dèî¢P’~^ø¯5ßµ®“²MF=2+¸£- LŠîÄü¿)<ü¤“Fz@†%7wˆ’Í\ZªŠ	sÀãë´~4—¨Oä—±IÒ½A,2ipãù9çĞùbºÇEi«¥tôÏÓúüsM¦ÅöÄÒìÄ¹˜¨ÎòOÈÁ²p1é]F×¢:rŞ&y@!&æ%ÀòÇ=³ü«?d:CJšñnÚ6l‘Fİ¿#æş\\sš§\'6y<|}Ã¾Œ6¡ğ¯PşÇµÖ:j;É•†ö³Ô“À¹B	ıÒ=‡Ö²\Z6¿n²ôş ¹RÛ¾É.1õÛì*î’õEœv\Z…»N€şÍï-Ç®íëz“a­töJK>«eã¤LvA!8# gàyúSÇÊËùvFX`ü?¥z/ªµ»Ò–šL‘ ù^[¥1\"g× 1àùSµî‹Ñt{ùìu^¡’Úx€.“ré»?0”÷ë]«¤o:VúÔ4—ÖÉ½Ái§DÈR~ñã¶*›­5KOÇSé­bÒÂ;¯YeCãÀ Çİ,	Ååe”ÿ\0ú³¼›ãJZtïQÚXhp»G-ŠJ¸,dfaÇoAÅdmõvÊİQ/Ò Æğ¾OOÓ?•væê>¾M’mcÜÌàË0à8m ?˜çõªõê§KhÕ´ÉÒWI¼WÍ†È8\0\"p=êØróF)J6Eâƒğèä°ëzòD¾…Â®ä\"l\\hÛ¨ú…Šÿ\0ã¢b¼\r±D8üv(:Ÿ¨œf}#E7áYNğ¡bäl<’yÆOjõ…ä—3ªtU¤ğ˜EÚ\0ÈÉS“»8<gÒ¤ù³^q‹Ù_ò8ìC¯C/ˆ&}»rñ®qœ÷ó¡]wYÕôÇ¶€ƒˆÜ<hó´èvÉón]ØÁwõ¡VG–ëı±<?üŒÒ*Ÿ´œyšY;î> T/òÎ`P9`{çŸô¯uG’%íÈæï¿ø¨ü;Pw†#Èäœ~µF½šaÏo˜Ò•cSƒrF}	4„LÛeºrI÷ÿ\0z=ö\nB!?æ¨ FN~Õ&G£Pìáre\'\'¹cıh¡’‹Ù?ÊVP?Íå@Ë¦ìû’ñş<~µc¶,Y_+õ?Ö”Vßp³çÔŸëE$MdGìásåÌŸíEnÖsO,¸İ\"÷9ÁÜ¥G\n·Ê‘ûœS‰\"	c !`r9<{Ô2E84Á;§P¦Ÿ.ìÈìû¶¨ó?7úš°÷°¨y\0Hä=‹ŒöÏúÔ>—Œ®“q±¿i”\'<ã€?[ßÉ3ÁÍ÷üÿ\0!^%ù$U]Z<ÍŸ•=‰ÈÇü«é1¾Ğ—\'hÙHïŸ:¨¶€1Pá»€;äÕ÷Põ“Ñ½!6§©MàÄˆv ûò9ì«êMB*Û!ä©ø•ÔöZ-©öQ´0Ø€e¤~áyŸ_ ;Ô…0jÛMÔš®Ô¿Õrû\0â†Dh=±ó}I5Ê:bßTø‡ÕV½EÔ’Úâ}–6 ü±Â2OûŸ3ô®ÿ\0n#ŠtŠ4\n¨›TÀíS}ŠFZxCõm”HÇqÏ¿ü57®ïî­í¼,Fğí=Ç=¿ù¨±º¿X[xØßiÏˆl¿b\rß¸ğ¤8÷#=Ğ7³;M+Xc)éÍnc¼¸‰~Ñ8J‘á§zçÿ\0¢&âà?+Œşµ²[™]‰ìâ!åÀå¨m¡J+c‰ünÖ¿³úÚÃQû+5¤Ñbl}åÚİıø=©ˆàŠHÖH­a1È £y{jïâ}´sÍk3&à¬Èsïÿ\0Ågì­îmìmàU,‰\n¨>\' ®Ï¥-“²è=]\"Â6E-­±çó¯çŞâ@ıš»Â£nYp-ß?æ ,î˜í6¬	ì0y®·³’ïy‹	\"œzŠTQFäŒıV‰tëÖaØØ¸ÿ\0*°±Ò¯ò<K5]ÙåƒZ„”\"†§6ÍwÃãkk!>!2p«á×¿¼”O¥Şñ„`‘îúg¹ííú×5ÑkTi\'µ·,¤rªàãœç\rõïéZ®¯‰h¡ÓÖxÈÂ’O¨ÉóõâçÄ¥’Ñ¾¨Ñê-à¼wT1ı§¯Ğš£Wš6È¸cß\'wòÅlµ¡wà´·Vq«äØ<Ølÿ\0ÎOã•œ9vÄpO8Lú×c‹+3eNĞÙ¸™†^RóµJ–Òå4XufßöY®\ZÜ6ª­Ïàß¡¨!]¦U’(Õ` ‘ê{×Pê]O§ÏÂ;]Å¬äº‚T23\\¹°TwÃÛõ,óÒQIybÅ“wàæ\"tPC;ŸNßÖÇ€ï$‰a•S\'À-é´gı(5¼¸\r¶Øş\0•höãôSî?±Ï´B\"æ|BiKsiçu.}Éâ£xRµ¶ûm@?•G69TÚ?Â*Z¢6LûM®?ú™‰ÏñQ¥Å¶0.¥İş`?C$;XìÎ<×Î•‰¹SácËij‚É†kVR\Zò|FÖÆÌ\"Ş];0|~ Ó\0LûàÄc²JQñ\0¹ûqIã‹ò56¼ø¡WbjÚˆ_ .\\zpio,¬4Õõ÷vİJ1}j>X¶Ñ ?ñpsšÎø8ò/ğ\\¹™—ó2E´“ZÈÆVõ†­ËüÃş\ZâÌÀy3ä}sQ·>şìN;G‰eşê­úw÷¢,\\ìëù™>ŞóQ·[]]ÃØşÈ„ÿ\0AHÓ¥½°¾¸¼²êîp\'’=ŠÒ`’7>nç¿­BÃ4™ØÙ\'ŞÔ~ûœş6ş´¿Óxÿ\0ñCş;?ü‹kÍ[^»tiïï !ìÜ3ßœU|°æ3]‹‹‰OyòÇñ¦L*y0·×{Q˜°Ağßß“N>Çˆ!Kù“\'[[Y1Û5¹ Ë¹?ëZ½¥:nîÙå{´\\pã9÷Íb•@È Ÿ,Ö£¢^Î+ ÂWW<ü¬8üñŠ«‘Ç8\\:<ò›©;«ÒËsû§8İÃßğ¬İÕ“Àvø]¼ƒŠê·s¤©¹äGLğ$cısY}rYIHâç÷[\0íÎJ§ú’%’-v™‡IÌ?İ«/·‰.ƒ\'í-™”vU¥Èenc<÷\"¢µÈóŒ£\ZéÇ\'ÚŠ2K.EÕ‘$–pÅK>å-d·±ÆTz­:/T\ZãF/PöI\0ôÚ?­YíGèó#Gì.0Ö0Ÿ<m¡àØ0çKüéáy	<Ç ÷ÙJûE«.vœûÒö¡ôäşÆ †Ş/š+# #?•\nRÎŒ2 zP¥ìcÿ\0Šw\'Ù\\VR#óêhÕ#TCŸÆ›1m8+ïÜşTyA€·áü«QPñ1§÷oa@xnI÷Æ?Za[`ùcù»Î–È(¹\\â€\n \rÍ\'Š6…İ>¸¨ş?\0ü¹¢?’|Ç×Ê»&xYÎ\Z2¦?ø¡E÷°§ñ¸ÿ\0Zâ·‡›>İÚ\'pßl(Ée>rFCr;gÎ\\¼dù…Z‰ö‡í´ŒùivÏ;Ü,JX»¸QÁ9Ïª2é;\Z³¤ôdR[Auss†£`îY—ı\\¨’uY\'F9NqTİ5wj³[1fÚ”ŒŒÏ—ïçëV·Zµ…•‘½Ô®\"†8X±ÉÆG=ÿ\0:ğó“¢eœ—šOh÷:ş¨ê[E¿\rä9íî{\nóıíÎ¿ñs«á–èIo§†am; „}ç>¬A>¤U·Skÿ\0uO4¶=-bâId~<b;ğ|šÛt¤QX½ı¼\"äı²(qÿ\0©²O®ÚiëıARì´é]5-º…!„m¦ÚøqqøøòkCowâj-°åq=ªNàC}s·™\\&Iç\0\\ÓÑÊEĞ5ïı)1>Ê{	uºÙ?•IøÆœNKa¸ãØÕ~†Kõ¸_5F¥Lëç#MmßÅıj‡ê3½­¼–GegCÎµ×_°ÓâE`[99ó$äşµ…èDšye¹i6ïFlŞ·ÒÄ–Ñ‹»ÙcÄ»†ö\0sNC—ê0İ{dÿ\0Ø\r4ƒ2ñ†¥dôÌÚTdùŠù°1ƒåKëß‰ú%ÔÓiš|É,C+-Ó¾\"ô!OŸ×µVôıìWºzËc*¼*í‡àó=|ë±é¤ÓéÙ [9·ü¼æØ¥ÚX]—\n\nx½}9¨™ÃîËzƒS-¤¸‘ytP£æ¹úc‘í]¹İ‰}g¦]4,ci†Á1÷ç‘Éı?\Z¶‡L7\"ºÇÇœñôãşqYÛ«•¸o;d>0yÎ{àµZ¦¡~…VI¡@é½–q&3†xñ÷â¹ùT¯É®\rQkgÓs²-Äz}Á#•€$ñÛÓ=ªÂimÑmK7J0&Dv+ã\'<gÈ{Sz¡ª[ÛÉ9™•Q”ñ³äv9ç\'ÏÏĞw«IµËëœ¥´\nnp® F£œ€O`3X&äßfˆ¥FoTœ´ÏnútÈ;wdPÜ‘Øsì{Ö2úŞp6œÊÉÈúg¿å]*ûUk›Y¥h­Rée+)i[Å>€àÿ\0?\ZÈêZ¥êÂ¡Å´’g´ıÌ{ã\0÷õ­ÜYQ›2³ş*~Í-d?0äcš)\'Ÿ²Û¾Óíš·¼Ôæ27Œc;p#èj1ÕdŞª¬ƒÈ¨Î+©hÆíÒÏ2·ÏlÄ>æI?\0×Ev$ƒ·õ«\'×I…?_˜J(õ¨ÉlÀ½ü—ó§ÙÈ®‹©û;ñç¶‰ÚíŸ+`vù?Ò¬¯ÉŸ0´£¬Z\0CÛƒç·oëÚ°+˜İ¿c¯şSD’NãK/r6œÕ¤šÅ»®*È;c\'?¥\Zê¶ê¬Æ2O¦âúR°*wÌÙÌdc9ÿ\0ZHñwF$ÈwÛŸ­ZÃ­ZÈ»ŞóÉ#ı…jv†#º9üdéNÄW$sÃîùP1°?ıD€úqú\Zöëùd>£¿ó¥}¶Æ2\0Œ’{|¼ãó¡…•¡]”0b¼ägıiF+’œ\\ÆFpNâ*Â9m¼\"Ûz\r§¯Õ‹)Ã®s‚I ş´¬vB….dlÑmSÎ‰¡¸ñŠÌŞ@çŠ˜óÚ¨Xàÿ\0„ãõ¢ÖIw	ÆÒ˜ì`ZŞ*’$SæÜQ%½è82F¾ÙÅ>#ˆ©L\0ÏÌ|óJ\\p—ßˆ&‹#cko8•—éº¥YK}lF.’s°Iüi³\rÉ9Ÿ!qJ‘.KñKg·È\rBQRò5*-QÕ<Dİ<kæFô¥^Ëu u]Ò»Aÿ\0Aı*8î¹.À(öÿ\0:R­á]É!ôâ©ş?¾ó4Rºï2+Üü£ ı{U|¶—ˆ`Œ|¾AıjT«w!RH¤(»RÀåF>ñïWF:•ÊVD6ÏÙ±ßv’¶Î¹%C*|¬ıÂ†÷+H-t¤ƒsì¿íV¸$ò3ÿ\0=)„røÍHT‘>CçÛšC…Hñ³n<Ü\n}cÁÎğ>Š¶†6\0»2ƒç	ü¨QĞX•çwëC¾@|cü$Sæh‰ŒÇæ§<H7J?>ÔöDZcòÆ?#@³‘Ÿ—ñ©K$,q½×Ò”\Z?!ä)9!$ÈlÍ‚Ä¯§o÷¥)ç¸àyyşµ1~ÎÀ–hÇ—\n(¿d7°ã×Ö1o%ÏaÇûÒ€`á°9ãÓùÔ’,?fÃüİ¨ Èl~ß5do™™¸ïÆi/~4é#”7.â8F~bqœøäâ¥í\'pN?ıÁZ_‡Ö±¶º·wøÚ¡b7nˆÀüMfæ:Á.ş:é¶6÷ğ}’§¶\nŞ$÷1lo¼Ûs’sôöªn·ƒD–í´®%¹DPÀLp€ùáTrxãvkGÕÚ­ÔwÆv…a·+µPqÇÒ°\Z€]KZ·kµ&Õ@2}=?:ñ©öMÉÕ’’gÕ.-tÛXV×M‰>QÉsïŠé\Z†m2iàŒÅoğ\"_áUF?^k\Z‹Hn®¤@²Éˆâ\0pŒ~|V£EwJ‹MQ†K‚­åÄæ%jÙ¤Ó”\r5Ìc©Ç7cá;³Ë }¹\rùÕ´$\Zs¦âI?Z¡³q¹S$úsSK¢WqeOGÂGXİ¼’±‘b?‡\"¦õ¥º]ÛÍl…ÿ\0(9ÍQÚk\Z~‰¬jz®¥sµ´püÎ~£ó>ÕËºÿ\0âÕş±ü]1jÖ¶»	7s/íNî¯eür~”F7àx¾Î…¬õ7GtF›·sK-ë[¯…c‘ûã÷F|Ûõ®×Ÿµ«¿[}LÉe§•¹%väıóİéíOôL_u\rëM#´ÒøfI¦”–ôäšv^Š¹—ª£´·O\ZAe¹Æçş\n¶¢²pqMÙÇ§´fÏNhïáš\'¹	41åeN	v8ïÍt¨-RŞ8 Y#‰B¨»è;Vsşİ“§olá¶·[™§ÔLØÆØÀl|‡ÆµR»î ÅŸQòÿ\0Zîze87ûÛ·‘˜6öV\'#ıø©VÖ®èÁ§™sƒ»)ŸÇùŠŒ¹%Y¡çü«š•díkYÙJùÆ¤cÏÏé[¦N>KK+şRîdváƒ`öÁãy«\rä„í¹ğÁQÂ¢€ öì•A´—djéo\"¨ÜFxÏš¶±llylşe.cÉ#êğy5ÎË±®^éZ4BU—%¼HÂ’°•<dyÓ¿z94h!w\\¨ùX:¯ÿ\0q$gÆ™†éÌ’G7ÌvÄ>^yœ?/ähKp†Ã¬R(ä+ò†%sûÃSŸË’Ea{Y£ª\"ê:IKÊ\\BÑ®6F_óÚ8çŸùŠÎ^i²,Ì^Tr>ÄqéWš…Ë©›Ãár71Ã<çòqÿ\0\rİä¾İ•˜.ØùäóŸ/ÇÔšÙƒbŒ”T_è×5]|Ç»§ŸŸªäÓ%FÇÚWv~a»9Å[»ºÊbTy=X¸5Tn¦7Í[•? äsƒÈ•ÒÆÚòc—~(\'öÌËçhÎšA$>áéÛô©o%?‘¢g\nÛrsøqW•[#µ”¡r²ìóôkA™A<·µKyŠ€ZBª<¸£YÆB´œ·l€I¢Åde´ÚHñ@ûô¿±F#âé‡Ñ³ŸåO™}¡€8ÃŠ ¬\nçò\\ÿ\0¥dqgº^fºû6àzg4mbx*Ùçœ‘ŸÇ5%·3Ÿ?İ¤¸ÈfÌIş´XY­°ê¾,qòwü©-h7dÎŒÃ•Êò*xcØ†Çáıh³ß‘Û@vCx\0\\´‘¶yóı(£ñÈäÃØŠeoºg?ó°¥ıÓçëùb•ÊÙuH™qX+øSÛî6ãpaÛ6jašSó)zdJtHÃæ;½òh°*ä\r2‹çÎ¦hƒÜg‰ÏãŠ²Ì	É\n=xş”mpÁpÀ/<?¥\0Ê¤’ë…#rú\'Š14ãWüäcıjĞN¥r6dúàÒd–\"ØX×pã8éEUöËèrP;|àÓk¨Ş÷e,I¤ÁıjÕü&ÜävôNc* F¹÷ Šad%ÔïÛºÊqü.½©şÿ\0¹‰É¿ìjQ\n90Æÿ\0?Úˆ4aøcñ_é@XÂê×ÑânÇ¡NÔ‘­Ê$f 1í‚;ş•!\n}Ó	íòÇÖšx¡c€Işÿ\0­4‚‡Y›;f\0Ï¥ÕPÈ<H~R{óŠW‚‰’UXŸğ*4¶ÖóFËà…ÜyÃ0&Ÿ@L:Œ2¨Ø˜ôÏô¡YûÆ‚Âmk48ûñH\réó5\nÉ.\Z.œ•š—‘%j,æ­ÕšäÒä^ÈsäÌ?kÿ\0qjÍg#Úß½½ÑÆĞWr¿<äÜf±# Êí…¿ŸwvÅyÇ9İ¦ubü£¢Ùu>¤6ÛÍtå×–!B¯õ§`×ï~Ò«öˆYIÇ‰»\0y’sş‚¹«ŞÏåÉ<Tˆ¤–M¡¤È¬óI;re¿‚ğ”z­ÛÃfÔm“fàÉ°ŞŸ/¥Jƒ­,ls\\“cvÄ×1‰Â	·ùŠD‘\"…\'ÔµjÁÌÏ…ş«ş¥98øò|QÜíoÕŸÚcaámÜYœp?:NŸ©Ù]\\½½µôrÌ‰¼…lœ}k…O¨İÕQ‚(çÎ¢­Ìÿ\0o$u|™N\rtaêÒm~&)pb¾OE…¸	’ùóÆïö®¡ĞG¦tÛ§ Kq(v>ÙÀş¿yJn«¼µéû›hÿ\0jFYåÜG8Ïlç·zkNßá†ŸÅôØ‰f9$ø`çó¨ú‡1O\ZŠù0åÂáä«ê³¯kRÚÄ„¬gËÓ4ÿ\0Qè‚ßLÒíàiÁY«Å][J,t[}E}Äğ«;“ç¶”íãhöSH2Âà‘Ïo”ÿ\0L×\0ªü>İêVvHß³VFr„Vó¥-!¹ÔgDBÍ»$ÏjÂéŒa³k´?´iòöÅuN…·‰\"’d\\4Ÿ3UVuËRŠ8à œyšÀj—Şk†\'Œg™­¾¸íá{“\\ãªÉı¸SÏáşõoÈ±öŒGVX\roI“+ãÈ§ÄXƒcq_•UÜ/IÃĞz­ŠØµ®°?ìî—æ\'oî·cş¾Õ£Ò®<8B¬c28ÏlšÅ|U×&¸Õ\"éô·†5!Yç#sOaü=ª	Ô©q¾•ğw@Lè9®+OsHO ÛÀüSé;?ïkÖ_İÓmsÇoºk£ôµªYt„vêw·3Û8Q\\ëC;º¿W|`‹Uı\r´Wİ‘> §u†$Óx0=´Ï¡9ık?ÿ\0ztú]Ío5üj±.D¬2Ôõ/ş¦°¶—;U™\"n±ÈùW›/nLÅB ŒFóÍtøü™ãÆ”Ngg¨¬µKÛH.meYá•r\"ŒãË¹©¾%œˆÛ„Æâ£ûgËúW™:sXÔ,Ä–Ñ\\Ê\"ğİ‚ÀÎÓåVõ¾¿jA‚è ×ÈıjùzƒŒ’h»øEO³ĞWZîŸ¦J±HcîŒzc_OJÔhz¯Oß¨ké$m¥v*;à“éœœŠò6£Õ\Z®¡#Ks;1îîyÀÍAƒ^Ô œ<W#)Ü¥\\Œ{Ö4²6ü\Z}¨(ªòz»Røƒgewum%²Ä`¶‘—Äñ|Œ.nü`õ²èş¥Òº«B’÷Ko\nxNÅ	â!¹ŞcñÇ­xš]zùbx¤±ñI%òy\'9ïÛò§4~²ê\"àI§k·öÎI$¤Ç“ÛŸ^Â¡+¶É½ZéÕÕ`D¶yï/!xã¹1’0rH\n=9ã…¿ê^“ˆ<ÿ\0Ûz{2gr™¢ÉÆGaÏ—Ö¸¹ñ7«ú—C¸ÒuMGÄW; ØÌTÜ{vàzV	˜ç¹5²œ|<[y=aew¥ß#I§ŞÛ]±ùÏƒáœqŸ—š©Õz¯§ô«À—Ú„1<ˆ \r„g8>_ë^i¶¸ßÏõV#·Ò¤êvomipÓ\rÊ™F1ÛÏ<Öã]tŠ†Wäô%¿Zt½ÌÌ‘k°|‡÷†Å únïWhmåQ\"¸`Üïàñëœó^_†Ş#¥Ípş!•J„Ã\0<äcŸÒ­ºS«u­\nuÖíÜÈ7Âü©çíÀò«1óû©\"âª¸³ÑB]pÄëÿ\08§|4ù[Ü(â£,¹«½ƒÇÈÿ\0z¤×µÉôÙ\"ˆ9eÜK1íéÅlär!‚ÏÁ“77ª4…9UtÀ=€^ëIaÊ—ŒsÁÀÿ\0z¤é­^M^áQ£ğÂ¶>öîãè*¥Ô³Z^´fÖ)#_,àğ@ïøÖwê”T¾WwF¬…IS´öÎqô¦[Æ.‡j`÷²qPìïŞæÌK´Ç´ƒ…nşx§–ã;ÆÖàß>µ®3RVŠ\\Z‘@pªx.—JŠFı¾Ã±$QÛîs$AİpqœÒàşlcÈÆ*ÄFÇqÃüªv…Î?Z,îÂ«8ÇŸ„qÍ4éˆWs3o÷1Ÿj4]Ä(%{?)PXò’s‰Ÿ·?.?Ö˜ñN÷—\0Ÿ»€y¢iÆ_˜ã¿Ş\'×Ş£Çw,¸Ã2óÏ9íE”ò19Êò æ”®àÈòÇjƒktÓ\\<e@+.ÍÇ“ØçF²³9ŒªIâ˜èœò¶6§ùÿ\0J4ec‚ª1çPnˆb—h,„•ÇëHûK1U;€\'\rŒy:T\"l²g¡IçqPÒ£–‘aÔ“Æ}ÏçMlª‡pœùµÍ E\nxàsL	´Á[ˆIşôÛ»*¨ØìŸåLIw “ÃøOzlLÏ¿\n¨pr@äÓ %<ÛNæŒz\0úŠopñI`¡}‡ò¨9	9ˆ»^ÿ\0ÒéØmõiT0šÅ*¤Ÿ.âÌO<§¨ïYç0t_jÄÏ<A6ø‹ğ™6yïL_İ­•¬—/uÉ–¿!È\0äŸÚ/æíƒYˆ&‡©xVÓÏ$r.JK!a‘!R1èqÛõ¬Î•á}–ÖÖDcûgrá°Û˜¨\'·`qéXçÊœ@İ4 ®}šn ¸–HõM/S³îäùí¼0²¨Æw6ï\\ùúñB±Ú‚\\Ü]4	y,b\"FOÍŸÔP¬2áÆNä•š—#UHÿÙ','aruva  i');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-07 19:28:11
