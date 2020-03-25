-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 25 Mars 2020 à 15:18
-- Version du serveur :  5.5.64-MariaDB
-- Version de PHP :  5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `retest`
--

-- --------------------------------------------------------

--
-- Structure de la table `Avancements`
--

CREATE TABLE IF NOT EXISTS `Avancements` (
  `id_avancement` int(11) NOT NULL,
  `nom_avancement` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Avancements`
--

INSERT INTO `Avancements` (`id_avancement`, `nom_avancement`) VALUES
(1, 'En cours'),
(2, 'A faire'),
(3, 'Fini');

-- --------------------------------------------------------

--
-- Structure de la table `Demandes`
--

CREATE TABLE IF NOT EXISTS `Demandes` (
  `id_demande` int(11) NOT NULL,
  `nom_demande` varchar(32) NOT NULL,
  `nom_demandeur` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `date_demande` date NOT NULL,
  `date_chiffrage` date DEFAULT NULL,
  `date_demarrage` date DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `code_nop` varchar(32) NOT NULL,
  `fonction` varchar(32) NOT NULL,
  `reference_client` varchar(32) DEFAULT NULL,
  `validation_chiffrage` varchar(32) DEFAULT NULL,
  `remarque_validation` text,
  `reference_interne` varchar(32) NOT NULL,
  `Total` double DEFAULT NULL,
  `fk_utilisateur_id` int(11) NOT NULL,
  `fk_etat_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Demandes`
--

INSERT INTO `Demandes` (`id_demande`, `nom_demande`, `nom_demandeur`, `description`, `date_demande`, `date_chiffrage`, `date_demarrage`, `date_livraison`, `code_nop`, `fonction`, `reference_client`, `validation_chiffrage`, `remarque_validation`, `reference_interne`, `Total`, `fk_utilisateur_id`, `fk_etat_id`) VALUES
(26, 'Projet Capgemini', 'thomas', 'projet master tri', '2020-02-02', '2020-03-25', NULL, NULL, 'x565', 'étudiant', 'thomas', 'Chiffrage accepté', '', 'thomas', 1, 2, 4),
(34, 'GT DATA - MIGRATION VERS AIX', 'Stéphane JUBEAU', 'construction de l''architecture d''hébergement de l''application Abus de Marché de Reuters :\n\napplication 3-Tiers : AS, BDD, ETL\n3 environnements : Dev, Homol et Production\n\n- AS : 4 VM RHEL + Oracle JDK\n- ETL : 3 VM RHEL + Oracle JRE\n- BDD : 2 LPAR avec BDD Oracle\n- publication application Citrix\n\nCriticité Application : a définir suite retrait de la redondance\nPCA/PRA : à definir suite retrait de la redondance\n5 utilisateurs\nenviron 4 To de stockage', '2020-02-29', '2020-03-12', NULL, NULL, 'A DEFINIR', 'CDP', 'F45', NULL, NULL, 'X24', 30581366, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Demandes_Perimetres`
--

CREATE TABLE IF NOT EXISTS `Demandes_Perimetres` (
  `fk_demande_id` int(11) DEFAULT NULL,
  `fk_perimetre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Demandes_Perimetres`
--

INSERT INTO `Demandes_Perimetres` (`fk_demande_id`, `fk_perimetre_id`) VALUES
(26, 1),
(26, 3),
(26, 4),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(34, 5),
(34, 6),
(34, 8);

-- --------------------------------------------------------

--
-- Structure de la table `Etats`
--

CREATE TABLE IF NOT EXISTS `Etats` (
  `id_etat` int(11) NOT NULL,
  `nom_etat` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Etats`
--

INSERT INTO `Etats` (`id_etat`, `nom_etat`) VALUES
(4, 'Chiffrage Accepté'),
(3, 'Demande Chiffrée'),
(1, 'Demande transmise'),
(7, 'Projet Annulé'),
(5, 'Projet en cours'),
(6, 'Projet livré'),
(2, 'Traitement en cours');

-- --------------------------------------------------------

--
-- Structure de la table `Ligne_Chiffrages`
--

CREATE TABLE IF NOT EXISTS `Ligne_Chiffrages` (
  `id_ligne` int(11) NOT NULL,
  `fk_demande_id` int(11) NOT NULL,
  `nom_etape` varchar(250) NOT NULL,
  `nom_sous_etape` varchar(250) NOT NULL,
  `nom_acteur` varchar(250) NOT NULL,
  `nom_grade` varchar(250) NOT NULL,
  `valeur_charge` double NOT NULL,
  `valeur_tjm` double NOT NULL,
  `valeur_total` double NOT NULL,
  `remarque` text,
  `fk_avancement_id` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Ligne_Chiffrages`
--

INSERT INTO `Ligne_Chiffrages` (`id_ligne`, `fk_demande_id`, `nom_etape`, `nom_sous_etape`, `nom_acteur`, `nom_grade`, `valeur_charge`, `valeur_tjm`, `valeur_total`, `remarque`, `fk_avancement_id`) VALUES
(188, 26, 'premiere etape', 'premiere sous etape', 'oui', '1', 10, 1, 1, 'test', 2),
(555, 34, 'PRE REQUIS', 'NOMMAGE SRV+BDD', 'COVEA FI', 'B2', 1, 20, 20, NULL, 2),
(558, 34, 'PRE REQUIS', 'CONFIG VM', 'COVEA FI', 'B2', 1, 50, 50, NULL, 2),
(560, 34, 'PRE REQUIS', 'LICENCE OS ET BDD', 'COVEA FI', 'B2', 1, 200, 200, NULL, 2),
(615, 34, 'PREPARATION', 'Etude, chiffrage, validation des pré requis', 'DBA', 'B2', 2, 200, 400, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Perimetres`
--

CREATE TABLE IF NOT EXISTS `Perimetres` (
  `id_perimetre` int(11) NOT NULL,
  `nom_perimetre` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Perimetres`
--

INSERT INTO `Perimetres` (`id_perimetre`, `nom_perimetre`) VALUES
(1, 'Application'),
(9, 'AUTRE'),
(3, 'BDD'),
(2, 'BT/Ordo'),
(6, 'RESEAU'),
(7, 'SAP'),
(8, 'STOCKAGE'),
(4, 'UNIX'),
(5, 'WINDOWS');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE IF NOT EXISTS `Utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prenom_utilisateur` varchar(250) NOT NULL,
  `login_utilisateur` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nom_entreprise` varchar(32) NOT NULL,
  `mdp_utilisateur` varchar(128) NOT NULL,
  `droit_utilisateur` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`id_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `login_utilisateur`, `nom_entreprise`, `mdp_utilisateur`, `droit_utilisateur`) VALUES
(1, 'Admin', 'Ahmed', 'Al sawah', 'Cap Gemini', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 2),
(2, 'Client', 'Thomas', 'Jamme', 'EDF', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 1),
(24, 'Ahmed', 'Ahmed', 'Al sawah', 'USMB', '5f75697204af47005af5743a6a59feef680c1c846c3f26ca4b885a57f8c47643024f76d37bd85aa75065d3a58b19d3fc1ce99f12d34fe4814dd9c4c3fee49d19', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Avancements`
--
ALTER TABLE `Avancements`
  ADD PRIMARY KEY (`id_avancement`);

--
-- Index pour la table `Demandes`
--
ALTER TABLE `Demandes`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `fk_utilisateur_id` (`fk_utilisateur_id`),
  ADD KEY `fk_etat_id` (`fk_etat_id`);

--
-- Index pour la table `Demandes_Perimetres`
--
ALTER TABLE `Demandes_Perimetres`
  ADD KEY `Demandes_Perimetres_ibfk_1` (`fk_demande_id`),
  ADD KEY `Demandes_Perimetres_ibfk_2` (`fk_perimetre_id`);

--
-- Index pour la table `Etats`
--
ALTER TABLE `Etats`
  ADD PRIMARY KEY (`id_etat`),
  ADD UNIQUE KEY `nom_etat` (`nom_etat`);

--
-- Index pour la table `Ligne_Chiffrages`
--
ALTER TABLE `Ligne_Chiffrages`
  ADD PRIMARY KEY (`id_ligne`),
  ADD KEY `fk_demande_id` (`fk_demande_id`),
  ADD KEY `fk_avancement_id` (`fk_avancement_id`);

--
-- Index pour la table `Perimetres`
--
ALTER TABLE `Perimetres`
  ADD PRIMARY KEY (`id_perimetre`),
  ADD UNIQUE KEY `nom_perimetre` (`nom_perimetre`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `nom_utilisateur` (`nom_utilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Avancements`
--
ALTER TABLE `Avancements`
  MODIFY `id_avancement` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Demandes`
--
ALTER TABLE `Demandes`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT pour la table `Etats`
--
ALTER TABLE `Etats`
  MODIFY `id_etat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `Ligne_Chiffrages`
--
ALTER TABLE `Ligne_Chiffrages`
  MODIFY `id_ligne` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=623;
--
-- AUTO_INCREMENT pour la table `Perimetres`
--
ALTER TABLE `Perimetres`
  MODIFY `id_perimetre` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Demandes`
--
ALTER TABLE `Demandes`
  ADD CONSTRAINT `Demandes_ibfk_1` FOREIGN KEY (`fk_utilisateur_id`) REFERENCES `Utilisateurs` (`id_utilisateur`),
  ADD CONSTRAINT `Demandes_ibfk_2` FOREIGN KEY (`fk_etat_id`) REFERENCES `Etats` (`id_etat`);

--
-- Contraintes pour la table `Demandes_Perimetres`
--
ALTER TABLE `Demandes_Perimetres`
  ADD CONSTRAINT `Demandes_Perimetres_ibfk_1` FOREIGN KEY (`fk_demande_id`) REFERENCES `Demandes` (`id_demande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Demandes_Perimetres_ibfk_2` FOREIGN KEY (`fk_perimetre_id`) REFERENCES `Perimetres` (`id_perimetre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Ligne_Chiffrages`
--
ALTER TABLE `Ligne_Chiffrages`
  ADD CONSTRAINT `Ligne_Chiffrages_ibfk_1` FOREIGN KEY (`fk_demande_id`) REFERENCES `Demandes` (`id_demande`),
  ADD CONSTRAINT `Ligne_Chiffrages_ibfk_2` FOREIGN KEY (`fk_avancement_id`) REFERENCES `Avancements` (`id_avancement`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
