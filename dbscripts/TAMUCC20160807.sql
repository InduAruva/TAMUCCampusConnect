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
INSERT INTO `user` VALUES ('ABC@BAC.COM','123456','abc@bac.com','FSH','12345','A','2016-07-30','COMP','����\0JFIF\0\0H\0H\0\0��\0C\0	\Z!\Z\"$\"$��\0C��\0m�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0I\0\0!1AQa\"q2���#BR��3br���$����4�%CSc�\'Dd����\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\03\0\0\0\0\0!1AQ\"2aBq��3R#��$4b����\0\0\0?\0ɈiB&�S���W����!존zT�zRL#��HTC�C(��I����X�G�H�K�Pَ���Ɣ���ph�qQi��#�@��\'rF��cI�jc�#��l_*�9�����Kd$\'�<�t-)T�H�Ds\Z�$�{�S��s�3ږ��ȥ���Ze�aR�v��}h���DP��6�5A�h�h��\0(��4<���6\n��=�����f����z<{���=(�(�@\0Q�Xɢ�=�o��R��z5¼CJW�3��CbPp(��Z��|т{斣ܐ[\"�\"�S�]*�ΜYGcL�h�J�lJ����q�R�\ZZ�bB�y\0=��TztHA�TZ\Zd�d�Q|RE-_�5^��p[�Ɉ��lҼ_Z#\'�co&��#�*C��2NjhL�%�y\"���5>B}qL�X�+tB�E\n�G4*{2�R�S��R#c[Ozv����R�ei%i��6Є�6\n-��#m\r��B�:mF�;{w�y�!�q��x�#��տ^tܽ�^j�\r<�VHc�	����|M�\rkJ�(m�d{�Z\'S����+>���7U$7S\\�L�!X�O����^Թ<���B2����\0���8���Ĥն��Y]e<�J��J���5���)>�\n`�u�R�o���il��G�<S�=�l��,��ϕ8���>�{\r�c�N)8�>��S�*-RA�qN��Z(�E\\��4���u�N��BJ�icB~D�<[w0=E5hWd\'BjNښ�\r ��Ob\rv�Qm��%\0�$��6��v��LV5�G��9����ǯ4t��҆�oƕ�����CғC�.=E�<Pǵ	 f�E9�-����S�}���b��omZ^�P��b���J�O��Q���m��+J�¡G�ڕ��Hv7�(9����@X�R�_|SeG������s�M�(�}ijd:\"F)֏p�@X۞)�sN��Q��b*�\nsh�Oa�<{R�������#h���S��԰��`Fqڔ#5!R�Rl�\"��T���mc�E��f��~�A�I8�iB��s_��_c��c��Y��Iy��$��h\0��+7�,8����Cf�}F�!����	`��$,\\8����[��qk�p]<��7!����>�ʩn�(��@T~[by?R*|HrsE�ͷo�F�ܳ���~M\n����uC%������p�i��F@#�I*9\0r+P��~ ����k��+:����N\rw�����g���ϖ\Z��ф�\0��F\"\'�V⡍��J���\0T��@\\�4��\ZM��?AR ��\'�R$eC�%4��0+l�HLϳ�V��rs�t��\r�$��v0P�5#a��ӱq�\")���L�M\r���t<:67�CeI�ϵ�s�,Dr�{)�\0��ϭ.�6��O�gҋa�a��=�\r���hl4�c;}�m��P�}(\r���-���}(l>������B<�l��l3�ڔ��ϥ-b=�����m��?jj�.�qCo�;��S�P	�x~�[*F܊{�Σd����{m�v3�ކ�jx/ҋi��l���>���j)���DG�*V��3C���;��/�F,yR\"�4*O��J��چ�e\r�}�F6R��S�}�l�c#��K	�G�ړ%��N+5�}#��%��T�f��61Mm�����c��+Q�ڏnG5Nlk$X�Gh����@�V�v:��G!�QbA��lsT�c��%�������Ȩz˸��1�]�F����/����f����(̧��Sx��v���a����%�yT/�=�l�ڼT\ZYu���+,����_��㽆��#;������\0_Ҷ�)6SCyi\r�\r�)P:PEIT��B��.�%9I�CKMH�j&�چ3R}��\n3�F)��F��){}�lʄ�&��I946ԟ��=��G�Cm?៭��E������{a��iح���j{g�\r�v�ǰ��E���Ce����ڞ�Ce3���{e��)X�6N��Ώn)6;��(�S�M��[>��(m��(�J[0Cm?�چ�j[1���O���}�\0�^{Q�����C��B�gi��jG�E�ڝ�v3�Qm��J-��t1���[=���A=�R\r�v�)�\n�@l1��P��h��Ea��{)�JI�;��C�\0�G�w�il�L��ֈ�I1��i>����m\n|��j+A�a\r+g�H��^��N�H�(�T��6\ZV:#�6T���E���?j1JH�0U&��c(yX;��\"D�\r�eԗꚥ̀��G��Io�ö9������g����{B�>��>��t�Ox��+�|\\IDe��g�5�~(Os�u�q9+�}�����׌��I?�LW��~\Z�d�n-��l�%�rs�?�V���n���Ւ^�k�c���f� �\0�[�\n�G%�6�\n���|�P�R8���y\ZPpj���7�`⇄E;�1J\'l\Z7�!=��D�T��,P�:7\rH�2846sR��Z_z7\rY���1�S��xC�Q�� ���s�S�@�\"���ȧ�� x#ҋ���\0�LL;\n7\rH�\r�T���xcҞ�D�o�L(=(�AF�\"l����T�����*[�H����R�#��<���*\"��S�R�*#N�o�\r�Ҥ�F���`F�G�S���c��+h���O���iY!!F{R�`������Q�)6�\'��^�1O��f��oADV���jP\\�9���O�#�F�|�)cN�t�摷olRy,��B$��cU��Q<����\\��io&5����H�\0Tf��I�R����N��h��ڞ�Y���:ݖ&�;b�eC���\r��ʍ��kA� I�4*)��0��QBس�JX���S҈����5�/��Ը�w�Q��wҖ��犓md���b=���M���bX\"]�3P�G����m�X�>�t���\'�vyî\0���QI��7$�Ef�qsk-k2H��̄��)���~5����o��H�m��d�y�w��{�LQ�p����y��E��Zɋ��!VE�B�8�μ�\0?�\0s��bV��?m�?�� �U�\0��o�ZWUǭg~���q�H9ſ��\0�J�\0*ՈMzO��}˩2�RvF|�Y�\nFf�m���Y4@ځ�ҧ�q�\r۰=�ج�h�h�o��|�P�1�J�l�>Qm`y��ҋ�&�Bِ�4�G�jO��|Q�|wZM�aYB��Rw�9�J��)_f���C�#,�|�ģ=�I���I�zP&ƃdqI,s�)�\0Ih2x�\nН���I(<�HÌP�O�b�>�5C���.h�/J�VI1��g4�F}iA���n%�cOx�h�{U�@�qQ����q�B�l�\"$g�Tz\ny�r1�e�d⥻#��OAH�މ���n\"��P��;�Xc�h���g�\r1�8��sRV��zZ�z�,d&-�I�c8�%�^ĊW��s�,H��f�ߜ�VF�jT�;+X�rM6ۼ���Ji�T\\���(m8�S~�O\"��Â��1Y!��({T�ԓ<\ZV2!N;Q��g��ph�$v�ò \\yQ*Q��x&���.(T�P<�Qc-�ф���d�T��P2�9$V�(�|�K�`>bI��sہI�2A��+,J�� 3�L��R�6=���9�A�\\�#m��R<C«6+�\r�n1�$d��J�zQ���n�¬������*�<��a:�7�k�����y�P�����:#��ȓ��?z�����a��]`>u�>����u�-�XVe�b���Mq���j��N+��ɶ�k��I���S�I�$�:����r����Z,I��Td�AC����7�;Ӧ�n�p���/	>�v�\0<��\nD	������-B��F)���K1�s��)f�-�GU.�T�}�Kj�>�h��R4dS�*Ȧ6AMI*\r�{	�2�N)�(��I�4��%�*p洡����(xu,�qG�}(�5D/�%K*�b���Q�苴y�<(�YG�6F<�l0�)?/|Q�(����lP4��M�ƌTY$�u��1O�(�3څ!�H�����3SJRLf����P(A�(�����1E��D�\nsKP�,b�!��������IQދb��)$\ny���@�*(��(�ޓ�Ga`�<�G�/�Z�Ө4�Zx�M��6�1�*<R���m�E�i�1�@(>T��gօH�B�-���?*(�)��e���I<`~4��/����l�%���\nA���7��2(p?x�WC�_JN��D\n�:6\"���L�)݃҉�Z�Q_�d��$}+ժ���d�\"���������\"Z2���f�\ZŔ���dq���q�+��*�_�!T�w��S�(P�Ŵџ�n�\0��v{ua���,\ZWŭ���8#���#�Q�������g:�\rB�Q�	��\0���_���J���5�Dj��y��3<#����/�wǮ{V�N����;�I�hd\\��cP:��L\Z%���պ�xg�28�r�3���ˢ�M������S޾D��5��`w�������N���I��5ng}\Z����[��3�Q����]8X�v�>�]W��w7��#6�m$XaU@���UV��;��ӣ:���$��,��h�V��r�����uNRk�?nGu�����t�.�^C�����!S�-6kq��N�횔�瓲F?�1俩�\'�=C��\0�\'�\'Hul^�A�@��}�Ks�]?o7����LNv�ұ>�h5��Js��+��Փ��\\��Ie��7�ht��x���8���s~{j�7}�>	���-�C�4��9 �^\'�-f�Ԭh}p�/�Zme���S�O=���I(����H^{Է�Ywe:aY�BЦ��	�X{��hv9�T\\�$�G,0�(���\"��^�\0Σ�*C%T��6cZ��s��D���l	�TĈELyc��iѵMI�i쭞�Y#�Xx*y4M���)�jȊA�=��j�X���2��E�*h,\Z��hx\Zp§�M-��Dq�yR�T�V���K�<�l��|$\'����N4n�T���gl�Ǫ�h6�hx@��r$�C4�Y�g�II���}\r�dSn�f��+�2�m Ԕ�j�\0R3�I\\R�v���A<��T$��QFp{�Iϑ��F�*M!��R��Rw5J����\"�\Zs$��~>T�!\0ҁ��bo*-�<����� dyP���tc-��!�c����A��J-�T\n�b�cI	Q�!��\0��V>B�$cޝ�ȵ��һ�4�v<����bE&�B����(|��D���/aZL��#�Ր6z��0�,n�# ��׵kn��[��/�&U7}��%��*9���P���8N��c>U����%�m7G�W�ít۫�(�-����GRpA���.tτ,�<�\0`��5�PJ�8d|�����Zh���\0UCgm�e�}���o��5��ӝWM��\n��V���8�\Z8�P�$����b���%�ޖ�%�Iw�}��!u��+��Z�	�{G��/�����[x�j,~)�)=�^F8��)zGP�5k��Ia3�o�x�x�?��p{�>A�N��:�F��[�4�00T��Ȗ��s�Jˑ��#)��O���K�G��]?m��x�,�i�������s��󬾽ӝ�Y9�K�˹A��\0J�!��(|�\0O��m�:�G�+�=\'D��a�I�\"��<��Oָ�Xuw��^jX�[کu���X�/q����e/A��đ��m�ie༂�I��	=�bX��U��\n���G�O�\"��\0FT$�Nr\Z�zkF�]~�n��ܘmA�#\'�͐Gn�]���DD04E?�C�\0�ME4�k��$(�!����>;\Z�aѝ1f��t���1+�\0Z���8��0��I?�[���-H><��K�V&!LMQ��MN��E�jP��Ɣ���Ų��J���ij��\Z�cT9�3N��jc�#�ikr��I4IXO`y��\Z\'�M����~����F��C�6��Z&#�\0�Mʚ#>Gz}���e>T>���*y�}�<b��]\0�8&��=y��ɓ�ڐ$\"���b=(�cPV�����ucؖ�I�\Z��qQRM8ޕ0�|Eq��R6���U��|�Թ�II�����0)�pr\Z&!��V�3K\"Tv�o5���5\n�<�ش�J�ѻ����F�0�A�D1�5=Q\r��ռ�4���:6�U�qO��`�ғ��ʃ�R3�\0�I11��Iq���A��ޝ��2+$R�P1��\\�c�NȤ\0I2=E(\'\"��;\nDČ,�ءJ��5L�pO�Cs����*�,��J 95]�g-�4��1J6\nK�1��Ej�4�|���&�豍�G�(N0ri^�4q���D�$��(�>_�Fr�-���n�ק����-b�O�o$c���r~f�Nc�q�	�\n89�^��F���^�^]� ���%m��UD�\'�ժ���}o´���q���^S$��,��+O���5A��t/��>\nc�����$T-B��ӭ�T{�n��s�k=���z�#>�O�]�툖K)�8�4з����>c�z�2}��=m��=C����4b�o�9!\0{pÏzӁ�$��nˏ�z���]i��K�I\"��\n1������+�tc��K�T`Lm\0�=�v�����t�\0B^N��f�������p���/�)���\r3M:��;׷G������~{��2J�d�nΏ�]E��7d�y3�Z�]L�&mă�`ָF�uk�K6��%WF0��0x�\06:�z�i�����{E\"\0�2�S�2���>�L�m����`���*�U���X������0i�\\�]kKy�6kw�&|Eu�G�]�����\0M�Kk{u��!�B���\0Ӻ��ϕw�����}���Rr<�>�y>��T-�:�JFF*�3\nPf���?p�\"#r��۷�jm]�AϘ�(�މ���<ҁ����gΐNjK=� ��S�,c&�H�4��Qm��+c{��zy �ifѱ��h,��{�	�M��RE�ݠ6YH��[������(��/���6�=h�yT��d��j�-9<Ұ؀Ɣ��Ԧ�e<)\"�-��4�Y{\rn���o�@�R�6 o��������h3��#d[����h8�Q4��f���j#j@���p	�H(=)���4����#�����O`��/�����⁅}i�I�*�ݷ�,,B���ib�&�qE��E&�r;Gs�u-!S�:���A���a���@{.?\Z!m���3�Iۚ3,�R�{��yP��hQLv9��0ϕP�dlN=��юhS��I��,{Qbl *N�ʗі��N}�?�G�(j���hM�յ+�z�X��B�F��\\c\0�����5��>#[�}=�����u�L��,9�-��i���]i�ҷ���`^��lħ\0c$;J�O�\Z|��\"�#�mm�Is9>RL~�5R3^fX�r4ׂ1�F���Mzg�s����W�_��X�![�s�W��3�M�	m<(��f��Qt�۠�?��F-�!�(QQ4^�[���d����l�1`�����\n�P}Iϝhō�`\\0O�%g�r���������or\'�T�a6��稭F���Q��l�t���Q1`A����gG�u����,K\Z�^�q��ڭ� XOi���#��\0e��|�Ҩ�?�����Xzw��VF%H��3d�c�i?�1t���æu\r1�N�Y��A�~q�N����<W�%;0�~��m{G��;�#BѠ�����k�i�?����a�kr�kj��xrD�H1�>*�=�5bf����ົ�YI�M�$\'�$~5��<���[pzc⭶�3`�,f�\06�?�\rzY�~U��N�D\Z*�Է \Z1f���V5>M���jqZ��jR�Y3�i�]�S��E��B�\Z���4��b|���ހ\nx\rG�=J�h�����#%�jv����2Fin�R�x�|JC���{U��h�1�IH(�H�<����27cV>\Z�B5����P����U3b�!C`��-����<���I1�y��Y@�ph�Ǩ�	�˶����i;�G�9��(�]	!����(�㺚SI\'c�����r<QN�HP�3��*p�V�ǈM�Q��Gc��J`<�)4��N�/o�4v�ri�&20*�3�h��8���T���%3F?xSm,^u���&��u��EIic\'i� �6T�Q`�Q`!�\'9�ʗ��Cҋ$�@\n>q��Co�(l��� `b��/cc���G�����2i�\"�����?48� �9LR�����B�m�օ��|\n4�Z0*\'c{I�Tӻ\r�E�gi��(4�J<\n,Bv/�T��֌.�,�\0P]Iim��kۂ��3fQ�q�����d~Eε��?F��$wL�!>��@������������� �[̽О�����\r�\r2�����k�D��G\"0x���\\^l\'�����m���	�,���%xl���hQMꖶ��J��)Z�����ݟ_-��np=������N�]���ͤ>\Z�~X�l\r�ȿ����}:{��\0�o��b������͏ʲ_ɚR�7�Uc&��x-���6y�H����Z���XX�@�h�{FG���^[��:*I��-�\'?ֹ�]�,���l9^��w�=��/�X�ܙ�4�m�����؁�܂y�}k\'�=	ө���wj�t�4����9<��F�;M���T����>^c�Y����^���9-�[Vqo�[���ǻ��\0|���E��Rŧ�%�Iy��c4����\0���L�\0����tޚ�8�lm�ԧ��Q��C�;�2���~k3��Iu����5��-ãw���/�Q�m��s���O��W�vZ��L��Rq��x�����ic�-�:��Os����a~k���au�k[[RӜG$�v��~��x ��z�`�8��Z��Oaܨ$����=���P��H,,J���4`s�;J�;S�+��\r7ϡ��P�c����֛%���Fy�C#9�������˟Λ�G�v\"���\0ѐ������%��N�b�\Zo/�i�{�f��Z�.O��c4�`xR�\Z9�&��Zwh&���aC?�Ӆ1E�z�,Bx����W�iX�����<���$�����.2��q¯���&�@��?ݧ��J�\n�H1�� c�4�ƤmC�/�\ZB�x�P�42�4@1R6\'|Q�C�R؎�|b�Wڥ�����Tw�<b��SJ�?��v�b��E\n|�CkƤ�h=h��J��4a�Ԁ@�e�ҋ�ޔly�H���q��xM�B�c�hQ`294{I�R���ʕ�@�jY#�\0�(�A\n=���R��1�JNC�P�<R�����RمN$X$hTI*�(���た*�K#�^��K!7�f`��j{�=���>�k�hW:��l�ۮ��X�\0�7uwVuG_j�izn���M7�\n,!N�䓌���U�潚Dg����ֽ[��·8k/!�!χ��$��FIo�kѝ7moei<�����c����b�BGՋ�W�O��h���ڏ�bwYv��dc�f�k�Kl��~���~X狟6ۖ\'��y�eȗ���4	q+w�3���v�WWWz���1�=��+Gs������J��X9��qU=W�����i�;H!��v�!�E�O�֡�d{Ts���uR�������}�����n(|��7r��V�-��kKaQ`�$���J��H�\0Zo��zM3RX^_��.鯮r�y\'�s~�G�4��i�\"\r2 [GпmrGݒ_�_ý\\��T�bߡ4���_���H�R���ny���k7�\ZK}^��<W��O�����-��;Eٝ�z*4h?�\Z�|Q�>��� o7�u���i�;m���{�)��K���O�}kk��_j�g�J��i6�����##����ϐ��_��� ��{q���8��f�H��Z.��Rv���тqڝ�<�+�)H�����M�cJ�H�*���R\nኞwb��5{\"��	��pw�=�k;5������\nW*{m�.R��Ѧ|uݏm�{G���h����3P\\�RN��4��CC�\0)�LO#�(��E/�CI �S�ǥ��\"��\Z/�ӰB�qC�҆�zH@;R�}(`�Q`#�\'��y��n�`�T&u]eгnH>t�~_�Ϗz�y#\Z�O\\�����8P9�\0J~�7J�U�C��E\r*�;u[�\r$���s۽�K�B�Y��Q�M��\0�aۿ�Xr��׃n.&���ڡ�3�;:�\0�R6��I��1�Z�q�!��\0\rQ>�7�cI�T?h�7d9]��S�V㏭8z���Iy,�{P�4X��f.=h�{�<\Z<���TZ-���4�B\n�,R��F�(b�>�3E�X�t3C\"��jF����G��Wk�����Y6lud�N0ѱ��J��U��?��-֫��Dq��&�Ǜ�M�FN>��lu����k3��2�NSrxxc헤[��2�ZZ>��Dn�#���O�����n�Dծ$v�|Y\\�#��{VS�������d�H�<o�����C�\'�E�Vt���.��;I�&�m$h�����s�T�uuy�Z]���k����r\0,H���d���e0�$��w��\0�=K$���2pq)M���r-Ŵs�;dP�Ut������:��<62J�	��V��n)���M!3B�D�Ƞ�\Z�Ke�����>�r��Vn,w���|đ��ع�\0���l���WQc����\0����jq���+E@�q�t��Ҧ<I�Ggh\n����ºU���L7\n f�q��+-а=����A�C�*U��[[��{{V�n6�_S����[d=R7��������� �Ơ�h�oq?Q\\,�d&;8ۼq��?��>�����Dn�ky1�����Ǹ��\'��a>#����jKѽ	�{�l\\��\'�G�A/�Rr�\"������H�S@����I�l�-T���h�oAh�z=ⴓƻ�}�3��#�᏷;��*��z>�D�XVV���B�]I̓�?�r|���G��]G�_�#�}�X�e��1׀A��V(��#�\"�%F�_��@(�Kf����)�ek���o��q[��v�\0�)\Z��n�MBGTX��	8�����+K���\"����5��S~-��2���O�[~����),�������/��0�ʀMa��T�����6�;��%i��7��6@�*���Yz��6�l`��}�`��mrz3��B�@�Oi���%�%�s���}ꯦEơe��� �/�\0�<����1�Ww���D�8���Y���K������iL�\07�\\g�?�D�T��r�}��1����!�|m_OʴZE�q�㲅n�z:�3J(q���+`g�:�$���� �(/���,w�T��K�|`��ӛH\Z>�f�w���%�g�l���8��;D��Fk�)�3� ��bNj���J��;�<Q�F�5�6wkd?{˶3T����f�¤E1!n7_��[Y��Ct�pe@�)���#�|���&�kykP]A<R6��I\0l\0!>�wc�M�\\�~c��&���hf#՘��iZ*�Y��G�j,Ӱ��7+���ɢ{Y�nbq��y�3���a����R�3gw�8V2�$�\0 ��g[���캬�0�F�1;<��?���D�|�9(�Gb2�rn��s	����\'�S$VSD��F-*MC��������\r�d��?\Z�3�>g���Y1ܼ�yxV)�|a��G�)qm��P	9��՜p�Ei|R\r�#RB���z���~C��H�?,��\n\"�n�R�J�H�8�\"����h�pqtʽ]��l�./]�a�� �9��Vg�z�G�^�����aX�L�o�q�98��zq��H��H��p�Ect�7�$/�h�\"�W���W\nI1���~����q���P�R:Z�JLY�Č	\ZE�v6�v�<g���v�I��*3��8�9ȉ<�s�_��� ��o�%��\"H�۲숀�9�����h�Oy/HG5��]Ǌ&r����Z���(Cfn��)R6�r�\0&J�b8�V^��(�@��Co<6s��ՉA�ca���5[tOڷ����Rg�<�^;VLo�E��,��ֈ�j�]sKi�!v�F \n�\'�^�RV��_�\'��ޠ�g8��?\n�|NL���F��O���oýG6on;2���j�Dsڋ\0�ҳ�)&���B�(h�;8�X�\Z*,�ENq�DE(R�(QaG�u�#��O�M�\0�[G�g�d~5}�*�v�Ă)�XLQ[\n�.G�ez�\\Z^#��\Z�S������Z_�{�����#=��C�W�ް�|Q�䫋&uoQ��U=�b(yB�d#9=�U����:j��b9��+�H�u4����H~a�;Z���dӧ��s�\r`D���g�VD\"�c��:<Y�Xgw����E���e��M	v�Kd�F�\'�μ��\'�;\Z���m:7O��	el%N���{�\r���{Ȗ�t�ݺ5^=ڡ����5�.xӔ���A����[��Cs$my$ �Y��#�\ra�n���\\H�MD�	)KxC\0��x>�>&���\0O�j1A�e�G���}�ޥ�����)2�(�I��ּY$�)b�4�:�}wӗ:k���F���@�18��O_��֡�)c�jW3G,1�����;F6��Z�O��O�yl����!?�O�;�[�m��u-��@�ϰg=�϶q��xNq�nW���0�(���t}.�M#���)�V��E�M�G�L�u�\0�*���8g���史�?���kXƮ��q������I&����|hA�/\'\'1ƀ�H��͒�\\���6MԵ˾�q��R�Y��o5�-�w)�ͽ����4};�4����Z��O���>��M�i	�α�v��$	�\'��ԟ3Q:��{��4����П�9���IE=�sͪJ\0R|(�PFO��\rk]p�����ie\r�JDh�G�g�OkW\ri�]\\(������̊�)n�2ZB���q��i����G�����s�C��2�>a�r�r	�V�(���!�*G�\\f�_d�N���*����]�C�8�T[[��YZ2�=6;�D�\"F��N�yg�\'�QR�m<�4{3� �B�\0��3�yև㍼���L��M:����v��T��ʹ�7mi�Y�)a��e<�#�b=�3��K�s����)�쐔*`�ڋSkYH�XY������\'��~����^�dW\n�Ҿ����;���\0��e�����W��r#��>���FUL)���-���\"2@�s��>���q�f��Ԕ�x����ҥuv�~БGo4�m�0rx��{s�j�u�����\r���\\Z�	�u�������\0�=׃f8x�gBٶ��Z��wp���WA�)�c�޼�H\\�b�z^�JjWB6VUB������\\�\0�ٽ�t뻡1m5���v\0�a���>��:A|\r/Xx�T�Spfd��k�����<~>8�T��_B�q���;�\0����3�Zᒬ�S�\0�=��6�\0q���cɿ:���O���2y?�y��T嫴a����F(�ͪ�#���}1UO�QC��b�N�s#�e+j��<��\"�u9�2�����\nG��ޛ���Rk�&�-^l\r�$p_�x�ی�8z�X��f�zv6�Q�S�WL��m^�Z��C�I�#���ʣuU�O��R�4ټI%���E�VT)����U�o�蚮��\\^���9M�QQd���K��v����l�k�ѠH�-F1f����� �~�����/^̙�9]�Q��{��֦u���̖nK�I��_[�ۉQ�f��FU��A�����zV��\\ߋ����G4\\n*���:�H�Oh#�Ia1�~G�|�sP�+\Z���b�I�w�zC�㑠u�܇翕�Vɧ�!���I��4��u�$�\'�Q���Ѵ�e�+6۞�������{�k���D���{Ѐ�$\0	�!QÕFM7H�\\[E:�u��]5�4�-5+{�j��� ߈a�ٹ$�#���V�e��Z�U�\0b�t�0���\0��Eދ׶6w�\"�b$tg���n��*�J����c�}�[2�A*w}���~(����_���{mcj�7S�P��1���ꋛ��[O�l.��	9�|��ҳ]{���h�Hd����s��<`�n8�.{,P��|HI9���Z�\\�ׯq�j�,߲��rs��~u^��Owk}�쵋�����V8$�j���@�u��ƑDblˎ	�{֣�]�,:�}�XD�G�?6��Ya��G\ZQ��~!�F��d��1�\0/�Wʛ�Op��;,�|0�1��(;��L|Pד^�u���lae�.�\03$A�8�Q��n�B\n��)Č��Q�cֹ܆��٫V鯣x�Id�3��s���lz����ip3�6N�55P��4�S�����P��C��p7��<���6/�T��s��H��F���3���]\'��n5ke��+�+�7�����}7L��]CJ��?˘�<p	��Eu��Y�����-f{dP�F��pa�»���d��Y���Ŭ�*�Ѳ8��5	�RkKǛq́G\' ��=��[��lu{;�N;�{Y.U��}���Qj�m�����`u����c�V^_.Y1�����q#�o��Qav\0���S��P@��d���b�U�����\\��v�s�O:��ln��-��w,i\0feR	�G�G������9>���u�N�9��x�`��隬K����7}����.�]�\0JcL�n��C%Ɓa4��y\"V&LO#>~�����f�����e����x����̬�)+p�\0�$J̌���Q�\'�\00�H��4���l�m�-�.�\"�<na��{/�O���j4Ǌ�>x���\Z0Fw�o\\�ְ�}S4_�4n��^&�N�DW���.��i�ϵ.(��̉?�<�@�Q�!L�d��v��P4�sI�o�\r:�)�E.�+p1ߵn�se>/���c�y:%���P&1�G���P��yo%Ѵ�<q+������P��r��R~L��\Z^:/K?Su�O�|�y�i�%�e.�m�s�ί:3J_��cs4ׯ�F-�%h�&mo2})�1㓫5�,e�~��I?�g��b}B���v#�p?@+��<ԩ>��d�F�p�4.$}z\r^�����Q�$,FJ�[�Mk����]�Z��dP됣��2*�ឝs�|8���e��\'�Nܝ�ⶺ�&�-��2��{(��IN��:��8�~���gnn7�7q�>�4k��cETP�@\0���;Vo�b�+{�Hb�����;o�\"�B����G�`�.u��[����UM��\r�~U��O*K��J6�wĝf��඗�[΍uk���S�$+��r*�����V���h=�\n�]I�vs�-?,Ϩ��GO�Te�&���:]&��_�J$�ڡ�#	���z׉�����)ϣ�jq���D;���|�\0fF3��1�l�wI�Эܴ�B��К��+��D�/ �Z�q�3�������f��-{3�W#���}+�ts}B�G��]KX�����3��kn��2�帓���ӱ��;�l14�3�G.��~�p��[�/F�Xe��$#��n�s��~��S�]�U�\r��,���!�݇��4���l�����` ��S��\'��\0J�|:���b�\0]x�F�`�9�c����?�z��gH�co!k�ClP�y������_��:-3��l��b�>���\'&���I��ʰ��^|�P����-�+\Z1�u,7c\n�9=��?:������s>��O�\r�gر\0~��Q+J��۳.s �A��Gō�_Gs�W�wz��V�p�c�v\n8?N{�;��u��{���+i|8N0.�Rr��\n2=)�e��Ȗ���3�z��ec��v���a���LX�qmJ�t��$�y��\0�+W�:vݛ���ݳ,Á�>u�:�G	�˩[�-�޲�~�����	SD�\'Ϡ�\rg�,nnaR�\r�e$�+i�yog��	Q�\0|9�ϙ���	g���e����m�����[��X�E/#1�(�Ɋ��+����~#k��#�[���L�\0*D�,I�폯�\\�O�����-#N����9�k�G(�f`�c����T���:��RB�k�;�ˉ\\a\"S�*�%�-�3�]g��~å�?D���YF���o����\0n)f̱.����ӽ=ͩO����i�E\r��[o<8�S&1��jå�CՂx*���m��Ϸ�W�֞�ڱ���\Z�\0���ͱJ[�,4o��0��#k����#�7����C<[ci\Z��n��i;xg�ε�P�ͫu݌����/�Ұ�w�j7�[��Y������Z��y�\0�a�\Z��<Yx�\0��nY�g>����o�_��`��nW�d���UY)[Y�d\n��d��0>�o���ӏdU�C6�c�{c۾<ϥS�%̖r�j�U=��68���u�o�z_�Į�UK���\0��N���S+$���PA*2�l#\\�x���3���y$��46m,�7Ȭs���z��΋3�e@c�\r���E�Rrm������tXM��p[�2��Xw����+[���vTp>�Ҹ�����wFf6rmǗ+]�X	oqr���995n��X�(/�q�=����7��\"�H��O ��\Z�Ѽ\Z��y���\\^�f���S�x�����x�+�t�Y\\��6�>5���l�xm��\Z�|3�4}OVׯ��\'�i��\0�\07B��g�MI�_���%,��Z,v�Gg�}�P�xQ�<Е��v�y�j��L�N�,�� ���x��\03Y���ZmV�\r.�%�	��w.���8��Vz�ۭ��謴;ɦ��EybEʾI�~?Vc��Rl���̏X�%���G�Ywv g��M�V���K\0{�a�s����\'�qZ~����G���q,\ng�g@#��J�3�g�J���t��\nL9�>��c�h��E��2S�_������F���ݞ%���؟S�������o�yY�_;�\'�+5�2�*�\\���53��3�Wk� wG�	#�?v��k+�̘��h��7�К��KFm��S� 9ϝ\\���I,�>2�����3Y+S��\0�u.?�Aa3��\0�m�<֛�,�����Y	A,�n1}�\\�Sn.��أT��7S�0G�H��K23�l3;��6�d�{zgγ�U��w���};so��8}�� ��95��g�u{�����I����=�D���<yyU?�d�/u��q͕b���\\iז1�6�ƚZ��QH�!�D���u?�Z��}S��kZ�v׷�����X�R{\Z���s�r��9�|VRı@B�;q�1���V^K�^F�@��y$�)�V`���R�I�p�\r�I�~N�q֗����f�l�6Ө���\\��pA���aҖ\'5���w}$7P�0��8FFQ����\0AU$�pS�O�\Z�|j�D��kgf�-���/I�j��t�\n�ђ�q�X�����p\n~RXw�]j6�m��Mr�,V�+n����pezn�O�ޱTy\'��0��/Ž*�{��A沲��ᰉ���\"�q�Vl���q��|��5�\\�}=�0�]\\J䳐�n��~Ï�kgӷXx��<2\rg촙̭�H$w�����UI �^}�KЮ��4h�\\\\,��A�\\s�.X}HǽW7�z�SKJl����/���./dY��<1�q]��5�����c��	#�_��q��v�����K�[�=��2:�\0u��-�r9��~ek��Iw�>w p9���U���E�c�E�mK�B�w��s?���5���߱;Nq�@����wp��i;���\0�3����U�����\\^4wܕ��_s-��,w�`�������o5�To��U�е��O�=�r7��=��\ZW�����î�7vR�]���}��?+q��\Z�%�\n,ǚsv�ͭ��z�I�I��mZ��`ġB�<�,1���WK螔������nI<c���mn�@;@�ȪMg��^�\"��5)�X�+\nF��FK�8#�t}T��BKM;O�L2�s\Z -���|��\0Z�椛}�I9:�h�V�m4:V���3xh�#\02����Nj���|�l&YX��bc#�{��jڢM;_Ʒ*���f rB�H�߅N���-1o-�Rf�dG�^�s�\"�y\'\'=�sdaQH��_�q�IѤY\ra��\r���==+��\0��ظ��r0џ�����w�k��.c�Lf)&�$��(�9#ڸ��{��:{BԮg�iZgq��V#��\n�����u���^Lܧ�i���N��!��wV�Djr�r��q��s�]���4mc������,���E�\n�\\�8�����uK������-#E�4��q����8��Mv��:t\Z\\�tr��Id��;~�[9���Z2����̿Ŀ~�ծ&�X�t�Hp�~|���q^{�w�z�}ށ<����|��^��M;U��A�Kh�1imhU|��{dy���>�ԭzF��ǧ�kM/�������B�w	�����|��_#�\n��e���^��]gW���G3��g�n*E���\0_��em���Φ��OC=ą����	��+}�Ť�����iu����˟Ƶ�g��jm~�;ݎ���-�\0lt�!��<C�um)�e`\\�ផ&��C5�a�.���^C��?��V�x�=��\nh�F��I�hg?e��q�ʯ?����۩���Kf\\����n��b鵷\'�XHov#�֤��+�S/L2;8�x	w��\0�~u[of�oJ��@\0�(��1���gX�\"FD`c�]���\0����E;�M?�\0�̄����~#k�t���Ch�R�c�+��y�Aǹ����i�<c���`N��#>�<yO��,��Yr�hײG���Hя@�[����n�d���[Y�I|����,���z���G��P��&�-��so\r�s,�\\��0FW֑�z��=bMzGWi��W9��a�UN:ܾ\r,�e��:Γ����X[\\�6��\"T��y�Y��3,�\"��?�*��\0�g\'�j��]4�,�]�9Y�\'T\0�q9�y��v�r�V����[>)�ǐ�\\9�����Us��H�J���Xxx�O�Zj�)�l�2���q�����b��G)���r��ߣ��h^̫���C��n~`0��#؜~^�4�E�MC��aQ�|�#;~�V��&�u]����%w�Iϟ�c�	$6����� /l��gW�t�ːcIB\r�	���a�έ�Ř�r̗�Vu������hP|Ɍ`pN8��T�r��FgU��drpT��&��_���}��\ne�\'Ï-��ܓ�~8�YW�R8��s�H? �J�s�+v�ʎ�I�z���b&��>n�w#�?:���?�4�5�	q!a�s��U�]!0K���xF��:�����w	!�>(��O<j���W7���_�ne����A��$y|���k�u&Y��mʹc������=H�5�\0�Σ�#���޻F�����v\n�s�����r?�9\\n��Ǻ#����k�@�܈\Z��\'�FCn������:4��լ^豀&?x�_*��$�>��ͼxā�c`\0y�y�˚��\0��ޝ��ן\\�1��Ѐ����o,�✥߂측�$cg�u��j6��ir�L�\0:�D�U@o0w=�J;��B��YzF�*���<���:�㦆�f�J�=�s�bQ�m!�LZ\\I&��(*��S�������5N)~(͙?��X���o/\'h\Zs�Q�\'���;w���T�u>����2)]�`q���>�q�2L~�dT�}�� f?������$7v��\'��8��(h{����Z�-e��M+�D�jʆO�����W�?���q�]���>�\0�~\"��e��������	�ʰ\"N@��V�����ɿ�l!\nF��9Ǘz�rrF]�أ\Z���Ck�Xj�v[}Ŕ�B7n��O?>3M�:���?�ap�����r�?�dz̟�B�X��ݣ��.�������}�_�5؄�+��t4�E��	,d��1�Z�3.~/_\'�\0�JW��@^!��Ԃp���1\\�ȼ?o5H�e��JUN2�	s�~�.L6�$��=?/��S�r�Y�0�,qLf-��{I$q����7Q>��R��1�O��6]F�ר\r�κ����2\n���S�����Pu\r�KI�\ZGx�Ǒ�\\4\\q�?�u�K$r��/�7�,�C�I�/��\Z�=o�=�QhH�Z�⼪|XK�|����ڹ]���34Dey�&���+��C�Ʒ�H����w��ҳ��\"����5�5�+K��Hc��B���?{=��wĎ�:6�M%��Ø�dd�\0��o:�뫩�tw���9V;Gr�x%B�{��:����t]]�乞K�G�D��@��+���PōNjR]\Z����籟����t�Z��va���)g2(���|��{����������MY�h���0A����8n�2�N�~%�z~��;c�[M�ofU&IFy��\0���	�:�Lޤ�����8��=�(��m]��o�ב�ֳwq�\"��	E�w�a�;�R�M[M\nG�����Ň�br;�R:��gH���V6=Ic7�E�|�#��O-�7]/�Ya]�����EW�3���gjI\'��M�u�u���?&���X��7�!�Aݸ�v�����\0t(/E��h�\"��6�$�9��ܮ��m��x��3Fy������W�X�?fl2*�p\'nHa��|�Н�]Zh�Y%��vf\0$i�	JmU3v����Ɏ5�2��ei�iG�0:͍䚔�i���{��G�1�H��Z��XN��C�R����{�hV8�t�Nc�\\2\"�>�ߑ��ެn7�\'P��4v��n\\���\0;��=i�6w��m��ђ���x��y*O$�/�j�^�K\'7�^�au?�.D[�2F@<��!#��[4���(8��OL�o`�k�C=�䀲�^Mc`0J���������:�E��,��\nb���=� ��z�u\'K�kZ�׭�_�F���TI+9p�b�o�L��\0���jm�H�6�XA�����K��Al��ۛ�ꏉVv���ik\r�Ĳ��\'��Q�\0\0C�O|�umG�.:�X���F\"CԐ������s�٨􆫡���ݥÑ�܃�n�3ϟ�*��T�E�Η�Ej�<	\"������˟��|��������O�#�O\"�tt��_Jӭ��i%gPΜ�/�8�\0j�g�Y�3�]�:�;<e��T��z�\Z�:v�rZXʒ3&���Ի9����\"��#��\n�1n��=;�M>�N���L�ԭ5놸����$��-0,I|;z�_���u��9U���fb���Ns��<\n��-�\r�孓�ОeϦka���u�6���b���y�n��Ń���r}G7��ח�(:���i��&ߴn\r��c���q��O��m��:yvJ�7Y��S�~@Ք���Σ}�����J���b>��t5�ٸկZ����c�#_�y��]+��%�f�Jo����H���(�K�k���ą�o��Ȧ���Kqn����U\Zc�o���,Y A���m����lco�Ef��rҪ���I��G�|���\\��K���PC���?�f��<~�T�+d�&� ���P�	Lgq�9�N�C=�������C�=<�U��g��yv�c�L*�˻��ܜU�[�\0�䌃��p���\0z_$ד;�7kqj�-��,@\'��w�kaqҗ\0���w3ۚ��#61��.x�����g�\'�;�)��*�.��ώ6��˧uLe�ͭ���\0m��\Z��\0,���4�I<8�̮�G�y���*�E��Q������s�߫F�Iے7���5t�:�uZ�>x��g�IR0�󚯑�V����M��m�;�����]~�9e���ȇ9��<�~&���6w�� �9R����/*��:�Q!*���t���$<sʜ�;{T�v[�@����u�c�����\0�p�zU䣒i��{wQ�e�Ht�X���I��+�@�Λqk�m�l���s,�kۭ�r7��6pZpO?�#ҙ�Q�G�)f�[d\rۃ�?��?�X���o+=�\'�:|�lg�???:��|�,���e���8�����1����L�el�H`#������Z9��&լl�DT��d�5�3�<��;�ձ�h�&��F7RIl�;��ԬX�Nq�븟,`-\\��\Zܐ}� �� �Od�@�<df���tW�Ct�\\YV�q�����07vۏJ�蚕��V�n��E�\"�D�]�8\r��^�VL5F�������\'�>�*��$H��q�\'�U��.->�+\\�|�dr3��O-�Oan���<�����;�۷�\\N��r�����Q�S��ӿ&3�K�h�_Z��r��:��Nc¶���|��I���E�e�y\0�:Jid���g}�,������k0��$�gh�fh��3�y q��&L�ɑx����en��q�]�I�Z³#+^2�Wdzϥg��7���/-�W��P^�\r��B8�~������;M�.�d |��\0e�9�?��\0̊��\0h�־�Rx��	&1����ێޕ�P�b��8o3��k�E���e�[^kz����7𧶴o�A�ኆ���x�߃O��I�12\\�9���NG�躔/s9��,�4��6A�or|�7c𫛟�=���sL�]̢9r���8 c�9���l���v��fJ[>��n��]�jvQ�Ih�*rH$����6��j�\0S�tA�3\\A\Z�DCd��~@�c�Ed��Cs�߮巖b0��� �^�}+`e�\0�{#�?4�X��Z�T�����v��M+K�ԍ���.��7F�Lns����>�~����\Z�/��*��4��>a��ϕg������a�����\n�\0R[{eO�1�q��Rf���p�mJi�eVG�cB\01�i�,�X������K\rSL���ck8$i�^\\,M�mV\'sq���\n��_��OO�P��Ax�Ǐ� c�0��O �⯛WҒ(H���s,����� ����R���5歫���a�B��H2 (\'���\03�Γm�E��R�i4�4���V&�H�|P5��$bH��$��\'\"�Rt텽��y�±��5ǅ��W�9�nkI���+_Y�R�B��(2L�ypJ���˚�ԯo3]i:d�I�ȼ	�,�����F�R�#��gt[���)<t�q�=3�u-��w�!��3-�(Pڲ�i=�銧�鉺WY��o{{�Q-�P|O���q�}�J�u��Z-�\Z]ޮ�zm�{ �m�Fl�����\r��V�s�ioe�K�ji�(d�ەh��F����c��1����Oe¾F!�P��yx\'9�{��WDꛝ;R7R_FV�b�b2q�nT�)���zU�����ְ�ݲ&�r��xT�\0,9�3{�[�L���M�\0����swq�<�<���˛�2�x�坿�o�.a��P��N�]���)��d{�S~7t�O��}=zѢZ�[��;���0_#�H�5�MO���_E��qw(-لK�`Vu�	x��������>��soIx=d�\0:*������ia&�ok����E�Fa��F7�,W��������\Z9B̮��)�EY��77�hI}h��\\�^��0�����Z��6�� �䕏-���^݆��WO�.����M�����KI>�]7���.\0<:�z-��a)��l�p��?����#X��o.$��L��I\r�\0�ݎ�ʖlQ����,9e���Dִ{��7j���,��L��I#�U<j���v��of�[:�l6J8���ry�}J��d�;i�d��29��͇\\궾2t�3�Qx~|�\0�gʹ���͘y+�ƾ5_^7\\jS�f6RO�YB�\r�($/8-���B��s��Z�ND��L�Bq��\0}q�B�a���:+ɇI9,�M���=��\r��Ȗ���Q�6�<a~�>����=.5K�Y������3�����KQ���L=O�Hv�ۅ�Ǜw�)��zt��%ơ���pHdP?|��1�撽_�3�ɢ��z��#�=6��L��rT\0y\'���?kսU�Q���M�\"�x�e�>C�J���lc�[Sy�xH��3s��n��늊�\'�x�V3䑛��{�Z�<<��S.\\�\r\'����W�����ec�Lcr2X���|��U�Զ���jV�P�,L����@$�F�cҘ�Ο��	e�V����ǁ���9�;�\\w�>������t���#la�cF�߿`O�g�e����\0�VZq�$H���+O�\0Z� �qA��>�0;��P�ꎙe�٪]M\"]��4q�`������I�	�g�?Ø��]\'O�aF$IɵH��S*�6)���\\Z��,�6<Oo\Z�G&�c�M���\0����h�>\'�ݡ�R�K\Z!f�r98�9��z��Z��WzD3i�`�βL�r��̧#�o���5�t7�V�\\\\�,x�|���.pN<�u^��4e�Һ_L��_�+���^0cQ��ʶb�e������gǗWl��B��zF��5�k%�>H�s�c��\Zs��r\0\nՉ�����{��!a_��7�q�V���4���1��&y����.xU���Q�p,�����%�=�֭t	Vl�{g�J�7��%;�@�����\"�#wd|.�䁙�����:������S�2kM��m��D�>P��=�=kMy���fp̑g�=���*����+��:�I�|�:�я)�����~\'ҷnh������\Z���դGرO����db�?ƎYq��s�Q����C�n��$�����=�ʨ�#�{VK��g78�h��*�B��j�\'Ӥ}+�5d�9$e�VH�PX�q�x�ju��i�k�d�]F�$eb���#-��Q���N})=K$�G����U�X��o�[c��6ڼ7��Ѷ���c��s�{}j��g�������Po�������m}xֶ�Ŷ7C+n�/����?7�;ӝA�-�����Y�d���y$d`��Á����PCy�H�����M2�x�C1���|�yAQ������$����&���\\�f��#�>|�β�F�E��΂�?%F�6��7���G/�d�\"�wx\0g�{�|R����a���\\1��S�G�$cߵ`��4��5�K��av�\0z��\0��G�]0m0h0��Y���X��x���&|١.�G]鯊�����Q0ZK�\Z���) ��*������Ť����=�Cm�����������]�\ZV����IX\\O#`L�������>�g��:�qJh	d��I����`���=��Kz �*�t����u��vR��s�C�\0��J��\"�^[��;w��	����c�c�[.��4�-i��\r��\0vN�!���Yu/Xk*d���\"�=�c{���eq�� s�U�陥ެ��q���\Z>��Φ���kk�?ټ���!��A��­?�#�v�;��wCg�b���\r�P0�\'��]��O88��@�������f��#\r\"I��?̸Nò�s�c��_O�$���X�n?�H��\Z2i��5�1y����<�\ny��iZ��q���U� ��:����O�`u���Wץ[+.�|5�a��s��{��^����Wa�\"G����8?t�㊪>���\\�ynH���D�}���]1쑞�\0�T��,,�I�y��f�#�c��㿭j4\rsP��$����iY��H�.8n��niSǣIesl���s�+��Gm��s�*�cʶ�%���\0XdƼ����h��������M�\ZS!��N1��8����A���#���-u8n#vy�v�e��G��1]H�zZ���M�=�u30�c9`7�)�����tF�4�v�<�N��Y�U	do��r��aF/҈�X���C�\0KEzV�\0U�����mm坂��Y��O|�]U����\\t扩[˩]#�M�#3�# |��5C�Z����V��#\r�P)��$Qs��@`�#�yǝH�\rkF��;H�ޟ����#�K�d��<n7rO5�.�2{�-?�_��u��NQm�\\wH�ńI��.NџLs�=��Z�՟H�mR�b�B��C!8�?��%����\rXi���>�$���w�����tk��8��73!.�g c��ǵY�nui�=�v�<�/�ۘ�)nm� ����9�3���\0*r�ឱ$*��$�D�&����n������,�<#��?g�֧_h==��Ӟ9Y/�n�s� ���4��2���1�<��n�a�c.2q�xy_������{�W6�=����2�8�?�����9�]3��*�\r���JF��t��u)Ѻ��S��t��a�G�\0�gs�j���н�wo�]X�_n�O��7]D\0�����b�d��P�~^���5ߵ���MF=2+��- L�����)<���Fz@�%7w���\Z���	s���~4��O䗱�IҽA,2ip��9���b��Ei��t�����sM������Ĺ����O���p1�]Fע:r�&y@!&�%���=���?d:CJ��n�6l�F݁�#��\\s��\'6y<|}Î��6��P�ǵ�:j;ɕ���ԓ��B	��=�ֲ\Z6�n�����R۾�.1���*��E��v\Z��N����-Ǯ��z�a�t�JK>�e�LvA!8# g�y�S����vFX`�?�z/���Җ�L� �^[�1\"g� 1��S���t{��u^���x�.�r�?0�����]��o:V��4��ɽ�i�D�R~��*��5�KO��S�b��;�YeC�� ��,	��e��\0�����JZt�Q�Xhp�G-�J�,dfa�oA�dm�v��Q/����OO�?�v��>�M�mc����0�8m��?�����ꎧKhմ��WI�W���8\0�\"p=��r�F)J6E�����z�D��®�\"l\\hۨ����\0�b�\r�D8�v(:����f}#E7�YN�b�l<�y�Oj���3�tU�����E�\0��S��8<gҤ��^q��_�8�C�C/�&}�r�q���]wY��Ƕ����<h��v��n]��w��VG����<?���*����y�Y;�>�T/�΍`P9`{���uG�%�������;Pw�#��~�F��a�o�ҕcS�rF}	4�L�e��rI��\0z=�\nB�!?樠FN~�&G�P���re\'\'�c�h����?�VP?͏�@˦�����<~�c�,Y_+�?֔V�p��ԟ�E$MdG��s�̟�En�sO,��\"�9���G\n�ʑ��S�\"	c !`r9<{�2E84�;�P��.�������?7������y\0H�=������>����q��i�\'<�?�[��3�����\0!^%�$U]Z<͟�=������1�З\'h��H�:���1P��;���P��ѽ!6��M�Ĉv���9��MB*�!�����Z-���Q�0؀e�~�y�_ ;��0j�MԚ�Կ�r�\0��Dh=��}I5�:b�T���V�E����}�6����2O��3���\0n#�t�4\n��T��S}�FZxC�m�H�qϿ�57����,F��=�=������X[�x�ߞiψl�b\r߸�8�#=�7�;M+�Xc)��nc���~�8J��z��\0�&��?+����[�]���!���m�J+c��nֿ����Q�+5��bl}�����=����H�H�a1Ƞ�y{j��}�s�k3&��s��\0�g��m�m�U,�\n�>\'��ϥ-���=]\"�6E-�����ލ�@����£nYp-�?�,��6�	�0y�����y�	\"�z�TQF���V�t��a�ظ�\0*��ү�<K5]��Z��\"��6�w��kk!>!2�p������O���`���g�����5�kTi\'��,�r����\r���Z���h���x��O������ĥ�Ѿ�э�-�wT1���К�W�6ȸc�\'w��l��wഷVq���<�l�\0�O㕜9v�pO8L��c�+�3eN�ٸ��^R��J���4Xuf��Y�\Z�6����ߡ�!]�U�(�`����{�P�]O���;]Ŭ亂T�23\\��Tw�ێ�,��QIyb��w��\"tPC;�N�֏ǀ�$�a�S\'�-�g�(5��\r���\0�h���S�?�ϴB\"�|BiKsi�u.}��xR���m@?�G69T�?�*Z�6L�M�?�����Q�Ŷ0.���`?�C�$;X��<�Ε��S�cˎij�ɆkVR\Z�|�F֐�́\"�];0|~��\0L���c��JQ�\0��qI��56���Wbjڈ_ .\\zpio,�4���v�J1�}j>X�� ?��ps���8�/�\\����2E��Z��V�������\Z����y3�}sQ�>��N;G�e���w��,\\����>��Q��[]]���Ȅ�\0AHӥ���������p\'�=��`�7>n翭B�4���\'��~���6����x�\0�C�;?��k�[^�ti���!��3ߜU|��3]���Oy���L*y0��{Q��A��ߓN>�Ǐ�!K����\'[[Y1�5� ˹?�Z��:n���{��\\p��9��b�@� �,֣�^�+��WW<��8�񊫑ǎ8\\:<�;���s��8ݞ����Փ�v�]����s����GL�$c�sY}rYIH���[\0��J�����%�-v��I�?ݫ/��.�\'�-��vU��enc<�\"�����\Z��\'ڊ2K.EՑ$�p�K>�-d����Tz�:/T\Z�F/P�I\0��?�Y�G��#G�.0�0�<m���0�K����y	<� ��J�E�.v��������Ơ��/�+�#�#?�\nRΌ2 zP��c�\0�w\'�\\VR#��h�#TC�ƛ1m8+���TyA�����QP�1���oa@xnI��?Za[`�c��Ζ�(�\\�\n�\r�\'�6��>���?\0���?�|��ʐ�&xY�\Z2�?��E������\0Z�⷇��>ݍ�\'p�l�(�e>rFCr;g�\\�d��Z������iv�;�,JX��Q�9��2�;\Z���dR[Auss����`�Y��\\��uY\'F9NqT�5wj�[1fڔ���ϗ���V�Z�����Ԯ\"�8X���G=�\0:����e���Oh�:���[E�\r�9��{\n���ο�s���Io��am; �}�>�A>�U�Sk�\0uO4�=-b�Id~<b;��|��t�QX���\"����(q�\0��O��i��AR��]5-��!�m���qq���kCow�j-��q�=�N�C}s��\\&I�\0\\���EЎ5��)1>�{	u���?�I��ƜNKa����~�K��_5F�L��#Mm���j��3����GegC�ε�_���E`[99�$�����D�ye�i6�Fl޷�Ėы��cĻ��\0sNC��0�{d�\0�\r4�2���d���Td����1���K�߉�%��i�|�,C+-Ӿ\"�!O�׵V���W�z�c*�*���=|�����٠[9�����إ�X]�\n\nx�}9�����z��S-���ytP�����c��]���}g�]4,ci��1�����?\Z��L�7\"��������qY����o;d>0y�{��Z��~�VI�@齐�q&3�x����T�ɮ\rQkg�s�-�z}�#��$���=��im�mK7J0&Dv�+�\'<g�{Sz��[��9��Q���v9�\'���w�I��뜥�\nnp��F����O`3X&��f��FoT���n�t�;wdPܑ�s�{�2��p6��Ɂ��g��]*�Uk�Y�h�R�e+)i[�>���\0?\Z��Z��¡Ŵ�g���{�\0����YQ�2��*~�-d?0�c�)\'��۾�횷���27�c;�p#�j1�dު��Ȩ�+�h����2��l�>�I?�\0�Ev$����\'�I��?_�J(���l�����������;�綉��+`v�?Ҭ�ɟ0���Z\0Cۃ�o�ڝ�+���c��SD�N�K/r6�դ�Ż�*�;c\'?�\Z���2O���R�*w���dc9�\0ZH�wF$�w۟�ZíZȻ���#��jv�#�9��d��N�W$s���P1�?�D���q�\Z����d>���}��2\0��{|��󡅕�]��0b��g�iF+��\\�FpN�*�9m�\"�z\r���Ջ)îs�I ���vB�.dl�mS��������@犘�ڨX��\0�����Iw	�Ҙ�`Z�*�$S���Q%��82F���>#��L\0��|�J�\\p�߈&�#cko8��麥YK}lF.�s��I�i�\r�9�!qJ�.K�Kg��\rBQR�5*-Q�<D�<k�F��^�u u�]��A�\0A�*�8�.�(��\0:R��]�!���?��4R��2+��� �{U|���`�|�A�jT�w!RH�(�R��F>��WF:��VD6�ٱ��v��ι%C*|���+H-t��s��V�$�3�\0=)�r��HT��>C�ۚC�H�n<�\n}c���>����6\0�2��	��Q�X���w�C�@|c�$S�h�����<H7J?>��DZc��?#@�����K$,q��Ҕ\Z?!�)9!$�l͂į�o��)��yy��1~���hǗ\n(�d7���֝�1o%�a��Ҁ`�9���Ԓ,?f��ݨ �l~�5do�����i/~4�#�7.�8F~bq�����\'pN?��Z_�ֱ���w��ڡb7n���Mf�:�.�:�6��}���\n�$�1lo��s�s���n��D����%�DP�Lp���Trx�vkG�ڭ�w�v�a�+�Pq�Ұ\Z�]KZ�k�&�@2}=?:��M�Ւ�g�.-t�XV�M�>Q�s��\Z�m2i���o�\"_�UF?^k\Z�Hn��@�Ɉ�\0p�~|V�Ew�J�MQ�K�����%j٤Ӕ\r5�c���ǝ7c�;��� }�\r�մ$\Zs��I?Z��q�S�$�sSK�WqeOG�GXݼ���b?�\"����]��l��\0(9�Q�k\Z~��jz��s��p��~��>�˺�\0�����]1jֶ�	7s/�N�e�r~�F7�x�΅��7GtF��sK-�[��c����F|���ן����[}L�e����%v���ݏ��O�L_u\r�M#���fI�����v^�������O\ZAe����\n����pqM�ǧ��f�Nh��\'�	41�eN	v8��t�-R�8��Y#�B���;Vs�ݓ�olᶷ[���L����l�|�ƵR�� şQ��\0Z�ze87������6�V\'#���V֮����s��)�Ǐ����%Y������d�kY�J�Ƥc���[�N>KK+�R�dv�`���y�\r����Q¢�����A��dj�o\"��Fx����llyl�e.c�#��y5�˱�^�Z4BU�%�H��<dyӿz94h!w\\��X:��\0q$g�ƙ��̒G7�v�>^y�?/�hKp���R(�+�%s��S�˒Ea{Y��\"�:IK�\\BѮ6F_��8����^i�,�^Tr>�q�W��˩�Î�r71�<��q�\0\r��ݕ�.����/�Ԛكb��T_��5]|��������%F��Wv~a�9�[���bTy=X�5Tn�7�[��? �s�������c�~�(\'����hΚA$>�����o%?��g\n�rs�qW�[#���r�����k�A�A<��Ky��ZB�<��Y�B���l�I��de��H�@����F#��ѳ��O�}��8�� �\n��\\�\0�dqg�^f���6�zg4mbx*�眑��5%��3�?ݤ���f̐I��XY���,q��w��-h7dΌÕ��*xc؆���h�ߑہ@vCx\0\\���y��(�����؊�eo�g?������b����u�H�q�X+�S��6�pa�6ja�S�)zdJtH��;��h�*�\r2����h��g����㊲�	�\n=x��mp�p�/<?�\0ʤ��#r�\'�14�W��c�j�N�r6d���d�\"�X�p�8�E�U���rP�;|��k���e,I���j��&��v��Nc*�F�� �ad%��ۺ�q�.����\0�����jQ\n90��\0?ڈ4a�c�_�@X�����nǡNԑ��$f 1�;��!\n}�	���֚x�c�I��\0�4��Y�;f�\0ϥ�P�<H~R{�W���UX��*4���F����y�0&�@L:�2�ؘ����Y�Ƃ�m�k48��H\r��5\n�.\Z.�����%j,�՚���^�s��?�k�\0qj�g#�߽����Wr�<��f�#������wv�y�9ݦub����u>�6��t�ז!B���`��~ҫ��YIǉ�\0y�s�����ύ��<T���M��Ȭ�I;re�����z���f�m�f�ɰ�ލ�/�J��,ls\\�cv���1��	���D��\"��\'Եj��υ����98��|Q��o՟�ca�m�Y�p?:N���]\\����r̉��l�}k�O���Q�(�΢���\0o$u|��N\rta��m~&)pb�OE��	���������G�t�ۧ Kq(v>�����yJn������h�\0jFY��G8�l緝zkN��ᆟ��؉f9$�`����1O\Z��0������kR�Ą�g��4�\0Q��L���i�Y��][J,t[}E}��;�綔��h�SH2����o��\0L�\0��>��VvH߳VFr�V�-!��gDBͻ$�j��a�k�?�i���uN���\"�d\\4�3U�Vu�R�8� �y��j��k�\'�g������{�\\����S����oȱ��GVX\roI�+�ȧ�X�cq_�U�/I��z��ص���?���\'o�c��գҮ<8B�c28�l��|U�&��\"����5!Y�#s�Oa�=�	ԩq����w@�L�9�+OsHO�����S�;?�k�_��ms�o�k����Yt�v�w��3�8Q\\�C;��W|`�U�\r�W�ݑ> ��u��$�x0=��ϡ9�k?�\0zt�]�o5�j�.D�2��/�����;U�\"n���W�/nL�B��F��t����ƔN�gg���K�H.meY�r\"��˹��%��ہ����g��W�:sX�,Ė�\\�\"�݂����V����jA�����j�z���h��EO��WZJ�Hc�zc_OJ�hz�Oߨk�$m�v*;��霜��6��\Z��#Ks;1��y��A�^Ԡ�<W#)ܥ\\�{�4�6�\Z}�(��z�R��gewum%��`�����|�.n�`�����Һ�B��Ko\nxN�	�!��c�ǭx�]z�bx���I%�y\'9���4~��\"�I�k���I$�Ǔ۟^¡+�ɽZ���`D�y�/!x��1��0rH\n=9����^��<�\0�z{2gr����Gaϗָ��7���C��uMGĎW;���T�{v�zV	��5��|<[y=aew��#I���]��σ�q�����z������ڄ1<��\r��g8>_�^i������V#�Ҥ�v�omip�\rʙF1��<֏�]t��W��%�Zt��̑k�|���� �n�Whm�Q\"�`������^_��#��p�!�J��\0<�c�ҭ�S�u�\nu�����7�������1���\"⪸��B]p���\08�|4�[�(�,�������\0z�׵���\"�9e�K1���l�r!����77�4�9Ut�=�^�Iaʗ�s���\0z��^M^�Q��¶>����*�ԳZ^�f�)#_,��@���w��T�WwF��IS���q��[�.�j`��qP�����K�Ǵ��n�x���;�����>��3RV�\\Z�@p�x.�J�F��ñ$Q��s$A�pq����lc��*�F�q���v��?Z,�«8ǟ�q�4�Ws3o�1�j4]�(%{�?)PX�s���?.?֘�N��\0���y�i�_���\'�ޣ�w,��2��9�E��19ʏ�攮����j�kt�\\<e@+.�Ǔ��F��9��I���6���\0J4ec��1�Pn��b�h,����H�K1U;�\'\r�y:T\"l�g��I�qPң��aԓ�}��Ml��p���� E\nx�sL	��[��I��ۻ*�؍���LIw ���OzlLϿ\n�pr@�Ӡ%<�N�z\0��op�I`�}��9	9���^�\0Ҟ��m�iT0��*��.��O<���Y�0t_j��<A6���6�y�L_ݭ���/u����!�\0��/��Y��&��xV��$r.JK!a�!R1�q���Ε�}���Dc�gr�ۘ�\'�`q�X�ʜ�@�4 �}�n���H�M/S������0���w6�\\���B�ڂ\\�]4	y,b\"FO͟�P�2��N䕚�#UH��','aruva  i');
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
