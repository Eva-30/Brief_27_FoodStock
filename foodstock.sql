-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 08 jan. 2021 à 15:28
-- Version du serveur :  10.3.25-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `foodstock`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliment`
--

CREATE TABLE `aliment` (
  `alim_id` int(11) NOT NULL,
  `alim_nom` varchar(255) NOT NULL,
  `alim_prix` decimal(10,0) NOT NULL,
  `alim_stock` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `assoc_type_alim_saison`
--

CREATE TABLE `assoc_type_alim_saison` (
  `assoc_id` int(11) NOT NULL,
  `assoc_id_saison` int(11) NOT NULL,
  `assoc_id_type` int(11) NOT NULL,
  `assoc_id_alim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `prix`
--

CREATE TABLE `prix` (
  `prix_id` int(11) NOT NULL,
  `prix_price` decimal(10,0) NOT NULL,
  `prix_date_achat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE `saison` (
  `saison_id` int(11) NOT NULL,
  `saison_nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `stock_nombre` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD PRIMARY KEY (`alim_id`),
  ADD KEY `alim_stock` (`alim_stock`),
  ADD KEY `alim_prix` (`alim_prix`);

--
-- Index pour la table `assoc_type_alim_saison`
--
ALTER TABLE `assoc_type_alim_saison`
  ADD PRIMARY KEY (`assoc_id`),
  ADD KEY `assoc_id_saison` (`assoc_id_saison`,`assoc_id_type`,`assoc_id_alim`),
  ADD KEY `assoc_id_type` (`assoc_id_type`),
  ADD KEY `assoc_id_alim` (`assoc_id_alim`);

--
-- Index pour la table `prix`
--
ALTER TABLE `prix`
  ADD PRIMARY KEY (`prix_id`);

--
-- Index pour la table `saison`
--
ALTER TABLE `saison`
  ADD PRIMARY KEY (`saison_id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assoc_type_alim_saison`
--
ALTER TABLE `assoc_type_alim_saison`
  ADD CONSTRAINT `assoc_type_alim_saison_ibfk_1` FOREIGN KEY (`assoc_id_type`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_type_alim_saison_ibfk_2` FOREIGN KEY (`assoc_id_saison`) REFERENCES `saison` (`saison_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_type_alim_saison_ibfk_3` FOREIGN KEY (`assoc_id_alim`) REFERENCES `aliment` (`alim_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
