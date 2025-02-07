-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 07 fév. 2025 à 16:04
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hostolink_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `id_annonce` int NOT NULL AUTO_INCREMENT,
  `titre_annonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_annonce` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `Id_role_permission` int DEFAULT NULL,
  PRIMARY KEY (`id_annonce`),
  KEY `Id_role_permission` (`Id_role_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `carte_bancaire`
--

DROP TABLE IF EXISTS `carte_bancaire`;
CREATE TABLE IF NOT EXISTS `carte_bancaire` (
  `Id_carte_bancaire` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `Numero_carte` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_expiration` date NOT NULL,
  `cvv` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type_bancaire` enum('VISA','MASTERCARD','PUSH') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status_bancaire` enum('actif','inactif') COLLATE utf8mb4_unicode_ci DEFAULT 'actif',
  PRIMARY KEY (`Id_carte_bancaire`),
  UNIQUE KEY `Numero_carte` (`Numero_carte`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `Id_commentaire` int NOT NULL AUTO_INCREMENT,
  `Id_publication` int NOT NULL,
  `Id_user` int NOT NULL,
  `Contenu_commentaire` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_commentaire`),
  KEY `Id_publication` (`Id_publication`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `Id_compte` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `type_compte` enum('épargne','courant') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Solde_compte` decimal(15,2) DEFAULT '0.00',
  `Devise` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Numero_compte` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date_creation_compte` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('actif','inactif') COLLATE utf8mb4_unicode_ci DEFAULT 'actif',
  PRIMARY KEY (`Id_compte`),
  UNIQUE KEY `Numero_compte` (`Numero_compte`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts_enregistres`
--

DROP TABLE IF EXISTS `contacts_enregistres`;
CREATE TABLE IF NOT EXISTS `contacts_enregistres` (
  `Id_contact` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `Id_contact_user` int NOT NULL,
  `nom_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_ajout` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_contact`),
  KEY `Id_user` (`Id_user`),
  KEY `Id_contact_user` (`Id_contact_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement_sante`
--

DROP TABLE IF EXISTS `etablissement_sante`;
CREATE TABLE IF NOT EXISTS `etablissement_sante` (
  `Id_etablissement` int NOT NULL AUTO_INCREMENT,
  `telephone_etablissement_sante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nom_etablissement_sante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Adresse_etablissement_sante` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_etablissement` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email_etablissement_sante` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Id_localisation` int DEFAULT NULL,
  PRIMARY KEY (`Id_etablissement`),
  UNIQUE KEY `Email_etablissement_sante` (`Email_etablissement_sante`),
  KEY `FK_Localisation` (`Id_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liker`
--

DROP TABLE IF EXISTS `liker`;
CREATE TABLE IF NOT EXISTS `liker` (
  `Id_like` int NOT NULL AUTO_INCREMENT,
  `Id_post_liker` int NOT NULL,
  `Id_user` int NOT NULL,
  `Date_liker` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_like`),
  KEY `Id_post_liker` (`Id_post_liker`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liste_numero_etablissement_sante`
--

DROP TABLE IF EXISTS `liste_numero_etablissement_sante`;
CREATE TABLE IF NOT EXISTS `liste_numero_etablissement_sante` (
  `Id_liste_num_etablissement_sante` int NOT NULL AUTO_INCREMENT,
  `id_role_permissions` int DEFAULT NULL,
  `nom_etablissement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presentation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `emplacement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Id_role_permission` int DEFAULT NULL,
  PRIMARY KEY (`Id_liste_num_etablissement_sante`),
  KEY `FK_RolePermission_ListEtablissement` (`Id_role_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

DROP TABLE IF EXISTS `localisation`;
CREATE TABLE IF NOT EXISTS `localisation` (
  `Id_localisation` int NOT NULL AUTO_INCREMENT,
  `longitude` decimal(10,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `altitude` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`Id_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `Id_message` int NOT NULL AUTO_INCREMENT,
  `Id_user` int DEFAULT NULL,
  `Id_thematique` int DEFAULT NULL,
  `Contenu_message` text,
  `Date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id_message`),
  KEY `Id_user` (`Id_user`),
  KEY `Id_thematique` (`Id_thematique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `Id_notification` int NOT NULL AUTO_INCREMENT,
  `Id_transaction` int NOT NULL,
  `Id_role_permission` int NOT NULL,
  `contenu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(15,2) DEFAULT NULL,
  `date_envoi` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('envoyé','lu','supprimé') COLLATE utf8mb4_unicode_ci DEFAULT 'envoyé',
  PRIMARY KEY (`Id_notification`),
  KEY `Id_transaction` (`Id_transaction`),
  KEY `Id_role_permission` (`Id_role_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `partages`
--

DROP TABLE IF EXISTS `partages`;
CREATE TABLE IF NOT EXISTS `partages` (
  `Id_partage` int NOT NULL AUTO_INCREMENT,
  `Id_publication` int NOT NULL,
  `Id_user` int NOT NULL,
  `Date_partage` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_partage`),
  KEY `Id_publication` (`Id_publication`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `Id_publication` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `Titre_publication` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_publication`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publicite`
--

DROP TABLE IF EXISTS `publicite`;
CREATE TABLE IF NOT EXISTS `publicite` (
  `Id_pub` int NOT NULL AUTO_INCREMENT,
  `Id_role_permission` int NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descript_pub` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image_pub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date_debut_pub` date NOT NULL,
  `Date_fin_pub` date NOT NULL,
  `statuts` enum('actif','inactif') COLLATE utf8mb4_unicode_ci DEFAULT 'actif',
  PRIMARY KEY (`Id_pub`),
  KEY `Id_role_permission` (`Id_role_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `qr_code_paiement`
--

DROP TABLE IF EXISTS `qr_code_paiement`;
CREATE TABLE IF NOT EXISTS `qr_code_paiement` (
  `Id_qrcode` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `montant` decimal(15,2) NOT NULL,
  `devise` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut_qrcode` enum('actif','expiré') COLLATE utf8mb4_unicode_ci DEFAULT 'actif',
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `expiration_qrcode` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_qrcode`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `Id_role_permission` int NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_role` text COLLATE utf8mb4_unicode_ci,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_role_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `thematiques`
--

DROP TABLE IF EXISTS `thematiques`;
CREATE TABLE IF NOT EXISTS `thematiques` (
  `Id_thematique_discussion` int NOT NULL AUTO_INCREMENT,
  `Titre_thematique` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date_ajout` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_thematique_discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `Id_transaction` int NOT NULL AUTO_INCREMENT,
  `Id_compte_recepteur` int NOT NULL,
  `Id_compte_expediteur` int NOT NULL,
  `Id_etablissement` int DEFAULT NULL,
  `Id_carte_bancaire` int DEFAULT NULL,
  `Montant` decimal(15,2) NOT NULL,
  `statut` enum('validé','en attente','annulé') COLLATE utf8mb4_unicode_ci DEFAULT 'en attente',
  `Devise_transaction` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_transaction` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date_transaction` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_transaction`),
  KEY `Id_compte_recepteur` (`Id_compte_recepteur`),
  KEY `Id_compte_expediteur` (`Id_compte_expediteur`),
  KEY `Id_carte_bancaire` (`Id_carte_bancaire`),
  KEY `FK_Etablissement` (`Id_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Id_user` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inscription` datetime DEFAULT CURRENT_TIMESTAMP,
  `Photo_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Derniere_connexion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_user`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `verification_compte`
--

DROP TABLE IF EXISTS `verification_compte`;
CREATE TABLE IF NOT EXISTS `verification_compte` (
  `Id_verif_compte` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_telephone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_verification` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('non vérifié','vérifié') COLLATE utf8mb4_unicode_ci DEFAULT 'non vérifié',
  PRIMARY KEY (`Id_verif_compte`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `verification_identite`
--

DROP TABLE IF EXISTS `verification_identite`;
CREATE TABLE IF NOT EXISTS `verification_identite` (
  `Id_verification` int NOT NULL AUTO_INCREMENT,
  `Id_user` int NOT NULL,
  `type_verification` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut_verification` enum('non vérifié','vérifié','en attente') COLLATE utf8mb4_unicode_ci DEFAULT 'en attente',
  `date_envoi` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_validation` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_verification`),
  KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_ibfk_1` FOREIGN KEY (`Id_role_permission`) REFERENCES `role_permission` (`Id_role_permission`);

--
-- Contraintes pour la table `carte_bancaire`
--
ALTER TABLE `carte_bancaire`
  ADD CONSTRAINT `carte_bancaire_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`Id_publication`) REFERENCES `publication` (`Id_publication`) ON DELETE CASCADE,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `contacts_enregistres`
--
ALTER TABLE `contacts_enregistres`
  ADD CONSTRAINT `contacts_enregistres_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_enregistres_ibfk_2` FOREIGN KEY (`Id_contact_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etablissement_sante`
--
ALTER TABLE `etablissement_sante`
  ADD CONSTRAINT `FK_Localisation` FOREIGN KEY (`Id_localisation`) REFERENCES `localisation` (`Id_localisation`);

--
-- Contraintes pour la table `liker`
--
ALTER TABLE `liker`
  ADD CONSTRAINT `liker_ibfk_1` FOREIGN KEY (`Id_post_liker`) REFERENCES `publication` (`Id_publication`) ON DELETE CASCADE,
  ADD CONSTRAINT `liker_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `liste_numero_etablissement_sante`
--
ALTER TABLE `liste_numero_etablissement_sante`
  ADD CONSTRAINT `FK_RolePermission_ListEtablissement` FOREIGN KEY (`Id_role_permission`) REFERENCES `role_permission` (`Id_role_permission`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`Id_thematique`) REFERENCES `thematiques` (`Id_thematique_discussion`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`Id_transaction`) REFERENCES `transaction` (`Id_transaction`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`Id_role_permission`) REFERENCES `role_permission` (`Id_role_permission`) ON DELETE CASCADE;

--
-- Contraintes pour la table `partages`
--
ALTER TABLE `partages`
  ADD CONSTRAINT `partages_ibfk_1` FOREIGN KEY (`Id_publication`) REFERENCES `publication` (`Id_publication`) ON DELETE CASCADE,
  ADD CONSTRAINT `partages_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `publicite`
--
ALTER TABLE `publicite`
  ADD CONSTRAINT `publicite_ibfk_1` FOREIGN KEY (`Id_role_permission`) REFERENCES `role_permission` (`Id_role_permission`) ON DELETE CASCADE;

--
-- Contraintes pour la table `qr_code_paiement`
--
ALTER TABLE `qr_code_paiement`
  ADD CONSTRAINT `qr_code_paiement_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK_Etablissement` FOREIGN KEY (`Id_etablissement`) REFERENCES `etablissement_sante` (`Id_etablissement`),
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`Id_compte_recepteur`) REFERENCES `compte` (`Id_compte`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`Id_compte_expediteur`) REFERENCES `compte` (`Id_compte`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`Id_carte_bancaire`) REFERENCES `carte_bancaire` (`Id_carte_bancaire`) ON DELETE SET NULL;

--
-- Contraintes pour la table `verification_compte`
--
ALTER TABLE `verification_compte`
  ADD CONSTRAINT `verification_compte_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `verification_identite`
--
ALTER TABLE `verification_identite`
  ADD CONSTRAINT `verification_identite_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `utilisateur` (`Id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
