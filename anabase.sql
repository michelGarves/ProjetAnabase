-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 22 mai 2022 à 20:07
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `anabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `NUM_ACTIVITE` int(2) NOT NULL,
  `NOM_ACTIVITE` char(32) DEFAULT NULL,
  `DATE_ACTIVITE` date DEFAULT NULL,
  `HEURE_ACTIVITE` time DEFAULT NULL,
  `PRIX_ACTIVITE` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`NUM_ACTIVITE`, `NOM_ACTIVITE`, `DATE_ACTIVITE`, `HEURE_ACTIVITE`, `PRIX_ACTIVITE`) VALUES
(1, 'Plongée', '2021-09-29', '12:30:30', 150),
(2, 'Equitation', '2021-09-29', '12:30:00', 200),
(3, 'Saut à la perche', '2021-09-29', '18:00:00', 70),
(4, 'Barbapapa', '2021-09-29', '17:30:30', 10);

-- --------------------------------------------------------

--
-- Structure de la table `congressiste`
--

CREATE TABLE `congressiste` (
  `NUM_CONGRESSISTE` int(2) NOT NULL,
  `NUM_ORGANISME` int(2) DEFAULT NULL,
  `NUM_HOTEL` int(2) DEFAULT NULL,
  `NOM_CONGRESSISTE` char(32) DEFAULT NULL,
  `PRENOM_CONGRESSISTE` char(32) DEFAULT NULL,
  `ADRESSE_CONGRESSISTE` char(50) DEFAULT NULL,
  `TEL_CONGRESSISTE` char(10) DEFAULT NULL,
  `DATE_INSCRIPTION` date DEFAULT NULL,
  `CODE_ACCOMPAGNATEUR` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `congressiste`
--

INSERT INTO `congressiste` (`NUM_CONGRESSISTE`, `NUM_ORGANISME`, `NUM_HOTEL`, `NOM_CONGRESSISTE`, `PRENOM_CONGRESSISTE`, `ADRESSE_CONGRESSISTE`, `TEL_CONGRESSISTE`, `DATE_INSCRIPTION`, `CODE_ACCOMPAGNATEUR`) VALUES
(1, 1, 1, 'Garves', 'Michel', '41 rue du guettho', '0123456789', '2021-09-22', 1),
(2, 3, 2, 'LAILLER', 'Pierre', '4646 bongo dongo road', '0123456789', '2021-09-22', 3),
(3, 2, 1, 'Nathanaël', 'Debord', '41 boulevard Gambetta', '0123456789', '2021-12-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `NUM_FACTURE` int(2) NOT NULL,
  `NUM_CONGRESSISTE` int(2) NOT NULL,
  `DATE_FACTURE` date DEFAULT NULL,
  `CODE_REGLEMENT` tinyint(1) DEFAULT NULL,
  `MONTANT_FACTURE` bigint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`NUM_FACTURE`, `NUM_CONGRESSISTE`, `DATE_FACTURE`, `CODE_REGLEMENT`, `MONTANT_FACTURE`) VALUES
(1, 1, '2021-09-23', 0, 1500),
(2, 2, '2021-11-10', 1, 2000);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `NUM_HOTEL` int(2) NOT NULL,
  `NOM_HOTEL` char(32) DEFAULT NULL,
  `ADRESSE_HOTEL` char(50) DEFAULT NULL,
  `NOMBRE_ETOILES` smallint(1) DEFAULT NULL,
  `PRIX_PARTICIPANT` int(2) DEFAULT NULL,
  `PRIX_SUPPL` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`NUM_HOTEL`, `NOM_HOTEL`, `ADRESSE_HOTEL`, `NOMBRE_ETOILES`, `PRIX_PARTICIPANT`, `PRIX_SUPPL`) VALUES
(1, 'Hoten Pennsylvanie', '41 rue de la pennsylvanie', 5, 1000, 50);

-- --------------------------------------------------------

--
-- Structure de la table `organisme_payeur`
--

CREATE TABLE `organisme_payeur` (
  `NUM_ORGANISME` int(2) NOT NULL,
  `NOM_ORGANISME` char(32) DEFAULT NULL,
  `ADRESSE_ORGANISME` char(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participation_session`
--

CREATE TABLE `participation_session` (
  `NUM_CONGRESSISTE` int(2) NOT NULL,
  `NUM_SESSION` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `participation_session`
--

INSERT INTO `participation_session` (`NUM_CONGRESSISTE`, `NUM_SESSION`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `rel_1`
--

CREATE TABLE `rel_1` (
  `NUM_CONGRESSISTE` int(2) NOT NULL,
  `NUM_ACTIVITE` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rel_1`
--

INSERT INTO `rel_1` (`NUM_CONGRESSISTE`, `NUM_ACTIVITE`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `NUM_SESSION` int(2) NOT NULL,
  `DATE_SESSION` date DEFAULT NULL,
  `HEURE_SESSION` time DEFAULT NULL,
  `PRIX_SESSION` int(2) DEFAULT NULL,
  `NOM_SESSION` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`NUM_SESSION`, `DATE_SESSION`, `HEURE_SESSION`, `PRIX_SESSION`, `NOM_SESSION`) VALUES
(1, '2021-09-29', '07:18:19', 510, 'SESSION UNE'),
(2, '2021-09-30', '05:15:00', 160, 'SESSION DEUX'),
(3, '2021-10-30', '05:15:00', 200, 'SESSION TROIS'),
(4, '2021-11-30', '05:15:00', 100, 'SESSION QUATRE');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`NUM_ACTIVITE`);

--
-- Index pour la table `congressiste`
--
ALTER TABLE `congressiste`
  ADD PRIMARY KEY (`NUM_CONGRESSISTE`),
  ADD KEY `I_FK_CONGRESSISTE_ORGANISME_PAYEUR` (`NUM_ORGANISME`),
  ADD KEY `I_FK_CONGRESSISTE_HOTEL` (`NUM_HOTEL`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`NUM_FACTURE`),
  ADD UNIQUE KEY `I_FK_FACTURE_CONGRESSISTE` (`NUM_CONGRESSISTE`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`NUM_HOTEL`);

--
-- Index pour la table `organisme_payeur`
--
ALTER TABLE `organisme_payeur`
  ADD PRIMARY KEY (`NUM_ORGANISME`);

--
-- Index pour la table `participation_session`
--
ALTER TABLE `participation_session`
  ADD PRIMARY KEY (`NUM_CONGRESSISTE`,`NUM_SESSION`),
  ADD KEY `I_FK_PARTICIPATION_SESSION_CONGRESSISTE` (`NUM_CONGRESSISTE`),
  ADD KEY `I_FK_PARTICIPATION_SESSION_SESSION` (`NUM_SESSION`);

--
-- Index pour la table `rel_1`
--
ALTER TABLE `rel_1`
  ADD PRIMARY KEY (`NUM_CONGRESSISTE`,`NUM_ACTIVITE`),
  ADD KEY `I_FK_REL_1_CONGRESSISTE` (`NUM_CONGRESSISTE`),
  ADD KEY `I_FK_REL_1_ACTIVITE` (`NUM_ACTIVITE`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`NUM_SESSION`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `congressiste`
--
ALTER TABLE `congressiste`
  MODIFY `NUM_CONGRESSISTE` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `NUM_FACTURE` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
