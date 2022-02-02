-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 25, 2022 at 09:37 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim_si_hospitalier`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `CODE_ADRESSE` int(11) NOT NULL,
  `CODE_WILAYA` int(11) NOT NULL,
  `L1_NBAT` varchar(30) DEFAULT NULL,
  `L2_NRUE` varchar(30) DEFAULT NULL,
  `L3_LOCALITE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_ADRESSE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorie_med`
--

DROP TABLE IF EXISTS `categorie_med`;
CREATE TABLE IF NOT EXISTS `categorie_med` (
  `CODE_CAT_MED` int(11) NOT NULL,
  `DESC_CAT_MED` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_CAT_MED`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorie_service`
--

DROP TABLE IF EXISTS `categorie_service`;
CREATE TABLE IF NOT EXISTS `categorie_service` (
  `CODE_CAT_SERVICE` int(11) NOT NULL,
  `LIBELLE_CAT_SERVICE` varchar(30) DEFAULT NULL,
  `ABREVIATION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_CAT_SERVICE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie_service`
--

INSERT INTO `categorie_service` (`CODE_CAT_SERVICE`, `LIBELLE_CAT_SERVICE`, `ABREVIATION`) VALUES
(1, 'CARDIOLOGIE', 'CARD'),
(2, 'DARMATOLOGIE', 'DARM');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_staff`
--

