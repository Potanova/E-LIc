# Host: 127.0.0.1  (Version 5.5.5-10.1.38-MariaDB)
# Date: 2023-05-09 13:02:23
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "jadwalpelatihan"
#

DROP TABLE IF EXISTS `jadwalpelatihan`;
CREATE TABLE `jadwalpelatihan` (
  `IdJadwal` int(11) NOT NULL AUTO_INCREMENT,
  `TglPelaksanaan` date DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `IdPel` int(11) NOT NULL,
  `Waktu` time DEFAULT NULL,
  PRIMARY KEY (`IdJadwal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "jadwalpelatihan"
#

INSERT INTO `jadwalpelatihan` VALUES (1,'2023-05-09','2023-05-08 17:08:26',1,'12:00:00'),(2,'2023-05-17','2023-05-08 17:30:10',2,'00:00:13'),(3,'2023-05-22','2023-05-08 17:30:32',3,'17:00:00');

#
# Structure for table "jenispelatihan"
#

DROP TABLE IF EXISTS `jenispelatihan`;
CREATE TABLE `jenispelatihan` (
  `IdPel` int(11) NOT NULL AUTO_INCREMENT,
  `NamaPelatihan` varchar(255) DEFAULT NULL,
  `Stat` varchar(5) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdPel`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "jenispelatihan"
#

INSERT INTO `jenispelatihan` VALUES (1,'Ground School','ON',NULL,'BEGINNER'),(2,'Student Pilot License (SPL)','ON',NULL,'MID'),(3,'Private Pilot License (PPL)','ON',NULL,'ADVANCE'),(4,'Commercial Pilot License (CPL) ','ON',NULL,'ADVANCE'),(5,'Instrument Rating (IR)','ON',NULL,'ADVANCE'),(6,'Multi Engine Rating','ON',NULL,'ADVANCE'),(7,'Review Boss','ON',NULL,'MID');

#
# Structure for table "prosespelatihan"
#

DROP TABLE IF EXISTS `prosespelatihan`;
CREATE TABLE `prosespelatihan` (
  `IdPendaftaran` varchar(255) NOT NULL DEFAULT '',
  `IdUser` varchar(255) NOT NULL DEFAULT '',
  `IdJadwal` int(11) DEFAULT NULL,
  `Skor` int(11) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `StatLulus` varchar(20) DEFAULT NULL,
  `StatPenilaian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdPendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "prosespelatihan"
#

INSERT INTO `prosespelatihan` VALUES ('2028c928-ed8a-11ed-9e7a-00155dd05898','2397caae-ed7b-11ed-9e7a-00155dd05898',1,428,'ON','2023-05-08 17:21:41','LULUS','DONE'),('ab0f231a-ede1-11ed-af77-00155d056c85','cc44d9f1-ed7a-11ed-9e7a-00155dd05898',2,NULL,'ON','2023-05-09 03:48:21',NULL,NULL),('ae88e46f-ede0-11ed-af77-00155d056c85','2397caae-ed7b-11ed-9e7a-00155dd05898',2,NULL,'OFF','2023-05-09 03:41:17',NULL,NULL),('fa2e659f-ee1a-11ed-884b-00155ddfb15e','2397caae-ed7b-11ed-9e7a-00155dd05898',2,NULL,'ON','2023-05-09 10:38:35',NULL,NULL),('fdb50b33-ee1a-11ed-884b-00155ddfb15e','2397caae-ed7b-11ed-9e7a-00155dd05898',3,NULL,'ON','2023-05-09 10:38:41',NULL,NULL);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `IdUser` varchar(255) NOT NULL DEFAULT '',
  `NamaLengkap` varchar(255) DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `StatusUser` varchar(255) DEFAULT NULL,
  `Alamat` text,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `IdPembuat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

#
# Data for table "user"
#

INSERT INTO `user` VALUES ('2397caae-ed7b-11ed-9e7a-00155dd05898','ALDI','Peserta','ld','1','ON','5t5t55465465','2023-05-08 15:34:25','4'),('4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','admin kece','admin','ad','1','ON',NULL,NULL,NULL),('cc44d9f1-ed7a-11ed-9e7a-00155dd05898','RANI','Peserta','rn','1','ON','czcvcvxv','2023-05-08 15:31:58','4'),('ff854a6b-ed7a-11ed-9e7a-00155dd05898','EDI','Penguji','ed','1','ON','fbfdbfb','2023-05-08 15:33:24','4');
