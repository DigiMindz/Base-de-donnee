-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2018 at 10:48 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bonsplansmain`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `etablissement_id` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67F068BCA76ED395` (`user_id`),
  KEY `IDX_67F068BCFF631228` (`etablissement_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`id`, `user_id`, `etablissement_id`, `comment`, `created`, `updated_at`) VALUES
(3, 2, 26, 'commentaire', '2018-05-03 11:29:27', NULL),
(4, 2, 26, 'fghf', '2018-05-03 13:11:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `demande_ajout`
--

CREATE TABLE IF NOT EXISTS `demande_ajout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Ouverture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Fermeture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_principale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget_Moyen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loisirs` enum('Cinema','Salle de sport','Parc d attraction','Spa','Salon de coiffure','Centre de beaute','Salle de jeux','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_shops` enum('Grande surface','Parfumerie','Boutique','Patisserie','Librairie','Fleuriste','Candy Shop','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_resto` enum('Restaurant','Bar','Cafe','Fast-Food','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrStars` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_869E89256B3CA4B` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `demande_partenariat`
--

CREATE TABLE IF NOT EXISTS `demande_partenariat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `favoris_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1E7483F251E8871B` (`favoris_id`),
  KEY `IDX_1E7483F2A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `df_category`
--

CREATE TABLE IF NOT EXISTS `df_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `disp_position` int(10) unsigned NOT NULL,
  `read_authorised_roles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `df_forum`
--

CREATE TABLE IF NOT EXISTS `df_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` smallint(6) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disp_position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6734FB05989D9B62` (`slug`),
  KEY `IDX_6734FB0512469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `df_post`
--

CREATE TABLE IF NOT EXISTS `df_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned NOT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FDB5B0441F55203D` (`topic_id`),
  KEY `IDX_FDB5B0445BB66C05` (`poster_id`),
  KEY `IDX_FDB5B04416FE72E1` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `df_topic`
--

CREATE TABLE IF NOT EXISTS `df_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `resolved` tinyint(1) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `last_post` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7F5F9BD3989D9B62` (`slug`),
  KEY `IDX_7F5F9BD329CCBAD0` (`forum_id`),
  KEY `IDX_7F5F9BD3A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

CREATE TABLE IF NOT EXISTS `etablissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Ouverture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Fermeture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_principale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget_Moyen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loisirs` enum('Cinema','Salle de sport','Parc d attraction','Spa','Salon de coiffure','Centre de beaute','Salle de jeux','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_shops` enum('Grande surface','Parfumerie','Boutique','Patisserie','Librairie','Fleuriste','Candy Shop','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrStars` int(11) DEFAULT NULL,
  `type_resto` enum('Restaurant','Bar','Cafe','Fast-Food','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `nbrrating` int(11) DEFAULT NULL,
  `nbruser` int(11) DEFAULT NULL,
  `representant_id` int(11) DEFAULT NULL,
  `partenaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_20FD592C6C4A52F0` (`representant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `etablissement`
--

INSERT INTO `etablissement` (`id`, `Nom`, `Type`, `Adresse`, `Description`, `Horaire_Ouverture`, `Horaire_Fermeture`, `Numero`, `image_principale`, `URL`, `Budget_Moyen`, `type_loisirs`, `type_shops`, `nbrStars`, `type_resto`, `rating`, `nbrrating`, `nbruser`, `representant_id`, `partenaire`) VALUES
(5, 'FarmHouse', 'Restaurants/Cafés', 'Av Mustapha Abd Essalem - Centre Intissar (Avenue Mustafa Abdessalam) Ariana', 'L''un(e) des 5 meilleur(e)s Pizzerias à Ariana', '09:00:00', '00:00:00', '71236264', 'd2cf4ffbfa7045c211dff90e8a384b6a.jpeg', 'https://www.facebook.com/FarmHousePizza', '20', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(6, 'Le Zink', 'Restaurants/Cafés', '1 rue Salah Ben Mahmoud 1004 Tunis', 'Réservations: Non\r\nTerrasse: Non\r\nChoix de types de restauration: Pas de service de livraison', '09:00:00', '22:00:00', '22706503', '411679349f3bbf90c51a080725683b81.jpeg', 'https://www.facebook.com/Le-zink-1431744763740516/', '20', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(7, 'El Ali', 'Restaurants/Cafés', 'Rue Jemaa Ezzitouna نهج جامع الزيتونة 1006 Tunis', 'Réservations: Oui\r\nCartes de crédit: Oui\r\nWifi: Oui\r\nTerrasse: Oui\r\nChoix de types de restauration: Pas de service de livraison\r\nMenus: Brunch, Déjeuner, Dîner\r\nBoissons: Cocktails', '08:00:00', '19:00:00', '71321927', '302b27435334b8b10014b97b879470e4.jpeg', 'https://www.facebook.com/ElAliRestoEtCafeCulturel', '30', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(8, 'Miam''s', 'Restaurants/Cafés', 'Hammam Sousse', 'Menus: Brunch, Déjeuner, Dîner', '09:00', '00:00', '28870445', 'c0653154937ebd2aa5a51fc1ac4243ad.jpeg', 'https://www.facebook.com/miamssousse', '30', NULL, NULL, NULL, 'Restaurant', NULL, NULL, NULL, 1, 0),
(10, 'Les Berges Du Lac Concorde Hotel', 'hotels', 'Rue du Lac Turkana 1053 Les Berges du Lac', 'Cartes de crédit: Oui (y compris American Express)\r\nWifi: Oui', '00:00:00', '00:00:00', '71961951', '95192bc5cc74696051d04bfc3d049251.jpeg', 'http://www.concorde-tunisia.com/Fr/', '1000', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(11, 'Regency Tunis Hotel', 'hotels', 'B.P 705 – 2078 La Marsa (Les Côtes de Carthage) Tunis', 'Cartes de crédit: Oui (y compris American Express)', '00:00:00', '00:00:00', '71910900', 'cd509adf8e4856617a328b2e1d61aec3.jpeg', 'http://www.regencytunis.com/', '1000', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(12, 'Hôtel Paris', 'hotels', 'les Berges du Lac Tunis', 'Wifi: Oui', '00:00:00', '00:00:00', '71107500', '13f078edce419ad7e29493301d51b7e0.jpeg', 'http://www.hotelparistunis.com/', '1000', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(13, 'Smug''s', 'Restaurants/Cafés', 'Rue du Lac Biwa Tunis', 'Réservations: Non\r\nCartes de crédit: Oui (y compris American Express)\r\nWifi: Oui\r\nTerrasse: Non\r\nChoix de types de restauration: Pas de service de livraison\r\nNourriture et boisson\r\nMenus: Brunch, Déjeuner, Dîner\r\nBoissons: Cocktails', '09:00:00', '00:00:00', '71960697', '85cc3d32caa25b010833e1b47b0b5cb5.jpeg', 'https://www.facebook.com/SmugsCoffeeShop', '30', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
(14, 'Les Dalton', 'Restaurants/Cafés', 'Rue Du Lac Victoria Tunis', 'Réservations: Non\r\nCartes de crédit: Non\r\nWifi: Oui\r\nTerrasse: Non\r\nMusique live\r\nChoix de types de restauration: Service de livraison\r\nNourriture et boisson\r\nMenus: Petit déjeuner, Déjeuner, Dîner, Dessert, Happy hour\r\nBoissons: Cocktails', '09:00:00', '23:30:00', '55759479', 'ce64dfa36a000dbd5627e7b94c4e26f8.jpeg', 'https://www.facebook.com/lesdaltoncafe', '30', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 4, 0),
(15, 'Carrefour', 'Shops', 'Route National 9 Tunis-Marsa (RN10) 2046 Sidi Daoud', 'Carrefour Tunisie, l''hypermarché en Tunisie propose de nombreux produits frais, de produits d''electroménager', '09:00:00', '22:00:00', '70011000', '2b6cd2b356cbdc1e7395e65b19b2ad55.png', 'https://www.carrefourtunisie.com/home', '10', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(16, 'Barista''s Cafe', 'Restaurants/Cafés', '17 Imm. La Perle du Lac, Rue du Lac Windermere 1053 Tunis', 'Cartes de crédit: Oui\r\nWifi: Oui\r\nTerrasse: Oui\r\nMusique: Musique live\r\nNourriture et boisson\r\nMenus: Brunch, Déjeuner, Dîner', '09:00:00', '00:00:00', '71656008', 'f055f3d15afe053866c1afbbe206c11d.jpeg', 'https://www.facebook.com/baristas.cafe/', '20', 'Autre', NULL, NULL, NULL, NULL, NULL, NULL, 3, 0),
(17, 'California Gym', 'Autres', 'Rue du lac Biwa 1053 Les berges du lac', 'La chaîne California Gym compte 6 clubs dont cinq sont \r\nrépartis sur le Grand Tunis et le sixième se trouve à Sousse. \r\nLa chaîne projette d’élargir progressivement son réseau afin que vous trouviez toujours un club à proximité de votre lieu de travail', '09:00:00', '00:00:00', '71656089', '8406af4534df77bbb190931290c69f4a.png', 'http://www.california-gym.com/', '160', 'Salle de sport', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(19, 'Cinéma Alhambra', 'Autres', 'C.C Zephyr La Marsa', '"La meilleure salle de cinéma de Tunis à tout les niveaux."', '10:00:00', '00:00:00', '28870445', '8628ada9f97e16797c9f2548451daff5.jpeg', 'https://www.facebook.com/cine.alhambra.zephyr/?ref=search', '10', 'Cinema', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(20, 'CarthageLand', 'Autres', 'Yasmine Hammamet Hammamet', 'Parc d''attractions et Divertissements et loisirs\r\nHammamet', '09:00:00', '00:00:00', '28870445', 'e437982e7367d4731daf70866778d3a2.jpeg', 'https://www.facebook.com/CarthageLandOfficiel/?ref=br_rs', '100', 'Parc d attraction', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(21, 'THE RESIDENCE TUNIS : Spa & Thalasso', 'Autres', 'Boite Postale 697, 2070 La Marsa Les Côtes de Carthage', 'Inspiré de l''atmosphère évocatrice des anciens thermes romains, le luxueux The Spa & Thalasso de 3500m² est l''une des destinations plus réputées de spa thalasso en Méditerranée. C’est un sanctuaire consacré au bien-être de ses clients.\r\nCe spa est le prem', '09:00:00', '21:00:00', '71910101', '9d80e18cc93c29b21e72421f4018be5b.jpeg', 'https://www.facebook.com/TheResidenceTunis/', '200', 'Spa', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(22, 'Lilia Ben Aziza Make up Hair Beauty & Spa', 'Autres', '31 rue de sfax menzeh 5 (186.87 mi) Tunis, Tunisia 1004', 'Mariage, Fiançailles, Esthétique, Onglerie & Coiffure \r\nBeauty Saloon\r\nLors de votre mariage, tous les regards seront portés sur vous !!!\r\nPour être la plus belle lors de cette journée exceptionnelle, il vous faut la coiffure et le maquillage qui correspo', '09:30:00', '19:30:00', '71231900', '952c6fc89e9270583e6aaf04ed2cc87b.jpeg', 'https://www.facebook.com/lba.makeup/', '1000', 'Centre de beaute', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(24, 'Game Zone salle de jeux', 'Autres', 'Cité Ennasr, au premier etage du Crystal Palace, Ariana, Tunis', 'Nous offrons jeux PS4, Ecouteurs de haute gamme, ect ect...', '08:00:00', '00:00:00', '92736366', '17f15951918954e398b0587e6588f32c.jpeg', 'https://www.facebook.com/Game-Zone-salle-de-jeux-1544200152536998/', '20', 'Salle de jeux', NULL, NULL, NULL, NULL, NULL, NULL, 4, 0),
(25, 'California Gym Ennaser', 'Autres', 'Ennaser', 'La chaîne California Gym compte 6 clubs dont cinq sont répartis sur le Grand Tunis et le sixième se trouve à Sousse. La chaîne projette d’élargir progressivement son réseau afin que vous trouviez toujours un club à proximité de votre lieu de travail', '09:00:00', '00:00:00', '71656089', 'cf06f04ba42934fc4ab0f4622021eb8d.png', 'http://www.california-gym.com/', '160', 'Salle de sport', NULL, NULL, NULL, NULL, NULL, NULL, 4, 0),
(26, '7 Swag', 'Restaurants/Cafés', 'Rue des Beaux artss', 'Seven Swag', '09:00', '22:00', '28870447', 'a9692f453f123eef3e6454eb777e1812.jpeg', 'https://www.facebook.com/SevenSwag', '20', 'Autre', NULL, NULL, 'Restaurant', NULL, NULL, NULL, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `etablissements_services`
--

CREATE TABLE IF NOT EXISTS `etablissements_services` (
  `service_id` int(11) NOT NULL,
  `etablissement_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`,`etablissement_id`),
  KEY `IDX_654CCA3EED5CA9E6` (`service_id`),
  KEY `IDX_654CCA3EFF631228` (`etablissement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement_tag`
--

CREATE TABLE IF NOT EXISTS `etablissement_tag` (
  `etablissement_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`etablissement_id`,`tag_id`),
  KEY `IDX_5D1714F8FF631228` (`etablissement_id`),
  KEY `IDX_5D1714F8BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_etablissement` int(11) DEFAULT NULL,
  `nbr_stars` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1323A5756B3CA4B` (`id_user`),
  KEY `IDX_1323A5759ED58849` (`id_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_etablissement`
--

CREATE TABLE IF NOT EXISTS `evaluation_etablissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etablissement_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Aime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PasAime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cool` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nulle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B7E1B219FF631228` (`etablissement_id`),
  KEY `IDX_B7E1B219A76ED395` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `evaluation_etablissement`
--

INSERT INTO `evaluation_etablissement` (`id`, `etablissement_id`, `user_id`, `Aime`, `PasAime`, `cool`, `nulle`) VALUES
(2, 26, 2, 'oui', '', 'oui', ''),
(3, 26, 2, 'oui', '', '', 'oui');

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_etablissement` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interesses` int(11) DEFAULT NULL,
  `nbr_personnes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B26681E9ED58849` (`id_etablissement`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `evenement`
--

INSERT INTO `evenement` (`id`, `id_etablissement`, `date`, `description`, `nom`, `interesses`, `nbr_personnes`) VALUES
(7, 17, '2018-05-05', 'Le TRX est plus qu''un sport, cg vous profite d''une journée a ne pas rater avec les coach seif et ons', 'Evenement CG TRXXX', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `favoris`
--

CREATE TABLE IF NOT EXISTS `favoris` (
  `user_id` int(11) NOT NULL,
  `etablissement_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`etablissement_id`),
  KEY `IDX_8933C432A76ED395` (`user_id`),
  KEY `IDX_8933C432FF631228` (`etablissement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `going_event`
--

CREATE TABLE IF NOT EXISTS `going_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4960DD2FA76ED395` (`user_id`),
  KEY `IDX_4960DD2F71F7E88B` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Ouverture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Fermeture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_principale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget_Moyen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loisirs` enum('Cinema','Salle de sport','Parc d attraction','Spa','Salon de coiffure','Centre de beaute','Salle de jeux','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_shops` enum('Grande surface','Parfumerie','Boutique','Patisserie','Librairie','Fleuriste','Candy Shop','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrStars` int(11) DEFAULT NULL,
  `partenaire` int(11) DEFAULT NULL,
  `type_resto` enum('Restaurant','Bar','Cafe','Fast-Food','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `nbrrating` int(11) DEFAULT NULL,
  `nbruser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C3E1A67A76ED395` (`user_id`),
  KEY `IDX_6C3E1A6771F7E88B` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`id`, `user_id`, `event_id`) VALUES
(4, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `loisirs`
--

CREATE TABLE IF NOT EXISTS `loisirs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Ouverture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Fermeture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_principale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget_Moyen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loisirs` enum('Cinema','Salle de sport','Parc d attraction','Spa','Salon de coiffure','Centre de beaute','Salle de jeux','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_shops` enum('Grande surface','Parfumerie','Boutique','Patisserie','Librairie','Fleuriste','Candy Shop','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrStars` int(11) DEFAULT NULL,
  `partenaire` int(11) DEFAULT NULL,
  `type_resto` enum('Restaurant','Bar','Cafe','Fast-Food','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `nbrrating` int(11) DEFAULT NULL,
  `nbruser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE IF NOT EXISTS `notif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `content` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `icon` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `icon_color` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C0730D6BA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifiable`
--

CREATE TABLE IF NOT EXISTS `notifiable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifiable_notification`
--

CREATE TABLE IF NOT EXISTS `notifiable_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) DEFAULT NULL,
  `notifiable_entity_id` int(11) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ADCFE0FAEF1A9D84` (`notification_id`),
  KEY `IDX_ADCFE0FAC3A0A4F8` (`notifiable_entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `offre`
--

CREATE TABLE IF NOT EXISTS `offre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_etablissement` int(11) DEFAULT NULL,
  `offre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_promo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pourcentage` double DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F9ED58849` (`id_etablissement`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `offre`
--

INSERT INTO `offre` (`id`, `id_etablissement`, `offre`, `code_promo`, `pourcentage`, `description`, `date_debut`, `date_fin`) VALUES
(38, 17, 'Offre CG Ennaser', '', 0, 'Cours Crossfit Gratuit pour les nouveaux admissions entre les dates mentionnés', '2018-05-06', '2018-05-08'),
(39, 26, 'CHEZ SWAG', '', 0, '7SWAG COFFEE', '2018-05-06', '2018-05-07'),
(42, 11, 'Offre Hotel', 'BONS PLANS', 20, 'HHH', '2018-05-05', '2018-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `partenariat`
--

CREATE TABLE IF NOT EXISTS `partenariat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `favoris_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BF53DC8651E8871B` (`favoris_id`),
  KEY `IDX_BF53DC86A76ED395` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `partenariat`
--

INSERT INTO `partenariat` (`id`, `favoris_id`, `user_id`, `Description`) VALUES
(1, 17, 4, 'Demande d''etre partenaire, bcp d''offres a venir'),
(2, 13, 3, 'HAHAHA');

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

CREATE TABLE IF NOT EXISTS `reclamation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `Sujet` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu_reclamation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_etab` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CE6064046B3CA4B` (`id_user`),
  KEY `IDX_CE6064042A3E5E31` (`id_etab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_etablissement` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nbre_chambres` int(11) DEFAULT NULL,
  `nbre_adultes` int(11) DEFAULT NULL,
  `nbre_enfants` int(11) DEFAULT NULL,
  `nbre_personnes` int(11) DEFAULT NULL,
  `date_de_reservation` date DEFAULT NULL,
  `arrivée` date DEFAULT NULL,
  `heuredereservation` datetime DEFAULT NULL,
  `départ` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C849556B3CA4B` (`id_user`),
  KEY `IDX_42C849559ED58849` (`id_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `restauration`
--

CREATE TABLE IF NOT EXISTS `restauration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Ouverture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Fermeture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_principale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget_Moyen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loisirs` enum('Cinema','Salle de sport','Parc d attraction','Spa','Salon de coiffure','Centre de beaute','Salle de jeux','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_shops` enum('Grande surface','Parfumerie','Boutique','Patisserie','Librairie','Fleuriste','Candy Shop','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrStars` int(11) DEFAULT NULL,
  `partenaire` int(11) DEFAULT NULL,
  `type_resto` enum('Restaurant','Bar','Cafe','Fast-Food','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `nbrrating` int(11) DEFAULT NULL,
  `nbruser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_service` enum('Wifi','Parking','Espace kids','Utilites handicapes','Music','Espace fumeur','autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shared_experience`
--

CREATE TABLE IF NOT EXISTS `shared_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_etablissement` int(11) DEFAULT NULL,
  `checkInDate` date NOT NULL,
  `impression` varchar(2500) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shared_experience_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_718321CC6B3CA4B` (`id_user`),
  KEY `IDX_718321CC9ED58849` (`id_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Ouverture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Horaire_Fermeture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_principale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget_Moyen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loisirs` enum('Cinema','Salle de sport','Parc d attraction','Spa','Salon de coiffure','Centre de beaute','Salle de jeux','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_shops` enum('Grande surface','Parfumerie','Boutique','Patisserie','Librairie','Fleuriste','Candy Shop','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nbrStars` int(11) DEFAULT NULL,
  `partenaire` int(11) DEFAULT NULL,
  `type_resto` enum('Restaurant','Bar','Cafe','Fast-Food','Autre') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `nbrrating` int(11) DEFAULT NULL,
  `nbruser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table_indications`
--

CREATE TABLE IF NOT EXISTS `table_indications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `id_commentaire` int(11) NOT NULL,
  `indication` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_30362BA4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datedenaissance` date DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `nom`, `Sexe`, `datedenaissance`, `ville`, `phone`, `URL`, `intro`) VALUES
(1, 'ons', 'ons', 'benothmenons@gmail.com', 'benothmenons@gmail.com', 1, NULL, '$2y$13$3b9xYM5rI6c2nbb0G4KWeuEZidfesO4xQqOOFG5DBL63rR8yqr1xu', '2018-05-20 16:45:01', NULL, NULL, 'a:2:{i:0;s:5:"ADMIN";i:1;s:10:"ROLE_ADMIN";}', 'Ons', 'Femme', '1996-12-18', 'Nabeul', '28870445', 'https://www.facebook.com/ons.bo.1', NULL),
(2, 'houss11', 'houss11', 'houssemeddine.nacer@esprit.tn', 'houssemeddine.nacer@esprit.tn', 1, NULL, '$2y$13$vmJ01WqUj9OJ7rZgyNFyi.vclsHARYhY7Xe2.KTB6sswkhghLAUNu', '2018-05-02 20:31:19', NULL, NULL, 'a:0:{}', 'houssem nacer', 'Homme', '1997-01-01', 'Tunis', '53189869', 'https://www.facebook.com/ons.bo.1', NULL),
(3, 'omarjarray', 'omarjarray', 'omar.jarray@esprit.tn', 'omar.jarray@esprit.tn', 1, NULL, '123', NULL, NULL, NULL, 'a:0:{}', 'Jarray', 'Homme', '1996-12-18', 'Manouba', '20397847', NULL, NULL),
(4, 'onssfitnesslife', 'onssfitnesslife', 'ons.benothmen@esprit.tn', 'ons.benothmen@esprit.tn', 1, NULL, '123', NULL, NULL, NULL, 'a:2:{i:0;s:5:"ADMIN";i:1;s:10:"ROLE_ADMIN";}', 'Ons Ben Othmen', 'Femme', '1996-12-18', 'Nabeul', '28870445', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visited`
--

CREATE TABLE IF NOT EXISTS `visited` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `favoris_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C4DEBC44A76ED395` (`user_id`),
  KEY `IDX_C4DEBC4451E8871B` (`favoris_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `visited`
--

INSERT INTO `visited` (`id`, `user_id`, `favoris_id`) VALUES
(12, 4, 5),
(13, 4, 6),
(14, 4, 8),
(15, 4, 26),
(16, 3, 17);

-- --------------------------------------------------------

--
-- Table structure for table `visited_event`
--

CREATE TABLE IF NOT EXISTS `visited_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A045BB62A76ED395` (`user_id`),
  KEY `IDX_A045BB6271F7E88B` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wishliste`
--

CREATE TABLE IF NOT EXISTS `wishliste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `favoris_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BE989B4AA76ED395` (`user_id`),
  KEY `IDX_BE989B4A51E8871B` (`favoris_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `wishliste`
--

INSERT INTO `wishliste` (`id`, `user_id`, `favoris_id`) VALUES
(31, 4, 5),
(32, 4, 6),
(33, 4, 8),
(34, 4, 26),
(35, 3, 17);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_67F068BCFF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `demande_ajout`
--
ALTER TABLE `demande_ajout`
  ADD CONSTRAINT `FK_869E89256B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `demande_partenariat`
--
ALTER TABLE `demande_partenariat`
  ADD CONSTRAINT `FK_1E7483F251E8871B` FOREIGN KEY (`favoris_id`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `FK_1E7483F2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `df_forum`
--
ALTER TABLE `df_forum`
  ADD CONSTRAINT `FK_6734FB0512469DE2` FOREIGN KEY (`category_id`) REFERENCES `df_category` (`id`);

--
-- Constraints for table `df_post`
--
ALTER TABLE `df_post`
  ADD CONSTRAINT `FK_FDB5B04416FE72E1` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FDB5B0441F55203D` FOREIGN KEY (`topic_id`) REFERENCES `df_topic` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FDB5B0445BB66C05` FOREIGN KEY (`poster_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `df_topic`
--
ALTER TABLE `df_topic`
  ADD CONSTRAINT `FK_7F5F9BD329CCBAD0` FOREIGN KEY (`forum_id`) REFERENCES `df_forum` (`id`),
  ADD CONSTRAINT `FK_7F5F9BD3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `FK_20FD592C6C4A52F0` FOREIGN KEY (`representant_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `etablissements_services`
--
ALTER TABLE `etablissements_services`
  ADD CONSTRAINT `etablissements_services_ibfk_1` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_654CCA3EED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `etablissement_tag`
--
ALTER TABLE `etablissement_tag`
  ADD CONSTRAINT `FK_5D1714F8BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5D1714F8FF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK_1323A5756B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1323A5759ED58849` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `evaluation_etablissement`
--
ALTER TABLE `evaluation_etablissement`
  ADD CONSTRAINT `FK_B7E1B219A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B7E1B219FF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_B26681E9ED58849` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `FK_8933C432A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8933C432FF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `going_event`
--
ALTER TABLE `going_event`
  ADD CONSTRAINT `FK_4960DD2F71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `FK_4960DD2FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `interest`
--
ALTER TABLE `interest`
  ADD CONSTRAINT `FK_6C3E1A6771F7E88B` FOREIGN KEY (`event_id`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `FK_6C3E1A67A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `notif`
--
ALTER TABLE `notif`
  ADD CONSTRAINT `FK_C0730D6BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `notifiable_notification`
--
ALTER TABLE `notifiable_notification`
  ADD CONSTRAINT `FK_ADCFE0FAC3A0A4F8` FOREIGN KEY (`notifiable_entity_id`) REFERENCES `notifiable` (`id`),
  ADD CONSTRAINT `FK_ADCFE0FAEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`);

--
-- Constraints for table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `FK_AF86866F9ED58849` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `partenariat`
--
ALTER TABLE `partenariat`
  ADD CONSTRAINT `FK_BF53DC8651E8871B` FOREIGN KEY (`favoris_id`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `FK_BF53DC86A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `FK_CE6064042A3E5E31` FOREIGN KEY (`id_etab`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `FK_CE6064046B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C849556B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_42C849559ED58849` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `shared_experience`
--
ALTER TABLE `shared_experience`
  ADD CONSTRAINT `FK_718321CC6B3CA4B` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_718321CC9ED58849` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id`);

--
-- Constraints for table `table_indications`
--
ALTER TABLE `table_indications`
  ADD CONSTRAINT `FK_30362BA4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `visited`
--
ALTER TABLE `visited`
  ADD CONSTRAINT `FK_C4DEBC4451E8871B` FOREIGN KEY (`favoris_id`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `FK_C4DEBC44A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `visited_event`
--
ALTER TABLE `visited_event`
  ADD CONSTRAINT `FK_A045BB6271F7E88B` FOREIGN KEY (`event_id`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `FK_A045BB62A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `wishliste`
--
ALTER TABLE `wishliste`
  ADD CONSTRAINT `FK_BE989B4A51E8871B` FOREIGN KEY (`favoris_id`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `FK_BE989B4AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