DROP TABLE IF EXISTS `categorie_staff`;
CREATE TABLE IF NOT EXISTS `categorie_staff` (
  `CODE_CAT_STAFF` int(11) NOT NULL,
  `LIB_CAT_STAFF` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_CAT_STAFF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `NUM_CHAMBRE` int(11) NOT NULL,
  `CODE_SERVICE` int(11) NOT NULL,
  `NUM_BATIMENT` int(11) DEFAULT NULL,
  `NUM_ETAGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUM_CHAMBRE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chambre`
--

INSERT INTO `chambre` (`NUM_CHAMBRE`, `CODE_SERVICE`, `NUM_BATIMENT`, `NUM_ETAGE`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1),
(4, 1, 1, 1),
(5, 2, 3, 1),
(6, 2, 4, 1),
(7, 3, 2, 1),
(8, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `composants_doss_pat`
--

DROP TABLE IF EXISTS `composants_doss_pat`;
CREATE TABLE IF NOT EXISTS `composants_doss_pat` (
  `CODE_COMPOSANT` int(11) NOT NULL,
  `DESCRIPTION_COMPOSANT` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_COMPOSANT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `details_factures`
--

DROP TABLE IF EXISTS `details_factures`;
CREATE TABLE IF NOT EXISTS `details_factures` (
  `CODE_FACT_PAT` int(11) NOT NULL,
  `CODE_ITEM` int(11) NOT NULL,
  `QUANTITE` int(11) DEFAULT NULL,
  `COUT_TOTAL` float DEFAULT NULL,
  PRIMARY KEY (`CODE_FACT_PAT`,`CODE_ITEM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostics`
--

DROP TABLE IF EXISTS `diagnostics`;
CREATE TABLE IF NOT EXISTS `diagnostics` (
  `CODE_DIAGNOSTIC` int(11) NOT NULL,
  `AUTRES_DETAILS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE_DIAGNOSTIC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dossier_patient`
--

DROP TABLE IF EXISTS `dossier_patient`;
CREATE TABLE IF NOT EXISTS `dossier_patient` (
  `CODE_DOSSIER_PAT` int(11) NOT NULL,
  `CODE_STAFF` int(11) NOT NULL,
  `CODE_PAT` int(11) NOT NULL,
  `CODE_COMPOSANT` int(11) NOT NULL,
  `DATE_MODIF` date DEFAULT NULL,
  `DATE_ADMISS` date DEFAULT NULL,
  `CONDITION_MEDICALE` varchar(30) DEFAULT NULL,
  `DETAILS_DOSSIER_PAT` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_DOSSIER_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facture_patient`
--

DROP TABLE IF EXISTS `facture_patient`;
CREATE TABLE IF NOT EXISTS `facture_patient` (
  `CODE_FACT_PAT` int(11) NOT NULL,
  `CODE_PAT` int(11) NOT NULL,
  `DATE_FACT` date DEFAULT NULL,
  `MONTANT_FACT` float DEFAULT NULL,
  `DATE_PAYEMENT` date DEFAULT NULL,
  PRIMARY KEY (`CODE_FACT_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `CODE_ITEM` int(11) NOT NULL,
  `LIBELLE_ITEM` varchar(30) DEFAULT NULL,
  `COUT_ITEM` float DEFAULT NULL,
  PRIMARY KEY (`CODE_ITEM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lits`
--

DROP TABLE IF EXISTS `lits`;
CREATE TABLE IF NOT EXISTS `lits` (
  `CODE_LITS` int(11) NOT NULL,
  `NUM_CHAMBRE` int(11) NOT NULL,
  `EMPLACEMENT_LIT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE_LITS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lits`
--

INSERT INTO `lits` (`CODE_LITS`, `NUM_CHAMBRE`, `EMPLACEMENT_LIT`) VALUES
(1, 1, 'G'),
(2, 1, 'D'),
(3, 2, 'G'),
(4, 2, 'D'),
(5, 3, 'D'),
(6, 3, 'G'),
(7, 4, 'D'),
(8, 4, 'G'),
(9, 5, 'D'),
(10, 5, 'G'),
(11, 6, 'D'),
(12, 6, 'G'),
(13, 7, 'D'),
(14, 7, 'G'),
(15, 8, 'D'),
(16, 8, 'G');

-- --------------------------------------------------------

--
-- Table structure for table `m?thodes_payement`
--

DROP TABLE IF EXISTS `m?thodes_payement`;
CREATE TABLE IF NOT EXISTS `m?thodes_payement` (
  `CODE_METH_PAYEMENT` int(11) NOT NULL,
  `CODE_PAT` int(11) NOT NULL,
  `NUM_CARTE` int(11) DEFAULT NULL,
  `DATE_EXPIRATION` date DEFAULT NULL,
  PRIMARY KEY (`CODE_METH_PAYEMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maladies`
--

DROP TABLE IF EXISTS `maladies`;
CREATE TABLE IF NOT EXISTS `maladies` (
  `CODE_MALADIES` int(11) NOT NULL,
  `LIBELLE_MALADIE` varchar(30) DEFAULT NULL,
  `NOM_COURT` varchar(30) DEFAULT NULL,
  `SYMPTOMES_COMM` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CODE_MALADIES`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maladie_symptome`
--

DROP TABLE IF EXISTS `maladie_symptome`;
CREATE TABLE IF NOT EXISTS `maladie_symptome` (
  `CODE_SYMPTOME` int(11) NOT NULL,
  `CODE_MALADIES` int(11) NOT NULL,
  `PROBABILITE_ATTENDUE` float DEFAULT NULL,
  `VALEUR_MIN` float DEFAULT NULL,
  `VALEUR_MAX` float DEFAULT NULL,
  `COMMENTAIRES` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_SYMPTOME`,`CODE_MALADIES`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicaments`
--

DROP TABLE IF EXISTS `medicaments`;
CREATE TABLE IF NOT EXISTS `medicaments` (
  `CODE_MEDICAMENT` int(11) NOT NULL,
  `NOM_MED` varchar(30) DEFAULT NULL,
  `DESC_MED` varchar(256) DEFAULT NULL,
  `PRIX_UNIT` float DEFAULT NULL,
  `AUTRES_DETAILS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE_MEDICAMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `med_cat`
--

DROP TABLE IF EXISTS `med_cat`;
CREATE TABLE IF NOT EXISTS `med_cat` (
  `CODE_CAT_MED` int(11) NOT NULL,
  `CODE_MEDICAMENT` int(11) NOT NULL,
  PRIMARY KEY (`CODE_CAT_MED`,`CODE_MEDICAMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `med_indications`
--

DROP TABLE IF EXISTS `med_indications`;
CREATE TABLE IF NOT EXISTS `med_indications` (
  `CODE_DIAGNOSTIC` int(11) NOT NULL,
  `CODE_MEDICAMENT` int(11) NOT NULL,
  PRIMARY KEY (`CODE_DIAGNOSTIC`,`CODE_MEDICAMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `CODE_PAT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_PAT` varchar(30) DEFAULT NULL,
  `PRENOM_PAT` varchar(30) DEFAULT NULL,
  `SEXE_PAT` varchar(30) DEFAULT NULL,
  `DNAISS_PAT` date DEFAULT NULL,
  `TAILLE_PAT` varchar(30) DEFAULT NULL,
  `POIDS_PAT` float DEFAULT NULL,
  `NTEL_PERS` varchar(15) DEFAULT NULL,
  `NTEL_MAISON` varchar(15) DEFAULT NULL,
  `NTEL_TRAVAIL` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CODE_PAT`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`CODE_PAT`, `NOM_PAT`, `PRENOM_PAT`, `SEXE_PAT`, `DNAISS_PAT`, `TAILLE_PAT`, `POIDS_PAT`, `NTEL_PERS`, `NTEL_MAISON`, `NTEL_TRAVAIL`) VALUES
(1, 'hassani', 'ilhem', 'femme', '1980-12-10', '170', 70, '05555555', '031111111111', '066666666666'),
(8, 'hafiani', 'khaled', 'homme', '1998-12-06', '170', 70, '0253434634', '434343464', '45345343434'),
(9, 'mekhlouf', 'hmed', 'homme', '1987-12-11', '165', 60, '0540820839', '0540820839', '0540820839'),
(4, 'chenoui', 'abrehhim', 'homme', '1998-12-01', '170', 70, '00000000', '00000000000', '0000000000'),
(13, 'hafiani', 'samir', 'homme', '1997-06-10', '155', 70, '0540820839', '0540820839', '0540820839'),
(11, 'sadaoui', 'asma ', 'femme', '1999-02-07', '168', 60, '0540820839', '0540820839', '0540820839'),
(12, 'djamali', 'aymen', 'homme', '1991-01-01', '182', 80, '0540820839', '0540820839', '0540820839'),
(14, 'ferahi', 'mohamed', 'homme', '1980-02-19', '150', 150, '0540820839', '0540820839', '0540820839');

-- --------------------------------------------------------

--
-- Table structure for table `patient_adresses`
--

DROP TABLE IF EXISTS `patient_adresses`;
CREATE TABLE IF NOT EXISTS `patient_adresses` (
  `CODE_PAT` int(11) NOT NULL,
  `CODE_ADRESSE` int(11) NOT NULL,
  `DATE_DEB` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`CODE_PAT`,`CODE_ADRESSE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_lits`
--

DROP TABLE IF EXISTS `patient_lits`;
CREATE TABLE IF NOT EXISTS `patient_lits` (
  `CODE_LITS` int(11) NOT NULL,
  `CODE_PAT` int(11) NOT NULL,
  `DATE_DEB` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`CODE_LITS`,`CODE_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_lits`
--

INSERT INTO `patient_lits` (`CODE_LITS`, `CODE_PAT`, `DATE_DEB`, `DATE_FIN`) VALUES
(1, 1, '2021-11-10', '2022-02-28'),
(9, 8, '2022-01-23', '2022-03-18'),
(2, 4, '2022-01-02', '2022-03-10'),
(16, 9, '2022-01-03', '2022-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `patient_symptome`
--

DROP TABLE IF EXISTS `patient_symptome`;
CREATE TABLE IF NOT EXISTS `patient_symptome` (
  `CODE_SYMPTOME` int(11) NOT NULL,
  `CODE_PAT` int(11) NOT NULL,
  `DATE_OBSERVATION` date DEFAULT NULL,
  `VALEUR_SYMPTOME` float DEFAULT NULL,
  PRIMARY KEY (`CODE_SYMPTOME`,`CODE_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `CODE_SERVICE` int(11) NOT NULL,
  `CODE_CAT_SERVICE` int(11) NOT NULL,
  `LIBELLE_SERVICE` varchar(30) DEFAULT NULL,
  `NBR_TOT_LIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODE_SERVICE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`CODE_SERVICE`, `CODE_CAT_SERVICE`, `LIBELLE_SERVICE`, `NBR_TOT_LIT`) VALUES
(1, 1, 'CARDIOLOGIE_5RM', 100),
(2, 2, 'DARMATOLOGIE_5RM', 500),
(3, 2, 'DARMATOLOGIE_1RM', 800);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `CODE_STAFF` int(11) NOT NULL,
  `CODE_CAT_STAFF` int(11) NOT NULL,
  `SEXE` varchar(15) DEFAULT NULL,
  `NOM_STAFF` varchar(30) DEFAULT NULL,
  `PRENOM_STAFF` varchar(30) DEFAULT NULL,
  `QUALIFICATION` varchar(30) DEFAULT NULL,
  `DNAISS_STAFF` date DEFAULT NULL,
  PRIMARY KEY (`CODE_STAFF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_adresses`
--

DROP TABLE IF EXISTS `staff_adresses`;
CREATE TABLE IF NOT EXISTS `staff_adresses` (
  `CODE_STAFF` int(11) NOT NULL,
  `CODE_ADRESSE` int(11) NOT NULL,
  `DATE_DEB` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`CODE_STAFF`,`CODE_ADRESSE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_affecte_pat`
--

DROP TABLE IF EXISTS `staff_affecte_pat`;
CREATE TABLE IF NOT EXISTS `staff_affecte_pat` (
  `CODE_PAT` int(11) NOT NULL,
  `CODE_STAFF` int(11) NOT NULL,
  `DDEBUT_AFFECT` date DEFAULT NULL,
  `DFIN_AFFECT` date DEFAULT NULL,
  PRIMARY KEY (`CODE_PAT`,`CODE_STAFF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `symptomes`
--

DROP TABLE IF EXISTS `symptomes`;
CREATE TABLE IF NOT EXISTS `symptomes` (
  `CODE_SYMPTOME` int(11) NOT NULL,
  `NOM_SYMPTOME` varchar(200) DEFAULT NULL,
  `DESCRIPTION_SYMPTOME` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CODE_SYMPTOME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `traitements_patt`
--

DROP TABLE IF EXISTS `traitements_patt`;
CREATE TABLE IF NOT EXISTS `traitements_patt` (
  `CODE_DIAGNOSTIC` int(11) NOT NULL,
  `CODE_MEDICAMENT` int(11) NOT NULL,
  `CODE_PAT` int(11) NOT NULL,
  `DATE_ADMIN` date DEFAULT NULL,
  `DOSE_ADMIN` varchar(30) DEFAULT NULL,
  `COMMENTAIRES` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_DIAGNOSTIC`,`CODE_MEDICAMENT`,`CODE_PAT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wilaya`
--

DROP TABLE IF EXISTS `wilaya`;
CREATE TABLE IF NOT EXISTS `wilaya` (
  `CODE_WILAYA` int(11) NOT NULL,
  `LIBELLE_WILAYA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODE_WILAYA`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
